    library("readr")
    library("dplyr")
    library("igraph")

How are all of the sections related to one another? We can think of this
as a network problem. Sections that are similar have a relationship, but
are very unlikely to have relationships to every other section. So we
can use our comparisons then decompose that big network graph into
families of codes.

Read the data.

    comparisons <- read_csv("out/scores-all-sections-pairs.csv") %>% 
      select(-dissimilarity) %>% 
      rename(weight = similarity) %>% 
      filter(weight > 0.1)

    g <- graph.data.frame(comparisons, directed = "FALSE")
    families <- decompose(g, min.vertices = 2)
    num_sections <- vapply(families, function(x) { length(V(x))}, integer(1))
    head(sort(-num_sections), 20)

    ##  [1] -17192   -546   -527   -319   -182   -172   -151   -141   -139   -137
    ## [11]   -127   -121   -114   -108    -91    -89    -84    -81    -79    -69

    which(num_sections > 10 & num_sections < 15)

    ##   [1]   56  117  128  209  214  250  396  398  412  416  427  435  436  537
    ##  [15]  601  605  653  674  678  702  704  706  713  737  738  740  741  742
    ##  [29]  746  759  844  878  895  898  899  900  904  905  906  922  930  940
    ##  [43]  941  945  946  948  958  973  982  995 1021 1032 1035 1041 1065 1089
    ##  [57] 1102 1117 1136 1142 1152 1162 1173 1174 1176 1179 1185 1193 1205 1239
    ##  [71] 1245 1262 1263 1276 1278 1282 1288 1291 1310 1352 1364 1399 1438 1444
    ##  [85] 1478 1585 1589 1599 1641 1680 1705 1706 1766 1855 1883 1913 1944 1994
    ##  [99] 2009 2045 2112 2115 2117 2120 2121 2122 2123 2150 2158 2176 2441 2453
    ## [113] 2508 2543 2622 2631 2660 2669 2671 2686 2767 2846 2847 2954 2969 3002
    ## [127] 3016 3173 3176 3233 3235 3410 3413 3456 3461 3585 3804 3828 3836 3847
    ## [141] 3869 4420 4464 4535 4543 4555 5050

Plot those and look at their vertices.

    V(families[[4]])

    ## + 2/2 vertices, named:
    ## [1] AK1900-00000390 OR1862-00000340

    plot(families[[4]])

<img src="018-families-of-sections_files/figure-markdown_strict/unnamed-chunk-4-1.png" title="" alt="" width="672" />

    V(families[[1084]])

    ## + 3/3 vertices, named:
    ## [1] AZ1887-00005100 CA1872-00011530 MT1895-00019570

    plot(families[[1084]])

<img src="018-families-of-sections_files/figure-markdown_strict/unnamed-chunk-4-2.png" title="" alt="" width="672" />

    V(families[[4635]])

    ## + 5/5 vertices, named:
    ## [1] NY1850-00005350 NY1850-00005360 NY1853-00003970 NY1876-00001930
    ## [5] OR1862-00011150

    plot(families[[4635]])

<img src="018-families-of-sections_files/figure-markdown_strict/unnamed-chunk-4-3.png" title="" alt="" width="672" />
