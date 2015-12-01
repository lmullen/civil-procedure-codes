Create a corpus of the sections.

    library("textreuse")
    library("dplyr")
    library("stringr")
    library("readr")
    options("mc.cores" = 6L)
    sections <- TextReuseCorpus(dir = "legal-codes-split/", tokenizer = NULL)

Get the word counts of each section and turn that into a data frame.

    wc_raw <- wordcount(sections)
    wc <- data_frame(section = names(wc_raw), words = wc_raw)
    wc

    ## Source: local data frame [95,278 x 2]
    ## 
    ##          section words
    ##            (chr) (int)
    ## 1  AK1900-000010    54
    ## 2  AK1900-000020    20
    ## 3  AK1900-000030     9
    ## 4  AK1900-000040   152
    ## 5  AK1900-000050    61
    ## 6  AK1900-000060   139
    ## 7  AK1900-000070    35
    ## 8  AK1900-000080    63
    ## 9  AK1900-000090    99
    ## 10 AK1900-000100    51
    ## ..           ...   ...

Now detect the code name and calculate some summary statistics.

    wc_summary <- wc %>% 
      mutate(code = str_replace(section, "-\\d+", "")) %>% 
      group_by(code) %>% 
      summarize(n_sections = n(),
                total_words = sum(words),
                min_words = min(words),
                max_words = max(words),
                mean_words = mean(words),
                median_words = median(words)) %>% 
      arrange(code)


    wc_summary %>% arrange(desc(n_sections))

    ## Source: local data frame [111 x 7]
    ## 
    ##      code n_sections total_words min_words max_words mean_words
    ##     (chr)      (int)       (int)     (int)     (int)      (dbl)
    ## 1  OH1879       2675      197650         4       757   73.88785
    ## 2  WV1868       2520      167930         4      1785   66.63889
    ## 3  TN1858       2133      114455         4      2120   53.65917
    ## 4  CT1879       2110       80516         4       447   38.15924
    ## 5  NY1850       2060      154112         5      1056   74.81165
    ## 6  IN1843       1987      147521         4      2963   74.24308
    ## 7  MT1895       1965      172432         4       967   87.75165
    ## 8  WI1849       1932      139333         4      1490   72.11853
    ## 9  NY1853       1876      132159         4       546   70.44723
    ## 10 TX1855       1745       93962         4       583   53.84642
    ## ..    ...        ...         ...       ...       ...        ...
    ## Variables not shown: median_words (dbl)

    wc_summary %>% arrange(n_sections)

    ## Source: local data frame [111 x 7]
    ## 
    ##      code n_sections total_words min_words max_words mean_words
    ##     (chr)      (int)       (int)     (int)     (int)      (dbl)
    ## 1  MS1850         18        2550        17       323   141.6667
    ## 2  VA1893         27        3166        24       608   117.2593
    ## 3  HI1859         42        5632         4       631   134.0952
    ## 4  UT1853         55        4488        24       247    81.6000
    ## 5  IA1839         85        9682         8       501   113.9059
    ## 6  VA1841         85       12603        15       714   148.2706
    ## 7  GB1873         92       21634         6      1107   235.1522
    ## 8  GB1854        107       11019        14       385   102.9813
    ## 9  MD1859        108       12847        11      4337   118.9537
    ## 10 MA1851        118       14982         4      3305   126.9661
    ## ..    ...        ...         ...       ...       ...        ...
    ## Variables not shown: median_words (dbl)

And write that file to disk.

    write_csv(wc_summary, "out/section-wordcounts-summary.csv")
