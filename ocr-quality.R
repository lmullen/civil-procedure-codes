library(stringr)
library(textreuse)
library(dplyr)

files <- Sys.glob("text/*")
texts <- files %>%
  lapply(readLines) %>%
  lapply(str_c, collapse = " ")
names(texts) <- files

quality <- texts %>% sapply(ocr_quality, method = "dictionary")
names(quality) <- names(texts)
quality <- round(quality, 3)

quality_df <- data_frame(code = names(quality), quality) %>%
  arrange(desc(quality))
write.csv(quality_df, "out/ocr-quality.csv")

hist(quality, breaks = 25, xlim = c(0, 1),
     main = "Histogram of Codes OCR Quality", labels = TRUE)
