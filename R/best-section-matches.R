best_section_matches <- function(code_name, scores, threshold = 0.1, top = 1) {
  require("dplyr")
  require("stringr")
  matches <- scores %>%
    filter(code_a == code_name | code_b == code_name) %>%
    mutate(match_code = ifelse(code_a == code_name, code_b, code_a),
           code_of_interest = ifelse(code_a == code_name, code_a, code_b),
           match_section = ifelse(code_a == code_name, section_b, section_a),
           section_of_interest = ifelse(code_a == code_name, section_a, section_b),
           match_year = ifelse(code_a == code_name, year_b, year_a)) %>%
    filter(match_code != code_of_interest,
           match_year <= extract_date(code_name),
           similarity >= threshold) %>%
    select(code_of_interest, section_of_interest, match_code, match_section,
           similarity) %>%
    group_by(section_of_interest) %>%
    arrange(desc(similarity)) %>%
    top_n(top, similarity) %>%
    mutate(borrower_code = code_name)

  all_sections <- Sys.glob(str_c("legal-codes-split/", code_name, "-0*")) %>%
    str_replace("legal-codes-split/", "") %>%
    str_replace("\\.txt", "")
  all <- data_frame(all_sections)

  all %>%
    left_join(matches, by = c("all_sections" = "section_of_interest")) %>%
    select(-code_of_interest)
}
