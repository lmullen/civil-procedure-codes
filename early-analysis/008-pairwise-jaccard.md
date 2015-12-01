    library("textreuse")

We are going to load the corpus from the cache, and create a comparison
matrix with Jaccard similarity. (We will do other comparisons in
different notebook so we can do this in parallel.) We will cache the
matrix for use in later analyses.

We are going to test this with both shingled and skip n-grams. Here are
skip n-grams.

    cache_skip <- "cache/comparison-matrix-skip-jaccard.rds"
    if (!file.exists(cache_skip)) {
      corpus_skip <- readRDS("cache/corpus-skip-ngrams-n7k3.rds")
      m_skip <- pairwise_compare(corpus_skip, jaccard_similarity)
      saveRDS(m_skip, cache_skip)
    } else {
      m_skip <- readRDS(cache_skip)
    }

Here are shingled n-grams.

    cache_shingles <- "cache/comparison-matrix-shingles-jaccard.rds"
    if (!file.exists(cache_shingles)) {
      corpus_shingles <- readRDS("cache/corpus-shingle-ngrams-n7.rds")
      m_shingles <- pairwise_compare(corpus_shingles, jaccard_similarity)
      saveRDS(m_shingles, cache_shingles)
    } else {
      m_shingles <- readRDS(cache_shingles)
    }

