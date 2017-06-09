suppressPackageStartupMessages(library("Matrix"))
suppressPackageStartupMessages(library("apcluster"))
suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("readr"))
suppressPackageStartupMessages(library("textreuse"))
suppressPackageStartupMessages(library("stringr"))
source("R/helper.R")
message("Loading LSH data")
load("cache/corpus-lsh.rda")

scores_clustering <- scores %>%
  filter(score >= 0.1)

section_names <- lsh_subset(scores_clustering)

# Turn the similarity scores into a sparse matrix
lookup <- data_frame(section_names, index = 1:length(section_names))
scores_clustering <- scores_clustering %>%
  left_join(lookup, by = c("a" = "section_names")) %>%
  left_join(lookup, by = c("b" = "section_names"))

n <- length(section_names)
m <- sparseMatrix(i = scores_clustering$index.x,
                  j = scores_clustering$index.y,
                  x = scores_clustering$score,
                  dims = c(n, n), symmetric = TRUE)
colnames(m) <- section_names
rownames(m) <- section_names

# Now use affinity propagation clustering to create clusters.
cluster_cache <- "cache/clusters.rds"
if (!file.exists(cluster_cache)) {
  timing <- system.time(
    clu <- apcluster(s = m,
                     maxits = 200e3, convits = 5e3,
                     q = 0,
                     lam = 0.900,
                     seed = 42325,
                     includeSim = TRUE,
                     details = TRUE
    )
  )
  message("Created ", length(clu@clusters), " clusters. ", "Timing: ")
  print(timing)
  saveRDS(clu, file = cluster_cache)
} else {
  message("Loading clusters from cache")
  clu <- readRDS(cluster_cache)
}

# Get the clusters in a slightly easier format to work with
clusters <- clu@clusters
names(clusters) <- names(clu@exemplars)
clusters <- lapply(clusters, names)

# Now the problem is that some clusters have been inadequately joined together.
# We will compute simiarities on the examplars. If any of them have a high
# Jaccard similarity, we will join those clusters together.
exemplars_corpus <- sections[names(clusters)]
exemplars_scores <- exemplars_corpus %>%
  lsh(bands = 60) %>%
  lsh_candidates() %>%
  lsh_compare(exemplars_corpus, jaccard_similarity) %>%
  arrange(desc(score))

# What is a good minimum match? Looking at the sections, `0.2` is clearly a
# match, while `0.1` is clearly not. An important observation is that the
# exemplars for the blood quantum sections have a Jaccard similarity of `0.15`.
# We will use that as the threshold.
join_threshold <- 0.15
exemplars_scores <- exemplars_scores %>%
  filter(score >= 0.15)

join_clusters <- function(row) {
  exs <- c(row$a, row$b)
  minval <- which.min(extract_date(exs))
  exemplar <- exs[minval]
  duplicate <- exs[ifelse(minval == 1, 2, 1)]
  clusters[[exemplar]] <<- c(clusters[[exemplar]], clusters[[duplicate]])
  clusters[[duplicate]] <<- NULL
  dplyr::as_data_frame(row)
}

message("Joining clusters together by similarity score")
dont_print <- exemplars_scores %>%
  rowwise() %>%
  do(join_clusters(.))

# Convert clusters to data frame
clusters_df <- clusters %>%
  seq_along() %>%
  lapply(function(i) {
    exemplar <- names(clusters)[i]
    doc <- clusters[[i]]
    data_frame(exemplar, doc, cluster_id = i)
  }) %>%
  bind_rows() %>%
  mutate(exemplar_year = extract_date(exemplar),
         doc_date = extract_date(doc)) %>%
  group_by(cluster_id) %>%
  mutate(earliest_date = min(doc_date),
         earliest = doc[which.min(doc_date)]) %>%
  select(cluster_id, exemplar, exemplar_year, earliest, earliest_date,
         doc, doc_date) %>%
  arrange(doc_date) %>%
  mutate(n = n()) %>%
  ungroup() %>%
  arrange(desc(n))

# That data frame has the following properties. It is sorted so that the
# clusters with the most documents appear first. Within each cluster, documents
# appear chronologically. Each cluster contains three columns for documents
# (with another three columns corresponding to years). One column is the
# "examplar" document identified by the affinity propagation clustering. The
# next is the earliest document in the cluster. If there are multiple documents
# from the earliest year, then only one is listed. The third is a list of all
# the documents in the cluster. The column `n` is the number of documents in the
# cluster. All clusters regardless of length have been included.
write_csv(clusters_df, "out/clusters/clusters.csv")

exemplars_summary <- clusters_df$exemplar %>%
  extract_code_names() %>%
  table() %>%
  as.data.frame() %>% as_data_frame() %>%
  rename(., code = `.`) %>%
  arrange(desc(Freq))
write_csv(exemplars_summary, "out/clusters-exemplars-summary.csv")

# The codes which most frequently provide the earliest documents in the
# clusters, weighted by the size of the clusters for which they are the
# earliest.
earliest_summary <- clusters_df$earliest %>%
  extract_code_names() %>%
  table() %>%
  as.data.frame() %>% as_data_frame() %>%
  rename(., code = `.`) %>%
  arrange(desc(Freq))
write_csv(earliest_summary, "out/clusters-earliest-summary.csv")

# Now let's write out the clusters with a certain minimum number of documents to disk.
get_printable_code <- function(doc_id) {
  content <- str_wrap(content(sections[[doc_id]]))
  str_c(doc_id, content, "-----------------------------------------------\n\n",
        sep = "\n\n")
}

get_cluster_header <- function(exemplar, earliest, n, cluster_id) {
  str_c("Exemplar: ", exemplar, "\n",
        "Earliest: ", earliest, "\n",
        "Documents in cluster: ", n, "\n",
        "Cluster ID: ", cluster_id, "\n",
        "\n",
        "-----------------------------------------------\n\n")
}

write_cluster <- function(df) {
  exemplar <- unique(df$exemplar)
  earliest <- unique(df$earliest)
  n <- unique(df$n)
  cluster_id <- unique(df$cluster_id)
  header <- get_cluster_header(exemplar, earliest, n, cluster_id)
  docs <- df$doc %>% sapply(get_printable_code)
  text <- str_c(docs, collapse = "\n") %>%
    str_c(header, .) %>%
    str_split("\n") %>%
    unlist()
  filename <- str_c("out/clusters/", earliest, ".txt")
  message("Writing ", filename)
  writeLines(text, filename)
  df
}


message("Writing clusters to text files")
dont_print <- clusters_df %>%
  filter(n >= 5) %>%
  group_by(cluster_id) %>%
  do(write_cluster(.))

message("Finished clustering successfully.")
