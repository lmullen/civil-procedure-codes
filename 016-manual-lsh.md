# Calculate minhash pairs manually
Lincoln Mullen  
September 25, 2015  

As the textreuse package is currently implemented, the `lsh()` function gets bogged down with large numbers of documents. The implementation with the hash package is probably unneccessary; we can do it a lot faster with dplyr. So we will implement a specific solution here before revising the textreuse package. (Thanks for an assist from [Stack Overflow](http://stackoverflow.com/questions/32783727/turn-ordered-pairs-into-unordered-pairs-in-a-data-frame-with-dplyr/32784685#32784685).)


```r
library("textreuse")
library("dplyr")
library("digest")
library("stringr")
library("tidyr")
library("readr")
```

Load the corpus.


```r
corpus <- readRDS("cache/corpus-n5-minhash-h1500-seed623.rds")
```


```r
bands <- 500
hashes <- 1500
rows <- hashes / bands
docs <- length(corpus)
bands_vec <- rep(vapply(1:bands, function(i) rep(i, rows), integer(rows)), docs)

buckets_cache <- "cache/buckets-dplyr-lsh.rds"
if (!file.exists(buckets_cache)) {
  buckets <-  corpus %>%
    hashes() %>%
    as_data_frame() %>%
    gather(doc, hash) %>%
    mutate(doc = as.character(doc),
           band = bands_vec) %>%
    group_by(doc, band) %>%
    summarize(buckets = digest(hash)) %>%
    select(-band)
  rm(bands_vec)
  saveRDS(buckets, file = buckets_cache)
} else {
  buckets <- readRDS(buckets_cache)
}
```

Now find the ordered pairs of matches:


```r
ordered <- buckets %>% 
  ungroup() %>%
  left_join(buckets, by = "buckets") %>%
  select(-buckets) %>%
  distinct() %>% 
  filter(doc.x != doc.y) %>%
  arrange(doc.x, doc.y)
```

Now remove the duplicate pairs.


```r
unordered <- ordered %>% 
  distinct(dn = pmin(doc.x, doc.y), up = pmax(doc.x, doc.y)) %>%
  select(-up, -dn) %>%
  rename(a = doc.x, b = doc.y) %>%
  arrange(a, b) %>% 
  mutate(score = NA_real_) 
```

Save the results.


```r
write_csv(ordered, path = "out/all-sections-unordered-pairs.csv")
```

Rehash the corpus to use for Jaccard similarity.


```r
corpus_rehashed <- rehash(corpus, hash_string)
```

Compute the Jaccard similarity scores and save the results.


```r
scores <- unordered %>% 
  lsh_compare(corpus_rehashed, jaccard_similarity) %>% 
  rename(similarity = score) %>% 
  mutate(dissimilarity = 1 - similarity)
write_csv(scores, path = "out/scores-all-sections-pairs.csv")
scores
```

```
## Source: local data frame [227,579 x 4]
## 
##                  a               b similarity dissimilarity
##              (chr)           (chr)      (dbl)         (dbl)
## 1  AK1900-00000020 CA1872-00000860 0.26250000     0.7375000
## 2  AK1900-00000020 DC1857-00003280 0.13698630     0.8630137
## 3  AK1900-00000020 DT1868-00000360 0.07812500     0.9218750
## 4  AK1900-00000020 DT1868-00000370 0.26923077     0.7307692
## 5  AK1900-00000020 DT1887-00000700 0.31250000     0.6875000
## 6  AK1900-00000020 KS1859-00000140 0.18421053     0.8157895
## 7  AK1900-00000020 KS1868-00000160 0.06015038     0.9398496
## 8  AK1900-00000020 KY1851-00000160 0.15714286     0.8428571
## 9  AK1900-00000020 MN1851-00000040 0.11842105     0.8815789
## 10 AK1900-00000020 MO1849-00000090 0.08235294     0.9176471
## ..             ...             ...        ...           ...
```