Here is the comparison matrix for the skip n-grams.

    round(m_skip, digits = 4)

    ##                AK1900 AL1852 AR1868 AR1874 AZ1865 AZ1887 BI1859 CA1850
    ## AK1900             NA  5e-04 0.0032 0.0026 0.0194 0.0031  1e-04 0.0112
    ## AL1852             NA     NA 0.0004 0.0002 0.0009 0.0003  1e-04 0.0002
    ## AR1868             NA     NA     NA 0.1176 0.0052 0.0024  2e-04 0.0053
    ## AR1874             NA     NA     NA     NA 0.0054 0.0032  1e-04 0.0073
    ## AZ1865             NA     NA     NA     NA     NA 0.0143  2e-04 0.0363
    ## AZ1887             NA     NA     NA     NA     NA     NA  2e-04 0.0045
    ## BI1859             NA     NA     NA     NA     NA     NA     NA 0.0002
    ## CA1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1868extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1872             NA     NA     NA     NA     NA     NA     NA     NA
    ## CO1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## CO1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## CT1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## CT1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## CT1879extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## DC1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## DE1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## DT1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## DT1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## DT1887             NA     NA     NA     NA     NA     NA     NA     NA
    ## FL1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## FL1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## FL1892             NA     NA     NA     NA     NA     NA     NA     NA
    ## FR1806             NA     NA     NA     NA     NA     NA     NA     NA
    ## GA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## GA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1875             NA     NA     NA     NA     NA     NA     NA     NA
    ## HI1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## HI1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1839             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1864             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1881             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1933             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1843             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825french       NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867             NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867french       NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1836             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ME1840             NA     NA     NA     NA     NA     NA     NA     NA
    ## MI1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                CA1851 CA1858 CA1868 CA1868extended CA1872 CO1868 CO1877
    ## AK1900         0.0194 0.0193 0.0144         0.0059 0.0172  4e-04 0.0101
    ## AL1852         0.0008 0.0009 0.0007         0.0003 0.0009  4e-04 0.0007
    ## AR1868         0.0056 0.0052 0.0037         0.0016 0.0055  4e-04 0.0057
    ## AR1874         0.0062 0.0056 0.0037         0.0011 0.0051  2e-04 0.0075
    ## AZ1865         0.3245 0.3031 0.1605         0.0551 0.0876  4e-04 0.1068
    ## AZ1887         0.0132 0.0121 0.0085         0.0031 0.1196  5e-04 0.0119
    ## BI1859         0.0002 0.0002 0.0002         0.0001 0.0002  2e-04 0.0002
    ## CA1850         0.0464 0.0437 0.0250         0.0064 0.0151  4e-04 0.0228
    ## CA1851             NA 0.4810 0.2225         0.0623 0.1016  4e-04 0.1029
    ## CA1858             NA     NA 0.2588         0.0734 0.1094  4e-04 0.1105
    ## CA1868             NA     NA     NA         0.0645 0.0864  5e-04 0.0821
    ## CA1868extended     NA     NA     NA             NA 0.0406  2e-04 0.0293
    ## CA1872             NA     NA     NA             NA     NA  5e-04 0.0451
    ## CO1868             NA     NA     NA             NA     NA     NA 0.0090
    ## CO1877             NA     NA     NA             NA     NA     NA     NA
    ## CT1854             NA     NA     NA             NA     NA     NA     NA
    ## CT1879             NA     NA     NA             NA     NA     NA     NA
    ## CT1879extended     NA     NA     NA             NA     NA     NA     NA
    ## DC1857             NA     NA     NA             NA     NA     NA     NA
    ## DE1852             NA     NA     NA             NA     NA     NA     NA
    ## DT1862             NA     NA     NA             NA     NA     NA     NA
    ## DT1868             NA     NA     NA             NA     NA     NA     NA
    ## DT1887             NA     NA     NA             NA     NA     NA     NA
    ## FL1847             NA     NA     NA             NA     NA     NA     NA
    ## FL1870             NA     NA     NA             NA     NA     NA     NA
    ## FL1892             NA     NA     NA             NA     NA     NA     NA
    ## FR1806             NA     NA     NA             NA     NA     NA     NA
    ## GA1851             NA     NA     NA             NA     NA     NA     NA
    ## GA1860             NA     NA     NA             NA     NA     NA     NA
    ## GB1852             NA     NA     NA             NA     NA     NA     NA
    ## GB1854             NA     NA     NA             NA     NA     NA     NA
    ## GB1873             NA     NA     NA             NA     NA     NA     NA
    ## GB1875             NA     NA     NA             NA     NA     NA     NA
    ## HI1859             NA     NA     NA             NA     NA     NA     NA
    ## HI1897             NA     NA     NA             NA     NA     NA     NA
    ## IA1839             NA     NA     NA             NA     NA     NA     NA
    ## IA1851             NA     NA     NA             NA     NA     NA     NA
    ## IA1859             NA     NA     NA             NA     NA     NA     NA
    ## ID1864             NA     NA     NA             NA     NA     NA     NA
    ## ID1881             NA     NA     NA             NA     NA     NA     NA
    ## IL1866             NA     NA     NA             NA     NA     NA     NA
    ## IL1933             NA     NA     NA             NA     NA     NA     NA
    ## IN1843             NA     NA     NA             NA     NA     NA     NA
    ## IN1852             NA     NA     NA             NA     NA     NA     NA
    ## KS1859             NA     NA     NA             NA     NA     NA     NA
    ## KS1868             NA     NA     NA             NA     NA     NA     NA
    ## KY1851             NA     NA     NA             NA     NA     NA     NA
    ## KY1854             NA     NA     NA             NA     NA     NA     NA
    ## LA1825             NA     NA     NA             NA     NA     NA     NA
    ## LA1825french       NA     NA     NA             NA     NA     NA     NA
    ## LC1867             NA     NA     NA             NA     NA     NA     NA
    ## LC1867french       NA     NA     NA             NA     NA     NA     NA
    ## MA1836             NA     NA     NA             NA     NA     NA     NA
    ## MA1851             NA     NA     NA             NA     NA     NA     NA
    ## MA1858             NA     NA     NA             NA     NA     NA     NA
    ## MD1855             NA     NA     NA             NA     NA     NA     NA
    ## MD1859             NA     NA     NA             NA     NA     NA     NA
    ## ME1840             NA     NA     NA             NA     NA     NA     NA
    ## MI1853             NA     NA     NA             NA     NA     NA     NA
    ## MN1851             NA     NA     NA             NA     NA     NA     NA
    ## MN1859             NA     NA     NA             NA     NA     NA     NA
    ## MO1835             NA     NA     NA             NA     NA     NA     NA
    ## MO1849             NA     NA     NA             NA     NA     NA     NA
    ## MO1856             NA     NA     NA             NA     NA     NA     NA
    ## MO1879             NA     NA     NA             NA     NA     NA     NA
    ## MS1848             NA     NA     NA             NA     NA     NA     NA
    ## MS1850             NA     NA     NA             NA     NA     NA     NA
    ## MS1857             NA     NA     NA             NA     NA     NA     NA
    ## MT1865             NA     NA     NA             NA     NA     NA     NA
    ## MT1895             NA     NA     NA             NA     NA     NA     NA
    ## NC1868             NA     NA     NA             NA     NA     NA     NA
    ## ND1877             NA     NA     NA             NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA             NA     NA     NA     NA
    ## NE1857             NA     NA     NA             NA     NA     NA     NA
    ## NE1859             NA     NA     NA             NA     NA     NA     NA
    ## NE1866             NA     NA     NA             NA     NA     NA     NA
    ## NH1842             NA     NA     NA             NA     NA     NA     NA
    ## NJ1847             NA     NA     NA             NA     NA     NA     NA
    ## NM1865             NA     NA     NA             NA     NA     NA     NA
    ## NM1897             NA     NA     NA             NA     NA     NA     NA
    ## NV1861             NA     NA     NA             NA     NA     NA     NA
    ## NV1869             NA     NA     NA             NA     NA     NA     NA
    ## NY1848             NA     NA     NA             NA     NA     NA     NA
    ## NY1849             NA     NA     NA             NA     NA     NA     NA
    ## NY1850             NA     NA     NA             NA     NA     NA     NA
    ## NY1851             NA     NA     NA             NA     NA     NA     NA
    ## NY1853             NA     NA     NA             NA     NA     NA     NA
    ## NY1876             NA     NA     NA             NA     NA     NA     NA
    ## NY1879             NA     NA     NA             NA     NA     NA     NA
    ## OH1853             NA     NA     NA             NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA             NA     NA     NA     NA
    ## OH1879             NA     NA     NA             NA     NA     NA     NA
    ## OK1891             NA     NA     NA             NA     NA     NA     NA
    ## OK1893             NA     NA     NA             NA     NA     NA     NA
    ## OR1854             NA     NA     NA             NA     NA     NA     NA
    ## OR1862             NA     NA     NA             NA     NA     NA     NA
    ## SC1870             NA     NA     NA             NA     NA     NA     NA
    ## TN1858             NA     NA     NA             NA     NA     NA     NA
    ## UT1853             NA     NA     NA             NA     NA     NA     NA
    ## UT1859             NA     NA     NA             NA     NA     NA     NA
    ## UT1870             NA     NA     NA             NA     NA     NA     NA
    ## UT1884             NA     NA     NA             NA     NA     NA     NA
    ## VA1841             NA     NA     NA             NA     NA     NA     NA
    ## VA1860             NA     NA     NA             NA     NA     NA     NA
    ## WA1855             NA     NA     NA             NA     NA     NA     NA
    ## WA1873             NA     NA     NA             NA     NA     NA     NA
    ## WI1849             NA     NA     NA             NA     NA     NA     NA
    ## WI1856             NA     NA     NA             NA     NA     NA     NA
    ## WI1858             NA     NA     NA             NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA             NA     NA     NA     NA
    ## WV1868             NA     NA     NA             NA     NA     NA     NA
    ## WY1870             NA     NA     NA             NA     NA     NA     NA
    ## WY1886             NA     NA     NA             NA     NA     NA     NA
    ##                CT1854 CT1879 CT1879extended DC1857 DE1852 DT1862 DT1868
    ## AK1900          1e-04  2e-04         0.0003 0.0101  2e-04 0.0043 0.0112
    ## AL1852          2e-04  0e+00         0.0001 0.0007  2e-04 0.0004 0.0005
    ## AR1868          2e-04  1e-04         0.0003 0.0136  2e-04 0.0300 0.0044
    ## AR1874          2e-04  2e-04         0.0003 0.0156  1e-04 0.0364 0.0049
    ## AZ1865          3e-04  3e-04         0.0003 0.0309  2e-04 0.0096 0.0250
    ## AZ1887          2e-04  1e-04         0.0002 0.0040  2e-04 0.0032 0.0035
    ## BI1859          2e-04  0e+00         0.0000 0.0002  1e-04 0.0002 0.0001
    ## CA1850          3e-04  4e-04         0.0004 0.0153  1e-04 0.0149 0.0500
    ## CA1851          3e-04  2e-04         0.0004 0.0301  2e-04 0.0111 0.0270
    ## CA1858          3e-04  2e-04         0.0003 0.0301  2e-04 0.0112 0.0267
    ## CA1868          3e-04  2e-04         0.0004 0.0199  2e-04 0.0080 0.0182
    ## CA1868extended  1e-04  0e+00         0.0002 0.0078  1e-04 0.0026 0.0059
    ## CA1872          2e-04  1e-04         0.0003 0.0170  2e-04 0.0100 0.0157
    ## CO1868          4e-04  0e+00         0.0001 0.0006  7e-04 0.0005 0.0004
    ## CO1877          4e-04  1e-04         0.0004 0.0202  1e-04 0.0106 0.0178
    ## CT1854             NA  0e+00         0.0003 0.0004  2e-04 0.0003 0.0003
    ## CT1879             NA     NA         0.0269 0.0002  0e+00 0.0004 0.0003
    ## CT1879extended     NA     NA             NA 0.0004  1e-04 0.0003 0.0003
    ## DC1857             NA     NA             NA     NA  3e-04 0.0364 0.0167
    ## DE1852             NA     NA             NA     NA     NA 0.0002 0.0002
    ## DT1862             NA     NA             NA     NA     NA     NA 0.0118
    ## DT1868             NA     NA             NA     NA     NA     NA     NA
    ## DT1887             NA     NA             NA     NA     NA     NA     NA
    ## FL1847             NA     NA             NA     NA     NA     NA     NA
    ## FL1870             NA     NA             NA     NA     NA     NA     NA
    ## FL1892             NA     NA             NA     NA     NA     NA     NA
    ## FR1806             NA     NA             NA     NA     NA     NA     NA
    ## GA1851             NA     NA             NA     NA     NA     NA     NA
    ## GA1860             NA     NA             NA     NA     NA     NA     NA
    ## GB1852             NA     NA             NA     NA     NA     NA     NA
    ## GB1854             NA     NA             NA     NA     NA     NA     NA
    ## GB1873             NA     NA             NA     NA     NA     NA     NA
    ## GB1875             NA     NA             NA     NA     NA     NA     NA
    ## HI1859             NA     NA             NA     NA     NA     NA     NA
    ## HI1897             NA     NA             NA     NA     NA     NA     NA
    ## IA1839             NA     NA             NA     NA     NA     NA     NA
    ## IA1851             NA     NA             NA     NA     NA     NA     NA
    ## IA1859             NA     NA             NA     NA     NA     NA     NA
    ## ID1864             NA     NA             NA     NA     NA     NA     NA
    ## ID1881             NA     NA             NA     NA     NA     NA     NA
    ## IL1866             NA     NA             NA     NA     NA     NA     NA
    ## IL1933             NA     NA             NA     NA     NA     NA     NA
    ## IN1843             NA     NA             NA     NA     NA     NA     NA
    ## IN1852             NA     NA             NA     NA     NA     NA     NA
    ## KS1859             NA     NA             NA     NA     NA     NA     NA
    ## KS1868             NA     NA             NA     NA     NA     NA     NA
    ## KY1851             NA     NA             NA     NA     NA     NA     NA
    ## KY1854             NA     NA             NA     NA     NA     NA     NA
    ## LA1825             NA     NA             NA     NA     NA     NA     NA
    ## LA1825french       NA     NA             NA     NA     NA     NA     NA
    ## LC1867             NA     NA             NA     NA     NA     NA     NA
    ## LC1867french       NA     NA             NA     NA     NA     NA     NA
    ## MA1836             NA     NA             NA     NA     NA     NA     NA
    ## MA1851             NA     NA             NA     NA     NA     NA     NA
    ## MA1858             NA     NA             NA     NA     NA     NA     NA
    ## MD1855             NA     NA             NA     NA     NA     NA     NA
    ## MD1859             NA     NA             NA     NA     NA     NA     NA
    ## ME1840             NA     NA             NA     NA     NA     NA     NA
    ## MI1853             NA     NA             NA     NA     NA     NA     NA
    ## MN1851             NA     NA             NA     NA     NA     NA     NA
    ## MN1859             NA     NA             NA     NA     NA     NA     NA
    ## MO1835             NA     NA             NA     NA     NA     NA     NA
    ## MO1849             NA     NA             NA     NA     NA     NA     NA
    ## MO1856             NA     NA             NA     NA     NA     NA     NA
    ## MO1879             NA     NA             NA     NA     NA     NA     NA
    ## MS1848             NA     NA             NA     NA     NA     NA     NA
    ## MS1850             NA     NA             NA     NA     NA     NA     NA
    ## MS1857             NA     NA             NA     NA     NA     NA     NA
    ## MT1865             NA     NA             NA     NA     NA     NA     NA
    ## MT1895             NA     NA             NA     NA     NA     NA     NA
    ## NC1868             NA     NA             NA     NA     NA     NA     NA
    ## ND1877             NA     NA             NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA             NA     NA     NA     NA     NA
    ## NE1857             NA     NA             NA     NA     NA     NA     NA
    ## NE1859             NA     NA             NA     NA     NA     NA     NA
    ## NE1866             NA     NA             NA     NA     NA     NA     NA
    ## NH1842             NA     NA             NA     NA     NA     NA     NA
    ## NJ1847             NA     NA             NA     NA     NA     NA     NA
    ## NM1865             NA     NA             NA     NA     NA     NA     NA
    ## NM1897             NA     NA             NA     NA     NA     NA     NA
    ## NV1861             NA     NA             NA     NA     NA     NA     NA
    ## NV1869             NA     NA             NA     NA     NA     NA     NA
    ## NY1848             NA     NA             NA     NA     NA     NA     NA
    ## NY1849             NA     NA             NA     NA     NA     NA     NA
    ## NY1850             NA     NA             NA     NA     NA     NA     NA
    ## NY1851             NA     NA             NA     NA     NA     NA     NA
    ## NY1853             NA     NA             NA     NA     NA     NA     NA
    ## NY1876             NA     NA             NA     NA     NA     NA     NA
    ## NY1879             NA     NA             NA     NA     NA     NA     NA
    ## OH1853             NA     NA             NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA             NA     NA     NA     NA     NA
    ## OH1879             NA     NA             NA     NA     NA     NA     NA
    ## OK1891             NA     NA             NA     NA     NA     NA     NA
    ## OK1893             NA     NA             NA     NA     NA     NA     NA
    ## OR1854             NA     NA             NA     NA     NA     NA     NA
    ## OR1862             NA     NA             NA     NA     NA     NA     NA
    ## SC1870             NA     NA             NA     NA     NA     NA     NA
    ## TN1858             NA     NA             NA     NA     NA     NA     NA
    ## UT1853             NA     NA             NA     NA     NA     NA     NA
    ## UT1859             NA     NA             NA     NA     NA     NA     NA
    ## UT1870             NA     NA             NA     NA     NA     NA     NA
    ## UT1884             NA     NA             NA     NA     NA     NA     NA
    ## VA1841             NA     NA             NA     NA     NA     NA     NA
    ## VA1860             NA     NA             NA     NA     NA     NA     NA
    ## WA1855             NA     NA             NA     NA     NA     NA     NA
    ## WA1873             NA     NA             NA     NA     NA     NA     NA
    ## WI1849             NA     NA             NA     NA     NA     NA     NA
    ## WI1856             NA     NA             NA     NA     NA     NA     NA
    ## WI1858             NA     NA             NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA             NA     NA     NA     NA     NA
    ## WV1868             NA     NA             NA     NA     NA     NA     NA
    ## WY1870             NA     NA             NA     NA     NA     NA     NA
    ## WY1886             NA     NA             NA     NA     NA     NA     NA
    ##                DT1887 FL1847 FL1870 FL1892 FR1806 GA1851 GA1860 GB1852
    ## AK1900         0.0066 0.0003 0.0145 0.0007      0 0.0002 0.0002 0.0001
    ## AL1852         0.0004 0.0006 0.0007 0.0005      0 0.0003 0.0004 0.0001
    ## AR1868         0.0028 0.0004 0.0055 0.0004      0 0.0002 0.0003 0.0001
    ## AR1874         0.0023 0.0002 0.0065 0.0002      0 0.0001 0.0001 0.0001
    ## AZ1865         0.0181 0.0003 0.0368 0.0005      0 0.0002 0.0002 0.0001
    ## AZ1887         0.0480 0.0004 0.0049 0.0004      0 0.0003 0.0004 0.0001
    ## BI1859         0.0001 0.0002 0.0002 0.0003      0 0.0001 0.0001 0.0007
    ## CA1850         0.0129 0.0003 0.0675 0.0003      0 0.0001 0.0002 0.0001
    ## CA1851         0.0197 0.0003 0.0384 0.0005      0 0.0002 0.0003 0.0001
    ## CA1858         0.0214 0.0003 0.0368 0.0006      0 0.0002 0.0003 0.0002
    ## CA1868         0.0171 0.0004 0.0250 0.0005      0 0.0002 0.0003 0.0002
    ## CA1868extended 0.0081 0.0002 0.0078 0.0003      0 0.0002 0.0002 0.0001
    ## CA1872         0.0657 0.0003 0.0189 0.0020      0 0.0002 0.0003 0.0001
    ## CO1868         0.0004 0.0015 0.0004 0.0010      0 0.0006 0.0006 0.0002
    ## CO1877         0.0087 0.0004 0.0237 0.0005      0 0.0002 0.0003 0.0002
    ## CT1854         0.0002 0.0003 0.0003 0.0003      0 0.0002 0.0002 0.0001
    ## CT1879         0.0001 0.0000 0.0005 0.0000      0 0.0000 0.0000 0.0001
    ## CT1879extended 0.0002 0.0001 0.0005 0.0002      0 0.0001 0.0001 0.0002
    ## DC1857         0.0100 0.0006 0.0226 0.0014      0 0.0002 0.0005 0.0001
    ## DE1852         0.0002 0.0005 0.0002 0.0005      0 0.0002 0.0002 0.0001
    ## DT1862         0.0110 0.0006 0.0146 0.0006      0 0.0003 0.0004 0.0002
    ## DT1868         0.0311 0.0002 0.1406 0.0025      0 0.0001 0.0002 0.0001
    ## DT1887             NA 0.0004 0.0314 0.0016      0 0.0002 0.0003 0.0001
    ## FL1847             NA     NA 0.0004 0.0335      0 0.0033 0.0009 0.0002
    ## FL1870             NA     NA     NA 0.0023      0 0.0002 0.0002 0.0001
    ## FL1892             NA     NA     NA     NA      0 0.0008 0.0005 0.0087
    ## FR1806             NA     NA     NA     NA     NA 0.0000 0.0000 0.0000
    ## GA1851             NA     NA     NA     NA     NA     NA 0.0138 0.0002
    ## GA1860             NA     NA     NA     NA     NA     NA     NA 0.0001
    ## GB1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1875             NA     NA     NA     NA     NA     NA     NA     NA
    ## HI1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## HI1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1839             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1864             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1881             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1933             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1843             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825french       NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867             NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867french       NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1836             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ME1840             NA     NA     NA     NA     NA     NA     NA     NA
    ## MI1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                GB1854 GB1873 GB1875 HI1859 HI1897 IA1839 IA1851 IA1859
    ## AK1900         0.0001 0.0001 0.0001 0.0004 0.0007 0.0001 0.0013 0.0017
    ## AL1852         0.0000 0.0000 0.0001 0.0001 0.0002 0.0001 0.0003 0.0004
    ## AR1868         0.0000 0.0000 0.0001 0.0012 0.0011 0.0001 0.0007 0.0158
    ## AR1874         0.0001 0.0000 0.0001 0.0023 0.0015 0.0002 0.0009 0.0125
    ## AZ1865         0.0001 0.0000 0.0001 0.0049 0.0038 0.0001 0.0024 0.0023
    ## AZ1887         0.0001 0.0001 0.0001 0.0011 0.0010 0.0001 0.0007 0.0009
    ## BI1859         0.0017 0.0001 0.0001 0.0000 0.0006 0.0001 0.0001 0.0002
    ## CA1850         0.0001 0.0000 0.0001 0.0026 0.0017 0.0002 0.0013 0.0024
    ## CA1851         0.0001 0.0000 0.0001 0.0061 0.0047 0.0001 0.0027 0.0027
    ## CA1858         0.0001 0.0001 0.0001 0.0040 0.0032 0.0001 0.0026 0.0028
    ## CA1868         0.0001 0.0001 0.0001 0.0038 0.0032 0.0001 0.0020 0.0022
    ## CA1868extended 0.0000 0.0000 0.0001 0.0008 0.0009 0.0000 0.0008 0.0011
    ## CA1872         0.0001 0.0001 0.0001 0.0018 0.0019 0.0001 0.0029 0.0027
    ## CO1868         0.0001 0.0001 0.0001 0.0001 0.0010 0.0183 0.0005 0.0003
    ## CO1877         0.0001 0.0000 0.0001 0.0035 0.0027 0.0001 0.0023 0.0028
    ## CT1854         0.0001 0.0001 0.0000 0.0003 0.0004 0.0001 0.0001 0.0002
    ## CT1879         0.0000 0.0001 0.0001 0.0003 0.0002 0.0001 0.0000 0.0000
    ## CT1879extended 0.0000 0.0001 0.0002 0.0001 0.0001 0.0001 0.0001 0.0002
    ## DC1857         0.0001 0.0001 0.0001 0.0021 0.0023 0.0003 0.0026 0.0067
    ## DE1852         0.0000 0.0000 0.0001 0.0002 0.0006 0.0001 0.0002 0.0001
    ## DT1862         0.0001 0.0001 0.0001 0.0024 0.0020 0.0003 0.0074 0.0131
    ## DT1868         0.0001 0.0001 0.0001 0.0022 0.0023 0.0001 0.0012 0.0020
    ## DT1887         0.0001 0.0000 0.0001 0.0006 0.0009 0.0001 0.0014 0.0018
    ## FL1847         0.0001 0.0001 0.0001 0.0001 0.0016 0.0003 0.0003 0.0003
    ## FL1870         0.0001 0.0001 0.0001 0.0031 0.0029 0.0001 0.0016 0.0029
    ## FL1892         0.0021 0.0001 0.0001 0.0003 0.0029 0.0003 0.0002 0.0005
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0001 0.0001 0.0001 0.0001 0.0002 0.0001 0.0002 0.0001
    ## GA1860         0.0001 0.0000 0.0001 0.0000 0.0002 0.0001 0.0003 0.0002
    ## GB1852         0.0107 0.0008 0.0025 0.0001 0.0113 0.0001 0.0001 0.0007
    ## GB1854             NA 0.0011 0.0011 0.0001 0.0149 0.0001 0.0001 0.0011
    ## GB1873             NA     NA 0.0050 0.0000 0.0002 0.0000 0.0000 0.0000
    ## GB1875             NA     NA     NA 0.0000 0.0002 0.0000 0.0001 0.0001
    ## HI1859             NA     NA     NA     NA 0.1075 0.0001 0.0005 0.0003
    ## HI1897             NA     NA     NA     NA     NA 0.0001 0.0005 0.0004
    ## IA1839             NA     NA     NA     NA     NA     NA 0.0002 0.0001
    ## IA1851             NA     NA     NA     NA     NA     NA     NA 0.0694
    ## IA1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1864             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1881             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1933             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1843             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825french       NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867             NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867french       NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1836             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ME1840             NA     NA     NA     NA     NA     NA     NA     NA
    ## MI1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                ID1864 ID1881 IL1866 IL1933 IN1843 IN1852 KS1859 KS1868
    ## AK1900         0.0154 0.0130 0.0004 0.0003 0.0009 0.0035 0.0051 0.0052
    ## AL1852         0.0005 0.0008 0.0005 0.0002 0.0006 0.0005 0.0005 0.0004
    ## AR1868         0.0038 0.0048 0.0004 0.0003 0.0005 0.0097 0.0310 0.0235
    ## AR1874         0.0039 0.0049 0.0003 0.0005 0.0002 0.0112 0.0376 0.0226
    ## AZ1865         0.1459 0.0734 0.0004 0.0005 0.0005 0.0055 0.0108 0.0103
    ## AZ1887         0.0081 0.0057 0.0004 0.0004 0.0005 0.0026 0.0032 0.0024
    ## BI1859         0.0001 0.0001 0.0002 0.0002 0.0002 0.0002 0.0002 0.0002
    ## CA1850         0.0213 0.0128 0.0003 0.0013 0.0003 0.0078 0.0156 0.0104
    ## CA1851         0.1376 0.0711 0.0004 0.0006 0.0005 0.0068 0.0121 0.0113
    ## CA1858         0.1640 0.0753 0.0004 0.0006 0.0006 0.0067 0.0121 0.0116
    ## CA1868         0.1033 0.0587 0.0004 0.0005 0.0005 0.0047 0.0088 0.0085
    ## CA1868extended 0.0378 0.0270 0.0002 0.0002 0.0004 0.0019 0.0028 0.0034
    ## CA1872         0.0526 0.1571 0.0004 0.0004 0.0006 0.0054 0.0095 0.0105
    ## CO1868         0.0004 0.0003 0.1191 0.0030 0.0026 0.0006 0.0005 0.0005
    ## CO1877         0.0705 0.0394 0.0045 0.0006 0.0004 0.0077 0.0113 0.0099
    ## CT1854         0.0003 0.0002 0.0006 0.0002 0.0003 0.0002 0.0008 0.0006
    ## CT1879         0.0001 0.0001 0.0000 0.0021 0.0000 0.0001 0.0004 0.0002
    ## CT1879extended 0.0003 0.0003 0.0001 0.0011 0.0002 0.0003 0.0004 0.0004
    ## DC1857         0.0194 0.0146 0.0006 0.0006 0.0062 0.0431 0.0370 0.0322
    ## DE1852         0.0001 0.0002 0.0003 0.0001 0.0007 0.0004 0.0002 0.0002
    ## DT1862         0.0071 0.0089 0.0005 0.0007 0.0007 0.0088 0.2999 0.1600
    ## DT1868         0.0156 0.0142 0.0003 0.0009 0.0005 0.0076 0.0118 0.0088
    ## DT1887         0.0130 0.0242 0.0003 0.0005 0.0006 0.0038 0.0103 0.0096
    ## FL1847         0.0003 0.0003 0.0024 0.0003 0.0034 0.0009 0.0005 0.0006
    ## FL1870         0.0209 0.0172 0.0003 0.0010 0.0007 0.0098 0.0158 0.0120
    ## FL1892         0.0006 0.0016 0.0011 0.0002 0.0022 0.0008 0.0006 0.0006
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0002 0.0001 0.0009 0.0002 0.0004 0.0003 0.0003 0.0003
    ## GA1860         0.0003 0.0002 0.0005 0.0002 0.0005 0.0003 0.0004 0.0004
    ## GB1852         0.0001 0.0001 0.0003 0.0001 0.0001 0.0001 0.0002 0.0001
    ## GB1854         0.0001 0.0000 0.0001 0.0002 0.0001 0.0001 0.0001 0.0001
    ## GB1873         0.0001 0.0000 0.0001 0.0000 0.0001 0.0001 0.0001 0.0001
    ## GB1875         0.0001 0.0001 0.0001 0.0003 0.0001 0.0001 0.0001 0.0001
    ## HI1859         0.0027 0.0018 0.0001 0.0001 0.0005 0.0008 0.0018 0.0011
    ## HI1897         0.0024 0.0018 0.0004 0.0002 0.0005 0.0009 0.0016 0.0012
    ## IA1839         0.0001 0.0001 0.0216 0.0021 0.0003 0.0002 0.0004 0.0003
    ## IA1851         0.0018 0.0025 0.0004 0.0002 0.0004 0.0038 0.0018 0.0030
    ## IA1859         0.0020 0.0025 0.0003 0.0002 0.0007 0.0043 0.0109 0.0090
    ## ID1864             NA 0.0453 0.0004 0.0004 0.0005 0.0046 0.0080 0.0076
    ## ID1881             NA     NA 0.0003 0.0003 0.0004 0.0043 0.0085 0.0089
    ## IL1866             NA     NA     NA 0.0031 0.0010 0.0006 0.0005 0.0006
    ## IL1933             NA     NA     NA     NA 0.0002 0.0007 0.0009 0.0006
    ## IN1843             NA     NA     NA     NA     NA 0.0090 0.0006 0.0030
    ## IN1852             NA     NA     NA     NA     NA     NA 0.0095 0.0152
    ## KS1859             NA     NA     NA     NA     NA     NA     NA 0.2067
    ## KS1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825french       NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867             NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867french       NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1836             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ME1840             NA     NA     NA     NA     NA     NA     NA     NA
    ## MI1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                KY1851 KY1854 LA1825 LA1825french LC1867 LC1867french
    ## AK1900         0.0036 0.0032  0e+00        0e+00  1e-04        1e-04
    ## AL1852         0.0004 0.0004  0e+00        0e+00  1e-04        0e+00
    ## AR1868         0.1469 0.1941  0e+00        0e+00  1e-04        0e+00
    ## AR1874         0.1036 0.0972  0e+00        0e+00  1e-04        0e+00
    ## AZ1865         0.0061 0.0051  0e+00        0e+00  1e-04        0e+00
    ## AZ1887         0.0024 0.0024  1e-04        0e+00  1e-04        0e+00
    ## BI1859         0.0002 0.0002  0e+00        0e+00  0e+00        0e+00
    ## CA1850         0.0074 0.0062  1e-04        0e+00  1e-04        0e+00
    ## CA1851         0.0071 0.0060  0e+00        0e+00  1e-04        0e+00
    ## CA1858         0.0063 0.0056  0e+00        0e+00  1e-04        0e+00
    ## CA1868         0.0043 0.0039  1e-04        0e+00  2e-04        0e+00
    ## CA1868extended 0.0016 0.0015  0e+00        1e-04  1e-04        1e-04
    ## CA1872         0.0073 0.0063  1e-04        0e+00  1e-04        0e+00
    ## CO1868         0.0003 0.0003  1e-04        0e+00  1e-04        0e+00
    ## CO1877         0.0066 0.0055  0e+00        0e+00  1e-04        0e+00
    ## CT1854         0.0002 0.0002  0e+00        0e+00  1e-04        0e+00
    ## CT1879         0.0001 0.0001  0e+00        0e+00  0e+00        0e+00
    ## CT1879extended 0.0002 0.0003  0e+00        0e+00  0e+00        0e+00
    ## DC1857         0.0168 0.0151  0e+00        0e+00  1e-04        0e+00
    ## DE1852         0.0002 0.0002  0e+00        0e+00  1e-04        0e+00
    ## DT1862         0.0442 0.0366  0e+00        0e+00  1e-04        0e+00
    ## DT1868         0.0060 0.0046  0e+00        0e+00  1e-04        0e+00
    ## DT1887         0.0037 0.0032  0e+00        0e+00  1e-04        0e+00
    ## FL1847         0.0003 0.0003  0e+00        0e+00  1e-04        0e+00
    ## FL1870         0.0072 0.0057  0e+00        0e+00  1e-04        0e+00
    ## FL1892         0.0005 0.0003  0e+00        0e+00  1e-04        0e+00
    ## FR1806         0.0000 0.0000  0e+00        0e+00  0e+00        0e+00
    ## GA1851         0.0002 0.0002  0e+00        1e-04  1e-04        1e-04
    ## GA1860         0.0002 0.0003  0e+00        0e+00  1e-04        0e+00
    ## GB1852         0.0001 0.0001  0e+00        0e+00  1e-04        0e+00
    ## GB1854         0.0001 0.0001  0e+00        0e+00  0e+00        0e+00
    ## GB1873         0.0000 0.0000  0e+00        0e+00  0e+00        0e+00
    ## GB1875         0.0001 0.0001  0e+00        1e-04  1e-04        0e+00
    ## HI1859         0.0019 0.0014  0e+00        0e+00  0e+00        0e+00
    ## HI1897         0.0016 0.0012  0e+00        0e+00  1e-04        0e+00
    ## IA1839         0.0001 0.0001  0e+00        0e+00  0e+00        0e+00
    ## IA1851         0.0009 0.0008  0e+00        0e+00  1e-04        0e+00
    ## IA1859         0.0151 0.0170  0e+00        0e+00  1e-04        0e+00
    ## ID1864         0.0042 0.0036  0e+00        0e+00  1e-04        0e+00
    ## ID1881         0.0060 0.0050  0e+00        0e+00  1e-04        0e+00
    ## IL1866         0.0003 0.0003  0e+00        0e+00  1e-04        0e+00
    ## IL1933         0.0003 0.0004  0e+00        0e+00  0e+00        0e+00
    ## IN1843         0.0003 0.0004  0e+00        0e+00  1e-04        0e+00
    ## IN1852         0.0108 0.0099  0e+00        0e+00  1e-04        0e+00
    ## KS1859         0.0404 0.0344  0e+00        0e+00  1e-04        0e+00
    ## KS1868         0.0277 0.0245  0e+00        0e+00  1e-04        1e-04
    ## KY1851             NA 0.2829  0e+00        0e+00  1e-04        0e+00
    ## KY1854             NA     NA  0e+00        0e+00  1e-04        0e+00
    ## LA1825             NA     NA     NA        0e+00  0e+00        0e+00
    ## LA1825french       NA     NA     NA           NA  0e+00        0e+00
    ## LC1867             NA     NA     NA           NA     NA        0e+00
    ## LC1867french       NA     NA     NA           NA     NA           NA
    ## MA1836             NA     NA     NA           NA     NA           NA
    ## MA1851             NA     NA     NA           NA     NA           NA
    ## MA1858             NA     NA     NA           NA     NA           NA
    ## MD1855             NA     NA     NA           NA     NA           NA
    ## MD1859             NA     NA     NA           NA     NA           NA
    ## ME1840             NA     NA     NA           NA     NA           NA
    ## MI1853             NA     NA     NA           NA     NA           NA
    ## MN1851             NA     NA     NA           NA     NA           NA
    ## MN1859             NA     NA     NA           NA     NA           NA
    ## MO1835             NA     NA     NA           NA     NA           NA
    ## MO1849             NA     NA     NA           NA     NA           NA
    ## MO1856             NA     NA     NA           NA     NA           NA
    ## MO1879             NA     NA     NA           NA     NA           NA
    ## MS1848             NA     NA     NA           NA     NA           NA
    ## MS1850             NA     NA     NA           NA     NA           NA
    ## MS1857             NA     NA     NA           NA     NA           NA
    ## MT1865             NA     NA     NA           NA     NA           NA
    ## MT1895             NA     NA     NA           NA     NA           NA
    ## NC1868             NA     NA     NA           NA     NA           NA
    ## ND1877             NA     NA     NA           NA     NA           NA
    ## ND1877extended     NA     NA     NA           NA     NA           NA
    ## NE1857             NA     NA     NA           NA     NA           NA
    ## NE1859             NA     NA     NA           NA     NA           NA
    ## NE1866             NA     NA     NA           NA     NA           NA
    ## NH1842             NA     NA     NA           NA     NA           NA
    ## NJ1847             NA     NA     NA           NA     NA           NA
    ## NM1865             NA     NA     NA           NA     NA           NA
    ## NM1897             NA     NA     NA           NA     NA           NA
    ## NV1861             NA     NA     NA           NA     NA           NA
    ## NV1869             NA     NA     NA           NA     NA           NA
    ## NY1848             NA     NA     NA           NA     NA           NA
    ## NY1849             NA     NA     NA           NA     NA           NA
    ## NY1850             NA     NA     NA           NA     NA           NA
    ## NY1851             NA     NA     NA           NA     NA           NA
    ## NY1853             NA     NA     NA           NA     NA           NA
    ## NY1876             NA     NA     NA           NA     NA           NA
    ## NY1879             NA     NA     NA           NA     NA           NA
    ## OH1853             NA     NA     NA           NA     NA           NA
    ## OH1853extended     NA     NA     NA           NA     NA           NA
    ## OH1879             NA     NA     NA           NA     NA           NA
    ## OK1891             NA     NA     NA           NA     NA           NA
    ## OK1893             NA     NA     NA           NA     NA           NA
    ## OR1854             NA     NA     NA           NA     NA           NA
    ## OR1862             NA     NA     NA           NA     NA           NA
    ## SC1870             NA     NA     NA           NA     NA           NA
    ## TN1858             NA     NA     NA           NA     NA           NA
    ## UT1853             NA     NA     NA           NA     NA           NA
    ## UT1859             NA     NA     NA           NA     NA           NA
    ## UT1870             NA     NA     NA           NA     NA           NA
    ## UT1884             NA     NA     NA           NA     NA           NA
    ## VA1841             NA     NA     NA           NA     NA           NA
    ## VA1860             NA     NA     NA           NA     NA           NA
    ## WA1855             NA     NA     NA           NA     NA           NA
    ## WA1873             NA     NA     NA           NA     NA           NA
    ## WI1849             NA     NA     NA           NA     NA           NA
    ## WI1856             NA     NA     NA           NA     NA           NA
    ## WI1858             NA     NA     NA           NA     NA           NA
    ## WOOD1857           NA     NA     NA           NA     NA           NA
    ## WV1868             NA     NA     NA           NA     NA           NA
    ## WY1870             NA     NA     NA           NA     NA           NA
    ## WY1886             NA     NA     NA           NA     NA           NA
    ##                MA1836 MA1851 MA1858 MD1855 MD1859 ME1840 MI1853 MN1851
    ## AK1900         0.0006  1e-04 0.0005 0.0001 0.0001 0.0005 0.0002 0.0133
    ## AL1852         0.0003  1e-04 0.0002 0.0001 0.0002 0.0002 0.0001 0.0008
    ## AR1868         0.0003  1e-04 0.0003 0.0001 0.0002 0.0002 0.0001 0.0030
    ## AR1874         0.0002  0e+00 0.0002 0.0001 0.0001 0.0002 0.0001 0.0028
    ## AZ1865         0.0003  1e-04 0.0003 0.0001 0.0002 0.0003 0.0006 0.0238
    ## AZ1887         0.0003  1e-04 0.0004 0.0000 0.0002 0.0004 0.0002 0.0016
    ## BI1859         0.0002  1e-04 0.0002 0.0001 0.0001 0.0001 0.0001 0.0001
    ## CA1850         0.0005  1e-04 0.0004 0.0001 0.0002 0.0002 0.0011 0.0130
    ## CA1851         0.0003  1e-04 0.0003 0.0001 0.0002 0.0002 0.0006 0.0234
    ## CA1858         0.0003  1e-04 0.0003 0.0001 0.0001 0.0003 0.0005 0.0227
    ## CA1868         0.0003  0e+00 0.0003 0.0001 0.0002 0.0003 0.0004 0.0156
    ## CA1868extended 0.0003  0e+00 0.0003 0.0000 0.0001 0.0002 0.0002 0.0071
    ## CA1872         0.0006  1e-04 0.0006 0.0000 0.0001 0.0004 0.0002 0.0206
    ## CO1868         0.0030  1e-04 0.0011 0.0001 0.0003 0.0021 0.0002 0.0005
    ## CO1877         0.0002  0e+00 0.0003 0.0001 0.0002 0.0002 0.0004 0.0125
    ## CT1854         0.0003  1e-04 0.0003 0.0000 0.0002 0.0004 0.0001 0.0003
    ## CT1879         0.0000  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0001
    ## CT1879extended 0.0001  1e-04 0.0001 0.0002 0.0002 0.0001 0.0001 0.0002
    ## DC1857         0.0017  1e-04 0.0011 0.0001 0.0001 0.0007 0.0003 0.0088
    ## DE1852         0.0029  0e+00 0.0017 0.0001 0.0001 0.0012 0.0001 0.0005
    ## DT1862         0.0004  1e-04 0.0004 0.0001 0.0002 0.0004 0.0003 0.0078
    ## DT1868         0.0003  1e-04 0.0003 0.0001 0.0001 0.0003 0.0007 0.0184
    ## DT1887         0.0003  1e-04 0.0004 0.0001 0.0001 0.0004 0.0003 0.0102
    ## FL1847         0.0067  1e-04 0.0043 0.0001 0.0002 0.0018 0.0002 0.0029
    ## FL1870         0.0004  1e-04 0.0004 0.0000 0.0001 0.0004 0.0009 0.0237
    ## FL1892         0.0027  1e-04 0.0020 0.0057 0.0021 0.0009 0.0002 0.0013
    ## FR1806         0.0000  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0003  0e+00 0.0002 0.0000 0.0002 0.0003 0.0001 0.0002
    ## GA1860         0.0002  1e-04 0.0003 0.0001 0.0003 0.0003 0.0001 0.0002
    ## GB1852         0.0002  1e-04 0.0001 0.0331 0.0089 0.0001 0.0001 0.0001
    ## GB1854         0.0001  1e-04 0.0001 0.0001 0.0001 0.0001 0.0000 0.0000
    ## GB1873         0.0001  1e-04 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GB1875         0.0001  0e+00 0.0001 0.0002 0.0000 0.0001 0.0001 0.0001
    ## HI1859         0.0007  0e+00 0.0006 0.0000 0.0000 0.0018 0.0001 0.0009
    ## HI1897         0.0050  1e-04 0.0033 0.0001 0.0001 0.0076 0.0002 0.0014
    ## IA1839         0.0001  0e+00 0.0001 0.0000 0.0002 0.0001 0.0001 0.0007
    ## IA1851         0.0004  0e+00 0.0004 0.0001 0.0001 0.0004 0.0001 0.0019
    ## IA1859         0.0003  6e-04 0.0006 0.0008 0.0001 0.0003 0.0001 0.0017
    ## ID1864         0.0003  1e-04 0.0003 0.0001 0.0001 0.0002 0.0004 0.0151
    ## ID1881         0.0005  1e-04 0.0004 0.0001 0.0001 0.0003 0.0002 0.0176
    ## IL1866         0.0011  1e-04 0.0006 0.0001 0.0003 0.0004 0.0002 0.0005
    ## IL1933         0.0001  1e-04 0.0002 0.0001 0.0001 0.0001 0.0010 0.0004
    ## IN1843         0.0050  1e-04 0.0028 0.0001 0.0002 0.0031 0.0003 0.0018
    ## IN1852         0.0009  2e-04 0.0010 0.0001 0.0002 0.0009 0.0002 0.0036
    ## KS1859         0.0004  1e-04 0.0004 0.0001 0.0002 0.0004 0.0003 0.0079
    ## KS1868         0.0004  1e-04 0.0005 0.0001 0.0002 0.0004 0.0003 0.0070
    ## KY1851         0.0003  1e-04 0.0003 0.0001 0.0002 0.0002 0.0001 0.0038
    ## KY1854         0.0003  1e-04 0.0003 0.0001 0.0002 0.0002 0.0001 0.0030
    ## LA1825         0.0001  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LA1825french   0.0000  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0001  0e+00 0.0001 0.0000 0.0000 0.0001 0.0001 0.0001
    ## LC1867french   0.0000  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836             NA  5e-04 0.1113 0.0001 0.0001 0.0332 0.0002 0.0069
    ## MA1851             NA     NA 0.0126 0.0005 0.0005 0.0001 0.0000 0.0001
    ## MA1858             NA     NA     NA 0.0002 0.0002 0.0195 0.0002 0.0039
    ## MD1855             NA     NA     NA     NA 0.0657 0.0001 0.0000 0.0000
    ## MD1859             NA     NA     NA     NA     NA 0.0002 0.0001 0.0001
    ## ME1840             NA     NA     NA     NA     NA     NA 0.0001 0.0014
    ## MI1853             NA     NA     NA     NA     NA     NA     NA 0.0003
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                MN1859 MO1835 MO1849 MO1856 MO1879 MS1848 MS1850 MS1857
    ## AK1900         0.0224 0.0002 0.0041 0.0043 0.0034 0.0003 0.0023 0.0006
    ## AL1852         0.0014 0.0002 0.0002 0.0003 0.0003 0.0006 0.0000 0.0006
    ## AR1868         0.0051 0.0003 0.0051 0.0050 0.0037 0.0004 0.0026 0.0014
    ## AR1874         0.0049 0.0014 0.0077 0.0075 0.0067 0.0002 0.0040 0.0015
    ## AZ1865         0.0402 0.0002 0.0104 0.0073 0.0054 0.0003 0.0045 0.0007
    ## AZ1887         0.0033 0.0009 0.0025 0.0026 0.0018 0.0008 0.0019 0.0010
    ## BI1859         0.0002 0.0002 0.0002 0.0002 0.0002 0.0002 0.0000 0.0002
    ## CA1850         0.0231 0.0003 0.0247 0.0161 0.0102 0.0002 0.0224 0.0012
    ## CA1851         0.0423 0.0002 0.0116 0.0079 0.0061 0.0002 0.0056 0.0007
    ## CA1858         0.0408 0.0002 0.0110 0.0080 0.0060 0.0003 0.0047 0.0008
    ## CA1868         0.0271 0.0002 0.0074 0.0056 0.0041 0.0004 0.0024 0.0006
    ## CA1868extended 0.0121 0.0001 0.0018 0.0016 0.0012 0.0002 0.0006 0.0003
    ## CA1872         0.0337 0.0001 0.0051 0.0039 0.0030 0.0004 0.0014 0.0006
    ## CO1868         0.0009 0.0019 0.0005 0.0007 0.0005 0.0038 0.0000 0.0009
    ## CO1877         0.0206 0.0003 0.0098 0.0083 0.0058 0.0004 0.0034 0.0008
    ## CT1854         0.0004 0.0003 0.0003 0.0004 0.0005 0.0004 0.0000 0.0003
    ## CT1879         0.0002 0.0000 0.0001 0.0008 0.0006 0.0000 0.0017 0.0000
    ## CT1879extended 0.0003 0.0000 0.0002 0.0005 0.0004 0.0001 0.0002 0.0001
    ## DC1857         0.0167 0.0004 0.0071 0.0066 0.0047 0.0004 0.0046 0.0008
    ## DE1852         0.0008 0.0001 0.0001 0.0002 0.0002 0.0002 0.0000 0.0004
    ## DT1862         0.0116 0.0003 0.0077 0.0076 0.0053 0.0004 0.0033 0.0020
    ## DT1868         0.0314 0.0002 0.0146 0.0094 0.0059 0.0002 0.0068 0.0006
    ## DT1887         0.0172 0.0001 0.0037 0.0027 0.0018 0.0003 0.0012 0.0004
    ## FL1847         0.0047 0.0003 0.0002 0.0003 0.0004 0.0129 0.0000 0.0011
    ## FL1870         0.0394 0.0002 0.0175 0.0148 0.0092 0.0003 0.0099 0.0008
    ## FL1892         0.0022 0.0003 0.0003 0.0004 0.0004 0.0021 0.0000 0.0015
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0003 0.0001 0.0001 0.0001 0.0002 0.0016 0.0000 0.0005
    ## GA1860         0.0003 0.0002 0.0001 0.0002 0.0002 0.0007 0.0000 0.0005
    ## GB1852         0.0001 0.0003 0.0001 0.0001 0.0001 0.0002 0.0000 0.0018
    ## GB1854         0.0001 0.0000 0.0000 0.0001 0.0001 0.0001 0.0000 0.0001
    ## GB1873         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0000 0.0001
    ## GB1875         0.0001 0.0000 0.0000 0.0001 0.0001 0.0001 0.0000 0.0001
    ## HI1859         0.0016 0.0001 0.0020 0.0016 0.0009 0.0001 0.0005 0.0000
    ## HI1897         0.0024 0.0002 0.0014 0.0012 0.0008 0.0003 0.0002 0.0004
    ## IA1839         0.0003 0.0006 0.0001 0.0004 0.0003 0.0003 0.0002 0.0004
    ## IA1851         0.0034 0.0002 0.0010 0.0007 0.0007 0.0002 0.0001 0.0004
    ## IA1859         0.0028 0.0003 0.0017 0.0030 0.0024 0.0002 0.0008 0.0008
    ## ID1864         0.0261 0.0002 0.0072 0.0048 0.0034 0.0003 0.0025 0.0005
    ## ID1881         0.0286 0.0001 0.0047 0.0038 0.0029 0.0002 0.0015 0.0005
    ## IL1866         0.0008 0.0018 0.0006 0.0008 0.0007 0.0049 0.0001 0.0010
    ## IL1933         0.0006 0.0003 0.0011 0.0013 0.0005 0.0002 0.0001 0.0003
    ## IN1843         0.0029 0.0017 0.0002 0.0012 0.0008 0.0009 0.0000 0.0008
    ## IN1852         0.0072 0.0003 0.0045 0.0031 0.0024 0.0005 0.0012 0.0006
    ## KS1859         0.0117 0.0004 0.0072 0.0072 0.0057 0.0004 0.0022 0.0020
    ## KS1868         0.0101 0.0003 0.0044 0.0050 0.0040 0.0005 0.0018 0.0018
    ## KY1851         0.0062 0.0002 0.0076 0.0062 0.0046 0.0003 0.0035 0.0014
    ## KY1854         0.0051 0.0002 0.0060 0.0051 0.0040 0.0003 0.0030 0.0015
    ## LA1825         0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000 0.0000
    ## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000 0.0000
    ## LC1867         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0000 0.0001
    ## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836         0.0105 0.0002 0.0002 0.0002 0.0005 0.0004 0.0000 0.0004
    ## MA1851         0.0001 0.0001 0.0002 0.0060 0.0025 0.0001 0.0000 0.0001
    ## MA1858         0.0059 0.0002 0.0002 0.0019 0.0009 0.0004 0.0000 0.0004
    ## MD1855         0.0001 0.0002 0.0001 0.0000 0.0001 0.0001 0.0001 0.0009
    ## MD1859         0.0001 0.0002 0.0002 0.0002 0.0002 0.0002 0.0000 0.0004
    ## ME1840         0.0023 0.0002 0.0001 0.0002 0.0002 0.0004 0.0000 0.0004
    ## MI1853         0.0005 0.0003 0.0005 0.0009 0.0003 0.0002 0.0002 0.0002
    ## MN1851         0.1509 0.0007 0.0047 0.0036 0.0027 0.0004 0.0024 0.0004
    ## MN1859             NA 0.0010 0.0076 0.0060 0.0044 0.0005 0.0052 0.0008
    ## MO1835             NA     NA 0.0047 0.0635 0.0328 0.0002 0.0001 0.0004
    ## MO1849             NA     NA     NA 0.0541 0.0232 0.0002 0.0088 0.0008
    ## MO1856             NA     NA     NA     NA 0.1209 0.0003 0.0087 0.0010
    ## MO1879             NA     NA     NA     NA     NA 0.0004 0.0057 0.0009
    ## MS1848             NA     NA     NA     NA     NA     NA 0.0001 0.0133
    ## MS1850             NA     NA     NA     NA     NA     NA     NA 0.0009
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                MT1865 MT1895 NC1868 ND1877 ND1877extended NE1857 NE1859
    ## AK1900         0.0150 0.0143 0.0126 0.0115         0.0115 0.0014 0.0045
    ## AL1852         0.0007 0.0007 0.0008 0.0006         0.0006 0.0003 0.0004
    ## AR1868         0.0050 0.0046 0.0049 0.0049         0.0049 0.0005 0.0297
    ## AR1874         0.0051 0.0038 0.0051 0.0043         0.0043 0.0006 0.0334
    ## AZ1865         0.1483 0.0561 0.0285 0.0320         0.0319 0.0028 0.0092
    ## AZ1887         0.0086 0.0817 0.0041 0.0741         0.0740 0.0007 0.0028
    ## BI1859         0.0002 0.0001 0.0002 0.0002         0.0002 0.0001 0.0002
    ## CA1850         0.0224 0.0092 0.0517 0.0221         0.0220 0.0020 0.0154
    ## CA1851         0.1345 0.0544 0.0313 0.0339         0.0338 0.0031 0.0111
    ## CA1858         0.1541 0.0584 0.0307 0.0362         0.0361 0.0027 0.0111
    ## CA1868         0.0969 0.0476 0.0212 0.0287         0.0287 0.0020 0.0082
    ## CA1868extended 0.0340 0.0273 0.0077 0.0136         0.0136 0.0008 0.0025
    ## CA1872         0.0509 0.1966 0.0176 0.1008         0.1004 0.0027 0.0102
    ## CO1868         0.0006 0.0009 0.0004 0.0006         0.0006 0.0009 0.0005
    ## CO1877         0.0887 0.0340 0.0185 0.0160         0.0160 0.0022 0.0098
    ## CT1854         0.0006 0.0002 0.0004 0.0002         0.0002 0.0001 0.0003
    ## CT1879         0.0002 0.0001 0.0004 0.0003         0.0003 0.0000 0.0004
    ## CT1879extended 0.0003 0.0003 0.0005 0.0005         0.0005 0.0001 0.0004
    ## DC1857         0.0221 0.0131 0.0186 0.0170         0.0170 0.0049 0.0353
    ## DE1852         0.0002 0.0002 0.0003 0.0002         0.0002 0.0002 0.0002
    ## DT1862         0.0113 0.0072 0.0120 0.0217         0.0216 0.0128 0.3862
    ## DT1868         0.0161 0.0109 0.1032 0.0598         0.0595 0.0017 0.0115
    ## DT1887         0.0129 0.0450 0.0281 0.1197         0.1188 0.0026 0.0116
    ## FL1847         0.0004 0.0004 0.0004 0.0006         0.0006 0.0004 0.0006
    ## FL1870         0.0222 0.0132 0.1414 0.0595         0.0593 0.0020 0.0148
    ## FL1892         0.0005 0.0015 0.0023 0.0024         0.0024 0.0003 0.0006
    ## FR1806         0.0000 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
    ## GA1851         0.0002 0.0002 0.0003 0.0003         0.0003 0.0002 0.0002
    ## GA1860         0.0003 0.0003 0.0003 0.0003         0.0003 0.0003 0.0004
    ## GB1852         0.0002 0.0001 0.0001 0.0001         0.0001 0.0001 0.0002
    ## GB1854         0.0001 0.0001 0.0001 0.0001         0.0001 0.0001 0.0001
    ## GB1873         0.0001 0.0000 0.0000 0.0000         0.0001 0.0000 0.0000
    ## GB1875         0.0001 0.0001 0.0001 0.0001         0.0001 0.0001 0.0001
    ## HI1859         0.0026 0.0010 0.0019 0.0012         0.0012 0.0004 0.0021
    ## HI1897         0.0024 0.0012 0.0023 0.0015         0.0015 0.0004 0.0018
    ## IA1839         0.0003 0.0001 0.0001 0.0002         0.0001 0.0003 0.0003
    ## IA1851         0.0023 0.0024 0.0014 0.0023         0.0023 0.1780 0.0097
    ## IA1859         0.0026 0.0024 0.0026 0.0034         0.0033 0.0407 0.0129
    ## ID1864         0.1469 0.0371 0.0174 0.0222         0.0222 0.0020 0.0069
    ## ID1881         0.0454 0.1099 0.0153 0.0412         0.0410 0.0023 0.0084
    ## IL1866         0.0006 0.0010 0.0004 0.0006         0.0006 0.0004 0.0005
    ## IL1933         0.0006 0.0003 0.0011 0.0006         0.0006 0.0002 0.0008
    ## IN1843         0.0007 0.0006 0.0007 0.0007         0.0007 0.0010 0.0007
    ## IN1852         0.0054 0.0043 0.0090 0.0061         0.0061 0.0032 0.0091
    ## KS1859         0.0141 0.0070 0.0126 0.0190         0.0189 0.0056 0.2912
    ## KS1868         0.0118 0.0081 0.0101 0.0171         0.0170 0.0064 0.1612
    ## KY1851         0.0056 0.0053 0.0062 0.0062         0.0062 0.0006 0.0485
    ## KY1854         0.0048 0.0049 0.0051 0.0053         0.0053 0.0006 0.0417
    ## LA1825         0.0001 0.0001 0.0000 0.0000         0.0000 0.0000 0.0000
    ## LA1825french   0.0000 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
    ## LC1867         0.0001 0.0002 0.0001 0.0001         0.0001 0.0001 0.0001
    ## LC1867french   0.0000 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
    ## MA1836         0.0003 0.0006 0.0004 0.0006         0.0006 0.0004 0.0004
    ## MA1851         0.0001 0.0001 0.0001 0.0001         0.0001 0.0001 0.0001
    ## MA1858         0.0004 0.0006 0.0004 0.0006         0.0006 0.0004 0.0004
    ## MD1855         0.0001 0.0000 0.0001 0.0001         0.0001 0.0001 0.0001
    ## MD1859         0.0002 0.0001 0.0002 0.0001         0.0001 0.0001 0.0002
    ## ME1840         0.0003 0.0004 0.0004 0.0005         0.0005 0.0003 0.0004
    ## MI1853         0.0006 0.0001 0.0007 0.0003         0.0003 0.0002 0.0003
    ## MN1851         0.0147 0.0141 0.0189 0.0177         0.0177 0.0056 0.0074
    ## MN1859         0.0263 0.0227 0.0331 0.0313         0.0312 0.0103 0.0114
    ## MO1835         0.0003 0.0001 0.0002 0.0002         0.0002 0.0003 0.0003
    ## MO1849         0.0081 0.0035 0.0147 0.0062         0.0061 0.0013 0.0072
    ## MO1856         0.0067 0.0028 0.0113 0.0052         0.0052 0.0011 0.0067
    ## MO1879         0.0051 0.0022 0.0075 0.0036         0.0036 0.0011 0.0048
    ## MS1848         0.0004 0.0004 0.0003 0.0004         0.0004 0.0003 0.0004
    ## MS1850         0.0026 0.0008 0.0074 0.0029         0.0029 0.0001 0.0030
    ## MS1857         0.0008 0.0005 0.0010 0.0006         0.0006 0.0005 0.0022
    ## MT1865             NA 0.0363 0.0175 0.0224         0.0224 0.0025 0.0102
    ## MT1895             NA     NA 0.0122 0.0696         0.0694 0.0024 0.0070
    ## NC1868             NA     NA     NA 0.0528         0.0527 0.0015 0.0123
    ## ND1877             NA     NA     NA     NA         0.8540 0.0045 0.0211
    ## ND1877extended     NA     NA     NA     NA             NA 0.0045 0.0210
    ## NE1857             NA     NA     NA     NA             NA     NA 0.0130
    ## NE1859             NA     NA     NA     NA             NA     NA     NA
    ## NE1866             NA     NA     NA     NA             NA     NA     NA
    ## NH1842             NA     NA     NA     NA             NA     NA     NA
    ## NJ1847             NA     NA     NA     NA             NA     NA     NA
    ## NM1865             NA     NA     NA     NA             NA     NA     NA
    ## NM1897             NA     NA     NA     NA             NA     NA     NA
    ## NV1861             NA     NA     NA     NA             NA     NA     NA
    ## NV1869             NA     NA     NA     NA             NA     NA     NA
    ## NY1848             NA     NA     NA     NA             NA     NA     NA
    ## NY1849             NA     NA     NA     NA             NA     NA     NA
    ## NY1850             NA     NA     NA     NA             NA     NA     NA
    ## NY1851             NA     NA     NA     NA             NA     NA     NA
    ## NY1853             NA     NA     NA     NA             NA     NA     NA
    ## NY1876             NA     NA     NA     NA             NA     NA     NA
    ## NY1879             NA     NA     NA     NA             NA     NA     NA
    ## OH1853             NA     NA     NA     NA             NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA             NA     NA     NA
    ## OH1879             NA     NA     NA     NA             NA     NA     NA
    ## OK1891             NA     NA     NA     NA             NA     NA     NA
    ## OK1893             NA     NA     NA     NA             NA     NA     NA
    ## OR1854             NA     NA     NA     NA             NA     NA     NA
    ## OR1862             NA     NA     NA     NA             NA     NA     NA
    ## SC1870             NA     NA     NA     NA             NA     NA     NA
    ## TN1858             NA     NA     NA     NA             NA     NA     NA
    ## UT1853             NA     NA     NA     NA             NA     NA     NA
    ## UT1859             NA     NA     NA     NA             NA     NA     NA
    ## UT1870             NA     NA     NA     NA             NA     NA     NA
    ## UT1884             NA     NA     NA     NA             NA     NA     NA
    ## VA1841             NA     NA     NA     NA             NA     NA     NA
    ## VA1860             NA     NA     NA     NA             NA     NA     NA
    ## WA1855             NA     NA     NA     NA             NA     NA     NA
    ## WA1873             NA     NA     NA     NA             NA     NA     NA
    ## WI1849             NA     NA     NA     NA             NA     NA     NA
    ## WI1856             NA     NA     NA     NA             NA     NA     NA
    ## WI1858             NA     NA     NA     NA             NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA             NA     NA     NA
    ## WV1868             NA     NA     NA     NA             NA     NA     NA
    ## WY1870             NA     NA     NA     NA             NA     NA     NA
    ## WY1886             NA     NA     NA     NA             NA     NA     NA
    ##                NE1866 NH1842 NJ1847 NM1865 NM1897 NV1861 NV1869 NY1848
    ## AK1900         0.0039 0.0002 0.0002 0.0001 0.0053 0.0196 0.0175 0.0081
    ## AL1852         0.0004 0.0001 0.0002 0.0004 0.0005 0.0007 0.0007 0.0002
    ## AR1868         0.0200 0.0001 0.0002 0.0002 0.0053 0.0054 0.0048 0.0041
    ## AR1874         0.0193 0.0001 0.0001 0.0002 0.0069 0.0057 0.0050 0.0055
    ## AZ1865         0.0088 0.0002 0.0002 0.0003 0.0051 0.2563 0.2448 0.0232
    ## AZ1887         0.0022 0.0002 0.0003 0.0004 0.0034 0.0117 0.0117 0.0028
    ## BI1859         0.0002 0.0001 0.0002 0.0001 0.0002 0.0002 0.0002 0.0002
    ## CA1850         0.0079 0.0001 0.0002 0.0004 0.0059 0.0333 0.0281 0.0603
    ## CA1851         0.0092 0.0001 0.0002 0.0002 0.0059 0.2373 0.2132 0.0268
    ## CA1858         0.0098 0.0002 0.0002 0.0002 0.0059 0.2854 0.2418 0.0258
    ## CA1868         0.0070 0.0001 0.0002 0.0002 0.0044 0.1676 0.1605 0.0167
    ## CA1868extended 0.0029 0.0001 0.0001 0.0001 0.0017 0.0566 0.0541 0.0045
    ## CA1872         0.0072 0.0002 0.0002 0.0001 0.0047 0.0842 0.0813 0.0123
    ## CO1868         0.0019 0.0003 0.0034 0.0004 0.0018 0.0005 0.0005 0.0002
    ## CO1877         0.0066 0.0001 0.0003 0.0003 0.0056 0.1138 0.1050 0.0150
    ## CT1854         0.0003 0.0003 0.0002 0.0003 0.0003 0.0003 0.0004 0.0003
    ## CT1879         0.0002 0.0000 0.0000 0.0000 0.0004 0.0002 0.0002 0.0004
    ## CT1879extended 0.0003 0.0001 0.0001 0.0001 0.0004 0.0003 0.0003 0.0004
    ## DC1857         0.0232 0.0003 0.0003 0.0006 0.0058 0.0277 0.0259 0.0117
    ## DE1852         0.0003 0.0003 0.0003 0.0001 0.0003 0.0002 0.0002 0.0002
    ## DT1862         0.1877 0.0002 0.0005 0.0003 0.0108 0.0101 0.0099 0.0079
    ## DT1868         0.0061 0.0001 0.0002 0.0001 0.0090 0.0235 0.0212 0.0508
    ## DT1887         0.0087 0.0001 0.0002 0.0001 0.0035 0.0185 0.0178 0.0130
    ## FL1847         0.0007 0.0003 0.0006 0.0005 0.0010 0.0004 0.0003 0.0002
    ## FL1870         0.0085 0.0002 0.0002 0.0001 0.0120 0.0335 0.0309 0.0662
    ## FL1892         0.0006 0.0002 0.0006 0.0004 0.0012 0.0007 0.0007 0.0012
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0003 0.0002 0.0004 0.0002 0.0005 0.0002 0.0002 0.0001
    ## GA1860         0.0004 0.0002 0.0003 0.0002 0.0013 0.0004 0.0003 0.0001
    ## GB1852         0.0001 0.0001 0.0009 0.0001 0.0002 0.0001 0.0001 0.0001
    ## GB1854         0.0001 0.0001 0.0001 0.0001 0.0015 0.0001 0.0001 0.0000
    ## GB1873         0.0001 0.0001 0.0001 0.0000 0.0002 0.0001 0.0000 0.0000
    ## GB1875         0.0001 0.0001 0.0001 0.0000 0.0001 0.0001 0.0001 0.0001
    ## HI1859         0.0005 0.0000 0.0001 0.0001 0.0008 0.0044 0.0035 0.0017
    ## HI1897         0.0007 0.0003 0.0008 0.0002 0.0023 0.0036 0.0028 0.0017
    ## IA1839         0.0002 0.0001 0.0009 0.0003 0.0002 0.0001 0.0001 0.0001
    ## IA1851         0.0214 0.0002 0.0002 0.0002 0.0032 0.0024 0.0025 0.0009
    ## IA1859         0.0149 0.0001 0.0001 0.0001 0.0047 0.0027 0.0026 0.0020
    ## ID1864         0.0069 0.0001 0.0002 0.0002 0.0034 0.2261 0.1366 0.0142
    ## ID1881         0.0060 0.0001 0.0002 0.0001 0.0047 0.0723 0.0713 0.0112
    ## IL1866         0.0015 0.0003 0.0059 0.0005 0.0021 0.0004 0.0004 0.0002
    ## IL1933         0.0007 0.0001 0.0002 0.0002 0.0006 0.0005 0.0005 0.0010
    ## IN1843         0.0024 0.0003 0.0006 0.0002 0.0018 0.0007 0.0006 0.0002
    ## IN1852         0.0067 0.0003 0.0004 0.0035 0.0043 0.0059 0.0060 0.0053
    ## KS1859         0.1770 0.0002 0.0004 0.0002 0.0103 0.0115 0.0111 0.0081
    ## KS1868         0.1460 0.0002 0.0005 0.0002 0.0084 0.0107 0.0104 0.0053
    ## KY1851         0.0242 0.0001 0.0002 0.0002 0.0063 0.0058 0.0053 0.0060
    ## KY1854         0.0206 0.0001 0.0002 0.0002 0.0060 0.0053 0.0046 0.0049
    ## LA1825         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0001 0.0001 0.0000 0.0000 0.0001 0.0001 0.0001 0.0001
    ## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836         0.0005 0.0009 0.0002 0.0002 0.0010 0.0003 0.0003 0.0002
    ## MA1851         0.0001 0.0001 0.0000 0.0000 0.0005 0.0001 0.0001 0.0001
    ## MA1858         0.0006 0.0007 0.0002 0.0001 0.0010 0.0003 0.0003 0.0002
    ## MD1855         0.0001 0.0000 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
    ## MD1859         0.0002 0.0001 0.0002 0.0002 0.0002 0.0001 0.0001 0.0001
    ## ME1840         0.0005 0.0015 0.0002 0.0002 0.0006 0.0003 0.0003 0.0002
    ## MI1853         0.0003 0.0001 0.0001 0.0001 0.0004 0.0005 0.0004 0.0008
    ## MN1851         0.0070 0.0002 0.0013 0.0001 0.0062 0.0217 0.0203 0.0139
    ## MN1859         0.0117 0.0003 0.0004 0.0003 0.0113 0.0385 0.0336 0.0238
    ## MO1835         0.0004 0.0001 0.0005 0.0003 0.0058 0.0002 0.0002 0.0002
    ## MO1849         0.0038 0.0001 0.0001 0.0002 0.0060 0.0099 0.0089 0.0308
    ## MO1856         0.0042 0.0001 0.0003 0.0004 0.0256 0.0076 0.0074 0.0150
    ## MO1879         0.0032 0.0001 0.0003 0.0006 0.0217 0.0056 0.0051 0.0100
    ## MS1848         0.0006 0.0002 0.0012 0.0004 0.0007 0.0003 0.0003 0.0002
    ## MS1850         0.0014 0.0000 0.0000 0.0003 0.0039 0.0038 0.0029 0.0109
    ## MS1857         0.0015 0.0003 0.0018 0.0004 0.0009 0.0008 0.0007 0.0007
    ## MT1865         0.0096 0.0001 0.0003 0.0003 0.0041 0.1914 0.1384 0.0133
    ## MT1895         0.0061 0.0002 0.0002 0.0001 0.0038 0.0571 0.0564 0.0080
    ## NC1868         0.0072 0.0002 0.0002 0.0002 0.0095 0.0267 0.0241 0.0438
    ## ND1877         0.0148 0.0002 0.0002 0.0002 0.0065 0.0325 0.0312 0.0226
    ## ND1877extended 0.0148 0.0002 0.0002 0.0002 0.0065 0.0325 0.0311 0.0222
    ## NE1857         0.0447 0.0001 0.0002 0.0002 0.0029 0.0026 0.0028 0.0013
    ## NE1859         0.1917 0.0002 0.0004 0.0004 0.0107 0.0097 0.0094 0.0085
    ## NE1866             NA 0.0002 0.0005 0.0002 0.0068 0.0094 0.0087 0.0044
    ## NH1842             NA     NA 0.0002 0.0001 0.0003 0.0002 0.0002 0.0001
    ## NJ1847             NA     NA     NA 0.0002 0.0003 0.0002 0.0002 0.0001
    ## NM1865             NA     NA     NA     NA 0.0504 0.0003 0.0002 0.0001
    ## NM1897             NA     NA     NA     NA     NA 0.0057 0.0051 0.0059
    ## NV1861             NA     NA     NA     NA     NA     NA 0.2401 0.0214
    ## NV1869             NA     NA     NA     NA     NA     NA     NA 0.0186
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                NY1849 NY1850 NY1851 NY1853 NY1876 NY1879 OH1853
    ## AK1900         0.0115 0.0270 0.0124 0.0223 0.0017 0.0014 0.0045
    ## AL1852         0.0006 0.0014 0.0008 0.0013 0.0003 0.0002 0.0005
    ## AR1868         0.0041 0.0060 0.0044 0.0050 0.0010 0.0008 0.0297
    ## AR1874         0.0046 0.0043 0.0052 0.0038 0.0008 0.0006 0.0331
    ## AZ1865         0.0300 0.0488 0.0300 0.0446 0.0021 0.0018 0.0092
    ## AZ1887         0.0032 0.0034 0.0039 0.0032 0.0006 0.0006 0.0027
    ## BI1859         0.0002 0.0001 0.0002 0.0001 0.0001 0.0001 0.0002
    ## CA1850         0.0778 0.0224 0.0643 0.0212 0.0023 0.0018 0.0157
    ## CA1851         0.0354 0.0550 0.0346 0.0497 0.0024 0.0020 0.0114
    ## CA1858         0.0338 0.0551 0.0336 0.0499 0.0023 0.0019 0.0110
    ## CA1868         0.0212 0.0352 0.0223 0.0317 0.0019 0.0016 0.0079
    ## CA1868extended 0.0070 0.0185 0.0072 0.0158 0.0011 0.0009 0.0025
    ## CA1872         0.0184 0.0840 0.0192 0.0522 0.0039 0.0029 0.0098
    ## CO1868         0.0003 0.0003 0.0003 0.0003 0.0002 0.0002 0.0005
    ## CO1877         0.0175 0.0230 0.0199 0.0213 0.0016 0.0012 0.0091
    ## CT1854         0.0003 0.0002 0.0003 0.0002 0.0001 0.0001 0.0007
    ## CT1879         0.0003 0.0001 0.0003 0.0001 0.0002 0.0001 0.0004
    ## CT1879extended 0.0003 0.0003 0.0004 0.0003 0.0003 0.0002 0.0004
    ## DC1857         0.0161 0.0173 0.0178 0.0160 0.0018 0.0015 0.0345
    ## DE1852         0.0001 0.0002 0.0002 0.0002 0.0001 0.0001 0.0002
    ## DT1862         0.0117 0.0121 0.0134 0.0107 0.0014 0.0010 0.3006
    ## DT1868         0.0867 0.0325 0.1012 0.0318 0.0043 0.0034 0.0117
    ## DT1887         0.0235 0.0190 0.0259 0.0178 0.0027 0.0020 0.0104
    ## FL1847         0.0002 0.0003 0.0002 0.0003 0.0002 0.0002 0.0006
    ## FL1870         0.1134 0.0408 0.1335 0.0399 0.0044 0.0035 0.0152
    ## FL1892         0.0038 0.0015 0.0028 0.0015 0.0008 0.0006 0.0006
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0001 0.0002 0.0001 0.0002 0.0002 0.0002 0.0003
    ## GA1860         0.0002 0.0003 0.0001 0.0002 0.0002 0.0002 0.0004
    ## GB1852         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0002
    ## GB1854         0.0000 0.0001 0.0000 0.0001 0.0000 0.0000 0.0001
    ## GB1873         0.0001 0.0001 0.0001 0.0001 0.0000 0.0000 0.0001
    ## GB1875         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
    ## HI1859         0.0017 0.0016 0.0020 0.0013 0.0002 0.0001 0.0020
    ## HI1897         0.0018 0.0016 0.0020 0.0015 0.0004 0.0003 0.0017
    ## IA1839         0.0001 0.0001 0.0001 0.0001 0.0000 0.0000 0.0004
    ## IA1851         0.0013 0.0040 0.0014 0.0034 0.0006 0.0004 0.0018
    ## IA1859         0.0023 0.0033 0.0024 0.0030 0.0006 0.0005 0.0112
    ## ID1864         0.0184 0.0297 0.0182 0.0273 0.0016 0.0014 0.0066
    ## ID1881         0.0154 0.0427 0.0162 0.0357 0.0032 0.0025 0.0084
    ## IL1866         0.0004 0.0003 0.0003 0.0003 0.0002 0.0002 0.0005
    ## IL1933         0.0010 0.0004 0.0011 0.0005 0.0003 0.0003 0.0009
    ## IN1843         0.0005 0.0010 0.0005 0.0010 0.0004 0.0003 0.0007
    ## IN1852         0.0073 0.0079 0.0085 0.0071 0.0010 0.0008 0.0083
    ## KS1859         0.0124 0.0119 0.0141 0.0112 0.0014 0.0010 0.2952
    ## KS1868         0.0092 0.0149 0.0107 0.0137 0.0014 0.0011 0.1631
    ## KY1851         0.0063 0.0077 0.0064 0.0063 0.0013 0.0010 0.0483
    ## KY1854         0.0047 0.0069 0.0050 0.0054 0.0010 0.0009 0.0410
    ## LA1825         0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
    ## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000
    ## MA1836         0.0003 0.0005 0.0003 0.0005 0.0003 0.0003 0.0004
    ## MA1851         0.0001 0.0000 0.0001 0.0000 0.0000 0.0000 0.0002
    ## MA1858         0.0004 0.0005 0.0003 0.0005 0.0004 0.0004 0.0004
    ## MD1855         0.0001 0.0000 0.0001 0.0000 0.0000 0.0000 0.0001
    ## MD1859         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0003
    ## ME1840         0.0003 0.0004 0.0003 0.0004 0.0003 0.0002 0.0004
    ## MI1853         0.0009 0.0004 0.0007 0.0003 0.0002 0.0001 0.0003
    ## MN1851         0.0219 0.0563 0.0209 0.0508 0.0021 0.0016 0.0074
    ## MN1859         0.0371 0.1052 0.0350 0.0917 0.0034 0.0028 0.0114
    ## MO1835         0.0002 0.0001 0.0002 0.0001 0.0002 0.0002 0.0004
    ## MO1849         0.0208 0.0069 0.0186 0.0061 0.0011 0.0008 0.0072
    ## MO1856         0.0117 0.0046 0.0117 0.0044 0.0011 0.0008 0.0071
    ## MO1879         0.0072 0.0032 0.0069 0.0032 0.0008 0.0006 0.0052
    ## MS1848         0.0002 0.0003 0.0002 0.0003 0.0002 0.0002 0.0004
    ## MS1850         0.0150 0.0022 0.0093 0.0019 0.0004 0.0003 0.0034
    ## MS1857         0.0007 0.0005 0.0008 0.0004 0.0003 0.0003 0.0021
    ## MT1865         0.0176 0.0300 0.0185 0.0282 0.0017 0.0014 0.0107
    ## MT1895         0.0113 0.0526 0.0122 0.0331 0.0120 0.0106 0.0067
    ## NC1868         0.0811 0.0351 0.0934 0.0330 0.0040 0.0031 0.0130
    ## ND1877         0.0411 0.0330 0.0475 0.0305 0.0045 0.0036 0.0187
    ## ND1877extended 0.0403 0.0327 0.0466 0.0302 0.0044 0.0036 0.0187
    ## NE1857         0.0015 0.0037 0.0022 0.0031 0.0005 0.0004 0.0050
    ## NE1859         0.0121 0.0129 0.0142 0.0111 0.0015 0.0012 0.3724
    ## NE1866         0.0071 0.0120 0.0077 0.0107 0.0012 0.0010 0.1575
    ## NH1842         0.0001 0.0002 0.0001 0.0002 0.0001 0.0001 0.0002
    ## NJ1847         0.0001 0.0002 0.0002 0.0002 0.0002 0.0001 0.0005
    ## NM1865         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0002
    ## NM1897         0.0056 0.0061 0.0081 0.0059 0.0012 0.0010 0.0118
    ## NV1861         0.0275 0.0447 0.0278 0.0404 0.0022 0.0019 0.0093
    ## NV1869         0.0239 0.0412 0.0252 0.0376 0.0021 0.0017 0.0093
    ## NY1848         0.1040 0.0301 0.0857 0.0257 0.0028 0.0023 0.0085
    ## NY1849             NA 0.0462 0.2033 0.0418 0.0047 0.0036 0.0130
    ## NY1850             NA     NA 0.0476 0.3980 0.0054 0.0042 0.0128
    ## NY1851             NA     NA     NA 0.0456 0.0052 0.0039 0.0146
    ## NY1853             NA     NA     NA     NA 0.0053 0.0040 0.0113
    ## NY1876             NA     NA     NA     NA     NA 0.3560 0.0016
    ## NY1879             NA     NA     NA     NA     NA     NA 0.0012
    ## OH1853             NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA
    ##                OH1853extended OH1879 OK1891 OK1893 OR1854 OR1862 SC1870
    ## AK1900                 0.0044 0.0021 0.0038 0.0049 0.0317 0.1368 0.0143
    ## AL1852                 0.0004 0.0004 0.0006 0.0004 0.0010 0.0007 0.0005
    ## AR1868                 0.0248 0.0086 0.0083 0.0198 0.0046 0.0042 0.0049
    ## AR1874                 0.0242 0.0061 0.0098 0.0191 0.0049 0.0033 0.0056
    ## AZ1865                 0.0111 0.0039 0.0098 0.0093 0.0709 0.0317 0.0294
    ## AZ1887                 0.0024 0.0015 0.0023 0.0023 0.0038 0.0031 0.0046
    ## BI1859                 0.0002 0.0001 0.0002 0.0002 0.0002 0.0001 0.0002
    ## CA1850                 0.0113 0.0028 0.0082 0.0088 0.0323 0.0182 0.0542
    ## CA1851                 0.0125 0.0041 0.0109 0.0106 0.0692 0.0314 0.0312
    ## CA1858                 0.0124 0.0044 0.0144 0.0106 0.0657 0.0312 0.0297
    ## CA1868                 0.0086 0.0033 0.0113 0.0077 0.0426 0.0216 0.0201
    ## CA1868extended         0.0033 0.0020 0.0044 0.0032 0.0155 0.0097 0.0065
    ## CA1872                 0.0102 0.0046 0.0182 0.0098 0.0330 0.0403 0.0185
    ## CO1868                 0.0005 0.0005 0.0007 0.0006 0.0010 0.0004 0.0003
    ## CO1877                 0.0072 0.0028 0.0085 0.0081 0.0288 0.0139 0.0202
    ## CT1854                 0.0006 0.0002 0.0003 0.0006 0.0004 0.0002 0.0003
    ## CT1879                 0.0003 0.0001 0.0001 0.0002 0.0002 0.0002 0.0006
    ## CT1879extended         0.0004 0.0003 0.0003 0.0004 0.0003 0.0003 0.0005
    ## DC1857                 0.0304 0.0103 0.0339 0.0273 0.0398 0.0147 0.0196
    ## DE1852                 0.0003 0.0003 0.0004 0.0003 0.0004 0.0002 0.0002
    ## DT1862                 0.2238 0.0396 0.0095 0.1447 0.0099 0.0063 0.0120
    ## DT1868                 0.0091 0.0029 0.0074 0.0078 0.0342 0.0188 0.1323
    ## DT1887                 0.0101 0.0040 0.0179 0.0097 0.0169 0.0111 0.0304
    ## FL1847                 0.0007 0.0006 0.0008 0.0006 0.0015 0.0004 0.0003
    ## FL1870                 0.0121 0.0038 0.0096 0.0108 0.0465 0.0259 0.1787
    ## FL1892                 0.0007 0.0006 0.0009 0.0007 0.0016 0.0009 0.0028
    ## FR1806                 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851                 0.0004 0.0004 0.0003 0.0003 0.0002 0.0002 0.0001
    ## GA1860                 0.0004 0.0004 0.0007 0.0004 0.0003 0.0003 0.0002
    ## GB1852                 0.0001 0.0001 0.0001 0.0002 0.0002 0.0001 0.0001
    ## GB1854                 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0000
    ## GB1873                 0.0001 0.0001 0.0001 0.0001 0.0001 0.0000 0.0001
    ## GB1875                 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
    ## HI1859                 0.0014 0.0004 0.0007 0.0009 0.0019 0.0005 0.0024
    ## HI1897                 0.0013 0.0005 0.0008 0.0011 0.0023 0.0008 0.0027
    ## IA1839                 0.0004 0.0002 0.0002 0.0003 0.0016 0.0001 0.0001
    ## IA1851                 0.0017 0.0007 0.0040 0.0028 0.0030 0.0026 0.0014
    ## IA1859                 0.0096 0.0035 0.0046 0.0081 0.0027 0.0027 0.0028
    ## ID1864                 0.0075 0.0030 0.0098 0.0069 0.0455 0.0215 0.0176
    ## ID1881                 0.0083 0.0034 0.0143 0.0080 0.0319 0.0230 0.0173
    ## IL1866                 0.0006 0.0005 0.0006 0.0005 0.0011 0.0004 0.0003
    ## IL1933                 0.0007 0.0004 0.0006 0.0007 0.0006 0.0004 0.0009
    ## IN1843                 0.0033 0.0021 0.0082 0.0029 0.0029 0.0010 0.0004
    ## IN1852                 0.0072 0.0049 0.1028 0.0131 0.0065 0.0052 0.0086
    ## KS1859                 0.2219 0.0392 0.0099 0.1743 0.0109 0.0069 0.0127
    ## KS1868                 0.1895 0.0502 0.0117 0.2806 0.0087 0.0065 0.0096
    ## KY1851                 0.0379 0.0101 0.0109 0.0277 0.0057 0.0047 0.0065
    ## KY1854                 0.0330 0.0095 0.0101 0.0252 0.0051 0.0043 0.0052
    ## LA1825                 0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LA1825french           0.0000 0.0001 0.0000 0.0000 0.0000 0.0001 0.0000
    ## LC1867                 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
    ## LC1867french           0.0000 0.0001 0.0000 0.0001 0.0000 0.0000 0.0000
    ## MA1836                 0.0008 0.0010 0.0007 0.0005 0.0043 0.0006 0.0003
    ## MA1851                 0.0001 0.0001 0.0001 0.0001 0.0003 0.0000 0.0001
    ## MA1858                 0.0006 0.0009 0.0007 0.0006 0.0021 0.0006 0.0003
    ## MD1855                 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
    ## MD1859                 0.0002 0.0001 0.0001 0.0002 0.0002 0.0001 0.0001
    ## ME1840                 0.0004 0.0010 0.0009 0.0005 0.0012 0.0005 0.0003
    ## MI1853                 0.0003 0.0002 0.0001 0.0003 0.0003 0.0002 0.0007
    ## MN1851                 0.0064 0.0024 0.0039 0.0063 0.0434 0.0207 0.0205
    ## MN1859                 0.0099 0.0037 0.0072 0.0095 0.0776 0.0372 0.0338
    ## MO1835                 0.0004 0.0002 0.0003 0.0003 0.0025 0.0002 0.0002
    ## MO1849                 0.0052 0.0014 0.0034 0.0036 0.0110 0.0050 0.0175
    ## MO1856                 0.0053 0.0019 0.0027 0.0043 0.0096 0.0051 0.0138
    ## MO1879                 0.0040 0.0013 0.0022 0.0038 0.0060 0.0037 0.0085
    ## MS1848                 0.0006 0.0005 0.0005 0.0005 0.0005 0.0003 0.0002
    ## MS1850                 0.0023 0.0006 0.0010 0.0018 0.0070 0.0032 0.0087
    ## MS1857                 0.0018 0.0008 0.0006 0.0015 0.0010 0.0006 0.0008
    ## MT1865                 0.0114 0.0040 0.0094 0.0105 0.0470 0.0216 0.0180
    ## MT1895                 0.0072 0.0057 0.0118 0.0074 0.0242 0.0316 0.0128
    ## NC1868                 0.0108 0.0037 0.0080 0.0090 0.0375 0.0215 0.1236
    ## ND1877                 0.0174 0.0066 0.0218 0.0164 0.0309 0.0190 0.0581
    ## ND1877extended         0.0174 0.0066 0.0218 0.0161 0.0308 0.0189 0.0579
    ## NE1857                 0.0050 0.0011 0.0033 0.0053 0.0085 0.0021 0.0019
    ## NE1859                 0.2752 0.0428 0.0100 0.1720 0.0100 0.0066 0.0123
    ## NE1866                 0.1803 0.0455 0.0091 0.1219 0.0100 0.0049 0.0074
    ## NH1842                 0.0003 0.0003 0.0002 0.0002 0.0003 0.0002 0.0001
    ## NJ1847                 0.0005 0.0003 0.0003 0.0004 0.0015 0.0002 0.0002
    ## NM1865                 0.0002 0.0001 0.0025 0.0003 0.0009 0.0001 0.0001
    ## NM1897                 0.0101 0.0032 0.0045 0.0083 0.0135 0.0066 0.0108
    ## NV1861                 0.0106 0.0040 0.0138 0.0092 0.0680 0.0290 0.0278
    ## NV1869                 0.0103 0.0039 0.0128 0.0090 0.0570 0.0272 0.0250
    ## NY1848                 0.0064 0.0018 0.0053 0.0051 0.0257 0.0138 0.0565
    ## NY1849                 0.0105 0.0029 0.0073 0.0080 0.0375 0.0197 0.0973
    ## NY1850                 0.0170 0.0062 0.0079 0.0143 0.0408 0.0642 0.0365
    ## NY1851                 0.0117 0.0033 0.0083 0.0100 0.0425 0.0209 0.1139
    ## NY1853                 0.0150 0.0054 0.0075 0.0129 0.0371 0.0421 0.0357
    ## NY1876                 0.0015 0.0011 0.0012 0.0014 0.0027 0.0027 0.0049
    ## NY1879                 0.0012 0.0009 0.0010 0.0012 0.0022 0.0022 0.0038
    ## OH1853                 0.6374 0.0429 0.0089 0.1666 0.0097 0.0065 0.0128
    ## OH1853extended             NA 0.0695 0.0101 0.1919 0.0080 0.0059 0.0101
    ## OH1879                     NA     NA 0.0041 0.0472 0.0032 0.0026 0.0032
    ## OK1891                     NA     NA     NA 0.0116 0.0070 0.0050 0.0082
    ## OK1893                     NA     NA     NA     NA 0.0078 0.0059 0.0087
    ## OR1854                     NA     NA     NA     NA     NA 0.0612 0.0413
    ## OR1862                     NA     NA     NA     NA     NA     NA 0.0233
    ## SC1870                     NA     NA     NA     NA     NA     NA     NA
    ## TN1858                     NA     NA     NA     NA     NA     NA     NA
    ## UT1853                     NA     NA     NA     NA     NA     NA     NA
    ## UT1859                     NA     NA     NA     NA     NA     NA     NA
    ## UT1870                     NA     NA     NA     NA     NA     NA     NA
    ## UT1884                     NA     NA     NA     NA     NA     NA     NA
    ## VA1841                     NA     NA     NA     NA     NA     NA     NA
    ## VA1860                     NA     NA     NA     NA     NA     NA     NA
    ## WA1855                     NA     NA     NA     NA     NA     NA     NA
    ## WA1873                     NA     NA     NA     NA     NA     NA     NA
    ## WI1849                     NA     NA     NA     NA     NA     NA     NA
    ## WI1856                     NA     NA     NA     NA     NA     NA     NA
    ## WI1858                     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857                   NA     NA     NA     NA     NA     NA     NA
    ## WV1868                     NA     NA     NA     NA     NA     NA     NA
    ## WY1870                     NA     NA     NA     NA     NA     NA     NA
    ## WY1886                     NA     NA     NA     NA     NA     NA     NA
    ##                TN1858 UT1853 UT1859 UT1870 UT1884 VA1841 VA1860 WA1855
    ## AK1900         0.0006 0.0001 0.0156 0.0106 0.0058 0.0001 0.0002 0.0134
    ## AL1852         0.0038 0.0000 0.0006 0.0005 0.0003 0.0002 0.0002 0.0004
    ## AR1868         0.0005 0.0001 0.0039 0.0028 0.0026 0.0001 0.0005 0.0052
    ## AR1874         0.0003 0.0001 0.0053 0.0030 0.0027 0.0001 0.0001 0.0058
    ## AZ1865         0.0007 0.0001 0.0355 0.1165 0.0287 0.0001 0.0002 0.0350
    ## AZ1887         0.0004 0.0000 0.0040 0.0064 0.0034 0.0004 0.0002 0.0037
    ## BI1859         0.0001 0.0000 0.0002 0.0001 0.0001 0.0002 0.0001 0.0002
    ## CA1850         0.0003 0.0001 0.0237 0.0162 0.0061 0.0002 0.0001 0.0264
    ## CA1851         0.0007 0.0000 0.0393 0.1052 0.0276 0.0001 0.0002 0.0353
    ## CA1858         0.0007 0.0000 0.0378 0.1186 0.0286 0.0001 0.0003 0.0355
    ## CA1868         0.0006 0.0000 0.0226 0.0813 0.0230 0.0001 0.0002 0.0221
    ## CA1868extended 0.0004 0.0000 0.0069 0.0288 0.0101 0.0000 0.0002 0.0084
    ## CA1872         0.0008 0.0000 0.0179 0.0423 0.0529 0.0001 0.0002 0.0151
    ## CO1868         0.0006 0.0001 0.0008 0.0003 0.0002 0.0006 0.0003 0.0006
    ## CO1877         0.0005 0.0000 0.0229 0.0551 0.0166 0.0001 0.0002 0.0173
    ## CT1854         0.0003 0.0001 0.0005 0.0002 0.0001 0.0003 0.0001 0.0003
    ## CT1879         0.0000 0.0000 0.0003 0.0001 0.0001 0.0000 0.0000 0.0002
    ## CT1879extended 0.0001 0.0000 0.0002 0.0002 0.0001 0.0000 0.0001 0.0003
    ## DC1857         0.0006 0.0000 0.0332 0.0152 0.0070 0.0001 0.0019 0.0382
    ## DE1852         0.0002 0.0000 0.0004 0.0001 0.0001 0.0001 0.0002 0.0003
    ## DT1862         0.0006 0.0000 0.0077 0.0055 0.0049 0.0002 0.0003 0.0078
    ## DT1868         0.0005 0.0001 0.0213 0.0117 0.0061 0.0001 0.0002 0.0206
    ## DT1887         0.0005 0.0000 0.0081 0.0103 0.0101 0.0001 0.0002 0.0080
    ## FL1847         0.0006 0.0001 0.0016 0.0002 0.0001 0.0010 0.0003 0.0015
    ## FL1870         0.0004 0.0001 0.0230 0.0174 0.0072 0.0002 0.0002 0.0291
    ## FL1892         0.0005 0.0000 0.0017 0.0005 0.0007 0.0005 0.0010 0.0009
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0003 0.0001 0.0003 0.0002 0.0001 0.0009 0.0003 0.0003
    ## GA1860         0.0004 0.0000 0.0004 0.0002 0.0001 0.0002 0.0004 0.0004
    ## GB1852         0.0001 0.0000 0.0001 0.0001 0.0001 0.0002 0.0002 0.0001
    ## GB1854         0.0000 0.0000 0.0001 0.0000 0.0000 0.0001 0.0000 0.0001
    ## GB1873         0.0001 0.0000 0.0001 0.0000 0.0000 0.0001 0.0001 0.0000
    ## GB1875         0.0001 0.0000 0.0001 0.0001 0.0001 0.0000 0.0001 0.0001
    ## HI1859         0.0001 0.0001 0.0022 0.0022 0.0014 0.0001 0.0000 0.0021
    ## HI1897         0.0002 0.0001 0.0024 0.0017 0.0013 0.0006 0.0002 0.0021
    ## IA1839         0.0001 0.0001 0.0003 0.0001 0.0001 0.0003 0.0001 0.0002
    ## IA1851         0.0058 0.0031 0.0038 0.0015 0.0013 0.0001 0.0002 0.0022
    ## IA1859         0.0032 0.0011 0.0026 0.0018 0.0013 0.0001 0.0002 0.0023
    ## ID1864         0.0006 0.0000 0.0246 0.0789 0.0182 0.0001 0.0002 0.0234
    ## ID1881         0.0006 0.0000 0.0157 0.0396 0.0647 0.0001 0.0002 0.0141
    ## IL1866         0.0006 0.0001 0.0007 0.0003 0.0002 0.0007 0.0004 0.0004
    ## IL1933         0.0002 0.0000 0.0006 0.0003 0.0002 0.0001 0.0001 0.0006
    ## IN1843         0.0006 0.0000 0.0016 0.0004 0.0002 0.0003 0.0003 0.0018
    ## IN1852         0.0006 0.0000 0.0056 0.0034 0.0020 0.0001 0.0003 0.0314
    ## KS1859         0.0006 0.0000 0.0074 0.0062 0.0049 0.0002 0.0003 0.0083
    ## KS1868         0.0010 0.0001 0.0064 0.0061 0.0048 0.0001 0.0003 0.0132
    ## KY1851         0.0004 0.0000 0.0055 0.0030 0.0032 0.0001 0.0006 0.0061
    ## KY1854         0.0005 0.0000 0.0050 0.0028 0.0029 0.0001 0.0005 0.0055
    ## LA1825         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0001
    ## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0001 0.0000 0.0001 0.0001 0.0001 0.0000 0.0001 0.0001
    ## LC1867french   0.0001 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836         0.0005 0.0000 0.0037 0.0002 0.0005 0.0001 0.0012 0.0016
    ## MA1851         0.0000 0.0000 0.0002 0.0001 0.0000 0.0000 0.0000 0.0003
    ## MA1858         0.0005 0.0000 0.0018 0.0002 0.0003 0.0001 0.0010 0.0012
    ## MD1855         0.0001 0.0000 0.0001 0.0001 0.0000 0.0000 0.0001 0.0001
    ## MD1859         0.0001 0.0001 0.0002 0.0001 0.0001 0.0002 0.0001 0.0001
    ## ME1840         0.0004 0.0001 0.0011 0.0002 0.0002 0.0001 0.0003 0.0008
    ## MI1853         0.0001 0.0000 0.0002 0.0004 0.0001 0.0001 0.0001 0.0002
    ## MN1851         0.0007 0.0001 0.0155 0.0110 0.0083 0.0001 0.0002 0.0131
    ## MN1859         0.0010 0.0001 0.0307 0.0182 0.0130 0.0001 0.0002 0.0231
    ## MO1835         0.0004 0.0001 0.0003 0.0002 0.0001 0.0004 0.0001 0.0003
    ## MO1849         0.0002 0.0001 0.0105 0.0052 0.0019 0.0001 0.0001 0.0065
    ## MO1856         0.0002 0.0000 0.0066 0.0046 0.0013 0.0003 0.0001 0.0046
    ## MO1879         0.0003 0.0000 0.0057 0.0033 0.0009 0.0002 0.0002 0.0035
    ## MS1848         0.0007 0.0001 0.0004 0.0002 0.0002 0.0140 0.0008 0.0004
    ## MS1850         0.0000 0.0000 0.0080 0.0028 0.0006 0.0001 0.0000 0.0057
    ## MS1857         0.0006 0.0001 0.0010 0.0006 0.0002 0.0072 0.0008 0.0009
    ## MT1865         0.0007 0.0001 0.0240 0.0712 0.0175 0.0001 0.0002 0.0244
    ## MT1895         0.0007 0.0000 0.0113 0.0299 0.0420 0.0001 0.0002 0.0111
    ## NC1868         0.0005 0.0001 0.0198 0.0139 0.0063 0.0002 0.0003 0.0229
    ## ND1877         0.0007 0.0000 0.0144 0.0176 0.0165 0.0001 0.0003 0.0148
    ## ND1877extended 0.0007 0.0000 0.0143 0.0176 0.0163 0.0001 0.0003 0.0148
    ## NE1857         0.0055 0.0038 0.0026 0.0017 0.0013 0.0001 0.0002 0.0031
    ## NE1859         0.0005 0.0000 0.0075 0.0055 0.0047 0.0002 0.0003 0.0078
    ## NE1866         0.0017 0.0000 0.0046 0.0057 0.0030 0.0002 0.0003 0.0057
    ## NH1842         0.0002 0.0000 0.0003 0.0001 0.0001 0.0001 0.0001 0.0002
    ## NJ1847         0.0002 0.0000 0.0002 0.0002 0.0001 0.0008 0.0003 0.0002
    ## NM1865         0.0002 0.0001 0.0007 0.0001 0.0001 0.0005 0.0001 0.0005
    ## NM1897         0.0007 0.0001 0.0084 0.0037 0.0022 0.0002 0.0003 0.0066
    ## NV1861         0.0007 0.0000 0.0339 0.1222 0.0287 0.0002 0.0002 0.0333
    ## NV1869         0.0007 0.0001 0.0267 0.1703 0.0298 0.0001 0.0002 0.0270
    ## NY1848         0.0003 0.0000 0.0203 0.0101 0.0047 0.0001 0.0001 0.0148
    ## NY1849         0.0004 0.0000 0.0238 0.0141 0.0059 0.0002 0.0002 0.0222
    ## NY1850         0.0011 0.0001 0.0199 0.0234 0.0189 0.0001 0.0002 0.0192
    ## NY1851         0.0004 0.0000 0.0245 0.0143 0.0062 0.0001 0.0002 0.0244
    ## NY1853         0.0010 0.0000 0.0184 0.0216 0.0160 0.0001 0.0002 0.0180
    ## NY1876         0.0003 0.0000 0.0019 0.0015 0.0011 0.0000 0.0002 0.0015
    ## NY1879         0.0003 0.0000 0.0016 0.0012 0.0010 0.0000 0.0002 0.0013
    ## OH1853         0.0006 0.0000 0.0073 0.0055 0.0046 0.0002 0.0002 0.0076
    ## OH1853extended 0.0007 0.0001 0.0066 0.0067 0.0042 0.0002 0.0003 0.0071
    ## OH1879         0.0006 0.0000 0.0023 0.0024 0.0016 0.0001 0.0003 0.0029
    ## OK1891         0.0006 0.0001 0.0070 0.0073 0.0042 0.0001 0.0003 0.0233
    ## OK1893         0.0009 0.0001 0.0058 0.0058 0.0042 0.0001 0.0003 0.0115
    ## OR1854         0.0010 0.0001 0.1232 0.0299 0.0134 0.0001 0.0003 0.0776
    ## OR1862         0.0008 0.0001 0.0260 0.0148 0.0105 0.0001 0.0002 0.0219
    ## SC1870         0.0004 0.0001 0.0230 0.0142 0.0068 0.0001 0.0002 0.0243
    ## TN1858             NA 0.0006 0.0005 0.0004 0.0003 0.0001 0.0003 0.0005
    ## UT1853             NA     NA 0.0003 0.0001 0.0000 0.0000 0.0000 0.0000
    ## UT1859             NA     NA     NA 0.0162 0.0089 0.0002 0.0002 0.0701
    ## UT1870             NA     NA     NA     NA 0.0192 0.0001 0.0002 0.0156
    ## UT1884             NA     NA     NA     NA     NA 0.0000 0.0001 0.0084
    ## VA1841             NA     NA     NA     NA     NA     NA 0.0006 0.0002
    ## VA1860             NA     NA     NA     NA     NA     NA     NA 0.0002
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                WA1873 WI1849 WI1856 WI1858 WOOD1857 WV1868 WY1870 WY1886
    ## AK1900         0.0130 0.0034 0.0125 0.0110   0.0142 0.0003 0.0047 0.0016
    ## AL1852         0.0004 0.0005 0.0008 0.0007   0.0007 0.0002 0.0005 0.0004
    ## AR1868         0.0044 0.0004 0.0056 0.0031   0.0035 0.0010 0.0218 0.0094
    ## AR1874         0.0045 0.0002 0.0067 0.0027   0.0035 0.0002 0.0231 0.0103
    ## AZ1865         0.0215 0.0015 0.0349 0.0160   0.1820 0.0003 0.0172 0.0029
    ## AZ1887         0.0156 0.0004 0.0045 0.0025   0.0087 0.0003 0.0053 0.0011
    ## BI1859         0.0002 0.0002 0.0001 0.0002   0.0001 0.0001 0.0002 0.0001
    ## CA1850         0.0178 0.0012 0.0733 0.0258   0.0236 0.0002 0.0112 0.0035
    ## CA1851         0.0224 0.0015 0.0380 0.0176   0.2017 0.0003 0.0183 0.0034
    ## CA1858         0.0221 0.0015 0.0371 0.0183   0.2353 0.0003 0.0197 0.0034
    ## CA1868         0.0151 0.0011 0.0246 0.0134   0.1459 0.0003 0.0138 0.0026
    ## CA1868extended 0.0057 0.0007 0.0067 0.0058   0.0493 0.0002 0.0050 0.0010
    ## CA1872         0.0205 0.0022 0.0168 0.0131   0.0726 0.0003 0.0130 0.0035
    ## CO1868         0.0006 0.0107 0.0003 0.0049   0.0004 0.0006 0.0078 0.0030
    ## CO1877         0.0148 0.0017 0.0237 0.0117   0.0714 0.0003 0.0167 0.0044
    ## CT1854         0.0003 0.0004 0.0003 0.0003   0.0002 0.0001 0.0003 0.0002
    ## CT1879         0.0001 0.0000 0.0006 0.0002   0.0002 0.0000 0.0002 0.0002
    ## CT1879extended 0.0002 0.0001 0.0004 0.0003   0.0003 0.0001 0.0003 0.0003
    ## DC1857         0.0240 0.0023 0.0208 0.0112   0.0211 0.0026 0.0275 0.0104
    ## DE1852         0.0003 0.0009 0.0002 0.0007   0.0002 0.0002 0.0002 0.0002
    ## DT1862         0.0065 0.0007 0.0137 0.0069   0.0073 0.0004 0.1736 0.0434
    ## DT1868         0.0163 0.0023 0.0980 0.0436   0.0179 0.0004 0.0093 0.0036
    ## DT1887         0.0113 0.0026 0.0233 0.0178   0.0148 0.0003 0.0085 0.0030
    ## FL1847         0.0011 0.0049 0.0002 0.0041   0.0003 0.0003 0.0005 0.0003
    ## FL1870         0.0214 0.0012 0.1526 0.0561   0.0239 0.0002 0.0125 0.0043
    ## FL1892         0.0012 0.0039 0.0005 0.0031   0.0004 0.0009 0.0005 0.0004
    ## FR1806         0.0000 0.0000 0.0000 0.0000   0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0003 0.0004 0.0001 0.0003   0.0002 0.0002 0.0003 0.0002
    ## GA1860         0.0004 0.0004 0.0001 0.0003   0.0003 0.0004 0.0004 0.0002
    ## GB1852         0.0001 0.0002 0.0001 0.0001   0.0001 0.0003 0.0002 0.0001
    ## GB1854         0.0001 0.0001 0.0001 0.0001   0.0001 0.0000 0.0001 0.0001
    ## GB1873         0.0001 0.0001 0.0001 0.0001   0.0000 0.0001 0.0001 0.0000
    ## GB1875         0.0001 0.0001 0.0001 0.0001   0.0001 0.0001 0.0001 0.0001
    ## HI1859         0.0012 0.0001 0.0035 0.0010   0.0026 0.0000 0.0015 0.0007
    ## HI1897         0.0015 0.0014 0.0024 0.0020   0.0022 0.0001 0.0015 0.0007
    ## IA1839         0.0002 0.0007 0.0001 0.0002   0.0001 0.0001 0.0003 0.0003
    ## IA1851         0.0017 0.0008 0.0016 0.0012   0.0019 0.0002 0.0204 0.0006
    ## IA1859         0.0022 0.0005 0.0030 0.0018   0.0023 0.0002 0.0150 0.0033
    ## ID1864         0.0179 0.0029 0.0217 0.0130   0.1055 0.0003 0.0123 0.0024
    ## ID1881         0.0114 0.0019 0.0153 0.0108   0.0549 0.0003 0.0115 0.0034
    ## IL1866         0.0006 0.0079 0.0003 0.0048   0.0004 0.0007 0.0063 0.0004
    ## IL1933         0.0005 0.0002 0.0011 0.0004   0.0005 0.0002 0.0007 0.0006
    ## IN1843         0.0016 0.0062 0.0006 0.0042   0.0005 0.0004 0.0016 0.0005
    ## IN1852         0.0292 0.0015 0.0099 0.0056   0.0046 0.0004 0.0083 0.0034
    ## KS1859         0.0068 0.0007 0.0148 0.0074   0.0076 0.0004 0.1914 0.0440
    ## KS1868         0.0102 0.0010 0.0111 0.0068   0.0078 0.0004 0.1374 0.0313
    ## KY1851         0.0053 0.0003 0.0067 0.0036   0.0043 0.0005 0.0259 0.0118
    ## KY1854         0.0045 0.0004 0.0059 0.0031   0.0040 0.0012 0.0230 0.0105
    ## LA1825         0.0001 0.0000 0.0000 0.0000   0.0000 0.0000 0.0000 0.0000
    ## LA1825french   0.0000 0.0000 0.0000 0.0000   0.0000 0.0001 0.0000 0.0000
    ## LC1867         0.0001 0.0001 0.0001 0.0001   0.0001 0.0001 0.0001 0.0001
    ## LC1867french   0.0000 0.0000 0.0000 0.0000   0.0000 0.0000 0.0000 0.0000
    ## MA1836         0.0013 0.0184 0.0002 0.0115   0.0005 0.0013 0.0004 0.0002
    ## MA1851         0.0002 0.0001 0.0001 0.0001   0.0000 0.0000 0.0001 0.0000
    ## MA1858         0.0012 0.0091 0.0002 0.0067   0.0004 0.0010 0.0005 0.0002
    ## MD1855         0.0001 0.0001 0.0001 0.0001   0.0000 0.0001 0.0001 0.0001
    ## MD1859         0.0001 0.0002 0.0001 0.0001   0.0001 0.0001 0.0002 0.0001
    ## ME1840         0.0009 0.0038 0.0002 0.0029   0.0002 0.0003 0.0004 0.0003
    ## MI1853         0.0002 0.0003 0.0009 0.0005   0.0004 0.0001 0.0003 0.0002
    ## MN1851         0.0109 0.0398 0.0213 0.0470   0.0168 0.0002 0.0073 0.0023
    ## MN1859         0.0183 0.0657 0.0372 0.0885   0.0291 0.0003 0.0106 0.0033
    ## MO1835         0.0002 0.0031 0.0002 0.0009   0.0002 0.0001 0.0004 0.0003
    ## MO1849         0.0057 0.0007 0.0229 0.0068   0.0071 0.0001 0.0052 0.0021
    ## MO1856         0.0038 0.0025 0.0155 0.0062   0.0052 0.0002 0.0052 0.0026
    ## MO1879         0.0030 0.0014 0.0096 0.0039   0.0037 0.0002 0.0040 0.0019
    ## MS1848         0.0005 0.0008 0.0002 0.0006   0.0003 0.0006 0.0006 0.0003
    ## MS1850         0.0038 0.0000 0.0132 0.0033   0.0031 0.0000 0.0021 0.0009
    ## MS1857         0.0008 0.0006 0.0010 0.0008   0.0006 0.0006 0.0018 0.0008
    ## MT1865         0.0187 0.0024 0.0216 0.0117   0.1003 0.0003 0.0181 0.0035
    ## MT1895         0.0151 0.0019 0.0112 0.0099   0.0430 0.0003 0.0096 0.0042
    ## NC1868         0.0181 0.0021 0.0976 0.0471   0.0208 0.0003 0.0107 0.0036
    ## ND1877         0.0181 0.0041 0.0439 0.0319   0.0271 0.0004 0.0155 0.0053
    ## ND1877extended 0.0180 0.0041 0.0437 0.0318   0.0270 0.0004 0.0154 0.0053
    ## NE1857         0.0021 0.0056 0.0023 0.0051   0.0021 0.0002 0.0333 0.0013
    ## NE1859         0.0064 0.0007 0.0143 0.0075   0.0073 0.0004 0.1719 0.0437
    ## NE1866         0.0044 0.0032 0.0076 0.0062   0.0066 0.0004 0.1823 0.0289
    ## NH1842         0.0002 0.0005 0.0001 0.0003   0.0001 0.0001 0.0002 0.0001
    ## NJ1847         0.0003 0.0022 0.0002 0.0004   0.0002 0.0002 0.0004 0.0002
    ## NM1865         0.0006 0.0003 0.0001 0.0002   0.0001 0.0001 0.0003 0.0002
    ## NM1897         0.0046 0.0068 0.0103 0.0108   0.0042 0.0005 0.0087 0.0032
    ## NV1861         0.0214 0.0035 0.0338 0.0190   0.1758 0.0003 0.0186 0.0032
    ## NV1869         0.0176 0.0013 0.0284 0.0144   0.1484 0.0003 0.0246 0.0030
    ## NY1848         0.0119 0.0008 0.0735 0.0256   0.0161 0.0002 0.0062 0.0024
    ## NY1849         0.0162 0.0028 0.1206 0.0476   0.0212 0.0002 0.0099 0.0034
    ## NY1850         0.0144 0.0056 0.0371 0.0289   0.0376 0.0003 0.0116 0.0032
    ## NY1851         0.0181 0.0029 0.1320 0.0521   0.0217 0.0002 0.0110 0.0036
    ## NY1853         0.0135 0.0054 0.0360 0.0276   0.0343 0.0003 0.0106 0.0029
    ## NY1876         0.0014 0.0014 0.0035 0.0034   0.0019 0.0003 0.0013 0.0009
    ## NY1879         0.0012 0.0011 0.0031 0.0029   0.0017 0.0003 0.0011 0.0006
    ## OH1853         0.0060 0.0007 0.0144 0.0069   0.0071 0.0004 0.1549 0.0422
    ## OH1853extended 0.0053 0.0011 0.0112 0.0062   0.0083 0.0004 0.1236 0.0355
    ## OH1879         0.0041 0.0010 0.0033 0.0032   0.0032 0.0006 0.0272 0.0655
    ## OK1891         0.0198 0.0011 0.0087 0.0056   0.0095 0.0004 0.0081 0.0039
    ## OK1893         0.0084 0.0010 0.0096 0.0060   0.0070 0.0005 0.1168 0.0286
    ## OR1854         0.0592 0.0183 0.0449 0.0396   0.0462 0.0004 0.0119 0.0035
    ## OR1862         0.0202 0.0050 0.0210 0.0184   0.0223 0.0004 0.0071 0.0021
    ## SC1870         0.0196 0.0035 0.1178 0.0514   0.0206 0.0002 0.0105 0.0037
    ## TN1858         0.0004 0.0011 0.0004 0.0012   0.0005 0.0004 0.0009 0.0004
    ## UT1853         0.0000 0.0001 0.0001 0.0001   0.0000 0.0000 0.0000 0.0000
    ## UT1859         0.0395 0.0058 0.0232 0.0153   0.0253 0.0002 0.0076 0.0025
    ## UT1870         0.0099 0.0008 0.0160 0.0079   0.0765 0.0002 0.0120 0.0020
    ## UT1884         0.0067 0.0006 0.0065 0.0047   0.0214 0.0002 0.0061 0.0019
    ## VA1841         0.0001 0.0002 0.0001 0.0002   0.0001 0.0003 0.0002 0.0001
    ## VA1860         0.0002 0.0009 0.0002 0.0003   0.0002 0.0762 0.0003 0.0002
    ## WA1855         0.1429 0.0062 0.0284 0.0150   0.0220 0.0003 0.0071 0.0026
    ## WA1873             NA 0.0020 0.0206 0.0128   0.0154 0.0003 0.0059 0.0022
    ## WI1849             NA     NA 0.0017 0.1299   0.0017 0.0011 0.0009 0.0004
    ## WI1856             NA     NA     NA 0.0765   0.0246 0.0002 0.0113 0.0041
    ## WI1858             NA     NA     NA     NA   0.0132 0.0007 0.0065 0.0025
    ## WOOD1857           NA     NA     NA     NA       NA 0.0003 0.0127 0.0024
    ## WV1868             NA     NA     NA     NA       NA     NA 0.0004 0.0002
    ## WY1870             NA     NA     NA     NA       NA     NA     NA 0.0309
    ## WY1886             NA     NA     NA     NA       NA     NA     NA     NA

