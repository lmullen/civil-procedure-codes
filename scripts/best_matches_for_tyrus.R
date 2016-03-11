library(dplyr)
library(r)
load("cache/corpus-lsh.rda")

all_sections <- data_frame(
  section_id = c(best_matches$borrower_section, best_matches$match_section) %>%
    unique() %>%
    sort(),
  index = 1:length(section_id)
)

best_matches_with_index <- best_matches %>%
  select(1:3) %>%
  filter(!is.na(match_section)) %>%
  left_join(all_sections, by = c("borrower_section" = "section_id")) %>%
  left_join(all_sections, by = c("match_section" = "section_id"))

write_csv(best_matches_with_index, "~/Dropbox/DocumentCluster/best-section-scores.csv")

all_sections2 <- data_frame(
  section_id = c(all_matches$borrower_section, all_matches$match_section) %>%
    unique() %>%
    sort(),
  index = 1:length(section_id)
)

all_matches_with_index <- all_matches %>%
  select(1:3) %>%
  filter(!is.na(match_section)) %>%
  left_join(all_sections2, by = c("borrower_section" = "section_id")) %>%
  left_join(all_sections2, by = c("match_section" = "section_id"))

write_csv(all_matches_with_index, "~/Dropbox/DocumentCluster/all-section-scores.csv")
