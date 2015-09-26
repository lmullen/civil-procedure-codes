summarize_borrowings <- function(section_list) {
  section_list %>%
    group_by(match_code) %>%
    summarize(original_code = unique(original_code),
              mean_similarity = mean(similarity),
              n = n()) %>%
    mutate(percentage_sections = n / nrow(section_list)) %>%
    arrange(desc(n)) %>%
    select(original_code, match_code, mean_similarity, n, percentage_sections)
}