Here is the comparison matrix for the shingled n-grams.

    round(m_shingles, digits = 4)

    ##                AK1900 AL1852 AR1868 AR1874 AZ1865 AZ1887 BI1859 CA1850
    ## AK1900             NA 0.0016 0.0074 0.0060 0.0360 0.0076  5e-04 0.0203
    ## AL1852             NA     NA 0.0015 0.0007 0.0025 0.0011  4e-04 0.0009
    ## AR1868             NA     NA     NA 0.1469 0.0108 0.0049  5e-04 0.0113
    ## AR1874             NA     NA     NA     NA 0.0115 0.0061  3e-04 0.0156
    ## AZ1865             NA     NA     NA     NA     NA 0.0205  6e-04 0.0657
    ## AZ1887             NA     NA     NA     NA     NA     NA  6e-04 0.0081
    ## BI1859             NA     NA     NA     NA     NA     NA     NA 0.0007
    ## CA1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1868extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## CA1872             NA     NA     NA     NA     NA     NA     NA     NA
    ## CO1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## CO1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## CT1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## CT1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## CT1879extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## DC1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## DE1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## DT1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## DT1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## DT1887             NA     NA     NA     NA     NA     NA     NA     NA
    ## FL1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## FL1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## FL1892             NA     NA     NA     NA     NA     NA     NA     NA
    ## FR1806             NA     NA     NA     NA     NA     NA     NA     NA
    ## GA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## GA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1875             NA     NA     NA     NA     NA     NA     NA     NA
    ## HI1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## HI1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1839             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1864             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1881             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1933             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1843             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825french       NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867             NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867french       NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1836             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ME1840             NA     NA     NA     NA     NA     NA     NA     NA
    ## MI1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                CA1851 CA1858 CA1868 CA1868extended CA1872 CO1868 CO1877
    ## AK1900         0.0369 0.0372 0.0297         0.0118 0.0345 0.0014 0.0204
    ## AL1852         0.0024 0.0026 0.0021         0.0008 0.0025 0.0014 0.0019
    ## AR1868         0.0116 0.0110 0.0088         0.0034 0.0117 0.0014 0.0117
    ## AR1874         0.0133 0.0121 0.0089         0.0025 0.0102 0.0009 0.0150
    ## AZ1865         0.4577 0.4285 0.2488         0.0745 0.1290 0.0016 0.1486
    ## AZ1887         0.0195 0.0185 0.0144         0.0049 0.1567 0.0018 0.0179
    ## BI1859         0.0007 0.0007 0.0006         0.0003 0.0005 0.0008 0.0005
    ## CA1850         0.0743 0.0712 0.0455         0.0116 0.0273 0.0015 0.0411
    ## CA1851             NA 0.5717 0.3065         0.0825 0.1357 0.0014 0.1561
    ## CA1858             NA     NA 0.3504         0.0955 0.1456 0.0016 0.1657
    ## CA1868             NA     NA     NA         0.0890 0.1260 0.0017 0.1352
    ## CA1868extended     NA     NA     NA             NA 0.0565 0.0006 0.0424
    ## CA1872             NA     NA     NA             NA     NA 0.0016 0.0714
    ## CO1868             NA     NA     NA             NA     NA     NA 0.0146
    ## CO1877             NA     NA     NA             NA     NA     NA     NA
    ## CT1854             NA     NA     NA             NA     NA     NA     NA
    ## CT1879             NA     NA     NA             NA     NA     NA     NA
    ## CT1879extended     NA     NA     NA             NA     NA     NA     NA
    ## DC1857             NA     NA     NA             NA     NA     NA     NA
    ## DE1852             NA     NA     NA             NA     NA     NA     NA
    ## DT1862             NA     NA     NA             NA     NA     NA     NA
    ## DT1868             NA     NA     NA             NA     NA     NA     NA
    ## DT1887             NA     NA     NA             NA     NA     NA     NA
    ## FL1847             NA     NA     NA             NA     NA     NA     NA
    ## FL1870             NA     NA     NA             NA     NA     NA     NA
    ## FL1892             NA     NA     NA             NA     NA     NA     NA
    ## FR1806             NA     NA     NA             NA     NA     NA     NA
    ## GA1851             NA     NA     NA             NA     NA     NA     NA
    ## GA1860             NA     NA     NA             NA     NA     NA     NA
    ## GB1852             NA     NA     NA             NA     NA     NA     NA
    ## GB1854             NA     NA     NA             NA     NA     NA     NA
    ## GB1873             NA     NA     NA             NA     NA     NA     NA
    ## GB1875             NA     NA     NA             NA     NA     NA     NA
    ## HI1859             NA     NA     NA             NA     NA     NA     NA
    ## HI1897             NA     NA     NA             NA     NA     NA     NA
    ## IA1839             NA     NA     NA             NA     NA     NA     NA
    ## IA1851             NA     NA     NA             NA     NA     NA     NA
    ## IA1859             NA     NA     NA             NA     NA     NA     NA
    ## ID1864             NA     NA     NA             NA     NA     NA     NA
    ## ID1881             NA     NA     NA             NA     NA     NA     NA
    ## IL1866             NA     NA     NA             NA     NA     NA     NA
    ## IL1933             NA     NA     NA             NA     NA     NA     NA
    ## IN1843             NA     NA     NA             NA     NA     NA     NA
    ## IN1852             NA     NA     NA             NA     NA     NA     NA
    ## KS1859             NA     NA     NA             NA     NA     NA     NA
    ## KS1868             NA     NA     NA             NA     NA     NA     NA
    ## KY1851             NA     NA     NA             NA     NA     NA     NA
    ## KY1854             NA     NA     NA             NA     NA     NA     NA
    ## LA1825             NA     NA     NA             NA     NA     NA     NA
    ## LA1825french       NA     NA     NA             NA     NA     NA     NA
    ## LC1867             NA     NA     NA             NA     NA     NA     NA
    ## LC1867french       NA     NA     NA             NA     NA     NA     NA
    ## MA1836             NA     NA     NA             NA     NA     NA     NA
    ## MA1851             NA     NA     NA             NA     NA     NA     NA
    ## MA1858             NA     NA     NA             NA     NA     NA     NA
    ## MD1855             NA     NA     NA             NA     NA     NA     NA
    ## MD1859             NA     NA     NA             NA     NA     NA     NA
    ## ME1840             NA     NA     NA             NA     NA     NA     NA
    ## MI1853             NA     NA     NA             NA     NA     NA     NA
    ## MN1851             NA     NA     NA             NA     NA     NA     NA
    ## MN1859             NA     NA     NA             NA     NA     NA     NA
    ## MO1835             NA     NA     NA             NA     NA     NA     NA
    ## MO1849             NA     NA     NA             NA     NA     NA     NA
    ## MO1856             NA     NA     NA             NA     NA     NA     NA
    ## MO1879             NA     NA     NA             NA     NA     NA     NA
    ## MS1848             NA     NA     NA             NA     NA     NA     NA
    ## MS1850             NA     NA     NA             NA     NA     NA     NA
    ## MS1857             NA     NA     NA             NA     NA     NA     NA
    ## MT1865             NA     NA     NA             NA     NA     NA     NA
    ## MT1895             NA     NA     NA             NA     NA     NA     NA
    ## NC1868             NA     NA     NA             NA     NA     NA     NA
    ## ND1877             NA     NA     NA             NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA             NA     NA     NA     NA
    ## NE1857             NA     NA     NA             NA     NA     NA     NA
    ## NE1859             NA     NA     NA             NA     NA     NA     NA
    ## NE1866             NA     NA     NA             NA     NA     NA     NA
    ## NH1842             NA     NA     NA             NA     NA     NA     NA
    ## NJ1847             NA     NA     NA             NA     NA     NA     NA
    ## NM1865             NA     NA     NA             NA     NA     NA     NA
    ## NM1897             NA     NA     NA             NA     NA     NA     NA
    ## NV1861             NA     NA     NA             NA     NA     NA     NA
    ## NV1869             NA     NA     NA             NA     NA     NA     NA
    ## NY1848             NA     NA     NA             NA     NA     NA     NA
    ## NY1849             NA     NA     NA             NA     NA     NA     NA
    ## NY1850             NA     NA     NA             NA     NA     NA     NA
    ## NY1851             NA     NA     NA             NA     NA     NA     NA
    ## NY1853             NA     NA     NA             NA     NA     NA     NA
    ## NY1876             NA     NA     NA             NA     NA     NA     NA
    ## NY1879             NA     NA     NA             NA     NA     NA     NA
    ## OH1853             NA     NA     NA             NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA             NA     NA     NA     NA
    ## OH1879             NA     NA     NA             NA     NA     NA     NA
    ## OK1891             NA     NA     NA             NA     NA     NA     NA
    ## OK1893             NA     NA     NA             NA     NA     NA     NA
    ## OR1854             NA     NA     NA             NA     NA     NA     NA
    ## OR1862             NA     NA     NA             NA     NA     NA     NA
    ## SC1870             NA     NA     NA             NA     NA     NA     NA
    ## TN1858             NA     NA     NA             NA     NA     NA     NA
    ## UT1853             NA     NA     NA             NA     NA     NA     NA
    ## UT1859             NA     NA     NA             NA     NA     NA     NA
    ## UT1870             NA     NA     NA             NA     NA     NA     NA
    ## UT1884             NA     NA     NA             NA     NA     NA     NA
    ## VA1841             NA     NA     NA             NA     NA     NA     NA
    ## VA1860             NA     NA     NA             NA     NA     NA     NA
    ## WA1855             NA     NA     NA             NA     NA     NA     NA
    ## WA1873             NA     NA     NA             NA     NA     NA     NA
    ## WI1849             NA     NA     NA             NA     NA     NA     NA
    ## WI1856             NA     NA     NA             NA     NA     NA     NA
    ## WI1858             NA     NA     NA             NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA             NA     NA     NA     NA
    ## WV1868             NA     NA     NA             NA     NA     NA     NA
    ## WY1870             NA     NA     NA             NA     NA     NA     NA
    ## WY1886             NA     NA     NA             NA     NA     NA     NA
    ##                CT1854 CT1879 CT1879extended DC1857 DE1852 DT1862 DT1868
    ## AK1900         0.0005 0.0005         0.0009 0.0205 0.0006 0.0110 0.0229
    ## AL1852         0.0008 0.0001         0.0002 0.0019 0.0007 0.0015 0.0017
    ## AR1868         0.0009 0.0004         0.0008 0.0237 0.0006 0.0522 0.0091
    ## AR1874         0.0007 0.0008         0.0009 0.0269 0.0005 0.0611 0.0106
    ## AZ1865         0.0012 0.0009         0.0009 0.0522 0.0007 0.0224 0.0496
    ## AZ1887         0.0007 0.0003         0.0004 0.0083 0.0007 0.0071 0.0066
    ## BI1859         0.0007 0.0002         0.0001 0.0006 0.0003 0.0006 0.0005
    ## CA1850         0.0010 0.0015         0.0010 0.0286 0.0004 0.0301 0.0862
    ## CA1851         0.0010 0.0008         0.0010 0.0534 0.0008 0.0247 0.0521
    ## CA1858         0.0012 0.0007         0.0009 0.0528 0.0009 0.0243 0.0518
    ## CA1868         0.0010 0.0006         0.0009 0.0389 0.0006 0.0183 0.0363
    ## CA1868extended 0.0004 0.0001         0.0004 0.0141 0.0002 0.0058 0.0115
    ## CA1872         0.0008 0.0004         0.0008 0.0323 0.0007 0.0201 0.0316
    ## CO1868         0.0014 0.0001         0.0005 0.0022 0.0018 0.0020 0.0013
    ## CO1877         0.0012 0.0004         0.0009 0.0364 0.0005 0.0222 0.0348
    ## CT1854             NA 0.0002         0.0010 0.0013 0.0006 0.0013 0.0010
    ## CT1879             NA     NA         0.0306 0.0008 0.0001 0.0012 0.0010
    ## CT1879extended     NA     NA             NA 0.0011 0.0002 0.0010 0.0009
    ## DC1857             NA     NA             NA     NA 0.0012 0.0597 0.0328
    ## DE1852             NA     NA             NA     NA     NA 0.0009 0.0006
    ## DT1862             NA     NA             NA     NA     NA     NA 0.0248
    ## DT1868             NA     NA             NA     NA     NA     NA     NA
    ## DT1887             NA     NA             NA     NA     NA     NA     NA
    ## FL1847             NA     NA             NA     NA     NA     NA     NA
    ## FL1870             NA     NA             NA     NA     NA     NA     NA
    ## FL1892             NA     NA             NA     NA     NA     NA     NA
    ## FR1806             NA     NA             NA     NA     NA     NA     NA
    ## GA1851             NA     NA             NA     NA     NA     NA     NA
    ## GA1860             NA     NA             NA     NA     NA     NA     NA
    ## GB1852             NA     NA             NA     NA     NA     NA     NA
    ## GB1854             NA     NA             NA     NA     NA     NA     NA
    ## GB1873             NA     NA             NA     NA     NA     NA     NA
    ## GB1875             NA     NA             NA     NA     NA     NA     NA
    ## HI1859             NA     NA             NA     NA     NA     NA     NA
    ## HI1897             NA     NA             NA     NA     NA     NA     NA
    ## IA1839             NA     NA             NA     NA     NA     NA     NA
    ## IA1851             NA     NA             NA     NA     NA     NA     NA
    ## IA1859             NA     NA             NA     NA     NA     NA     NA
    ## ID1864             NA     NA             NA     NA     NA     NA     NA
    ## ID1881             NA     NA             NA     NA     NA     NA     NA
    ## IL1866             NA     NA             NA     NA     NA     NA     NA
    ## IL1933             NA     NA             NA     NA     NA     NA     NA
    ## IN1843             NA     NA             NA     NA     NA     NA     NA
    ## IN1852             NA     NA             NA     NA     NA     NA     NA
    ## KS1859             NA     NA             NA     NA     NA     NA     NA
    ## KS1868             NA     NA             NA     NA     NA     NA     NA
    ## KY1851             NA     NA             NA     NA     NA     NA     NA
    ## KY1854             NA     NA             NA     NA     NA     NA     NA
    ## LA1825             NA     NA             NA     NA     NA     NA     NA
    ## LA1825french       NA     NA             NA     NA     NA     NA     NA
    ## LC1867             NA     NA             NA     NA     NA     NA     NA
    ## LC1867french       NA     NA             NA     NA     NA     NA     NA
    ## MA1836             NA     NA             NA     NA     NA     NA     NA
    ## MA1851             NA     NA             NA     NA     NA     NA     NA
    ## MA1858             NA     NA             NA     NA     NA     NA     NA
    ## MD1855             NA     NA             NA     NA     NA     NA     NA
    ## MD1859             NA     NA             NA     NA     NA     NA     NA
    ## ME1840             NA     NA             NA     NA     NA     NA     NA
    ## MI1853             NA     NA             NA     NA     NA     NA     NA
    ## MN1851             NA     NA             NA     NA     NA     NA     NA
    ## MN1859             NA     NA             NA     NA     NA     NA     NA
    ## MO1835             NA     NA             NA     NA     NA     NA     NA
    ## MO1849             NA     NA             NA     NA     NA     NA     NA
    ## MO1856             NA     NA             NA     NA     NA     NA     NA
    ## MO1879             NA     NA             NA     NA     NA     NA     NA
    ## MS1848             NA     NA             NA     NA     NA     NA     NA
    ## MS1850             NA     NA             NA     NA     NA     NA     NA
    ## MS1857             NA     NA             NA     NA     NA     NA     NA
    ## MT1865             NA     NA             NA     NA     NA     NA     NA
    ## MT1895             NA     NA             NA     NA     NA     NA     NA
    ## NC1868             NA     NA             NA     NA     NA     NA     NA
    ## ND1877             NA     NA             NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA             NA     NA     NA     NA     NA
    ## NE1857             NA     NA             NA     NA     NA     NA     NA
    ## NE1859             NA     NA             NA     NA     NA     NA     NA
    ## NE1866             NA     NA             NA     NA     NA     NA     NA
    ## NH1842             NA     NA             NA     NA     NA     NA     NA
    ## NJ1847             NA     NA             NA     NA     NA     NA     NA
    ## NM1865             NA     NA             NA     NA     NA     NA     NA
    ## NM1897             NA     NA             NA     NA     NA     NA     NA
    ## NV1861             NA     NA             NA     NA     NA     NA     NA
    ## NV1869             NA     NA             NA     NA     NA     NA     NA
    ## NY1848             NA     NA             NA     NA     NA     NA     NA
    ## NY1849             NA     NA             NA     NA     NA     NA     NA
    ## NY1850             NA     NA             NA     NA     NA     NA     NA
    ## NY1851             NA     NA             NA     NA     NA     NA     NA
    ## NY1853             NA     NA             NA     NA     NA     NA     NA
    ## NY1876             NA     NA             NA     NA     NA     NA     NA
    ## NY1879             NA     NA             NA     NA     NA     NA     NA
    ## OH1853             NA     NA             NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA             NA     NA     NA     NA     NA
    ## OH1879             NA     NA             NA     NA     NA     NA     NA
    ## OK1891             NA     NA             NA     NA     NA     NA     NA
    ## OK1893             NA     NA             NA     NA     NA     NA     NA
    ## OR1854             NA     NA             NA     NA     NA     NA     NA
    ## OR1862             NA     NA             NA     NA     NA     NA     NA
    ## SC1870             NA     NA             NA     NA     NA     NA     NA
    ## TN1858             NA     NA             NA     NA     NA     NA     NA
    ## UT1853             NA     NA             NA     NA     NA     NA     NA
    ## UT1859             NA     NA             NA     NA     NA     NA     NA
    ## UT1870             NA     NA             NA     NA     NA     NA     NA
    ## UT1884             NA     NA             NA     NA     NA     NA     NA
    ## VA1841             NA     NA             NA     NA     NA     NA     NA
    ## VA1860             NA     NA             NA     NA     NA     NA     NA
    ## WA1855             NA     NA             NA     NA     NA     NA     NA
    ## WA1873             NA     NA             NA     NA     NA     NA     NA
    ## WI1849             NA     NA             NA     NA     NA     NA     NA
    ## WI1856             NA     NA             NA     NA     NA     NA     NA
    ## WI1858             NA     NA             NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA             NA     NA     NA     NA     NA
    ## WV1868             NA     NA             NA     NA     NA     NA     NA
    ## WY1870             NA     NA             NA     NA     NA     NA     NA
    ## WY1886             NA     NA             NA     NA     NA     NA     NA
    ##                DT1887 FL1847 FL1870 FL1892 FR1806 GA1851 GA1860 GB1852
    ## AK1900         0.0151 0.0011 0.0267 0.0019      0 0.0005 0.0006 0.0004
    ## AL1852         0.0013 0.0020 0.0022 0.0017      0 0.0009 0.0015 0.0003
    ## AR1868         0.0066 0.0013 0.0114 0.0013      0 0.0008 0.0009 0.0003
    ## AR1874         0.0051 0.0006 0.0139 0.0006      0 0.0004 0.0005 0.0003
    ## AZ1865         0.0346 0.0011 0.0653 0.0016      0 0.0006 0.0009 0.0006
    ## AZ1887         0.0768 0.0017 0.0088 0.0014      0 0.0012 0.0013 0.0003
    ## BI1859         0.0004 0.0008 0.0008 0.0010      0 0.0003 0.0005 0.0021
    ## CA1850         0.0228 0.0011 0.1084 0.0011      0 0.0005 0.0008 0.0002
    ## CA1851         0.0354 0.0010 0.0694 0.0017      0 0.0005 0.0009 0.0005
    ## CA1858         0.0381 0.0012 0.0677 0.0019      0 0.0006 0.0011 0.0005
    ## CA1868         0.0320 0.0014 0.0476 0.0018      0 0.0009 0.0011 0.0005
    ## CA1868extended 0.0148 0.0005 0.0144 0.0009      0 0.0004 0.0005 0.0002
    ## CA1872         0.1034 0.0012 0.0359 0.0043      0 0.0007 0.0011 0.0003
    ## CO1868         0.0013 0.0048 0.0013 0.0029      0 0.0020 0.0020 0.0008
    ## CO1877         0.0182 0.0014 0.0434 0.0018      0 0.0007 0.0011 0.0006
    ## CT1854         0.0006 0.0012 0.0011 0.0010      0 0.0009 0.0009 0.0005
    ## CT1879         0.0002 0.0002 0.0014 0.0001      0 0.0001 0.0001 0.0003
    ## CT1879extended 0.0005 0.0004 0.0013 0.0005      0 0.0003 0.0002 0.0004
    ## DC1857         0.0203 0.0021 0.0399 0.0034      0 0.0009 0.0013 0.0005
    ## DE1852         0.0006 0.0013 0.0008 0.0013      0 0.0006 0.0007 0.0004
    ## DT1862         0.0213 0.0020 0.0302 0.0020      0 0.0010 0.0014 0.0006
    ## DT1868         0.0533 0.0009 0.2273 0.0049      0 0.0004 0.0006 0.0003
    ## DT1887             NA 0.0014 0.0522 0.0035      0 0.0007 0.0008 0.0002
    ## FL1847             NA     NA 0.0013 0.0580      0 0.0085 0.0033 0.0008
    ## FL1870             NA     NA     NA 0.0047      0 0.0006 0.0007 0.0004
    ## FL1892             NA     NA     NA     NA      0 0.0024 0.0018 0.0157
    ## FR1806             NA     NA     NA     NA     NA 0.0000 0.0000 0.0000
    ## GA1851             NA     NA     NA     NA     NA     NA 0.0291 0.0007
    ## GA1860             NA     NA     NA     NA     NA     NA     NA 0.0004
    ## GB1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## GB1875             NA     NA     NA     NA     NA     NA     NA     NA
    ## HI1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## HI1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1839             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## IA1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1864             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1881             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1933             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1843             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825french       NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867             NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867french       NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1836             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ME1840             NA     NA     NA     NA     NA     NA     NA     NA
    ## MI1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                GB1854 GB1873 GB1875 HI1859 HI1897 IA1839 IA1851 IA1859
    ## AK1900         0.0002 0.0002 0.0002 0.0011 0.0020 0.0003 0.0040 0.0043
    ## AL1852         0.0001 0.0001 0.0001 0.0003 0.0008 0.0005 0.0011 0.0011
    ## AR1868         0.0002 0.0001 0.0003 0.0022 0.0023 0.0006 0.0021 0.0266
    ## AR1874         0.0002 0.0001 0.0002 0.0051 0.0034 0.0006 0.0026 0.0212
    ## AZ1865         0.0003 0.0001 0.0003 0.0088 0.0073 0.0005 0.0067 0.0057
    ## AZ1887         0.0003 0.0002 0.0002 0.0019 0.0021 0.0006 0.0024 0.0023
    ## BI1859         0.0041 0.0004 0.0003 0.0001 0.0018 0.0004 0.0004 0.0006
    ## CA1850         0.0002 0.0001 0.0001 0.0058 0.0043 0.0006 0.0038 0.0053
    ## CA1851         0.0004 0.0002 0.0003 0.0100 0.0083 0.0004 0.0073 0.0062
    ## CA1858         0.0004 0.0002 0.0003 0.0075 0.0065 0.0005 0.0070 0.0064
    ## CA1868         0.0005 0.0002 0.0004 0.0064 0.0059 0.0004 0.0056 0.0056
    ## CA1868extended 0.0001 0.0000 0.0002 0.0015 0.0017 0.0001 0.0021 0.0026
    ## CA1872         0.0002 0.0002 0.0004 0.0036 0.0042 0.0003 0.0074 0.0067
    ## CO1868         0.0005 0.0002 0.0002 0.0003 0.0026 0.0306 0.0018 0.0012
    ## CO1877         0.0004 0.0001 0.0004 0.0068 0.0057 0.0005 0.0063 0.0062
    ## CT1854         0.0003 0.0002 0.0001 0.0009 0.0014 0.0005 0.0005 0.0005
    ## CT1879         0.0001 0.0004 0.0004 0.0010 0.0008 0.0002 0.0001 0.0001
    ## CT1879extended 0.0001 0.0002 0.0005 0.0002 0.0004 0.0002 0.0003 0.0004
    ## DC1857         0.0003 0.0003 0.0004 0.0038 0.0050 0.0009 0.0063 0.0132
    ## DE1852         0.0001 0.0001 0.0002 0.0004 0.0016 0.0005 0.0007 0.0004
    ## DT1862         0.0004 0.0002 0.0003 0.0047 0.0046 0.0011 0.0134 0.0234
    ## DT1868         0.0002 0.0002 0.0003 0.0051 0.0055 0.0005 0.0037 0.0050
    ## DT1887         0.0002 0.0001 0.0003 0.0013 0.0023 0.0004 0.0038 0.0048
    ## FL1847         0.0003 0.0003 0.0002 0.0005 0.0039 0.0013 0.0012 0.0009
    ## FL1870         0.0003 0.0002 0.0004 0.0065 0.0061 0.0005 0.0047 0.0068
    ## FL1892         0.0039 0.0002 0.0004 0.0006 0.0056 0.0010 0.0008 0.0013
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0003 0.0004 0.0002 0.0002 0.0006 0.0006 0.0007 0.0004
    ## GA1860         0.0002 0.0001 0.0002 0.0002 0.0006 0.0005 0.0010 0.0006
    ## GB1852         0.0179 0.0019 0.0053 0.0002 0.0154 0.0003 0.0002 0.0014
    ## GB1854             NA 0.0024 0.0023 0.0002 0.0220 0.0002 0.0003 0.0020
    ## GB1873             NA     NA 0.0085 0.0002 0.0006 0.0001 0.0001 0.0001
    ## GB1875             NA     NA     NA 0.0001 0.0006 0.0001 0.0001 0.0002
    ## HI1859             NA     NA     NA     NA 0.1345 0.0003 0.0015 0.0007
    ## HI1897             NA     NA     NA     NA     NA 0.0005 0.0014 0.0013
    ## IA1839             NA     NA     NA     NA     NA     NA 0.0008 0.0004
    ## IA1851             NA     NA     NA     NA     NA     NA     NA 0.1123
    ## IA1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1864             NA     NA     NA     NA     NA     NA     NA     NA
    ## ID1881             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## IL1933             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1843             NA     NA     NA     NA     NA     NA     NA     NA
    ## IN1852             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## KS1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825french       NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867             NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867french       NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1836             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ME1840             NA     NA     NA     NA     NA     NA     NA     NA
    ## MI1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                ID1864 ID1881 IL1866 IL1933 IN1843 IN1852 KS1859 KS1868
    ## AK1900         0.0304 0.0268 0.0013 0.0011 0.0024 0.0082 0.0122 0.0121
    ## AL1852         0.0017 0.0022 0.0016 0.0006 0.0020 0.0017 0.0017 0.0016
    ## AR1868         0.0085 0.0100 0.0013 0.0011 0.0016 0.0178 0.0519 0.0396
    ## AR1874         0.0085 0.0099 0.0010 0.0016 0.0008 0.0196 0.0588 0.0363
    ## AZ1865         0.2102 0.1149 0.0015 0.0016 0.0015 0.0113 0.0239 0.0226
    ## AZ1887         0.0131 0.0103 0.0015 0.0013 0.0017 0.0059 0.0067 0.0057
    ## BI1859         0.0005 0.0004 0.0009 0.0006 0.0006 0.0006 0.0006 0.0006
    ## CA1850         0.0400 0.0263 0.0011 0.0031 0.0010 0.0144 0.0312 0.0210
    ## CA1851         0.2137 0.1158 0.0015 0.0018 0.0016 0.0128 0.0265 0.0245
    ## CA1858         0.2485 0.1233 0.0016 0.0018 0.0018 0.0130 0.0259 0.0248
    ## CA1868         0.1719 0.1035 0.0016 0.0017 0.0018 0.0100 0.0195 0.0193
    ## CA1868extended 0.0562 0.0432 0.0006 0.0005 0.0010 0.0039 0.0062 0.0074
    ## CA1872         0.0872 0.2286 0.0015 0.0012 0.0020 0.0116 0.0192 0.0206
    ## CO1868         0.0016 0.0012 0.1602 0.0064 0.0059 0.0021 0.0019 0.0020
    ## CO1877         0.1083 0.0671 0.0078 0.0019 0.0014 0.0141 0.0228 0.0191
    ## CT1854         0.0010 0.0007 0.0019 0.0007 0.0011 0.0008 0.0019 0.0017
    ## CT1879         0.0004 0.0004 0.0001 0.0045 0.0001 0.0003 0.0012 0.0008
    ## CT1879extended 0.0008 0.0007 0.0004 0.0020 0.0004 0.0009 0.0011 0.0010
    ## DC1857         0.0358 0.0287 0.0020 0.0018 0.0133 0.0659 0.0587 0.0523
    ## DE1852         0.0005 0.0005 0.0011 0.0004 0.0019 0.0011 0.0008 0.0009
    ## DT1862         0.0161 0.0185 0.0018 0.0024 0.0023 0.0184 0.4037 0.2246
    ## DT1868         0.0324 0.0303 0.0011 0.0024 0.0013 0.0146 0.0261 0.0196
    ## DT1887         0.0260 0.0446 0.0011 0.0012 0.0018 0.0082 0.0198 0.0195
    ## FL1847         0.0011 0.0009 0.0065 0.0008 0.0067 0.0026 0.0018 0.0023
    ## FL1870         0.0408 0.0342 0.0010 0.0027 0.0018 0.0176 0.0321 0.0246
    ## FL1892         0.0018 0.0038 0.0032 0.0008 0.0046 0.0024 0.0021 0.0022
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0005 0.0004 0.0030 0.0006 0.0016 0.0011 0.0009 0.0011
    ## GA1860         0.0009 0.0008 0.0020 0.0006 0.0018 0.0012 0.0014 0.0014
    ## GB1852         0.0005 0.0002 0.0011 0.0005 0.0005 0.0005 0.0006 0.0005
    ## GB1854         0.0003 0.0001 0.0003 0.0007 0.0003 0.0002 0.0003 0.0004
    ## GB1873         0.0002 0.0000 0.0002 0.0002 0.0002 0.0002 0.0002 0.0002
    ## GB1875         0.0004 0.0002 0.0003 0.0008 0.0002 0.0003 0.0002 0.0003
    ## HI1859         0.0047 0.0038 0.0003 0.0002 0.0009 0.0016 0.0038 0.0026
    ## HI1897         0.0045 0.0042 0.0015 0.0008 0.0017 0.0021 0.0040 0.0033
    ## IA1839         0.0004 0.0003 0.0329 0.0051 0.0010 0.0006 0.0014 0.0012
    ## IA1851         0.0050 0.0066 0.0014 0.0009 0.0015 0.0086 0.0048 0.0072
    ## IA1859         0.0048 0.0061 0.0009 0.0006 0.0018 0.0095 0.0197 0.0168
    ## ID1864             NA 0.0797 0.0014 0.0014 0.0016 0.0096 0.0175 0.0172
    ## ID1881             NA     NA 0.0010 0.0010 0.0013 0.0093 0.0178 0.0179
    ## IL1866             NA     NA     NA 0.0061 0.0035 0.0022 0.0017 0.0020
    ## IL1933             NA     NA     NA     NA 0.0007 0.0019 0.0026 0.0019
    ## IN1843             NA     NA     NA     NA     NA 0.0180 0.0022 0.0074
    ## IN1852             NA     NA     NA     NA     NA     NA 0.0190 0.0255
    ## KS1859             NA     NA     NA     NA     NA     NA     NA 0.2678
    ## KS1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## KY1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825             NA     NA     NA     NA     NA     NA     NA     NA
    ## LA1825french       NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867             NA     NA     NA     NA     NA     NA     NA     NA
    ## LC1867french       NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1836             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MA1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## MD1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## ME1840             NA     NA     NA     NA     NA     NA     NA     NA
    ## MI1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                KY1851 KY1854 LA1825 LA1825french LC1867 LC1867french
    ## AK1900         0.0087 0.0075  0e+00            0  3e-04            0
    ## AL1852         0.0012 0.0013  1e-04            0  3e-04            0
    ## AR1868         0.2230 0.2963  0e+00            0  3e-04            0
    ## AR1874         0.1649 0.1479  0e+00            0  2e-04            0
    ## AZ1865         0.0134 0.0114  1e-04            0  3e-04            0
    ## AZ1887         0.0054 0.0051  1e-04            0  2e-04            0
    ## BI1859         0.0006 0.0006  0e+00            0  2e-04            0
    ## CA1850         0.0157 0.0127  4e-04            0  2e-04            0
    ## CA1851         0.0150 0.0126  1e-04            0  3e-04            0
    ## CA1858         0.0139 0.0119  1e-04            0  4e-04            0
    ## CA1868         0.0103 0.0092  1e-04            0  5e-04            0
    ## CA1868extended 0.0035 0.0032  0e+00            0  2e-04            0
    ## CA1872         0.0148 0.0129  1e-04            0  3e-04            0
    ## CO1868         0.0012 0.0013  1e-04            0  3e-04            0
    ## CO1877         0.0146 0.0123  1e-04            0  2e-04            0
    ## CT1854         0.0009 0.0008  0e+00            0  1e-04            0
    ## CT1879         0.0005 0.0003  0e+00            0  0e+00            0
    ## CT1879extended 0.0007 0.0008  0e+00            0  1e-04            0
    ## DC1857         0.0310 0.0273  1e-04            0  3e-04            0
    ## DE1852         0.0005 0.0006  0e+00            0  3e-04            0
    ## DT1862         0.0793 0.0651  0e+00            0  3e-04            0
    ## DT1868         0.0131 0.0098  0e+00            0  3e-04            0
    ## DT1887         0.0084 0.0073  0e+00            0  3e-04            0
    ## FL1847         0.0011 0.0012  1e-04            0  3e-04            0
    ## FL1870         0.0157 0.0126  1e-04            0  3e-04            0
    ## FL1892         0.0016 0.0011  1e-04            0  3e-04            0
    ## FR1806         0.0000 0.0000  0e+00            0  0e+00            0
    ## GA1851         0.0006 0.0006  1e-04            0  2e-04            0
    ## GA1860         0.0007 0.0009  1e-04            0  3e-04            0
    ## GB1852         0.0004 0.0003  0e+00            0  2e-04            0
    ## GB1854         0.0002 0.0002  0e+00            0  2e-04            0
    ## GB1873         0.0001 0.0001  0e+00            0  1e-04            0
    ## GB1875         0.0002 0.0002  0e+00            0  1e-04            0
    ## HI1859         0.0035 0.0026  0e+00            0  1e-04            0
    ## HI1897         0.0032 0.0024  0e+00            0  3e-04            0
    ## IA1839         0.0006 0.0006  0e+00            0  1e-04            0
    ## IA1851         0.0026 0.0024  1e-04            0  3e-04            0
    ## IA1859         0.0276 0.0295  0e+00            0  3e-04            0
    ## ID1864         0.0095 0.0085  1e-04            0  3e-04            0
    ## ID1881         0.0132 0.0109  0e+00            0  4e-04            0
    ## IL1866         0.0012 0.0012  1e-04            0  3e-04            0
    ## IL1933         0.0012 0.0013  0e+00            0  1e-04            0
    ## IN1843         0.0011 0.0014  1e-04            0  2e-04            0
    ## IN1852         0.0210 0.0188  0e+00            0  3e-04            0
    ## KS1859         0.0744 0.0618  0e+00            0  3e-04            0
    ## KS1868         0.0518 0.0454  1e-04            0  4e-04            0
    ## KY1851             NA 0.3550  0e+00            0  3e-04            0
    ## KY1854             NA     NA  0e+00            0  3e-04            0
    ## LA1825             NA     NA     NA            0  0e+00            0
    ## LA1825french       NA     NA     NA           NA  0e+00            0
    ## LC1867             NA     NA     NA           NA     NA            0
    ## LC1867french       NA     NA     NA           NA     NA           NA
    ## MA1836             NA     NA     NA           NA     NA           NA
    ## MA1851             NA     NA     NA           NA     NA           NA
    ## MA1858             NA     NA     NA           NA     NA           NA
    ## MD1855             NA     NA     NA           NA     NA           NA
    ## MD1859             NA     NA     NA           NA     NA           NA
    ## ME1840             NA     NA     NA           NA     NA           NA
    ## MI1853             NA     NA     NA           NA     NA           NA
    ## MN1851             NA     NA     NA           NA     NA           NA
    ## MN1859             NA     NA     NA           NA     NA           NA
    ## MO1835             NA     NA     NA           NA     NA           NA
    ## MO1849             NA     NA     NA           NA     NA           NA
    ## MO1856             NA     NA     NA           NA     NA           NA
    ## MO1879             NA     NA     NA           NA     NA           NA
    ## MS1848             NA     NA     NA           NA     NA           NA
    ## MS1850             NA     NA     NA           NA     NA           NA
    ## MS1857             NA     NA     NA           NA     NA           NA
    ## MT1865             NA     NA     NA           NA     NA           NA
    ## MT1895             NA     NA     NA           NA     NA           NA
    ## NC1868             NA     NA     NA           NA     NA           NA
    ## ND1877             NA     NA     NA           NA     NA           NA
    ## ND1877extended     NA     NA     NA           NA     NA           NA
    ## NE1857             NA     NA     NA           NA     NA           NA
    ## NE1859             NA     NA     NA           NA     NA           NA
    ## NE1866             NA     NA     NA           NA     NA           NA
    ## NH1842             NA     NA     NA           NA     NA           NA
    ## NJ1847             NA     NA     NA           NA     NA           NA
    ## NM1865             NA     NA     NA           NA     NA           NA
    ## NM1897             NA     NA     NA           NA     NA           NA
    ## NV1861             NA     NA     NA           NA     NA           NA
    ## NV1869             NA     NA     NA           NA     NA           NA
    ## NY1848             NA     NA     NA           NA     NA           NA
    ## NY1849             NA     NA     NA           NA     NA           NA
    ## NY1850             NA     NA     NA           NA     NA           NA
    ## NY1851             NA     NA     NA           NA     NA           NA
    ## NY1853             NA     NA     NA           NA     NA           NA
    ## NY1876             NA     NA     NA           NA     NA           NA
    ## NY1879             NA     NA     NA           NA     NA           NA
    ## OH1853             NA     NA     NA           NA     NA           NA
    ## OH1853extended     NA     NA     NA           NA     NA           NA
    ## OH1879             NA     NA     NA           NA     NA           NA
    ## OK1891             NA     NA     NA           NA     NA           NA
    ## OK1893             NA     NA     NA           NA     NA           NA
    ## OR1854             NA     NA     NA           NA     NA           NA
    ## OR1862             NA     NA     NA           NA     NA           NA
    ## SC1870             NA     NA     NA           NA     NA           NA
    ## TN1858             NA     NA     NA           NA     NA           NA
    ## UT1853             NA     NA     NA           NA     NA           NA
    ## UT1859             NA     NA     NA           NA     NA           NA
    ## UT1870             NA     NA     NA           NA     NA           NA
    ## UT1884             NA     NA     NA           NA     NA           NA
    ## VA1841             NA     NA     NA           NA     NA           NA
    ## VA1860             NA     NA     NA           NA     NA           NA
    ## WA1855             NA     NA     NA           NA     NA           NA
    ## WA1873             NA     NA     NA           NA     NA           NA
    ## WI1849             NA     NA     NA           NA     NA           NA
    ## WI1856             NA     NA     NA           NA     NA           NA
    ## WI1858             NA     NA     NA           NA     NA           NA
    ## WOOD1857           NA     NA     NA           NA     NA           NA
    ## WV1868             NA     NA     NA           NA     NA           NA
    ## WY1870             NA     NA     NA           NA     NA           NA
    ## WY1886             NA     NA     NA           NA     NA           NA
    ##                MA1836 MA1851 MA1858 MD1855 MD1859 ME1840 MI1853 MN1851
    ## AK1900         0.0019 0.0002 0.0018 0.0002 0.0002 0.0014 0.0007 0.0277
    ## AL1852         0.0009 0.0002 0.0008 0.0003 0.0006 0.0009 0.0004 0.0024
    ## AR1868         0.0010 0.0002 0.0010 0.0002 0.0006 0.0008 0.0005 0.0065
    ## AR1874         0.0006 0.0001 0.0006 0.0003 0.0006 0.0006 0.0003 0.0067
    ## AZ1865         0.0010 0.0002 0.0011 0.0002 0.0006 0.0009 0.0015 0.0432
    ## AZ1887         0.0010 0.0002 0.0014 0.0002 0.0008 0.0013 0.0007 0.0038
    ## BI1859         0.0006 0.0002 0.0006 0.0002 0.0004 0.0005 0.0004 0.0004
    ## CA1850         0.0014 0.0003 0.0012 0.0005 0.0008 0.0007 0.0023 0.0243
    ## CA1851         0.0011 0.0002 0.0012 0.0002 0.0006 0.0009 0.0017 0.0437
    ## CA1858         0.0012 0.0002 0.0012 0.0002 0.0006 0.0009 0.0015 0.0424
    ## CA1868         0.0011 0.0002 0.0012 0.0002 0.0006 0.0009 0.0012 0.0315
    ## CA1868extended 0.0007 0.0000 0.0007 0.0001 0.0002 0.0005 0.0004 0.0132
    ## CA1872         0.0018 0.0003 0.0019 0.0001 0.0004 0.0013 0.0007 0.0382
    ## CO1868         0.0048 0.0003 0.0026 0.0004 0.0010 0.0044 0.0007 0.0019
    ## CO1877         0.0008 0.0002 0.0009 0.0003 0.0007 0.0008 0.0012 0.0239
    ## CT1854         0.0013 0.0003 0.0011 0.0001 0.0008 0.0015 0.0003 0.0009
    ## CT1879         0.0001 0.0000 0.0001 0.0001 0.0001 0.0001 0.0000 0.0003
    ## CT1879extended 0.0003 0.0002 0.0004 0.0005 0.0005 0.0003 0.0001 0.0006
    ## DC1857         0.0044 0.0004 0.0033 0.0004 0.0003 0.0024 0.0009 0.0191
    ## DE1852         0.0053 0.0001 0.0036 0.0002 0.0006 0.0030 0.0003 0.0012
    ## DT1862         0.0013 0.0005 0.0014 0.0005 0.0009 0.0015 0.0011 0.0155
    ## DT1868         0.0010 0.0003 0.0010 0.0002 0.0004 0.0010 0.0018 0.0357
    ## DT1887         0.0011 0.0002 0.0013 0.0002 0.0002 0.0011 0.0008 0.0213
    ## FL1847         0.0099 0.0004 0.0072 0.0004 0.0009 0.0041 0.0007 0.0053
    ## FL1870         0.0012 0.0004 0.0012 0.0002 0.0005 0.0012 0.0020 0.0421
    ## FL1892         0.0046 0.0003 0.0041 0.0109 0.0046 0.0024 0.0007 0.0028
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0008 0.0001 0.0008 0.0002 0.0007 0.0009 0.0003 0.0006
    ## GA1860         0.0008 0.0001 0.0009 0.0003 0.0010 0.0010 0.0004 0.0007
    ## GB1852         0.0005 0.0002 0.0004 0.0555 0.0141 0.0003 0.0003 0.0004
    ## GB1854         0.0003 0.0005 0.0003 0.0002 0.0004 0.0003 0.0002 0.0001
    ## GB1873         0.0002 0.0002 0.0002 0.0000 0.0002 0.0001 0.0001 0.0001
    ## GB1875         0.0002 0.0001 0.0002 0.0003 0.0001 0.0001 0.0002 0.0003
    ## HI1859         0.0013 0.0000 0.0012 0.0001 0.0001 0.0026 0.0003 0.0020
    ## HI1897         0.0089 0.0004 0.0065 0.0004 0.0005 0.0121 0.0006 0.0037
    ## IA1839         0.0003 0.0001 0.0002 0.0000 0.0006 0.0005 0.0005 0.0020
    ## IA1851         0.0013 0.0002 0.0013 0.0002 0.0004 0.0013 0.0004 0.0055
    ## IA1859         0.0009 0.0011 0.0015 0.0018 0.0003 0.0008 0.0002 0.0045
    ## ID1864         0.0009 0.0002 0.0010 0.0003 0.0004 0.0008 0.0011 0.0302
    ## ID1881         0.0013 0.0001 0.0012 0.0002 0.0002 0.0009 0.0006 0.0347
    ## IL1866         0.0025 0.0002 0.0019 0.0004 0.0011 0.0015 0.0007 0.0018
    ## IL1933         0.0004 0.0003 0.0006 0.0003 0.0004 0.0006 0.0027 0.0010
    ## IN1843         0.0095 0.0003 0.0063 0.0003 0.0006 0.0070 0.0010 0.0045
    ## IN1852         0.0026 0.0007 0.0028 0.0003 0.0007 0.0025 0.0006 0.0090
    ## KS1859         0.0013 0.0005 0.0015 0.0004 0.0009 0.0013 0.0011 0.0157
    ## KS1868         0.0016 0.0003 0.0017 0.0004 0.0008 0.0015 0.0009 0.0141
    ## KY1851         0.0011 0.0002 0.0010 0.0002 0.0006 0.0008 0.0004 0.0085
    ## KY1854         0.0011 0.0003 0.0011 0.0001 0.0007 0.0009 0.0004 0.0069
    ## LA1825         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0001
    ## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0003 0.0001 0.0003 0.0001 0.0001 0.0003 0.0002 0.0003
    ## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836             NA 0.0015 0.1875 0.0002 0.0003 0.0602 0.0008 0.0114
    ## MA1851             NA     NA 0.0201 0.0011 0.0014 0.0004 0.0001 0.0002
    ## MA1858             NA     NA     NA 0.0005 0.0007 0.0390 0.0007 0.0073
    ## MD1855             NA     NA     NA     NA 0.0845 0.0002 0.0000 0.0001
    ## MD1859             NA     NA     NA     NA     NA 0.0006 0.0004 0.0003
    ## ME1840             NA     NA     NA     NA     NA     NA 0.0004 0.0033
    ## MI1853             NA     NA     NA     NA     NA     NA     NA 0.0010
    ## MN1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## MN1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1835             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## MO1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                MN1859 MO1835 MO1849 MO1856 MO1879 MS1848 MS1850 MS1857
    ## AK1900         0.0431 0.0006 0.0088 0.0083 0.0070 0.0008 0.0047 0.0015
    ## AL1852         0.0034 0.0006 0.0009 0.0010 0.0011 0.0020 0.0000 0.0021
    ## AR1868         0.0102 0.0009 0.0097 0.0089 0.0069 0.0015 0.0053 0.0035
    ## AR1874         0.0100 0.0033 0.0149 0.0144 0.0128 0.0006 0.0090 0.0035
    ## AZ1865         0.0680 0.0008 0.0208 0.0141 0.0106 0.0009 0.0090 0.0022
    ## AZ1887         0.0066 0.0025 0.0050 0.0051 0.0044 0.0025 0.0032 0.0031
    ## BI1859         0.0006 0.0008 0.0006 0.0007 0.0006 0.0006 0.0001 0.0007
    ## CA1850         0.0382 0.0010 0.0437 0.0278 0.0192 0.0007 0.0355 0.0032
    ## CA1851         0.0712 0.0008 0.0226 0.0153 0.0120 0.0009 0.0105 0.0022
    ## CA1858         0.0697 0.0009 0.0212 0.0150 0.0116 0.0010 0.0090 0.0024
    ## CA1868         0.0504 0.0006 0.0152 0.0113 0.0087 0.0013 0.0054 0.0022
    ## CA1868extended 0.0209 0.0002 0.0038 0.0030 0.0024 0.0006 0.0012 0.0008
    ## CA1872         0.0578 0.0005 0.0108 0.0082 0.0064 0.0012 0.0035 0.0020
    ## CO1868         0.0029 0.0048 0.0016 0.0026 0.0020 0.0082 0.0002 0.0032
    ## CO1877         0.0378 0.0010 0.0202 0.0155 0.0117 0.0013 0.0070 0.0023
    ## CT1854         0.0013 0.0009 0.0012 0.0013 0.0015 0.0013 0.0001 0.0011
    ## CT1879         0.0005 0.0000 0.0004 0.0023 0.0018 0.0001 0.0054 0.0000
    ## CT1879extended 0.0010 0.0001 0.0006 0.0015 0.0011 0.0003 0.0006 0.0003
    ## DC1857         0.0326 0.0013 0.0148 0.0135 0.0102 0.0015 0.0085 0.0027
    ## DE1852         0.0018 0.0005 0.0004 0.0006 0.0005 0.0009 0.0001 0.0014
    ## DT1862         0.0227 0.0010 0.0168 0.0162 0.0118 0.0017 0.0080 0.0048
    ## DT1868         0.0581 0.0006 0.0307 0.0190 0.0127 0.0008 0.0139 0.0018
    ## DT1887         0.0339 0.0004 0.0080 0.0058 0.0044 0.0010 0.0028 0.0014
    ## FL1847         0.0079 0.0011 0.0008 0.0010 0.0015 0.0212 0.0002 0.0037
    ## FL1870         0.0665 0.0008 0.0349 0.0262 0.0184 0.0010 0.0184 0.0025
    ## FL1892         0.0044 0.0010 0.0010 0.0012 0.0014 0.0053 0.0001 0.0040
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0011 0.0004 0.0003 0.0005 0.0006 0.0051 0.0001 0.0016
    ## GA1860         0.0012 0.0006 0.0003 0.0006 0.0008 0.0025 0.0000 0.0019
    ## GB1852         0.0005 0.0008 0.0003 0.0004 0.0004 0.0007 0.0001 0.0039
    ## GB1854         0.0003 0.0001 0.0001 0.0002 0.0003 0.0004 0.0002 0.0004
    ## GB1873         0.0002 0.0001 0.0002 0.0002 0.0002 0.0005 0.0000 0.0003
    ## GB1875         0.0004 0.0002 0.0001 0.0002 0.0002 0.0002 0.0000 0.0003
    ## HI1859         0.0033 0.0002 0.0046 0.0039 0.0025 0.0002 0.0021 0.0002
    ## HI1897         0.0058 0.0008 0.0034 0.0031 0.0024 0.0011 0.0008 0.0013
    ## IA1839         0.0009 0.0019 0.0004 0.0012 0.0009 0.0010 0.0005 0.0014
    ## IA1851         0.0085 0.0009 0.0029 0.0020 0.0021 0.0009 0.0002 0.0013
    ## IA1859         0.0068 0.0008 0.0041 0.0058 0.0051 0.0007 0.0019 0.0019
    ## ID1864         0.0486 0.0006 0.0152 0.0101 0.0078 0.0011 0.0053 0.0017
    ## ID1881         0.0519 0.0004 0.0106 0.0080 0.0063 0.0008 0.0037 0.0016
    ## IL1866         0.0028 0.0047 0.0018 0.0029 0.0024 0.0106 0.0003 0.0036
    ## IL1933         0.0016 0.0010 0.0029 0.0035 0.0020 0.0007 0.0006 0.0010
    ## IN1843         0.0068 0.0041 0.0007 0.0030 0.0025 0.0034 0.0000 0.0030
    ## IN1852         0.0155 0.0010 0.0097 0.0066 0.0056 0.0017 0.0028 0.0023
    ## KS1859         0.0231 0.0012 0.0163 0.0159 0.0130 0.0016 0.0061 0.0045
    ## KS1868         0.0205 0.0011 0.0107 0.0109 0.0094 0.0019 0.0044 0.0045
    ## KY1851         0.0128 0.0008 0.0149 0.0121 0.0091 0.0012 0.0073 0.0035
    ## KY1854         0.0106 0.0009 0.0114 0.0102 0.0081 0.0012 0.0061 0.0036
    ## LA1825         0.0001 0.0000 0.0000 0.0000 0.0001 0.0001 0.0000 0.0000
    ## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0004 0.0002 0.0003 0.0003 0.0002 0.0003 0.0000 0.0003
    ## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836         0.0160 0.0008 0.0005 0.0007 0.0013 0.0013 0.0001 0.0013
    ## MA1851         0.0003 0.0003 0.0005 0.0092 0.0037 0.0002 0.0000 0.0003
    ## MA1858         0.0108 0.0006 0.0006 0.0034 0.0019 0.0013 0.0001 0.0013
    ## MD1855         0.0002 0.0005 0.0003 0.0002 0.0003 0.0003 0.0003 0.0023
    ## MD1859         0.0003 0.0006 0.0006 0.0010 0.0007 0.0008 0.0001 0.0014
    ## ME1840         0.0056 0.0007 0.0005 0.0008 0.0008 0.0013 0.0001 0.0013
    ## MI1853         0.0012 0.0011 0.0016 0.0022 0.0011 0.0005 0.0006 0.0007
    ## MN1851         0.2346 0.0015 0.0103 0.0078 0.0063 0.0012 0.0051 0.0016
    ## MN1859             NA 0.0020 0.0153 0.0116 0.0094 0.0017 0.0089 0.0025
    ## MO1835             NA     NA 0.0091 0.1058 0.0605 0.0009 0.0002 0.0015
    ## MO1849             NA     NA     NA 0.0867 0.0415 0.0007 0.0176 0.0022
    ## MO1856             NA     NA     NA     NA 0.1818 0.0012 0.0158 0.0028
    ## MO1879             NA     NA     NA     NA     NA 0.0015 0.0111 0.0026
    ## MS1848             NA     NA     NA     NA     NA     NA 0.0002 0.0277
    ## MS1850             NA     NA     NA     NA     NA     NA     NA 0.0020
    ## MS1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## MT1895             NA     NA     NA     NA     NA     NA     NA     NA
    ## NC1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877             NA     NA     NA     NA     NA     NA     NA     NA
    ## ND1877extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1857             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## NE1866             NA     NA     NA     NA     NA     NA     NA     NA
    ## NH1842             NA     NA     NA     NA     NA     NA     NA     NA
    ## NJ1847             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1865             NA     NA     NA     NA     NA     NA     NA     NA
    ## NM1897             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1861             NA     NA     NA     NA     NA     NA     NA     NA
    ## NV1869             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                MT1865 MT1895 NC1868 ND1877 ND1877extended NE1857 NE1859
    ## AK1900         0.0292 0.0278 0.0239 0.0254         0.0253 0.0039 0.0116
    ## AL1852         0.0022 0.0020 0.0025 0.0020         0.0020 0.0011 0.0015
    ## AR1868         0.0109 0.0095 0.0099 0.0112         0.0112 0.0017 0.0530
    ## AR1874         0.0109 0.0076 0.0105 0.0095         0.0095 0.0020 0.0578
    ## AZ1865         0.2108 0.0825 0.0512 0.0607         0.0606 0.0076 0.0220
    ## AZ1887         0.0143 0.1108 0.0078 0.1219         0.1217 0.0023 0.0066
    ## BI1859         0.0008 0.0005 0.0006 0.0005         0.0005 0.0004 0.0006
    ## CA1850         0.0417 0.0177 0.0794 0.0398         0.0396 0.0056 0.0309
    ## CA1851         0.2098 0.0838 0.0545 0.0628         0.0627 0.0082 0.0246
    ## CA1858         0.2346 0.0904 0.0544 0.0668         0.0667 0.0075 0.0243
    ## CA1868         0.1623 0.0800 0.0389 0.0547         0.0546 0.0060 0.0189
    ## CA1868extended 0.0505 0.0416 0.0137 0.0243         0.0243 0.0021 0.0059
    ## CA1872         0.0828 0.2920 0.0330 0.1703         0.1699 0.0071 0.0204
    ## CO1868         0.0022 0.0022 0.0015 0.0023         0.0023 0.0028 0.0021
    ## CO1877         0.1290 0.0524 0.0341 0.0322         0.0321 0.0062 0.0215
    ## CT1854         0.0017 0.0007 0.0013 0.0009         0.0008 0.0005 0.0011
    ## CT1879         0.0007 0.0002 0.0012 0.0007         0.0007 0.0001 0.0013
    ## CT1879extended 0.0010 0.0007 0.0013 0.0010         0.0010 0.0002 0.0011
    ## DC1857         0.0415 0.0247 0.0339 0.0339         0.0338 0.0104 0.0583
    ## DE1852         0.0008 0.0007 0.0009 0.0007         0.0007 0.0007 0.0008
    ## DT1862         0.0244 0.0143 0.0246 0.0390         0.0389 0.0201 0.5361
    ## DT1868         0.0332 0.0226 0.1673 0.1015         0.1012 0.0045 0.0250
    ## DT1887         0.0254 0.0800 0.0473 0.2100         0.2096 0.0065 0.0219
    ## FL1847         0.0015 0.0012 0.0015 0.0019         0.0019 0.0015 0.0019
    ## FL1870         0.0426 0.0252 0.2083 0.0974         0.0970 0.0055 0.0311
    ## FL1892         0.0020 0.0034 0.0047 0.0049         0.0049 0.0009 0.0021
    ## FR1806         0.0000 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
    ## GA1851         0.0009 0.0008 0.0010 0.0009         0.0009 0.0007 0.0009
    ## GA1860         0.0012 0.0011 0.0012 0.0011         0.0011 0.0010 0.0013
    ## GB1852         0.0006 0.0003 0.0004 0.0003         0.0003 0.0002 0.0005
    ## GB1854         0.0003 0.0002 0.0003 0.0003         0.0003 0.0003 0.0004
    ## GB1873         0.0002 0.0001 0.0001 0.0001         0.0001 0.0001 0.0002
    ## GB1875         0.0004 0.0004 0.0003 0.0004         0.0004 0.0001 0.0003
    ## HI1859         0.0050 0.0020 0.0039 0.0025         0.0025 0.0011 0.0040
    ## HI1897         0.0052 0.0027 0.0049 0.0037         0.0036 0.0010 0.0040
    ## IA1839         0.0010 0.0003 0.0004 0.0006         0.0006 0.0010 0.0011
    ## IA1851         0.0068 0.0063 0.0042 0.0061         0.0061 0.2855 0.0146
    ## IA1859         0.0062 0.0061 0.0061 0.0081         0.0081 0.0690 0.0236
    ## ID1864         0.2162 0.0609 0.0341 0.0448         0.0447 0.0055 0.0161
    ## ID1881         0.0772 0.1574 0.0307 0.0733         0.0731 0.0063 0.0186
    ## IL1866         0.0020 0.0022 0.0013 0.0020         0.0020 0.0014 0.0019
    ## IL1933         0.0019 0.0010 0.0025 0.0017         0.0017 0.0008 0.0027
    ## IN1843         0.0023 0.0021 0.0021 0.0023         0.0023 0.0026 0.0024
    ## IN1852         0.0116 0.0095 0.0166 0.0134         0.0133 0.0074 0.0188
    ## KS1859         0.0273 0.0140 0.0264 0.0360         0.0359 0.0098 0.4198
    ## KS1868         0.0245 0.0164 0.0215 0.0336         0.0335 0.0112 0.2396
    ## KY1851         0.0129 0.0114 0.0131 0.0142         0.0141 0.0021 0.0806
    ## KY1854         0.0111 0.0103 0.0105 0.0124         0.0123 0.0020 0.0673
    ## LA1825         0.0001 0.0001 0.0001 0.0000         0.0000 0.0001 0.0000
    ## LA1825french   0.0000 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
    ## LC1867         0.0004 0.0004 0.0004 0.0003         0.0003 0.0003 0.0003
    ## LC1867french   0.0000 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
    ## MA1836         0.0012 0.0018 0.0014 0.0018         0.0018 0.0013 0.0013
    ## MA1851         0.0003 0.0002 0.0003 0.0002         0.0002 0.0002 0.0004
    ## MA1858         0.0013 0.0020 0.0014 0.0020         0.0020 0.0014 0.0013
    ## MD1855         0.0003 0.0001 0.0002 0.0002         0.0002 0.0003 0.0004
    ## MD1859         0.0006 0.0004 0.0006 0.0003         0.0003 0.0004 0.0010
    ## ME1840         0.0010 0.0014 0.0014 0.0017         0.0017 0.0012 0.0014
    ## MI1853         0.0014 0.0005 0.0017 0.0010         0.0010 0.0005 0.0011
    ## MN1851         0.0297 0.0272 0.0344 0.0374         0.0373 0.0109 0.0157
    ## MN1859         0.0480 0.0404 0.0552 0.0597         0.0596 0.0174 0.0234
    ## MO1835         0.0010 0.0005 0.0008 0.0007         0.0007 0.0012 0.0011
    ## MO1849         0.0172 0.0075 0.0278 0.0136         0.0136 0.0038 0.0163
    ## MO1856         0.0138 0.0059 0.0197 0.0109         0.0109 0.0030 0.0147
    ## MO1879         0.0109 0.0047 0.0143 0.0080         0.0080 0.0030 0.0111
    ## MS1848         0.0015 0.0013 0.0012 0.0014         0.0014 0.0011 0.0016
    ## MS1850         0.0057 0.0018 0.0127 0.0061         0.0061 0.0003 0.0077
    ## MS1857         0.0026 0.0017 0.0027 0.0021         0.0021 0.0017 0.0051
    ## MT1865             NA 0.0586 0.0339 0.0436         0.0436 0.0073 0.0226
    ## MT1895             NA     NA 0.0238 0.1249         0.1247 0.0062 0.0149
    ## NC1868             NA     NA     NA 0.0862         0.0860 0.0046 0.0257
    ## ND1877             NA     NA     NA     NA         0.8611 0.0106 0.0389
    ## ND1877extended     NA     NA     NA     NA             NA 0.0106 0.0388
    ## NE1857             NA     NA     NA     NA             NA     NA 0.0209
    ## NE1859             NA     NA     NA     NA             NA     NA     NA
    ## NE1866             NA     NA     NA     NA             NA     NA     NA
    ## NH1842             NA     NA     NA     NA             NA     NA     NA
    ## NJ1847             NA     NA     NA     NA             NA     NA     NA
    ## NM1865             NA     NA     NA     NA             NA     NA     NA
    ## NM1897             NA     NA     NA     NA             NA     NA     NA
    ## NV1861             NA     NA     NA     NA             NA     NA     NA
    ## NV1869             NA     NA     NA     NA             NA     NA     NA
    ## NY1848             NA     NA     NA     NA             NA     NA     NA
    ## NY1849             NA     NA     NA     NA             NA     NA     NA
    ## NY1850             NA     NA     NA     NA             NA     NA     NA
    ## NY1851             NA     NA     NA     NA             NA     NA     NA
    ## NY1853             NA     NA     NA     NA             NA     NA     NA
    ## NY1876             NA     NA     NA     NA             NA     NA     NA
    ## NY1879             NA     NA     NA     NA             NA     NA     NA
    ## OH1853             NA     NA     NA     NA             NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA             NA     NA     NA
    ## OH1879             NA     NA     NA     NA             NA     NA     NA
    ## OK1891             NA     NA     NA     NA             NA     NA     NA
    ## OK1893             NA     NA     NA     NA             NA     NA     NA
    ## OR1854             NA     NA     NA     NA             NA     NA     NA
    ## OR1862             NA     NA     NA     NA             NA     NA     NA
    ## SC1870             NA     NA     NA     NA             NA     NA     NA
    ## TN1858             NA     NA     NA     NA             NA     NA     NA
    ## UT1853             NA     NA     NA     NA             NA     NA     NA
    ## UT1859             NA     NA     NA     NA             NA     NA     NA
    ## UT1870             NA     NA     NA     NA             NA     NA     NA
    ## UT1884             NA     NA     NA     NA             NA     NA     NA
    ## VA1841             NA     NA     NA     NA             NA     NA     NA
    ## VA1860             NA     NA     NA     NA             NA     NA     NA
    ## WA1855             NA     NA     NA     NA             NA     NA     NA
    ## WA1873             NA     NA     NA     NA             NA     NA     NA
    ## WI1849             NA     NA     NA     NA             NA     NA     NA
    ## WI1856             NA     NA     NA     NA             NA     NA     NA
    ## WI1858             NA     NA     NA     NA             NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA             NA     NA     NA
    ## WV1868             NA     NA     NA     NA             NA     NA     NA
    ## WY1870             NA     NA     NA     NA             NA     NA     NA
    ## WY1886             NA     NA     NA     NA             NA     NA     NA
    ##                NE1866 NH1842 NJ1847 NM1865 NM1897 NV1861 NV1869 NY1848
    ## AK1900         0.0098 0.0005 0.0006 0.0004 0.0111 0.0364 0.0346 0.0157
    ## AL1852         0.0014 0.0005 0.0008 0.0013 0.0017 0.0022 0.0021 0.0009
    ## AR1868         0.0349 0.0005 0.0007 0.0008 0.0100 0.0109 0.0105 0.0086
    ## AR1874         0.0316 0.0003 0.0004 0.0007 0.0126 0.0114 0.0109 0.0114
    ## AZ1865         0.0200 0.0005 0.0007 0.0010 0.0111 0.3313 0.3299 0.0454
    ## AZ1887         0.0050 0.0005 0.0009 0.0013 0.0073 0.0175 0.0179 0.0056
    ## BI1859         0.0006 0.0003 0.0007 0.0003 0.0006 0.0006 0.0007 0.0006
    ## CA1850         0.0172 0.0005 0.0007 0.0014 0.0123 0.0572 0.0543 0.0923
    ## CA1851         0.0210 0.0005 0.0008 0.0006 0.0122 0.3362 0.3243 0.0484
    ## CA1858         0.0217 0.0006 0.0009 0.0010 0.0124 0.3942 0.3606 0.0465
    ## CA1868         0.0165 0.0005 0.0009 0.0008 0.0102 0.2596 0.2632 0.0334
    ## CA1868extended 0.0065 0.0002 0.0003 0.0002 0.0037 0.0765 0.0767 0.0087
    ## CA1872         0.0165 0.0005 0.0007 0.0005 0.0099 0.1262 0.1251 0.0246
    ## CO1868         0.0047 0.0009 0.0074 0.0017 0.0052 0.0019 0.0017 0.0008
    ## CO1877         0.0145 0.0005 0.0010 0.0011 0.0122 0.1577 0.1530 0.0296
    ## CT1854         0.0012 0.0012 0.0008 0.0011 0.0011 0.0011 0.0012 0.0010
    ## CT1879         0.0007 0.0000 0.0001 0.0001 0.0012 0.0006 0.0006 0.0013
    ## CT1879extended 0.0009 0.0003 0.0002 0.0001 0.0012 0.0009 0.0009 0.0010
    ## DC1857         0.0398 0.0012 0.0009 0.0014 0.0129 0.0476 0.0460 0.0240
    ## DE1852         0.0009 0.0009 0.0009 0.0005 0.0012 0.0007 0.0007 0.0005
    ## DT1862         0.2508 0.0009 0.0015 0.0012 0.0193 0.0218 0.0216 0.0196
    ## DT1868         0.0145 0.0003 0.0006 0.0006 0.0168 0.0456 0.0441 0.0932
    ## DT1887         0.0178 0.0004 0.0007 0.0004 0.0076 0.0351 0.0347 0.0238
    ## FL1847         0.0024 0.0011 0.0022 0.0016 0.0035 0.0015 0.0011 0.0007
    ## FL1870         0.0187 0.0006 0.0007 0.0006 0.0210 0.0588 0.0581 0.1164
    ## FL1892         0.0020 0.0007 0.0018 0.0012 0.0035 0.0021 0.0020 0.0028
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0012 0.0007 0.0016 0.0008 0.0020 0.0006 0.0007 0.0003
    ## GA1860         0.0015 0.0007 0.0010 0.0008 0.0027 0.0012 0.0011 0.0004
    ## GB1852         0.0005 0.0002 0.0025 0.0002 0.0007 0.0005 0.0006 0.0003
    ## GB1854         0.0003 0.0002 0.0005 0.0003 0.0023 0.0004 0.0003 0.0001
    ## GB1873         0.0002 0.0003 0.0004 0.0001 0.0005 0.0002 0.0002 0.0001
    ## GB1875         0.0002 0.0001 0.0003 0.0001 0.0003 0.0004 0.0003 0.0002
    ## HI1859         0.0014 0.0001 0.0003 0.0002 0.0020 0.0073 0.0066 0.0043
    ## HI1897         0.0021 0.0009 0.0021 0.0005 0.0051 0.0066 0.0057 0.0042
    ## IA1839         0.0010 0.0005 0.0028 0.0011 0.0007 0.0006 0.0005 0.0002
    ## IA1851         0.0346 0.0006 0.0006 0.0007 0.0071 0.0067 0.0070 0.0031
    ## IA1859         0.0264 0.0004 0.0004 0.0005 0.0093 0.0063 0.0063 0.0046
    ## ID1864         0.0156 0.0004 0.0008 0.0007 0.0083 0.3075 0.2064 0.0293
    ## ID1881         0.0146 0.0004 0.0006 0.0004 0.0097 0.1149 0.1146 0.0242
    ## IL1866         0.0038 0.0011 0.0119 0.0017 0.0052 0.0015 0.0017 0.0009
    ## IL1933         0.0020 0.0003 0.0006 0.0006 0.0019 0.0016 0.0015 0.0027
    ## IN1843         0.0060 0.0011 0.0020 0.0007 0.0051 0.0021 0.0018 0.0007
    ## IN1852         0.0147 0.0010 0.0013 0.0048 0.0087 0.0121 0.0119 0.0109
    ## KS1859         0.2308 0.0008 0.0015 0.0009 0.0185 0.0235 0.0236 0.0201
    ## KS1868         0.2042 0.0009 0.0016 0.0009 0.0161 0.0227 0.0226 0.0137
    ## KY1851         0.0457 0.0005 0.0006 0.0006 0.0109 0.0125 0.0127 0.0133
    ## KY1854         0.0391 0.0005 0.0008 0.0007 0.0105 0.0113 0.0109 0.0103
    ## LA1825         0.0001 0.0001 0.0000 0.0000 0.0001 0.0001 0.0001 0.0000
    ## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0004 0.0002 0.0001 0.0001 0.0004 0.0004 0.0004 0.0002
    ## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836         0.0018 0.0029 0.0008 0.0006 0.0030 0.0012 0.0010 0.0008
    ## MA1851         0.0003 0.0002 0.0002 0.0001 0.0011 0.0002 0.0002 0.0003
    ## MA1858         0.0019 0.0024 0.0007 0.0005 0.0030 0.0012 0.0011 0.0007
    ## MD1855         0.0003 0.0001 0.0004 0.0002 0.0003 0.0003 0.0002 0.0002
    ## MD1859         0.0008 0.0003 0.0008 0.0008 0.0006 0.0005 0.0006 0.0003
    ## ME1840         0.0016 0.0047 0.0008 0.0007 0.0020 0.0011 0.0010 0.0007
    ## MI1853         0.0011 0.0002 0.0005 0.0003 0.0012 0.0013 0.0011 0.0019
    ## MN1851         0.0144 0.0007 0.0030 0.0004 0.0131 0.0401 0.0379 0.0269
    ## MN1859         0.0231 0.0011 0.0012 0.0010 0.0204 0.0666 0.0606 0.0418
    ## MO1835         0.0013 0.0004 0.0019 0.0011 0.0115 0.0008 0.0008 0.0006
    ## MO1849         0.0091 0.0003 0.0004 0.0010 0.0119 0.0193 0.0182 0.0535
    ## MO1856         0.0094 0.0004 0.0012 0.0012 0.0362 0.0139 0.0139 0.0256
    ## MO1879         0.0076 0.0004 0.0012 0.0018 0.0357 0.0108 0.0105 0.0181
    ## MS1848         0.0022 0.0008 0.0039 0.0015 0.0028 0.0012 0.0010 0.0006
    ## MS1850         0.0037 0.0001 0.0000 0.0010 0.0074 0.0076 0.0062 0.0188
    ## MS1857         0.0039 0.0011 0.0041 0.0015 0.0029 0.0023 0.0021 0.0020
    ## MT1865         0.0207 0.0005 0.0010 0.0012 0.0101 0.2692 0.2049 0.0278
    ## MT1895         0.0137 0.0005 0.0008 0.0004 0.0085 0.0847 0.0851 0.0167
    ## NC1868         0.0166 0.0006 0.0008 0.0006 0.0170 0.0476 0.0466 0.0765
    ## ND1877         0.0297 0.0005 0.0008 0.0007 0.0140 0.0610 0.0600 0.0423
    ## ND1877extended 0.0296 0.0005 0.0008 0.0007 0.0139 0.0609 0.0599 0.0421
    ## NE1857         0.0588 0.0005 0.0008 0.0009 0.0071 0.0072 0.0078 0.0037
    ## NE1859         0.2715 0.0009 0.0015 0.0013 0.0180 0.0219 0.0216 0.0208
    ## NE1866             NA 0.0008 0.0016 0.0008 0.0134 0.0204 0.0199 0.0115
    ## NH1842             NA     NA 0.0007 0.0004 0.0011 0.0006 0.0005 0.0003
    ## NJ1847             NA     NA     NA 0.0008 0.0013 0.0008 0.0009 0.0004
    ## NM1865             NA     NA     NA     NA 0.0700 0.0009 0.0008 0.0003
    ## NM1897             NA     NA     NA     NA     NA 0.0118 0.0116 0.0123
    ## NV1861             NA     NA     NA     NA     NA     NA 0.3287 0.0406
    ## NV1869             NA     NA     NA     NA     NA     NA     NA 0.0385
    ## NY1848             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1850             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1851             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1876             NA     NA     NA     NA     NA     NA     NA     NA
    ## NY1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                NY1849 NY1850 NY1851 NY1853 NY1876 NY1879 OH1853
    ## AK1900         0.0224 0.0500 0.0237 0.0441 0.0047 0.0039 0.0114
    ## AL1852         0.0017 0.0033 0.0023 0.0031 0.0009 0.0007 0.0017
    ## AR1868         0.0092 0.0120 0.0094 0.0106 0.0029 0.0024 0.0533
    ## AR1874         0.0107 0.0090 0.0113 0.0089 0.0023 0.0020 0.0570
    ## AZ1865         0.0563 0.0798 0.0557 0.0770 0.0063 0.0052 0.0221
    ## AZ1887         0.0063 0.0065 0.0069 0.0065 0.0018 0.0016 0.0063
    ## BI1859         0.0006 0.0004 0.0006 0.0004 0.0004 0.0003 0.0006
    ## CA1850         0.1105 0.0328 0.0933 0.0325 0.0064 0.0051 0.0313
    ## CA1851         0.0625 0.0828 0.0605 0.0799 0.0069 0.0057 0.0248
    ## CA1858         0.0590 0.0828 0.0586 0.0803 0.0069 0.0057 0.0242
    ## CA1868         0.0406 0.0593 0.0411 0.0567 0.0056 0.0048 0.0181
    ## CA1868extended 0.0130 0.0300 0.0132 0.0269 0.0032 0.0027 0.0057
    ## CA1872         0.0342 0.1166 0.0350 0.0835 0.0098 0.0078 0.0192
    ## CO1868         0.0011 0.0010 0.0010 0.0010 0.0007 0.0006 0.0021
    ## CO1877         0.0342 0.0406 0.0377 0.0391 0.0047 0.0038 0.0204
    ## CT1854         0.0009 0.0007 0.0010 0.0007 0.0004 0.0004 0.0019
    ## CT1879         0.0011 0.0004 0.0010 0.0004 0.0005 0.0004 0.0012
    ## CT1879extended 0.0010 0.0008 0.0010 0.0008 0.0008 0.0006 0.0011
    ## DC1857         0.0316 0.0325 0.0346 0.0316 0.0051 0.0042 0.0582
    ## DE1852         0.0005 0.0007 0.0008 0.0007 0.0004 0.0004 0.0008
    ## DT1862         0.0247 0.0229 0.0274 0.0216 0.0039 0.0031 0.4327
    ## DT1868         0.1517 0.0566 0.1707 0.0575 0.0116 0.0094 0.0256
    ## DT1887         0.0393 0.0348 0.0434 0.0341 0.0073 0.0059 0.0199
    ## FL1847         0.0008 0.0010 0.0008 0.0010 0.0007 0.0006 0.0021
    ## FL1870         0.1838 0.0654 0.2083 0.0668 0.0120 0.0098 0.0319
    ## FL1892         0.0063 0.0033 0.0054 0.0034 0.0020 0.0015 0.0021
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0004 0.0006 0.0004 0.0006 0.0005 0.0004 0.0011
    ## GA1860         0.0005 0.0008 0.0004 0.0008 0.0006 0.0005 0.0015
    ## GB1852         0.0004 0.0003 0.0004 0.0004 0.0002 0.0002 0.0006
    ## GB1854         0.0001 0.0002 0.0001 0.0002 0.0001 0.0001 0.0003
    ## GB1873         0.0003 0.0001 0.0002 0.0001 0.0001 0.0001 0.0002
    ## GB1875         0.0002 0.0004 0.0003 0.0004 0.0003 0.0003 0.0003
    ## HI1859         0.0041 0.0030 0.0050 0.0028 0.0006 0.0005 0.0042
    ## HI1897         0.0046 0.0036 0.0051 0.0033 0.0014 0.0010 0.0041
    ## IA1839         0.0003 0.0002 0.0002 0.0002 0.0001 0.0001 0.0014
    ## IA1851         0.0038 0.0094 0.0040 0.0085 0.0018 0.0014 0.0049
    ## IA1859         0.0055 0.0076 0.0059 0.0070 0.0018 0.0015 0.0203
    ## ID1864         0.0360 0.0529 0.0355 0.0508 0.0050 0.0042 0.0157
    ## ID1881         0.0312 0.0741 0.0325 0.0660 0.0085 0.0068 0.0182
    ## IL1866         0.0012 0.0011 0.0011 0.0012 0.0007 0.0007 0.0019
    ## IL1933         0.0024 0.0012 0.0024 0.0013 0.0011 0.0009 0.0025
    ## IN1843         0.0014 0.0027 0.0015 0.0027 0.0013 0.0010 0.0025
    ## IN1852         0.0144 0.0152 0.0159 0.0144 0.0028 0.0024 0.0180
    ## KS1859         0.0268 0.0228 0.0294 0.0225 0.0041 0.0032 0.4254
    ## KS1868         0.0197 0.0281 0.0221 0.0270 0.0041 0.0034 0.2428
    ## KY1851         0.0140 0.0149 0.0139 0.0133 0.0036 0.0029 0.0804
    ## KY1854         0.0101 0.0130 0.0106 0.0114 0.0031 0.0026 0.0663
    ## LA1825         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0002 0.0004 0.0002 0.0004 0.0003 0.0003 0.0003
    ## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836         0.0012 0.0017 0.0012 0.0017 0.0011 0.0010 0.0015
    ## MA1851         0.0002 0.0001 0.0003 0.0001 0.0000 0.0000 0.0005
    ## MA1858         0.0011 0.0018 0.0011 0.0018 0.0014 0.0012 0.0015
    ## MD1855         0.0003 0.0001 0.0003 0.0001 0.0001 0.0001 0.0004
    ## MD1859         0.0005 0.0002 0.0004 0.0003 0.0002 0.0002 0.0010
    ## ME1840         0.0010 0.0012 0.0009 0.0012 0.0008 0.0007 0.0014
    ## MI1853         0.0020 0.0010 0.0017 0.0009 0.0006 0.0004 0.0010
    ## MN1851         0.0401 0.0881 0.0390 0.0834 0.0061 0.0049 0.0155
    ## MN1859         0.0624 0.1434 0.0609 0.1342 0.0092 0.0077 0.0229
    ## MO1835         0.0006 0.0005 0.0006 0.0005 0.0007 0.0007 0.0013
    ## MO1849         0.0391 0.0126 0.0345 0.0119 0.0033 0.0025 0.0163
    ## MO1856         0.0217 0.0089 0.0216 0.0090 0.0030 0.0022 0.0153
    ## MO1879         0.0147 0.0068 0.0140 0.0069 0.0023 0.0018 0.0120
    ## MS1848         0.0008 0.0009 0.0007 0.0009 0.0007 0.0007 0.0017
    ## MS1850         0.0234 0.0043 0.0164 0.0042 0.0012 0.0009 0.0079
    ## MS1857         0.0021 0.0016 0.0022 0.0015 0.0012 0.0012 0.0048
    ## MT1865         0.0357 0.0524 0.0361 0.0515 0.0053 0.0042 0.0234
    ## MT1895         0.0228 0.0836 0.0240 0.0587 0.0206 0.0179 0.0137
    ## NC1868         0.1293 0.0567 0.1447 0.0559 0.0104 0.0083 0.0269
    ## ND1877         0.0708 0.0597 0.0795 0.0572 0.0115 0.0095 0.0355
    ## ND1877extended 0.0705 0.0596 0.0793 0.0571 0.0115 0.0095 0.0355
    ## NE1857         0.0043 0.0088 0.0054 0.0079 0.0017 0.0013 0.0093
    ## NE1859         0.0259 0.0238 0.0286 0.0224 0.0044 0.0036 0.4649
    ## NE1866         0.0162 0.0234 0.0167 0.0220 0.0038 0.0030 0.2319
    ## NH1842         0.0005 0.0005 0.0005 0.0006 0.0003 0.0003 0.0010
    ## NJ1847         0.0006 0.0007 0.0005 0.0007 0.0006 0.0005 0.0017
    ## NM1865         0.0003 0.0002 0.0003 0.0003 0.0002 0.0002 0.0009
    ## NM1897         0.0127 0.0123 0.0157 0.0121 0.0036 0.0030 0.0188
    ## NV1861         0.0502 0.0732 0.0503 0.0701 0.0066 0.0055 0.0211
    ## NV1869         0.0473 0.0709 0.0488 0.0684 0.0062 0.0052 0.0212
    ## NY1848         0.1644 0.0486 0.1366 0.0444 0.0079 0.0066 0.0206
    ## NY1849             NA 0.0715 0.2938 0.0683 0.0118 0.0094 0.0271
    ## NY1850             NA     NA 0.0727 0.4814 0.0143 0.0116 0.0233
    ## NY1851             NA     NA     NA 0.0737 0.0131 0.0103 0.0293
    ## NY1853             NA     NA     NA     NA 0.0140 0.0113 0.0226
    ## NY1876             NA     NA     NA     NA     NA 0.4375 0.0046
    ## NY1879             NA     NA     NA     NA     NA     NA 0.0037
    ## OH1853             NA     NA     NA     NA     NA     NA     NA
    ## OH1853extended     NA     NA     NA     NA     NA     NA     NA
    ## OH1879             NA     NA     NA     NA     NA     NA     NA
    ## OK1891             NA     NA     NA     NA     NA     NA     NA
    ## OK1893             NA     NA     NA     NA     NA     NA     NA
    ## OR1854             NA     NA     NA     NA     NA     NA     NA
    ## OR1862             NA     NA     NA     NA     NA     NA     NA
    ## SC1870             NA     NA     NA     NA     NA     NA     NA
    ## TN1858             NA     NA     NA     NA     NA     NA     NA
    ## UT1853             NA     NA     NA     NA     NA     NA     NA
    ## UT1859             NA     NA     NA     NA     NA     NA     NA
    ## UT1870             NA     NA     NA     NA     NA     NA     NA
    ## UT1884             NA     NA     NA     NA     NA     NA     NA
    ## VA1841             NA     NA     NA     NA     NA     NA     NA
    ## VA1860             NA     NA     NA     NA     NA     NA     NA
    ## WA1855             NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA
    ##                OH1853extended OH1879 OK1891 OK1893 OR1854 OR1862 SC1870
    ## AK1900                 0.0113 0.0058 0.0089 0.0118 0.0538 0.1952 0.0263
    ## AL1852                 0.0017 0.0014 0.0018 0.0016 0.0029 0.0020 0.0017
    ## AR1868                 0.0450 0.0176 0.0181 0.0366 0.0096 0.0092 0.0103
    ## AR1874                 0.0419 0.0124 0.0203 0.0332 0.0103 0.0073 0.0118
    ## AZ1865                 0.0248 0.0092 0.0212 0.0210 0.1076 0.0536 0.0534
    ## AZ1887                 0.0058 0.0045 0.0057 0.0057 0.0077 0.0067 0.0078
    ## BI1859                 0.0007 0.0004 0.0008 0.0007 0.0008 0.0005 0.0006
    ## CA1850                 0.0227 0.0068 0.0164 0.0185 0.0516 0.0293 0.0874
    ## CA1851                 0.0264 0.0097 0.0219 0.0227 0.1099 0.0549 0.0567
    ## CA1858                 0.0262 0.0102 0.0266 0.0227 0.1063 0.0550 0.0550
    ## CA1868                 0.0194 0.0082 0.0216 0.0177 0.0748 0.0407 0.0391
    ## CA1868extended         0.0073 0.0047 0.0083 0.0072 0.0253 0.0176 0.0122
    ## CA1872                 0.0203 0.0110 0.0285 0.0195 0.0553 0.0692 0.0350
    ## CO1868                 0.0021 0.0018 0.0024 0.0023 0.0034 0.0014 0.0012
    ## CO1877                 0.0164 0.0069 0.0175 0.0172 0.0479 0.0264 0.0363
    ## CT1854                 0.0017 0.0008 0.0008 0.0016 0.0013 0.0006 0.0010
    ## CT1879                 0.0009 0.0002 0.0004 0.0007 0.0007 0.0005 0.0017
    ## CT1879extended         0.0010 0.0007 0.0008 0.0010 0.0010 0.0009 0.0013
    ## DC1857                 0.0523 0.0196 0.0604 0.0473 0.0619 0.0268 0.0348
    ## DE1852                 0.0009 0.0009 0.0011 0.0009 0.0013 0.0006 0.0007
    ## DT1862                 0.3153 0.0681 0.0209 0.2092 0.0213 0.0156 0.0265
    ## DT1868                 0.0203 0.0071 0.0158 0.0181 0.0620 0.0346 0.2154
    ## DT1887                 0.0196 0.0096 0.0270 0.0192 0.0323 0.0218 0.0511
    ## FL1847                 0.0026 0.0021 0.0024 0.0022 0.0037 0.0013 0.0009
    ## FL1870                 0.0254 0.0090 0.0199 0.0228 0.0716 0.0412 0.2505
    ## FL1892                 0.0023 0.0021 0.0025 0.0025 0.0041 0.0025 0.0052
    ## FR1806                 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851                 0.0017 0.0014 0.0010 0.0012 0.0008 0.0006 0.0005
    ## GA1860                 0.0017 0.0013 0.0019 0.0014 0.0012 0.0009 0.0006
    ## GB1852                 0.0005 0.0003 0.0004 0.0005 0.0006 0.0003 0.0005
    ## GB1854                 0.0004 0.0002 0.0004 0.0004 0.0004 0.0003 0.0002
    ## GB1873                 0.0002 0.0002 0.0002 0.0002 0.0001 0.0001 0.0002
    ## GB1875                 0.0003 0.0003 0.0003 0.0003 0.0004 0.0003 0.0003
    ## HI1859                 0.0029 0.0010 0.0015 0.0023 0.0039 0.0012 0.0055
    ## HI1897                 0.0033 0.0015 0.0023 0.0031 0.0054 0.0023 0.0061
    ## IA1839                 0.0012 0.0006 0.0008 0.0011 0.0035 0.0003 0.0004
    ## IA1851                 0.0049 0.0024 0.0089 0.0064 0.0076 0.0065 0.0041
    ## IA1859                 0.0177 0.0078 0.0105 0.0155 0.0068 0.0062 0.0063
    ## ID1864                 0.0173 0.0073 0.0202 0.0164 0.0735 0.0389 0.0347
    ## ID1881                 0.0181 0.0080 0.0256 0.0169 0.0541 0.0432 0.0334
    ## IL1866                 0.0023 0.0019 0.0021 0.0020 0.0035 0.0014 0.0012
    ## IL1933                 0.0021 0.0012 0.0019 0.0020 0.0018 0.0012 0.0024
    ## IN1843                 0.0078 0.0055 0.0164 0.0071 0.0071 0.0030 0.0014
    ## IN1852                 0.0160 0.0113 0.1558 0.0237 0.0139 0.0111 0.0159
    ## KS1859                 0.3139 0.0677 0.0210 0.2461 0.0233 0.0160 0.0278
    ## KS1868                 0.2831 0.0842 0.0252 0.3906 0.0189 0.0150 0.0208
    ## KY1851                 0.0633 0.0205 0.0218 0.0479 0.0130 0.0112 0.0147
    ## KY1854                 0.0536 0.0193 0.0196 0.0423 0.0106 0.0099 0.0113
    ## LA1825                 0.0001 0.0001 0.0000 0.0000 0.0001 0.0001 0.0001
    ## LA1825french           0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867                 0.0003 0.0003 0.0002 0.0004 0.0004 0.0003 0.0003
    ## LC1867french           0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836                 0.0023 0.0028 0.0018 0.0019 0.0078 0.0020 0.0011
    ## MA1851                 0.0004 0.0002 0.0002 0.0003 0.0007 0.0001 0.0003
    ## MA1858                 0.0021 0.0030 0.0019 0.0020 0.0050 0.0019 0.0011
    ## MD1855                 0.0004 0.0002 0.0002 0.0003 0.0004 0.0002 0.0002
    ## MD1859                 0.0008 0.0005 0.0005 0.0006 0.0007 0.0003 0.0004
    ## ME1840                 0.0014 0.0026 0.0023 0.0017 0.0036 0.0016 0.0012
    ## MI1853                 0.0009 0.0006 0.0005 0.0010 0.0010 0.0007 0.0018
    ## MN1851                 0.0137 0.0064 0.0096 0.0135 0.0755 0.0400 0.0374
    ## MN1859                 0.0203 0.0095 0.0162 0.0200 0.1229 0.0641 0.0583
    ## MO1835                 0.0013 0.0007 0.0009 0.0011 0.0055 0.0007 0.0007
    ## MO1849                 0.0120 0.0036 0.0086 0.0092 0.0217 0.0098 0.0341
    ## MO1856                 0.0117 0.0045 0.0067 0.0099 0.0173 0.0093 0.0236
    ## MO1879                 0.0093 0.0035 0.0058 0.0090 0.0122 0.0073 0.0163
    ## MS1848                 0.0024 0.0019 0.0017 0.0021 0.0019 0.0012 0.0009
    ## MS1850                 0.0054 0.0015 0.0027 0.0042 0.0122 0.0056 0.0151
    ## MS1857                 0.0045 0.0024 0.0023 0.0041 0.0032 0.0019 0.0023
    ## MT1865                 0.0242 0.0095 0.0207 0.0227 0.0755 0.0380 0.0343
    ## MT1895                 0.0150 0.0121 0.0214 0.0158 0.0403 0.0520 0.0250
    ## NC1868                 0.0226 0.0089 0.0168 0.0199 0.0608 0.0365 0.1847
    ## ND1877                 0.0338 0.0153 0.0370 0.0328 0.0570 0.0368 0.0941
    ## ND1877extended         0.0338 0.0153 0.0369 0.0324 0.0568 0.0367 0.0938
    ## NE1857                 0.0096 0.0030 0.0083 0.0097 0.0143 0.0054 0.0049
    ## NE1859                 0.3399 0.0736 0.0210 0.2243 0.0224 0.0161 0.0278
    ## NE1866                 0.2683 0.0781 0.0201 0.1872 0.0200 0.0122 0.0170
    ## NH1842                 0.0011 0.0009 0.0008 0.0009 0.0010 0.0006 0.0005
    ## NJ1847                 0.0017 0.0010 0.0013 0.0015 0.0035 0.0006 0.0007
    ## NM1865                 0.0009 0.0005 0.0044 0.0010 0.0024 0.0005 0.0003
    ## NM1897                 0.0167 0.0077 0.0102 0.0155 0.0251 0.0126 0.0190
    ## NV1861                 0.0231 0.0094 0.0263 0.0210 0.1027 0.0490 0.0491
    ## NV1869                 0.0232 0.0093 0.0251 0.0208 0.0914 0.0486 0.0471
    ## NY1848                 0.0157 0.0052 0.0119 0.0128 0.0458 0.0244 0.0986
    ## NY1849                 0.0220 0.0073 0.0152 0.0178 0.0633 0.0344 0.1593
    ## NY1850                 0.0295 0.0133 0.0165 0.0257 0.0684 0.1059 0.0607
    ## NY1851                 0.0236 0.0079 0.0168 0.0203 0.0687 0.0358 0.1820
    ## NY1853                 0.0281 0.0122 0.0160 0.0247 0.0652 0.0768 0.0620
    ## NY1876                 0.0044 0.0033 0.0035 0.0042 0.0072 0.0074 0.0124
    ## NY1879                 0.0036 0.0027 0.0030 0.0035 0.0060 0.0061 0.0098
    ## OH1853                 0.6438 0.0739 0.0197 0.2170 0.0218 0.0157 0.0283
    ## OH1853extended             NA 0.1101 0.0223 0.2510 0.0182 0.0144 0.0225
    ## OH1879                     NA     NA 0.0103 0.0794 0.0081 0.0072 0.0077
    ## OK1891                     NA     NA     NA 0.0244 0.0155 0.0109 0.0169
    ## OK1893                     NA     NA     NA     NA 0.0183 0.0143 0.0194
    ## OR1854                     NA     NA     NA     NA     NA 0.0888 0.0656
    ## OR1862                     NA     NA     NA     NA     NA     NA 0.0381
    ## SC1870                     NA     NA     NA     NA     NA     NA     NA
    ## TN1858                     NA     NA     NA     NA     NA     NA     NA
    ## UT1853                     NA     NA     NA     NA     NA     NA     NA
    ## UT1859                     NA     NA     NA     NA     NA     NA     NA
    ## UT1870                     NA     NA     NA     NA     NA     NA     NA
    ## UT1884                     NA     NA     NA     NA     NA     NA     NA
    ## VA1841                     NA     NA     NA     NA     NA     NA     NA
    ## VA1860                     NA     NA     NA     NA     NA     NA     NA
    ## WA1855                     NA     NA     NA     NA     NA     NA     NA
    ## WA1873                     NA     NA     NA     NA     NA     NA     NA
    ## WI1849                     NA     NA     NA     NA     NA     NA     NA
    ## WI1856                     NA     NA     NA     NA     NA     NA     NA
    ## WI1858                     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857                   NA     NA     NA     NA     NA     NA     NA
    ## WV1868                     NA     NA     NA     NA     NA     NA     NA
    ## WY1870                     NA     NA     NA     NA     NA     NA     NA
    ## WY1886                     NA     NA     NA     NA     NA     NA     NA
    ##                TN1858 UT1853 UT1859 UT1870 UT1884 VA1841 VA1860 WA1855
    ## AK1900         0.0018 0.0002 0.0286 0.0230 0.0123 0.0003 0.0006 0.0245
    ## AL1852         0.0095 0.0001 0.0019 0.0016 0.0008 0.0006 0.0007 0.0014
    ## AR1868         0.0016 0.0002 0.0082 0.0070 0.0057 0.0004 0.0015 0.0110
    ## AR1874         0.0009 0.0003 0.0115 0.0074 0.0054 0.0004 0.0004 0.0115
    ## AZ1865         0.0021 0.0002 0.0626 0.1802 0.0447 0.0005 0.0008 0.0575
    ## AZ1887         0.0013 0.0001 0.0082 0.0117 0.0060 0.0013 0.0008 0.0075
    ## BI1859         0.0004 0.0002 0.0008 0.0005 0.0002 0.0006 0.0003 0.0006
    ## CA1850         0.0012 0.0002 0.0359 0.0339 0.0122 0.0006 0.0005 0.0442
    ## CA1851         0.0021 0.0002 0.0632 0.1794 0.0446 0.0005 0.0007 0.0597
    ## CA1858         0.0023 0.0002 0.0617 0.1973 0.0460 0.0005 0.0009 0.0591
    ## CA1868         0.0018 0.0002 0.0419 0.1468 0.0403 0.0005 0.0007 0.0409
    ## CA1868extended 0.0010 0.0001 0.0124 0.0465 0.0164 0.0001 0.0003 0.0146
    ## CA1872         0.0023 0.0001 0.0314 0.0748 0.0784 0.0003 0.0008 0.0279
    ## CO1868         0.0020 0.0004 0.0027 0.0011 0.0008 0.0022 0.0010 0.0020
    ## CO1877         0.0016 0.0002 0.0412 0.0901 0.0275 0.0005 0.0007 0.0308
    ## CT1854         0.0009 0.0002 0.0017 0.0008 0.0004 0.0010 0.0003 0.0011
    ## CT1879         0.0001 0.0000 0.0008 0.0004 0.0002 0.0000 0.0001 0.0005
    ## CT1879extended 0.0004 0.0000 0.0007 0.0006 0.0003 0.0001 0.0002 0.0008
    ## DC1857         0.0021 0.0002 0.0571 0.0302 0.0142 0.0004 0.0035 0.0598
    ## DE1852         0.0007 0.0001 0.0014 0.0004 0.0003 0.0006 0.0007 0.0009
    ## DT1862         0.0018 0.0002 0.0177 0.0144 0.0096 0.0007 0.0010 0.0171
    ## DT1868         0.0014 0.0002 0.0384 0.0273 0.0133 0.0004 0.0006 0.0370
    ## DT1887         0.0015 0.0001 0.0164 0.0224 0.0185 0.0003 0.0006 0.0167
    ## FL1847         0.0024 0.0003 0.0039 0.0008 0.0005 0.0026 0.0009 0.0038
    ## FL1870         0.0014 0.0003 0.0407 0.0361 0.0144 0.0005 0.0007 0.0466
    ## FL1892         0.0018 0.0001 0.0040 0.0015 0.0015 0.0014 0.0020 0.0029
    ## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0012 0.0002 0.0011 0.0005 0.0003 0.0014 0.0010 0.0009
    ## GA1860         0.0016 0.0001 0.0013 0.0007 0.0004 0.0006 0.0011 0.0013
    ## GB1852         0.0003 0.0001 0.0004 0.0005 0.0002 0.0007 0.0006 0.0005
    ## GB1854         0.0001 0.0002 0.0005 0.0002 0.0001 0.0005 0.0002 0.0004
    ## GB1873         0.0001 0.0000 0.0003 0.0001 0.0001 0.0002 0.0002 0.0001
    ## GB1875         0.0002 0.0000 0.0003 0.0003 0.0002 0.0001 0.0001 0.0003
    ## HI1859         0.0003 0.0004 0.0048 0.0041 0.0028 0.0003 0.0002 0.0038
    ## HI1897         0.0006 0.0002 0.0062 0.0038 0.0029 0.0016 0.0006 0.0045
    ## IA1839         0.0004 0.0004 0.0012 0.0004 0.0002 0.0010 0.0004 0.0009
    ## IA1851         0.0112 0.0064 0.0087 0.0043 0.0033 0.0002 0.0007 0.0062
    ## IA1859         0.0066 0.0021 0.0061 0.0043 0.0032 0.0002 0.0005 0.0055
    ## ID1864         0.0019 0.0001 0.0443 0.1335 0.0321 0.0004 0.0007 0.0430
    ## ID1881         0.0019 0.0001 0.0299 0.0713 0.0926 0.0003 0.0007 0.0267
    ## IL1866         0.0022 0.0002 0.0024 0.0011 0.0006 0.0025 0.0013 0.0016
    ## IL1933         0.0006 0.0001 0.0019 0.0010 0.0006 0.0005 0.0005 0.0018
    ## IN1843         0.0021 0.0001 0.0043 0.0013 0.0007 0.0010 0.0010 0.0053
    ## IN1852         0.0020 0.0001 0.0120 0.0079 0.0046 0.0004 0.0009 0.0451
    ## KS1859         0.0019 0.0002 0.0171 0.0158 0.0097 0.0006 0.0010 0.0181
    ## KS1868         0.0027 0.0002 0.0145 0.0152 0.0091 0.0006 0.0010 0.0243
    ## KY1851         0.0015 0.0001 0.0120 0.0081 0.0072 0.0005 0.0019 0.0132
    ## KY1854         0.0017 0.0001 0.0099 0.0073 0.0064 0.0005 0.0016 0.0118
    ## LA1825         0.0001 0.0000 0.0001 0.0000 0.0000 0.0001 0.0000 0.0001
    ## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0002 0.0001 0.0003 0.0003 0.0002 0.0002 0.0002 0.0004
    ## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
    ## MA1836         0.0016 0.0001 0.0068 0.0008 0.0010 0.0005 0.0025 0.0036
    ## MA1851         0.0001 0.0001 0.0007 0.0002 0.0000 0.0002 0.0000 0.0009
    ## MA1858         0.0016 0.0001 0.0044 0.0008 0.0008 0.0004 0.0022 0.0031
    ## MD1855         0.0002 0.0001 0.0003 0.0002 0.0001 0.0002 0.0005 0.0003
    ## MD1859         0.0005 0.0003 0.0006 0.0005 0.0002 0.0007 0.0004 0.0005
    ## ME1840         0.0013 0.0002 0.0030 0.0007 0.0005 0.0005 0.0011 0.0023
    ## MI1853         0.0004 0.0001 0.0008 0.0011 0.0002 0.0003 0.0003 0.0008
    ## MN1851         0.0021 0.0002 0.0300 0.0233 0.0158 0.0004 0.0005 0.0250
    ## MN1859         0.0030 0.0003 0.0516 0.0368 0.0229 0.0004 0.0008 0.0397
    ## MO1835         0.0010 0.0002 0.0011 0.0005 0.0003 0.0016 0.0004 0.0012
    ## MO1849         0.0008 0.0003 0.0198 0.0114 0.0044 0.0005 0.0004 0.0135
    ## MO1856         0.0008 0.0001 0.0130 0.0092 0.0030 0.0011 0.0005 0.0101
    ## MO1879         0.0009 0.0002 0.0114 0.0070 0.0022 0.0008 0.0006 0.0080
    ## MS1848         0.0023 0.0003 0.0015 0.0008 0.0004 0.0217 0.0027 0.0016
    ## MS1850         0.0001 0.0001 0.0141 0.0058 0.0013 0.0003 0.0001 0.0100
    ## MS1857         0.0020 0.0002 0.0030 0.0016 0.0008 0.0135 0.0027 0.0026
    ## MT1865         0.0023 0.0002 0.0450 0.1211 0.0298 0.0005 0.0009 0.0441
    ## MT1895         0.0022 0.0001 0.0216 0.0515 0.0605 0.0003 0.0008 0.0205
    ## NC1868         0.0017 0.0002 0.0335 0.0290 0.0127 0.0006 0.0009 0.0387
    ## ND1877         0.0021 0.0002 0.0284 0.0380 0.0288 0.0003 0.0009 0.0289
    ## ND1877extended 0.0021 0.0002 0.0283 0.0380 0.0287 0.0003 0.0010 0.0288
    ## NE1857         0.0107 0.0072 0.0072 0.0050 0.0031 0.0003 0.0006 0.0076
    ## NE1859         0.0018 0.0001 0.0169 0.0147 0.0101 0.0007 0.0010 0.0174
    ## NE1866         0.0038 0.0002 0.0117 0.0145 0.0070 0.0006 0.0009 0.0137
    ## NH1842         0.0005 0.0001 0.0011 0.0003 0.0002 0.0005 0.0005 0.0007
    ## NJ1847         0.0007 0.0001 0.0009 0.0005 0.0004 0.0027 0.0009 0.0009
    ## NM1865         0.0007 0.0006 0.0019 0.0004 0.0002 0.0015 0.0005 0.0016
    ## NM1897         0.0024 0.0005 0.0173 0.0082 0.0047 0.0006 0.0010 0.0150
    ## NV1861         0.0022 0.0002 0.0587 0.1921 0.0454 0.0006 0.0009 0.0554
    ## NV1869         0.0021 0.0002 0.0501 0.2513 0.0463 0.0005 0.0009 0.0481
    ## NY1848         0.0011 0.0002 0.0352 0.0236 0.0104 0.0003 0.0004 0.0278
    ## NY1849         0.0013 0.0001 0.0384 0.0305 0.0127 0.0005 0.0007 0.0394
    ## NY1850         0.0031 0.0002 0.0330 0.0445 0.0320 0.0002 0.0007 0.0324
    ## NY1851         0.0013 0.0002 0.0394 0.0307 0.0130 0.0003 0.0006 0.0414
    ## NY1853         0.0030 0.0002 0.0320 0.0431 0.0287 0.0003 0.0007 0.0317
    ## NY1876         0.0010 0.0001 0.0049 0.0044 0.0034 0.0001 0.0006 0.0044
    ## NY1879         0.0009 0.0000 0.0041 0.0036 0.0031 0.0001 0.0005 0.0039
    ## OH1853         0.0019 0.0002 0.0167 0.0146 0.0094 0.0007 0.0009 0.0173
    ## OH1853extended 0.0023 0.0003 0.0151 0.0166 0.0087 0.0006 0.0009 0.0165
    ## OH1879         0.0021 0.0001 0.0061 0.0063 0.0038 0.0003 0.0009 0.0075
    ## OK1891         0.0020 0.0002 0.0146 0.0162 0.0088 0.0005 0.0012 0.0410
    ## OK1893         0.0027 0.0002 0.0138 0.0147 0.0085 0.0005 0.0010 0.0229
    ## OR1854         0.0030 0.0004 0.1763 0.0544 0.0233 0.0006 0.0010 0.1049
    ## OR1862         0.0025 0.0002 0.0423 0.0298 0.0195 0.0004 0.0008 0.0344
    ## SC1870         0.0013 0.0002 0.0387 0.0303 0.0135 0.0004 0.0006 0.0393
    ## TN1858             NA 0.0014 0.0020 0.0014 0.0009 0.0004 0.0009 0.0017
    ## UT1853             NA     NA 0.0009 0.0003 0.0001 0.0002 0.0001 0.0001
    ## UT1859             NA     NA     NA 0.0330 0.0163 0.0007 0.0008 0.1080
    ## UT1870             NA     NA     NA     NA 0.0324 0.0003 0.0007 0.0312
    ## UT1884             NA     NA     NA     NA     NA 0.0002 0.0004 0.0150
    ## VA1841             NA     NA     NA     NA     NA     NA 0.0021 0.0005
    ## VA1860             NA     NA     NA     NA     NA     NA     NA 0.0009
    ## WA1855             NA     NA     NA     NA     NA     NA     NA     NA
    ## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
    ## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
    ## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
    ## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
    ## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
    ##                WA1873 WI1849 WI1856 WI1858 WOOD1857 WV1868 WY1870 WY1886
    ## AK1900         0.0239 0.0072 0.0237 0.0217   0.0284 0.0009 0.0117 0.0045
    ## AL1852         0.0015 0.0018 0.0022 0.0021   0.0022 0.0009 0.0018 0.0012
    ## AR1868         0.0094 0.0013 0.0109 0.0069   0.0082 0.0024 0.0372 0.0189
    ## AR1874         0.0091 0.0007 0.0142 0.0061   0.0081 0.0006 0.0371 0.0206
    ## AZ1865         0.0363 0.0040 0.0628 0.0298   0.2654 0.0010 0.0308 0.0077
    ## AZ1887         0.0314 0.0017 0.0081 0.0051   0.0139 0.0010 0.0084 0.0029
    ## BI1859         0.0006 0.0007 0.0006 0.0006   0.0005 0.0004 0.0007 0.0002
    ## CA1850         0.0299 0.0030 0.1177 0.0410   0.0442 0.0007 0.0230 0.0086
    ## CA1851         0.0378 0.0039 0.0679 0.0319   0.2929 0.0010 0.0332 0.0087
    ## CA1858         0.0378 0.0040 0.0668 0.0330   0.3360 0.0011 0.0349 0.0086
    ## CA1868         0.0282 0.0034 0.0466 0.0257   0.2278 0.0009 0.0266 0.0068
    ## CA1868extended 0.0103 0.0019 0.0126 0.0110   0.0690 0.0005 0.0092 0.0025
    ## CA1872         0.0409 0.0054 0.0319 0.0253   0.1110 0.0012 0.0238 0.0080
    ## CO1868         0.0023 0.0166 0.0011 0.0087   0.0014 0.0020 0.0125 0.0053
    ## CO1877         0.0255 0.0037 0.0423 0.0215   0.1116 0.0010 0.0288 0.0094
    ## CT1854         0.0010 0.0013 0.0009 0.0012   0.0008 0.0004 0.0011 0.0007
    ## CT1879         0.0003 0.0001 0.0020 0.0005   0.0005 0.0001 0.0006 0.0005
    ## CT1879extended 0.0007 0.0003 0.0012 0.0009   0.0008 0.0002 0.0008 0.0007
    ## DC1857         0.0394 0.0063 0.0366 0.0223   0.0389 0.0050 0.0470 0.0203
    ## DE1852         0.0011 0.0022 0.0006 0.0018   0.0007 0.0008 0.0008 0.0005
    ## DT1862         0.0143 0.0022 0.0288 0.0147   0.0172 0.0013 0.2420 0.0808
    ## DT1868         0.0307 0.0050 0.1684 0.0731   0.0373 0.0012 0.0205 0.0087
    ## DT1887         0.0249 0.0060 0.0400 0.0321   0.0292 0.0010 0.0178 0.0071
    ## FL1847         0.0030 0.0090 0.0008 0.0074   0.0011 0.0011 0.0018 0.0010
    ## FL1870         0.0354 0.0035 0.2234 0.0829   0.0469 0.0009 0.0261 0.0101
    ## FL1892         0.0031 0.0075 0.0016 0.0062   0.0015 0.0021 0.0018 0.0013
    ## FR1806         0.0000 0.0000 0.0000 0.0000   0.0000 0.0000 0.0000 0.0000
    ## GA1851         0.0012 0.0014 0.0003 0.0010   0.0006 0.0008 0.0012 0.0007
    ## GA1860         0.0013 0.0015 0.0004 0.0012   0.0009 0.0012 0.0015 0.0007
    ## GB1852         0.0004 0.0006 0.0004 0.0005   0.0004 0.0008 0.0005 0.0003
    ## GB1854         0.0004 0.0003 0.0002 0.0002   0.0003 0.0001 0.0004 0.0002
    ## GB1873         0.0002 0.0002 0.0001 0.0002   0.0001 0.0002 0.0003 0.0001
    ## GB1875         0.0003 0.0003 0.0003 0.0003   0.0003 0.0001 0.0004 0.0002
    ## HI1859         0.0024 0.0003 0.0075 0.0023   0.0050 0.0001 0.0031 0.0018
    ## HI1897         0.0039 0.0034 0.0056 0.0050   0.0046 0.0005 0.0034 0.0020
    ## IA1839         0.0006 0.0019 0.0003 0.0006   0.0003 0.0003 0.0012 0.0010
    ## IA1851         0.0044 0.0025 0.0046 0.0037   0.0054 0.0006 0.0323 0.0021
    ## IA1859         0.0049 0.0015 0.0069 0.0046   0.0054 0.0006 0.0259 0.0077
    ## ID1864         0.0323 0.0059 0.0409 0.0249   0.1663 0.0010 0.0228 0.0062
    ## ID1881         0.0220 0.0044 0.0309 0.0220   0.0927 0.0010 0.0219 0.0078
    ## IL1866         0.0020 0.0136 0.0010 0.0088   0.0013 0.0022 0.0101 0.0014
    ## IL1933         0.0015 0.0007 0.0027 0.0012   0.0014 0.0006 0.0022 0.0016
    ## IN1843         0.0045 0.0144 0.0016 0.0095   0.0015 0.0012 0.0040 0.0017
    ## IN1852         0.0425 0.0041 0.0182 0.0123   0.0095 0.0012 0.0170 0.0082
    ## KS1859         0.0149 0.0021 0.0303 0.0157   0.0176 0.0014 0.2551 0.0803
    ## KS1868         0.0194 0.0033 0.0230 0.0148   0.0176 0.0016 0.1858 0.0583
    ## KY1851         0.0120 0.0011 0.0143 0.0081   0.0103 0.0017 0.0486 0.0249
    ## KY1854         0.0099 0.0013 0.0124 0.0069   0.0095 0.0027 0.0420 0.0220
    ## LA1825         0.0001 0.0000 0.0000 0.0000   0.0001 0.0000 0.0000 0.0001
    ## LA1825french   0.0000 0.0000 0.0000 0.0000   0.0000 0.0000 0.0000 0.0000
    ## LC1867         0.0003 0.0004 0.0003 0.0003   0.0004 0.0002 0.0003 0.0002
    ## LC1867french   0.0000 0.0000 0.0000 0.0000   0.0000 0.0000 0.0000 0.0000
    ## MA1836         0.0032 0.0291 0.0008 0.0186   0.0014 0.0029 0.0014 0.0008
    ## MA1851         0.0005 0.0003 0.0005 0.0003   0.0001 0.0000 0.0003 0.0001
    ## MA1858         0.0031 0.0172 0.0008 0.0126   0.0013 0.0025 0.0016 0.0008
    ## MD1855         0.0002 0.0004 0.0003 0.0002   0.0002 0.0003 0.0003 0.0002
    ## MD1859         0.0004 0.0006 0.0006 0.0006   0.0004 0.0003 0.0008 0.0003
    ## ME1840         0.0027 0.0088 0.0006 0.0066   0.0008 0.0009 0.0015 0.0009
    ## MI1853         0.0008 0.0011 0.0024 0.0013   0.0011 0.0002 0.0011 0.0007
    ## MN1851         0.0213 0.0623 0.0381 0.0783   0.0329 0.0007 0.0151 0.0057
    ## MN1859         0.0326 0.0941 0.0626 0.1351   0.0515 0.0011 0.0219 0.0082
    ## MO1835         0.0008 0.0058 0.0008 0.0020   0.0006 0.0005 0.0015 0.0009
    ## MO1849         0.0116 0.0015 0.0431 0.0136   0.0150 0.0005 0.0119 0.0056
    ## MO1856         0.0079 0.0045 0.0279 0.0114   0.0105 0.0006 0.0112 0.0060
    ## MO1879         0.0065 0.0036 0.0187 0.0083   0.0079 0.0006 0.0090 0.0047
    ## MS1848         0.0020 0.0028 0.0007 0.0022   0.0009 0.0020 0.0019 0.0010
    ## MS1850         0.0068 0.0000 0.0235 0.0059   0.0066 0.0001 0.0052 0.0025
    ## MS1857         0.0026 0.0023 0.0026 0.0026   0.0020 0.0020 0.0044 0.0022
    ## MT1865         0.0336 0.0057 0.0403 0.0233   0.1552 0.0013 0.0326 0.0089
    ## MT1895         0.0300 0.0049 0.0219 0.0198   0.0703 0.0012 0.0178 0.0085
    ## NC1868         0.0311 0.0047 0.1502 0.0717   0.0395 0.0011 0.0222 0.0089
    ## ND1877         0.0390 0.0093 0.0745 0.0558   0.0515 0.0014 0.0307 0.0123
    ## ND1877extended 0.0389 0.0093 0.0742 0.0556   0.0514 0.0014 0.0306 0.0123
    ## NE1857         0.0055 0.0093 0.0061 0.0089   0.0058 0.0006 0.0444 0.0034
    ## NE1859         0.0147 0.0023 0.0304 0.0158   0.0177 0.0013 0.2565 0.0837
    ## NE1866         0.0105 0.0068 0.0172 0.0140   0.0153 0.0014 0.2423 0.0528
    ## NH1842         0.0006 0.0015 0.0005 0.0010   0.0005 0.0004 0.0007 0.0004
    ## NJ1847         0.0011 0.0047 0.0007 0.0014   0.0007 0.0006 0.0016 0.0006
    ## NM1865         0.0018 0.0010 0.0003 0.0006   0.0005 0.0005 0.0011 0.0008
    ## NM1897         0.0100 0.0136 0.0189 0.0198   0.0095 0.0014 0.0156 0.0074
    ## NV1861         0.0361 0.0072 0.0582 0.0337   0.2540 0.0011 0.0319 0.0081
    ## NV1869         0.0321 0.0037 0.0544 0.0282   0.2297 0.0011 0.0381 0.0079
    ## NY1848         0.0224 0.0018 0.1250 0.0438   0.0333 0.0006 0.0153 0.0068
    ## NY1849         0.0300 0.0054 0.1883 0.0723   0.0417 0.0008 0.0212 0.0085
    ## NY1850         0.0254 0.0114 0.0596 0.0484   0.0638 0.0010 0.0223 0.0077
    ## NY1851         0.0322 0.0056 0.2025 0.0780   0.0419 0.0007 0.0229 0.0088
    ## NY1853         0.0245 0.0112 0.0605 0.0476   0.0610 0.0010 0.0213 0.0075
    ## NY1876         0.0042 0.0038 0.0096 0.0092   0.0056 0.0008 0.0039 0.0025
    ## NY1879         0.0037 0.0031 0.0082 0.0080   0.0049 0.0008 0.0032 0.0020
    ## OH1853         0.0143 0.0022 0.0311 0.0155   0.0172 0.0013 0.2337 0.0810
    ## OH1853extended 0.0127 0.0036 0.0242 0.0141   0.0188 0.0015 0.1851 0.0678
    ## OH1879         0.0101 0.0036 0.0080 0.0083   0.0077 0.0016 0.0502 0.0914
    ## OK1891         0.0345 0.0034 0.0188 0.0127   0.0188 0.0015 0.0180 0.0097
    ## OK1893         0.0178 0.0034 0.0212 0.0139   0.0166 0.0016 0.1724 0.0562
    ## OR1854         0.0839 0.0286 0.0700 0.0646   0.0783 0.0013 0.0239 0.0090
    ## OR1862         0.0331 0.0099 0.0349 0.0327   0.0416 0.0012 0.0163 0.0060
    ## SC1870         0.0328 0.0063 0.1813 0.0786   0.0397 0.0009 0.0226 0.0089
    ## TN1858         0.0015 0.0032 0.0012 0.0033   0.0017 0.0014 0.0026 0.0012
    ## UT1853         0.0002 0.0002 0.0003 0.0003   0.0002 0.0000 0.0001 0.0001
    ## UT1859         0.0608 0.0112 0.0399 0.0270   0.0462 0.0009 0.0163 0.0069
    ## UT1870         0.0201 0.0022 0.0341 0.0171   0.1327 0.0008 0.0233 0.0055
    ## UT1884         0.0124 0.0015 0.0135 0.0096   0.0363 0.0005 0.0111 0.0043
    ## VA1841         0.0004 0.0007 0.0004 0.0005   0.0004 0.0013 0.0006 0.0004
    ## VA1860         0.0008 0.0019 0.0006 0.0009   0.0007 0.1172 0.0011 0.0006
    ## WA1855         0.1838 0.0132 0.0463 0.0259   0.0399 0.0012 0.0157 0.0068
    ## WA1873             NA 0.0048 0.0337 0.0229   0.0282 0.0011 0.0131 0.0061
    ## WI1849             NA     NA 0.0036 0.1738   0.0041 0.0026 0.0030 0.0014
    ## WI1856             NA     NA     NA 0.1021   0.0467 0.0007 0.0239 0.0099
    ## WI1858             NA     NA     NA     NA   0.0259 0.0022 0.0144 0.0061
    ## WOOD1857           NA     NA     NA     NA       NA 0.0009 0.0239 0.0063
    ## WV1868             NA     NA     NA     NA       NA     NA 0.0014 0.0008
    ## WY1870             NA     NA     NA     NA       NA     NA     NA 0.0571
    ## WY1886             NA     NA     NA     NA       NA     NA     NA     NA

Session info:

    sessionInfo()

    ## R version 3.2.2 (2015-08-14)
    ## Platform: x86_64-apple-darwin14.4.0 (64-bit)
    ## Running under: OS X 10.10.5 (Yosemite)
    ## 
    ## locale:
    ## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] textreuse_0.0.1.9003
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] assertthat_0.1  magrittr_1.5    tools_3.2.2     htmltools_0.2.6
    ##  [5] NLP_0.1-8       yaml_2.1.13     Rcpp_0.12.1     stringi_0.5-5  
    ##  [9] rmarkdown_0.8   knitr_1.11      stringr_1.0.0   digest_0.6.8   
    ## [13] evaluate_0.8
