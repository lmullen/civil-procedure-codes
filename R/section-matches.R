best_matches <- function(matches, threshold = 0.1, tolerance = 0.1) {

  require("dplyr")
  # message("Start: ", pnum(nrow(matches)))

  # Remove matches from the same code
  matches <- matches %>%
    filter(borrower_code != match_code)
  # message("Same code: ", pnum(nrow(matches)))

  # Remove anachronistic matches
  matches <- matches %>%
    filter(borrower_year >= match_year)
  # message("Anachronistic: ", pnum(nrow(matches)))

  # Remove matches below threshold
  matches <- matches %>%
    filter(score >= threshold)
  # message("Threshold: ", pnum(nrow(matches)))

  # Keep matches within the tolerance
  matches <- matches %>%
    group_by(borrower_section) %>%
    filter(score >= max(score) - tolerance)
  # message("Tolerance: ", pnum(nrow(matches)))

  # Keep matches within the same state, if there is one from the same state
  matches <- matches %>%
    group_by(borrower_section) %>%
    mutate(state_same = borrower_state == match_state) %>%
    top_n(1, wt = state_same)
  # message("State: ", pnum(nrow(matches)))

  # Split between sections that have matches within the state and sections
  # that don't
  matches_within_state <- matches %>%
    filter(state_same)
  # message("Within state: ", pnum(nrow(matches_within_state)))
  matches_outside_state <- matches %>%
    filter(!state_same)
  # message("Outside state: ", pnum(nrow(matches_outside_state)))

  # Within state matches, take the highest ranked match from year closest to
  # the borrowing sections
  matches_within_state <- matches_within_state %>%
    group_by(borrower_section) %>%
    arrange(desc(match_year), desc(score)) %>%
    slice(1) %>%
    ungroup()
  # message("Within state sliced: ", pnum(nrow(matches_within_state)))

  # Outside of state matches, take the highest ranked match
  matches_outside_state <- matches_outside_state %>%
    group_by(borrower_section) %>%
    arrange(desc(score)) %>%
    slice(1) %>%
    ungroup()
  # message("Outside state sliced: ", pnum(nrow(matches_outside_state)))

  # Final cleanup
  matches <- bind_rows(matches_outside_state, matches_within_state) %>%
    select(-state_same) %>%
    arrange(borrower_section)
  # message("Final: ", pnum(nrow(matches)))

  matches

}

summarize_borrowings <- function(matches) {
  matches %>%
    group_by(borrower_code, match_code) %>%
    summarize(mean_score = mean(score, na.rm = TRUE),
              sections_borrowed = n()) %>%
    group_by(borrower_code) %>%
    mutate(percent_borrowed = sections_borrowed / sum(sections_borrowed)) %>%
    arrange(desc(sections_borrowed))
}
