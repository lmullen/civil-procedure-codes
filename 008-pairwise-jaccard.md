# Compare pairwise with Jaccard similarity
Lincoln Mullen  
September 21, 2015  

We are going to load the corpus from the cache, and create a comparison matrix with Jaccard similarity. (We will do other comparisons in different notebook so we can do this in parallel.) We will cache the matrix for use in later analyses.


```r
library("textreuse")

cache <- "cache/comparison-matrix-jaccard.rds"
if (!file.exists(cache)) {
  corpus <- readRDS("cache/corpus-skip-ngrams-n7k3.rds")
  m <- pairwise_compare(corpus, jaccard_similarity)
  saveRDS(m, cache)
} else {
  m <- readRDS(cache)
}
```

Here is the comparison matrix:


```r
round(m, digits = 4)
```

```
##                AK1900 AL1852 AR1868 AR1874 AZ1865 AZ1887 BI1859 CA1850
## AK1900             NA  5e-04  3e-03 0.0023 0.0192 0.0030  1e-04 0.0111
## AL1852             NA     NA  4e-04 0.0002 0.0008 0.0003  1e-04 0.0002
## AR1868             NA     NA     NA 0.0994 0.0050 0.0022  2e-04 0.0053
## AR1874             NA     NA     NA     NA 0.0050 0.0029  1e-04 0.0071
## AZ1865             NA     NA     NA     NA     NA 0.0134  2e-04 0.0355
## AZ1887             NA     NA     NA     NA     NA     NA  2e-04 0.0044
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
## AK1900         0.0192 0.0161 0.0125         0.0059 0.0160  4e-04 0.0089
## AL1852         0.0007 0.0007 0.0005         0.0003 0.0008  3e-04 0.0005
## AR1868         0.0055 0.0037 0.0032         0.0016 0.0051  4e-04 0.0051
## AR1874         0.0060 0.0038 0.0027         0.0011 0.0045  2e-04 0.0064
## AZ1865         0.3182 0.2369 0.1572         0.0550 0.0822  4e-04 0.0931
## AZ1887         0.0130 0.0091 0.0061         0.0031 0.1078  4e-04 0.0101
## BI1859         0.0002 0.0002 0.0002         0.0001 0.0001  2e-04 0.0001
## CA1850         0.0451 0.0298 0.0177         0.0063 0.0131  4e-04 0.0215
## CA1851             NA 0.3146 0.1795         0.0616 0.0853  3e-04 0.0923
## CA1858             NA     NA 0.1807         0.0681 0.0804  3e-04 0.0769
## CA1868             NA     NA     NA         0.2212 0.0798  3e-04 0.0708
## CA1868extended     NA     NA     NA             NA 0.0400  2e-04 0.0265
## CA1872             NA     NA     NA             NA     NA  4e-04 0.0385
## CO1868             NA     NA     NA             NA     NA     NA 0.0072
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
## AK1900          1e-04  2e-04         0.0003 0.0093  2e-04 0.0042 0.0110
## AL1852          2e-04  0e+00         0.0001 0.0006  2e-04 0.0004 0.0005
## AR1868          2e-04  1e-04         0.0003 0.0118  2e-04 0.0300 0.0044
## AR1874          2e-04  1e-04         0.0003 0.0135  1e-04 0.0354 0.0047
## AZ1865          3e-04  3e-04         0.0003 0.0284  2e-04 0.0096 0.0249
## AZ1887          2e-04  1e-04         0.0001 0.0035  2e-04 0.0031 0.0034
## BI1859          2e-04  0e+00         0.0000 0.0002  1e-04 0.0002 0.0001
## CA1850          3e-04  4e-04         0.0004 0.0141  1e-04 0.0142 0.0497
## CA1851          3e-04  2e-04         0.0004 0.0281  2e-04 0.0111 0.0270
## CA1858          3e-04  1e-04         0.0003 0.0227  2e-04 0.0084 0.0202
## CA1868          3e-04  1e-04         0.0002 0.0158  1e-04 0.0066 0.0148
## CA1868extended  1e-04  0e+00         0.0002 0.0073  1e-04 0.0026 0.0059
## CA1872          2e-04  1e-04         0.0003 0.0148  2e-04 0.0090 0.0143
## CO1868          4e-04  0e+00         0.0001 0.0006  8e-04 0.0005 0.0003
## CO1877          3e-04  1e-04         0.0004 0.0180  1e-04 0.0093 0.0167
## CT1854             NA  0e+00         0.0003 0.0004  2e-04 0.0003 0.0003
## CT1879             NA     NA         0.0269 0.0002  0e+00 0.0004 0.0003
## CT1879extended     NA     NA             NA 0.0004  1e-04 0.0003 0.0003
## DC1857             NA     NA             NA     NA  3e-04 0.0335 0.0157
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
## AK1900         0.0065 0.0003 0.0133 0.0007      0 0.0002 0.0002 0.0001
## AL1852         0.0004 0.0005 0.0006 0.0005      0 0.0003 0.0004 0.0001
## AR1868         0.0029 0.0004 0.0051 0.0004      0 0.0002 0.0003 0.0001
## AR1874         0.0023 0.0002 0.0060 0.0002      0 0.0001 0.0001 0.0001
## AZ1865         0.0178 0.0003 0.0340 0.0005      0 0.0002 0.0002 0.0001
## AZ1887         0.0454 0.0004 0.0046 0.0004      0 0.0003 0.0004 0.0001
## BI1859         0.0001 0.0002 0.0002 0.0003      0 0.0001 0.0001 0.0007
## CA1850         0.0125 0.0002 0.0636 0.0003      0 0.0001 0.0002 0.0000
## CA1851         0.0193 0.0003 0.0372 0.0005      0 0.0002 0.0003 0.0001
## CA1858         0.0182 0.0003 0.0275 0.0005      0 0.0002 0.0003 0.0001
## CA1868         0.0157 0.0003 0.0211 0.0005      0 0.0002 0.0003 0.0001
## CA1868extended 0.0080 0.0002 0.0081 0.0003      0 0.0002 0.0002 0.0001
## CA1872         0.0553 0.0003 0.0169 0.0019      0 0.0002 0.0003 0.0001
## CO1868         0.0004 0.0013 0.0003 0.0008      0 0.0005 0.0005 0.0002
## CO1877         0.0082 0.0004 0.0205 0.0005      0 0.0002 0.0003 0.0002
## CT1854         0.0002 0.0003 0.0003 0.0003      0 0.0002 0.0002 0.0001
## CT1879         0.0001 0.0000 0.0005 0.0000      0 0.0000 0.0000 0.0001
## CT1879extended 0.0002 0.0001 0.0004 0.0002      0 0.0001 0.0001 0.0002
## DC1857         0.0091 0.0006 0.0196 0.0013      0 0.0002 0.0004 0.0001
## DE1852         0.0002 0.0005 0.0002 0.0005      0 0.0002 0.0002 0.0001
## DT1862         0.0105 0.0006 0.0140 0.0006      0 0.0003 0.0004 0.0002
## DT1868         0.0295 0.0002 0.1422 0.0025      0 0.0001 0.0002 0.0001
## DT1887             NA 0.0004 0.0300 0.0016      0 0.0002 0.0003 0.0001
## FL1847             NA     NA 0.0004 0.0335      0 0.0033 0.0009 0.0002
## FL1870             NA     NA     NA 0.0023      0 0.0002 0.0002 0.0001
## FL1892             NA     NA     NA     NA      0 0.0008 0.0005 0.0085
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
## AK1900         0.0001  1e-04 0.0001 0.0004 0.0007 0.0001 0.0013 0.0026
## AL1852         0.0000  0e+00 0.0001 0.0001 0.0002 0.0001 0.0003 0.0006
## AR1868         0.0000  0e+00 0.0001 0.0012 0.0011 0.0001 0.0007 0.0246
## AR1874         0.0001  0e+00 0.0001 0.0022 0.0014 0.0001 0.0009 0.0202
## AZ1865         0.0001  0e+00 0.0001 0.0049 0.0038 0.0001 0.0024 0.0037
## AZ1887         0.0001  1e-04 0.0001 0.0011 0.0010 0.0001 0.0007 0.0015
## BI1859         0.0017  1e-04 0.0001 0.0000 0.0006 0.0001 0.0001 0.0003
## CA1850         0.0001  0e+00 0.0000 0.0026 0.0017 0.0002 0.0011 0.0037
## CA1851         0.0001  0e+00 0.0001 0.0061 0.0047 0.0001 0.0026 0.0044
## CA1858         0.0001  1e-04 0.0001 0.0025 0.0022 0.0001 0.0021 0.0034
## CA1868         0.0001  0e+00 0.0001 0.0029 0.0026 0.0001 0.0019 0.0030
## CA1868extended 0.0000  0e+00 0.0001 0.0008 0.0009 0.0000 0.0008 0.0016
## CA1872         0.0001  1e-04 0.0001 0.0016 0.0017 0.0001 0.0027 0.0038
## CO1868         0.0001  0e+00 0.0001 0.0001 0.0009 0.0159 0.0005 0.0004
## CO1877         0.0001  0e+00 0.0001 0.0030 0.0023 0.0001 0.0020 0.0038
## CT1854         0.0001  1e-04 0.0001 0.0003 0.0004 0.0001 0.0001 0.0002
## CT1879         0.0000  1e-04 0.0001 0.0003 0.0002 0.0001 0.0000 0.0000
## CT1879extended 0.0000  1e-04 0.0002 0.0001 0.0001 0.0001 0.0001 0.0002
## DC1857         0.0001  1e-04 0.0001 0.0018 0.0021 0.0003 0.0025 0.0098
## DE1852         0.0000  0e+00 0.0001 0.0002 0.0006 0.0001 0.0002 0.0002
## DT1862         0.0001  1e-04 0.0001 0.0024 0.0020 0.0003 0.0074 0.0224
## DT1868         0.0001  1e-04 0.0001 0.0022 0.0023 0.0001 0.0012 0.0032
## DT1887         0.0001  0e+00 0.0001 0.0006 0.0010 0.0001 0.0014 0.0029
## FL1847         0.0001  1e-04 0.0001 0.0001 0.0016 0.0003 0.0003 0.0004
## FL1870         0.0001  1e-04 0.0001 0.0029 0.0028 0.0001 0.0015 0.0045
## FL1892         0.0021  1e-04 0.0001 0.0003 0.0029 0.0003 0.0002 0.0008
## FR1806         0.0000  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## GA1851         0.0001  1e-04 0.0001 0.0001 0.0002 0.0001 0.0002 0.0002
## GA1860         0.0001  0e+00 0.0001 0.0000 0.0002 0.0001 0.0003 0.0003
## GB1852         0.0105  6e-04 0.0025 0.0001 0.0109 0.0001 0.0001 0.0011
## GB1854             NA  8e-04 0.0011 0.0001 0.0148 0.0001 0.0001 0.0020
## GB1873             NA     NA 0.0042 0.0000 0.0002 0.0000 0.0000 0.0001
## GB1875             NA     NA     NA 0.0000 0.0002 0.0000 0.0001 0.0001
## HI1859             NA     NA     NA     NA 0.1075 0.0001 0.0005 0.0005
## HI1897             NA     NA     NA     NA     NA 0.0001 0.0005 0.0007
## IA1839             NA     NA     NA     NA     NA     NA 0.0002 0.0001
## IA1851             NA     NA     NA     NA     NA     NA     NA 0.1173
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
## AK1900         0.0153 0.0129 0.0004 0.0003 0.0009 0.0034 0.0049 0.0044
## AL1852         0.0005 0.0008 0.0004 0.0002 0.0006 0.0005 0.0004 0.0004
## AR1868         0.0037 0.0047 0.0004 0.0003 0.0005 0.0093 0.0290 0.0193
## AR1874         0.0037 0.0048 0.0002 0.0005 0.0002 0.0108 0.0358 0.0193
## AZ1865         0.1443 0.0729 0.0004 0.0005 0.0005 0.0055 0.0107 0.0086
## AZ1887         0.0076 0.0055 0.0004 0.0004 0.0005 0.0026 0.0029 0.0020
## BI1859         0.0001 0.0001 0.0002 0.0002 0.0002 0.0002 0.0002 0.0002
## CA1850         0.0210 0.0128 0.0003 0.0013 0.0003 0.0077 0.0148 0.0084
## CA1851         0.1355 0.0706 0.0004 0.0006 0.0005 0.0068 0.0120 0.0094
## CA1858         0.1356 0.0638 0.0004 0.0004 0.0005 0.0054 0.0091 0.0081
## CA1868         0.0982 0.0626 0.0003 0.0003 0.0005 0.0036 0.0069 0.0066
## CA1868extended 0.0379 0.0270 0.0002 0.0002 0.0004 0.0019 0.0028 0.0029
## CA1872         0.0501 0.1506 0.0004 0.0003 0.0006 0.0050 0.0086 0.0085
## CO1868         0.0004 0.0003 0.0893 0.0029 0.0022 0.0005 0.0005 0.0005
## CO1877         0.0612 0.0353 0.0044 0.0006 0.0004 0.0072 0.0101 0.0075
## CT1854         0.0003 0.0002 0.0005 0.0002 0.0003 0.0002 0.0008 0.0006
## CT1879         0.0001 0.0001 0.0000 0.0021 0.0000 0.0001 0.0004 0.0002
## CT1879extended 0.0003 0.0003 0.0001 0.0011 0.0002 0.0003 0.0004 0.0004
## DC1857         0.0181 0.0134 0.0005 0.0006 0.0058 0.0395 0.0337 0.0258
## DE1852         0.0001 0.0002 0.0003 0.0001 0.0007 0.0004 0.0002 0.0002
## DT1862         0.0071 0.0089 0.0005 0.0007 0.0007 0.0088 0.2998 0.1347
## DT1868         0.0156 0.0142 0.0003 0.0009 0.0005 0.0076 0.0118 0.0077
## DT1887         0.0128 0.0236 0.0003 0.0005 0.0006 0.0036 0.0097 0.0081
## FL1847         0.0003 0.0003 0.0022 0.0003 0.0034 0.0009 0.0005 0.0006
## FL1870         0.0198 0.0167 0.0003 0.0010 0.0007 0.0095 0.0147 0.0098
## FL1892         0.0006 0.0016 0.0011 0.0002 0.0022 0.0008 0.0006 0.0006
## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## GA1851         0.0002 0.0001 0.0008 0.0002 0.0004 0.0003 0.0003 0.0003
## GA1860         0.0003 0.0002 0.0005 0.0002 0.0005 0.0003 0.0004 0.0004
## GB1852         0.0001 0.0001 0.0003 0.0001 0.0001 0.0001 0.0002 0.0001
## GB1854         0.0001 0.0000 0.0001 0.0002 0.0001 0.0001 0.0001 0.0001
## GB1873         0.0001 0.0000 0.0001 0.0000 0.0001 0.0001 0.0001 0.0001
## GB1875         0.0001 0.0001 0.0001 0.0003 0.0001 0.0001 0.0001 0.0001
## HI1859         0.0027 0.0018 0.0001 0.0001 0.0005 0.0008 0.0018 0.0010
## HI1897         0.0024 0.0018 0.0004 0.0002 0.0005 0.0009 0.0016 0.0011
## IA1839         0.0001 0.0001 0.0204 0.0021 0.0003 0.0002 0.0004 0.0003
## IA1851         0.0018 0.0025 0.0004 0.0002 0.0004 0.0038 0.0018 0.0028
## IA1859         0.0030 0.0037 0.0003 0.0003 0.0011 0.0076 0.0191 0.0136
## ID1864             NA 0.0453 0.0004 0.0004 0.0005 0.0046 0.0080 0.0065
## ID1881             NA     NA 0.0003 0.0003 0.0004 0.0043 0.0085 0.0080
## IL1866             NA     NA     NA 0.0029 0.0010 0.0006 0.0005 0.0005
## IL1933             NA     NA     NA     NA 0.0002 0.0007 0.0009 0.0006
## IN1843             NA     NA     NA     NA     NA 0.0090 0.0006 0.0029
## IN1852             NA     NA     NA     NA     NA     NA 0.0095 0.0135
## KS1859             NA     NA     NA     NA     NA     NA     NA 0.1722
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
## AK1900         0.0035 0.0024  0e+00        0e+00  1e-04        1e-04
## AL1852         0.0003 0.0003  0e+00        0e+00  1e-04        0e+00
## AR1868         0.1454 0.1402  0e+00        0e+00  1e-04        0e+00
## AR1874         0.0974 0.0665  0e+00        0e+00  1e-04        0e+00
## AZ1865         0.0060 0.0039  0e+00        0e+00  1e-04        0e+00
## AZ1887         0.0024 0.0020  0e+00        0e+00  1e-04        0e+00
## BI1859         0.0002 0.0001  0e+00        0e+00  0e+00        0e+00
## CA1850         0.0074 0.0046  1e-04        0e+00  1e-04        0e+00
## CA1851         0.0070 0.0045  0e+00        0e+00  1e-04        0e+00
## CA1858         0.0044 0.0030  0e+00        0e+00  1e-04        0e+00
## CA1868         0.0037 0.0025  0e+00        0e+00  1e-04        0e+00
## CA1868extended 0.0016 0.0012  0e+00        1e-04  1e-04        1e-04
## CA1872         0.0065 0.0046  0e+00        0e+00  1e-04        0e+00
## CO1868         0.0003 0.0003  0e+00        0e+00  1e-04        0e+00
## CO1877         0.0060 0.0038  0e+00        0e+00  1e-04        0e+00
## CT1854         0.0002 0.0002  0e+00        0e+00  1e-04        0e+00
## CT1879         0.0001 0.0001  0e+00        0e+00  0e+00        0e+00
## CT1879extended 0.0002 0.0002  0e+00        0e+00  0e+00        1e-04
## DC1857         0.0153 0.0108  0e+00        0e+00  1e-04        0e+00
## DE1852         0.0002 0.0001  0e+00        0e+00  1e-04        0e+00
## DT1862         0.0439 0.0275  0e+00        0e+00  1e-04        0e+00
## DT1868         0.0059 0.0037  0e+00        0e+00  1e-04        0e+00
## DT1887         0.0037 0.0026  0e+00        0e+00  1e-04        0e+00
## FL1847         0.0003 0.0003  0e+00        0e+00  1e-04        0e+00
## FL1870         0.0070 0.0044  0e+00        0e+00  1e-04        0e+00
## FL1892         0.0005 0.0003  1e-04        0e+00  1e-04        0e+00
## FR1806         0.0000 0.0000  0e+00        0e+00  0e+00        0e+00
## GA1851         0.0002 0.0002  0e+00        0e+00  1e-04        1e-04
## GA1860         0.0002 0.0002  0e+00        0e+00  1e-04        0e+00
## GB1852         0.0001 0.0001  0e+00        0e+00  1e-04        0e+00
## GB1854         0.0001 0.0001  0e+00        0e+00  0e+00        0e+00
## GB1873         0.0000 0.0000  0e+00        0e+00  0e+00        0e+00
## GB1875         0.0001 0.0001  0e+00        1e-04  1e-04        0e+00
## HI1859         0.0019 0.0010  0e+00        0e+00  0e+00        0e+00
## HI1897         0.0016 0.0009  0e+00        0e+00  1e-04        0e+00
## IA1839         0.0001 0.0001  0e+00        0e+00  0e+00        0e+00
## IA1851         0.0009 0.0007  0e+00        0e+00  1e-04        0e+00
## IA1859         0.0252 0.0204  0e+00        0e+00  1e-04        0e+00
## ID1864         0.0042 0.0029  0e+00        0e+00  1e-04        0e+00
## ID1881         0.0060 0.0041  0e+00        0e+00  1e-04        0e+00
## IL1866         0.0003 0.0003  0e+00        0e+00  1e-04        0e+00
## IL1933         0.0003 0.0003  0e+00        0e+00  0e+00        0e+00
## IN1843         0.0003 0.0004  1e-04        0e+00  1e-04        0e+00
## IN1852         0.0107 0.0079  0e+00        0e+00  1e-04        0e+00
## KS1859         0.0402 0.0254  0e+00        0e+00  1e-04        0e+00
## KS1868         0.0243 0.0172  0e+00        0e+00  1e-04        1e-04
## KY1851             NA 0.1835  0e+00        0e+00  1e-04        0e+00
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
## AK1900         0.0006  1e-04 0.0005 0.0001 0.0001 0.0005 0.0002 0.0131
## AL1852         0.0003  1e-04 0.0002 0.0001 0.0001 0.0002 0.0001 0.0007
## AR1868         0.0003  1e-04 0.0003 0.0001 0.0002 0.0002 0.0001 0.0029
## AR1874         0.0002  0e+00 0.0002 0.0001 0.0001 0.0002 0.0001 0.0027
## AZ1865         0.0003  1e-04 0.0003 0.0001 0.0002 0.0003 0.0006 0.0237
## AZ1887         0.0003  1e-04 0.0004 0.0000 0.0002 0.0004 0.0002 0.0016
## BI1859         0.0002  1e-04 0.0002 0.0001 0.0001 0.0001 0.0001 0.0001
## CA1850         0.0004  1e-04 0.0004 0.0001 0.0002 0.0002 0.0011 0.0130
## CA1851         0.0003  1e-04 0.0003 0.0001 0.0002 0.0002 0.0006 0.0233
## CA1858         0.0003  0e+00 0.0003 0.0001 0.0001 0.0002 0.0004 0.0190
## CA1868         0.0003  0e+00 0.0003 0.0000 0.0001 0.0003 0.0004 0.0157
## CA1868extended 0.0003  0e+00 0.0003 0.0000 0.0001 0.0002 0.0002 0.0071
## CA1872         0.0006  1e-04 0.0005 0.0000 0.0001 0.0004 0.0002 0.0192
## CO1868         0.0026  1e-04 0.0011 0.0001 0.0002 0.0020 0.0002 0.0005
## CO1877         0.0002  0e+00 0.0002 0.0001 0.0002 0.0002 0.0004 0.0110
## CT1854         0.0003  1e-04 0.0003 0.0000 0.0002 0.0004 0.0001 0.0003
## CT1879         0.0000  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0001
## CT1879extended 0.0001  1e-04 0.0001 0.0002 0.0002 0.0001 0.0001 0.0002
## DC1857         0.0017  1e-04 0.0011 0.0001 0.0001 0.0007 0.0003 0.0083
## DE1852         0.0029  0e+00 0.0017 0.0001 0.0001 0.0012 0.0001 0.0005
## DT1862         0.0004  2e-04 0.0004 0.0001 0.0002 0.0004 0.0003 0.0078
## DT1868         0.0003  1e-04 0.0003 0.0001 0.0001 0.0003 0.0007 0.0184
## DT1887         0.0003  1e-04 0.0004 0.0000 0.0001 0.0004 0.0003 0.0101
## FL1847         0.0067  1e-04 0.0043 0.0001 0.0002 0.0018 0.0002 0.0029
## FL1870         0.0004  1e-04 0.0004 0.0000 0.0001 0.0004 0.0009 0.0224
## FL1892         0.0027  1e-04 0.0020 0.0057 0.0021 0.0009 0.0002 0.0013
## FR1806         0.0000  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## GA1851         0.0003  0e+00 0.0002 0.0000 0.0002 0.0003 0.0001 0.0002
## GA1860         0.0002  0e+00 0.0003 0.0001 0.0003 0.0003 0.0001 0.0002
## GB1852         0.0002  1e-04 0.0001 0.0327 0.0089 0.0001 0.0001 0.0001
## GB1854         0.0001  1e-04 0.0001 0.0001 0.0001 0.0001 0.0000 0.0000
## GB1873         0.0001  1e-04 0.0001 0.0000 0.0000 0.0001 0.0000 0.0000
## GB1875         0.0001  0e+00 0.0001 0.0002 0.0000 0.0001 0.0001 0.0001
## HI1859         0.0007  0e+00 0.0006 0.0000 0.0000 0.0018 0.0001 0.0009
## HI1897         0.0050  1e-04 0.0033 0.0001 0.0001 0.0076 0.0002 0.0014
## IA1839         0.0001  0e+00 0.0001 0.0000 0.0002 0.0001 0.0001 0.0007
## IA1851         0.0004  0e+00 0.0004 0.0001 0.0001 0.0004 0.0001 0.0019
## IA1859         0.0004  1e-03 0.0009 0.0012 0.0002 0.0003 0.0001 0.0027
## ID1864         0.0003  1e-04 0.0003 0.0001 0.0001 0.0002 0.0004 0.0151
## ID1881         0.0005  1e-04 0.0004 0.0001 0.0001 0.0003 0.0002 0.0176
## IL1866         0.0010  1e-04 0.0006 0.0002 0.0003 0.0004 0.0002 0.0005
## IL1933         0.0001  1e-04 0.0002 0.0001 0.0001 0.0001 0.0010 0.0004
## IN1843         0.0049  1e-04 0.0028 0.0001 0.0002 0.0031 0.0003 0.0018
## IN1852         0.0009  2e-04 0.0010 0.0001 0.0002 0.0009 0.0002 0.0036
## KS1859         0.0004  1e-04 0.0004 0.0001 0.0002 0.0004 0.0003 0.0079
## KS1868         0.0004  1e-04 0.0005 0.0001 0.0002 0.0004 0.0003 0.0061
## KY1851         0.0003  1e-04 0.0003 0.0001 0.0002 0.0002 0.0001 0.0037
## KY1854         0.0003  1e-04 0.0003 0.0000 0.0001 0.0002 0.0001 0.0023
## LA1825         0.0001  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## LA1825french   0.0000  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## LC1867         0.0001  0e+00 0.0001 0.0000 0.0000 0.0001 0.0001 0.0001
## LC1867french   0.0000  0e+00 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## MA1836             NA  5e-04 0.1101 0.0001 0.0001 0.0331 0.0002 0.0069
## MA1851             NA     NA 0.0113 0.0005 0.0005 0.0001 0.0000 0.0001
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
## AK1900         0.0222 0.0002 0.0040 0.0039 0.0033 0.0003 0.0020 0.0005
## AL1852         0.0013 0.0002 0.0002 0.0002 0.0002 0.0006 0.0000 0.0005
## AR1868         0.0050 0.0002 0.0051 0.0049 0.0037 0.0004 0.0025 0.0014
## AR1874         0.0047 0.0012 0.0075 0.0072 0.0065 0.0002 0.0037 0.0014
## AZ1865         0.0400 0.0002 0.0103 0.0072 0.0054 0.0003 0.0043 0.0007
## AZ1887         0.0034 0.0009 0.0025 0.0025 0.0018 0.0008 0.0018 0.0010
## BI1859         0.0002 0.0002 0.0002 0.0002 0.0002 0.0002 0.0000 0.0002
## CA1850         0.0230 0.0003 0.0247 0.0161 0.0101 0.0002 0.0209 0.0012
## CA1851         0.0422 0.0002 0.0116 0.0079 0.0061 0.0002 0.0052 0.0007
## CA1858         0.0338 0.0002 0.0074 0.0054 0.0040 0.0003 0.0017 0.0007
## CA1868         0.0265 0.0001 0.0049 0.0035 0.0028 0.0003 0.0015 0.0004
## CA1868extended 0.0121 0.0001 0.0018 0.0016 0.0012 0.0002 0.0006 0.0003
## CA1872         0.0311 0.0001 0.0045 0.0035 0.0027 0.0004 0.0012 0.0005
## CO1868         0.0008 0.0018 0.0004 0.0007 0.0005 0.0029 0.0000 0.0008
## CO1877         0.0187 0.0003 0.0086 0.0074 0.0053 0.0004 0.0031 0.0006
## CT1854         0.0004 0.0003 0.0003 0.0004 0.0005 0.0004 0.0000 0.0003
## CT1879         0.0002 0.0000 0.0001 0.0008 0.0006 0.0000 0.0017 0.0000
## CT1879extended 0.0003 0.0000 0.0002 0.0005 0.0004 0.0001 0.0002 0.0001
## DC1857         0.0157 0.0003 0.0067 0.0063 0.0044 0.0004 0.0038 0.0008
## DE1852         0.0008 0.0001 0.0001 0.0002 0.0002 0.0002 0.0000 0.0004
## DT1862         0.0116 0.0003 0.0077 0.0076 0.0053 0.0004 0.0030 0.0019
## DT1868         0.0314 0.0002 0.0146 0.0094 0.0059 0.0002 0.0062 0.0007
## DT1887         0.0168 0.0001 0.0036 0.0027 0.0018 0.0003 0.0010 0.0004
## FL1847         0.0047 0.0003 0.0002 0.0003 0.0004 0.0129 0.0000 0.0011
## FL1870         0.0384 0.0002 0.0169 0.0139 0.0090 0.0003 0.0084 0.0008
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
## IA1851         0.0034 0.0002 0.0010 0.0007 0.0007 0.0002 0.0001 0.0003
## IA1859         0.0049 0.0005 0.0025 0.0044 0.0036 0.0003 0.0013 0.0012
## ID1864         0.0261 0.0002 0.0072 0.0048 0.0034 0.0003 0.0024 0.0005
## ID1881         0.0286 0.0001 0.0047 0.0038 0.0029 0.0002 0.0015 0.0005
## IL1866         0.0008 0.0018 0.0005 0.0007 0.0006 0.0045 0.0001 0.0010
## IL1933         0.0006 0.0003 0.0011 0.0013 0.0005 0.0002 0.0001 0.0002
## IN1843         0.0029 0.0017 0.0002 0.0012 0.0008 0.0009 0.0000 0.0008
## IN1852         0.0072 0.0003 0.0045 0.0031 0.0023 0.0005 0.0010 0.0006
## KS1859         0.0117 0.0004 0.0072 0.0072 0.0057 0.0004 0.0020 0.0019
## KS1868         0.0086 0.0003 0.0037 0.0042 0.0034 0.0005 0.0015 0.0017
## KY1851         0.0061 0.0002 0.0075 0.0062 0.0046 0.0003 0.0032 0.0014
## KY1854         0.0041 0.0002 0.0047 0.0039 0.0032 0.0003 0.0022 0.0011
## LA1825         0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000 0.0000
## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000 0.0000
## LC1867         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0000 0.0001
## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## MA1836         0.0105 0.0002 0.0002 0.0002 0.0005 0.0004 0.0000 0.0004
## MA1851         0.0001 0.0001 0.0002 0.0054 0.0024 0.0001 0.0000 0.0001
## MA1858         0.0059 0.0002 0.0002 0.0019 0.0009 0.0004 0.0000 0.0004
## MD1855         0.0001 0.0002 0.0001 0.0000 0.0001 0.0001 0.0001 0.0009
## MD1859         0.0001 0.0002 0.0002 0.0002 0.0002 0.0002 0.0000 0.0004
## ME1840         0.0023 0.0002 0.0001 0.0002 0.0002 0.0004 0.0000 0.0004
## MI1853         0.0005 0.0003 0.0005 0.0009 0.0003 0.0002 0.0002 0.0002
## MN1851         0.1509 0.0007 0.0047 0.0036 0.0027 0.0004 0.0023 0.0004
## MN1859             NA 0.0010 0.0076 0.0060 0.0044 0.0005 0.0048 0.0008
## MO1835             NA     NA 0.0047 0.0635 0.0328 0.0002 0.0001 0.0004
## MO1849             NA     NA     NA 0.0541 0.0232 0.0002 0.0085 0.0007
## MO1856             NA     NA     NA     NA 0.1209 0.0003 0.0082 0.0010
## MO1879             NA     NA     NA     NA     NA 0.0004 0.0053 0.0009
## MS1848             NA     NA     NA     NA     NA     NA 0.0001 0.0125
## MS1850             NA     NA     NA     NA     NA     NA     NA 0.0008
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
## AK1900         0.0147 0.0142 0.0124 0.0134         0.0113 0.0013 0.0044
## AL1852         0.0006 0.0006 0.0007 0.0006         0.0006 0.0003 0.0004
## AR1868         0.0048 0.0044 0.0049 0.0063         0.0049 0.0005 0.0276
## AR1874         0.0047 0.0036 0.0050 0.0062         0.0042 0.0006 0.0310
## AZ1865         0.1445 0.0557 0.0284 0.0399         0.0319 0.0028 0.0086
## AZ1887         0.0080 0.0739 0.0041 0.0044         0.0735 0.0007 0.0024
## BI1859         0.0002 0.0001 0.0002 0.0002         0.0002 0.0001 0.0002
## CA1850         0.0215 0.0092 0.0506 0.0333         0.0216 0.0019 0.0144
## CA1851         0.1312 0.0540 0.0312 0.0431         0.0334 0.0031 0.0103
## CA1858         0.1248 0.0522 0.0236 0.0350         0.0310 0.0023 0.0074
## CA1868         0.0935 0.0506 0.0182 0.0292         0.0276 0.0019 0.0059
## CA1868extended 0.0339 0.0273 0.0077 0.0125         0.0136 0.0008 0.0024
## CA1872         0.0473 0.1920 0.0161 0.0425         0.0925 0.0024 0.0087
## CO1868         0.0006 0.0008 0.0004 0.0007         0.0006 0.0008 0.0005
## CO1877         0.0749 0.0308 0.0173 0.0204         0.0149 0.0020 0.0083
## CT1854         0.0006 0.0002 0.0004 0.0003         0.0003 0.0001 0.0003
## CT1879         0.0002 0.0001 0.0004 0.0004         0.0003 0.0000 0.0004
## CT1879extended 0.0003 0.0003 0.0005 0.0006         0.0005 0.0001 0.0003
## DC1857         0.0205 0.0120 0.0174 0.0192         0.0159 0.0046 0.0305
## DE1852         0.0002 0.0002 0.0003 0.0002         0.0002 0.0002 0.0002
## DT1862         0.0112 0.0072 0.0120 0.0309         0.0215 0.0128 0.3487
## DT1868         0.0158 0.0109 0.1032 0.0867         0.0593 0.0017 0.0113
## DT1887         0.0124 0.0430 0.0274 0.0753         0.1140 0.0026 0.0106
## FL1847         0.0004 0.0004 0.0004 0.0006         0.0006 0.0004 0.0006
## FL1870         0.0206 0.0126 0.1422 0.0848         0.0583 0.0019 0.0136
## FL1892         0.0005 0.0015 0.0023 0.0027         0.0024 0.0003 0.0006
## FR1806         0.0000 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
## GA1851         0.0002 0.0002 0.0003 0.0002         0.0003 0.0002 0.0002
## GA1860         0.0003 0.0003 0.0003 0.0003         0.0003 0.0003 0.0003
## GB1852         0.0002 0.0001 0.0001 0.0001         0.0001 0.0001 0.0002
## GB1854         0.0001 0.0001 0.0001 0.0001         0.0001 0.0001 0.0001
## GB1873         0.0001 0.0001 0.0000 0.0001         0.0000 0.0000 0.0000
## GB1875         0.0001 0.0001 0.0001 0.0001         0.0001 0.0001 0.0001
## HI1859         0.0026 0.0010 0.0019 0.0019         0.0012 0.0004 0.0019
## HI1897         0.0024 0.0012 0.0023 0.0021         0.0015 0.0004 0.0016
## IA1839         0.0002 0.0001 0.0001 0.0002         0.0001 0.0003 0.0003
## IA1851         0.0023 0.0024 0.0014 0.0029         0.0023 0.1780 0.0091
## IA1859         0.0042 0.0039 0.0041 0.0068         0.0056 0.0702 0.0214
## ID1864         0.1445 0.0371 0.0174 0.0248         0.0222 0.0020 0.0066
## ID1881         0.0450 0.1099 0.0153 0.0420         0.0409 0.0023 0.0080
## IL1866         0.0005 0.0010 0.0004 0.0007         0.0006 0.0004 0.0005
## IL1933         0.0006 0.0003 0.0011 0.0008         0.0006 0.0002 0.0008
## IN1843         0.0007 0.0006 0.0007 0.0007         0.0007 0.0010 0.0007
## IN1852         0.0053 0.0043 0.0090 0.0075         0.0061 0.0032 0.0086
## KS1859         0.0138 0.0070 0.0126 0.0268         0.0188 0.0056 0.2656
## KS1868         0.0095 0.0071 0.0088 0.0182         0.0146 0.0056 0.1291
## KY1851         0.0056 0.0053 0.0062 0.0085         0.0061 0.0006 0.0450
## KY1854         0.0037 0.0039 0.0041 0.0057         0.0044 0.0005 0.0306
## LA1825         0.0001 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
## LA1825french   0.0000 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
## LC1867         0.0001 0.0002 0.0001 0.0001         0.0001 0.0001 0.0001
## LC1867french   0.0000 0.0000 0.0000 0.0000         0.0000 0.0000 0.0000
## MA1836         0.0003 0.0006 0.0004 0.0006         0.0006 0.0004 0.0004
## MA1851         0.0001 0.0001 0.0001 0.0001         0.0001 0.0001 0.0001
## MA1858         0.0004 0.0006 0.0004 0.0005         0.0006 0.0004 0.0004
## MD1855         0.0001 0.0000 0.0001 0.0001         0.0001 0.0001 0.0001
## MD1859         0.0002 0.0001 0.0002 0.0001         0.0001 0.0001 0.0002
## ME1840         0.0003 0.0004 0.0004 0.0005         0.0005 0.0003 0.0004
## MI1853         0.0006 0.0001 0.0007 0.0004         0.0003 0.0002 0.0003
## MN1851         0.0147 0.0141 0.0189 0.0225         0.0176 0.0056 0.0071
## MN1859         0.0262 0.0227 0.0331 0.0401         0.0312 0.0103 0.0109
## MO1835         0.0003 0.0001 0.0002 0.0002         0.0002 0.0003 0.0003
## MO1849         0.0080 0.0035 0.0147 0.0092         0.0061 0.0013 0.0069
## MO1856         0.0066 0.0028 0.0113 0.0076         0.0052 0.0011 0.0064
## MO1879         0.0050 0.0022 0.0075 0.0051         0.0036 0.0011 0.0046
## MS1848         0.0004 0.0004 0.0003 0.0004         0.0004 0.0003 0.0004
## MS1850         0.0024 0.0007 0.0066 0.0043         0.0026 0.0001 0.0028
## MS1857         0.0007 0.0005 0.0010 0.0007         0.0006 0.0005 0.0020
## MT1865             NA 0.0359 0.0174 0.0272         0.0221 0.0025 0.0093
## MT1895             NA     NA 0.0122 0.0337         0.0693 0.0024 0.0068
## NC1868             NA     NA     NA 0.0725         0.0525 0.0015 0.0117
## ND1877             NA     NA     NA     NA         0.5927 0.0058 0.0281
## ND1877extended     NA     NA     NA     NA             NA 0.0045 0.0198
## NE1857             NA     NA     NA     NA             NA     NA 0.0119
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
## AK1900         0.0038 0.0002 0.0002 0.0001 0.0050 0.0194 0.0169 0.0071
## AL1852         0.0003 0.0001 0.0002 0.0004 0.0005 0.0006 0.0007 0.0002
## AR1868         0.0185 0.0002 0.0002 0.0002 0.0049 0.0051 0.0044 0.0037
## AR1874         0.0184 0.0001 0.0001 0.0002 0.0061 0.0053 0.0046 0.0050
## AZ1865         0.0087 0.0002 0.0002 0.0002 0.0048 0.2528 0.2363 0.0211
## AZ1887         0.0021 0.0002 0.0003 0.0004 0.0034 0.0111 0.0108 0.0027
## BI1859         0.0002 0.0001 0.0002 0.0001 0.0002 0.0002 0.0002 0.0002
## CA1850         0.0075 0.0001 0.0002 0.0004 0.0059 0.0324 0.0271 0.0535
## CA1851         0.0090 0.0002 0.0002 0.0002 0.0058 0.2334 0.2072 0.0239
## CA1858         0.0079 0.0002 0.0002 0.0002 0.0035 0.2263 0.1912 0.0168
## CA1868         0.0062 0.0001 0.0002 0.0001 0.0030 0.1566 0.1504 0.0113
## CA1868extended 0.0029 0.0001 0.0001 0.0000 0.0016 0.0566 0.0533 0.0041
## CA1872         0.0067 0.0002 0.0002 0.0001 0.0041 0.0807 0.0758 0.0102
## CO1868         0.0016 0.0003 0.0026 0.0004 0.0014 0.0004 0.0004 0.0002
## CO1877         0.0061 0.0001 0.0002 0.0003 0.0049 0.0999 0.0901 0.0121
## CT1854         0.0003 0.0003 0.0002 0.0003 0.0003 0.0003 0.0004 0.0003
## CT1879         0.0002 0.0000 0.0000 0.0000 0.0004 0.0002 0.0002 0.0004
## CT1879extended 0.0003 0.0001 0.0001 0.0000 0.0004 0.0003 0.0003 0.0004
## DC1857         0.0217 0.0003 0.0003 0.0004 0.0053 0.0253 0.0237 0.0102
## DE1852         0.0002 0.0002 0.0003 0.0001 0.0003 0.0002 0.0002 0.0002
## DT1862         0.1872 0.0002 0.0005 0.0003 0.0098 0.0100 0.0097 0.0074
## DT1868         0.0061 0.0001 0.0002 0.0002 0.0090 0.0232 0.0211 0.0457
## DT1887         0.0083 0.0001 0.0002 0.0001 0.0033 0.0182 0.0174 0.0118
## FL1847         0.0007 0.0003 0.0005 0.0004 0.0010 0.0004 0.0003 0.0002
## FL1870         0.0080 0.0002 0.0002 0.0001 0.0115 0.0310 0.0284 0.0575
## FL1892         0.0006 0.0002 0.0006 0.0004 0.0012 0.0007 0.0007 0.0012
## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## GA1851         0.0003 0.0002 0.0004 0.0002 0.0005 0.0002 0.0002 0.0001
## GA1860         0.0004 0.0002 0.0003 0.0002 0.0013 0.0004 0.0003 0.0001
## GB1852         0.0001 0.0001 0.0009 0.0001 0.0002 0.0001 0.0001 0.0001
## GB1854         0.0001 0.0000 0.0001 0.0001 0.0015 0.0001 0.0001 0.0000
## GB1873         0.0001 0.0001 0.0001 0.0000 0.0001 0.0001 0.0000 0.0000
## GB1875         0.0001 0.0001 0.0001 0.0000 0.0001 0.0001 0.0001 0.0001
## HI1859         0.0005 0.0000 0.0001 0.0001 0.0008 0.0044 0.0035 0.0016
## HI1897         0.0007 0.0003 0.0010 0.0002 0.0024 0.0036 0.0028 0.0016
## IA1839         0.0003 0.0001 0.0009 0.0003 0.0002 0.0001 0.0001 0.0001
## IA1851         0.0213 0.0002 0.0002 0.0002 0.0030 0.0025 0.0025 0.0009
## IA1859         0.0258 0.0002 0.0002 0.0002 0.0074 0.0043 0.0041 0.0028
## ID1864         0.0068 0.0001 0.0002 0.0002 0.0031 0.2248 0.1332 0.0127
## ID1881         0.0060 0.0001 0.0002 0.0001 0.0046 0.0721 0.0704 0.0104
## IL1866         0.0015 0.0003 0.0052 0.0005 0.0019 0.0004 0.0004 0.0002
## IL1933         0.0007 0.0001 0.0002 0.0002 0.0006 0.0005 0.0005 0.0009
## IN1843         0.0024 0.0003 0.0006 0.0002 0.0016 0.0007 0.0006 0.0002
## IN1852         0.0067 0.0003 0.0003 0.0033 0.0042 0.0059 0.0059 0.0048
## KS1859         0.1761 0.0002 0.0004 0.0002 0.0091 0.0114 0.0109 0.0074
## KS1868         0.1246 0.0002 0.0004 0.0002 0.0070 0.0090 0.0088 0.0042
## KY1851         0.0241 0.0001 0.0002 0.0002 0.0057 0.0057 0.0051 0.0053
## KY1854         0.0161 0.0001 0.0002 0.0002 0.0042 0.0041 0.0035 0.0038
## LA1825         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## LC1867         0.0001 0.0001 0.0001 0.0000 0.0001 0.0001 0.0001 0.0001
## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## MA1836         0.0005 0.0008 0.0002 0.0002 0.0009 0.0003 0.0003 0.0002
## MA1851         0.0001 0.0001 0.0000 0.0000 0.0004 0.0001 0.0001 0.0001
## MA1858         0.0006 0.0007 0.0002 0.0001 0.0010 0.0003 0.0003 0.0002
## MD1855         0.0001 0.0000 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
## MD1859         0.0002 0.0001 0.0002 0.0002 0.0002 0.0001 0.0001 0.0001
## ME1840         0.0004 0.0014 0.0002 0.0002 0.0006 0.0003 0.0003 0.0002
## MI1853         0.0003 0.0001 0.0001 0.0001 0.0004 0.0005 0.0004 0.0008
## MN1851         0.0070 0.0002 0.0011 0.0001 0.0058 0.0217 0.0199 0.0125
## MN1859         0.0117 0.0003 0.0003 0.0003 0.0107 0.0385 0.0330 0.0213
## MO1835         0.0004 0.0001 0.0004 0.0003 0.0058 0.0002 0.0002 0.0001
## MO1849         0.0038 0.0001 0.0001 0.0002 0.0061 0.0098 0.0088 0.0282
## MO1856         0.0042 0.0001 0.0003 0.0004 0.0244 0.0075 0.0073 0.0141
## MO1879         0.0032 0.0001 0.0003 0.0006 0.0219 0.0056 0.0050 0.0095
## MS1848         0.0006 0.0002 0.0012 0.0004 0.0007 0.0003 0.0003 0.0002
## MS1850         0.0013 0.0000 0.0000 0.0002 0.0037 0.0038 0.0027 0.0092
## MS1857         0.0014 0.0003 0.0015 0.0004 0.0009 0.0008 0.0007 0.0006
## MT1865         0.0095 0.0001 0.0002 0.0003 0.0038 0.1869 0.1331 0.0120
## MT1895         0.0061 0.0002 0.0002 0.0001 0.0036 0.0570 0.0551 0.0072
## NC1868         0.0072 0.0002 0.0002 0.0002 0.0096 0.0266 0.0240 0.0395
## ND1877         0.0184 0.0002 0.0002 0.0002 0.0080 0.0368 0.0365 0.0301
## ND1877extended 0.0148 0.0002 0.0002 0.0002 0.0064 0.0323 0.0307 0.0202
## NE1857         0.0444 0.0001 0.0002 0.0002 0.0027 0.0026 0.0028 0.0012
## NE1859         0.1764 0.0002 0.0004 0.0003 0.0093 0.0091 0.0087 0.0076
## NE1866             NA 0.0002 0.0005 0.0002 0.0063 0.0094 0.0085 0.0042
## NH1842             NA     NA 0.0002 0.0001 0.0003 0.0002 0.0002 0.0001
## NJ1847             NA     NA     NA 0.0002 0.0003 0.0002 0.0002 0.0001
## NM1865             NA     NA     NA     NA 0.0456 0.0003 0.0002 0.0001
## NM1897             NA     NA     NA     NA     NA 0.0054 0.0047 0.0055
## NV1861             NA     NA     NA     NA     NA     NA 0.2325 0.0191
## NV1869             NA     NA     NA     NA     NA     NA     NA 0.0169
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
## AK1900         0.0113 0.0268 0.0123 0.0222 0.0017 0.0014 0.0044
## AL1852         0.0005 0.0013 0.0007 0.0012 0.0003 0.0002 0.0004
## AR1868         0.0041 0.0060 0.0044 0.0050 0.0010 0.0008 0.0296
## AR1874         0.0045 0.0042 0.0051 0.0037 0.0008 0.0006 0.0325
## AZ1865         0.0299 0.0486 0.0299 0.0444 0.0021 0.0017 0.0091
## AZ1887         0.0032 0.0034 0.0039 0.0032 0.0006 0.0005 0.0027
## BI1859         0.0002 0.0001 0.0002 0.0001 0.0001 0.0001 0.0002
## CA1850         0.0764 0.0224 0.0627 0.0212 0.0023 0.0017 0.0146
## CA1851         0.0352 0.0543 0.0345 0.0492 0.0024 0.0019 0.0113
## CA1858         0.0248 0.0464 0.0260 0.0420 0.0021 0.0016 0.0082
## CA1868         0.0179 0.0349 0.0183 0.0313 0.0017 0.0013 0.0063
## CA1868extended 0.0070 0.0185 0.0072 0.0158 0.0011 0.0009 0.0025
## CA1872         0.0167 0.0769 0.0174 0.0474 0.0037 0.0026 0.0086
## CO1868         0.0003 0.0003 0.0003 0.0003 0.0002 0.0002 0.0005
## CO1877         0.0157 0.0206 0.0185 0.0190 0.0014 0.0011 0.0082
## CT1854         0.0003 0.0002 0.0003 0.0002 0.0001 0.0001 0.0007
## CT1879         0.0003 0.0001 0.0003 0.0001 0.0002 0.0001 0.0004
## CT1879extended 0.0003 0.0003 0.0004 0.0003 0.0003 0.0002 0.0004
## DC1857         0.0150 0.0164 0.0167 0.0152 0.0017 0.0013 0.0317
## DE1852         0.0001 0.0002 0.0002 0.0002 0.0001 0.0001 0.0002
## DT1862         0.0117 0.0121 0.0134 0.0107 0.0014 0.0010 0.3006
## DT1868         0.0867 0.0325 0.1012 0.0318 0.0043 0.0032 0.0117
## DT1887         0.0225 0.0188 0.0251 0.0176 0.0026 0.0019 0.0097
## FL1847         0.0002 0.0003 0.0002 0.0003 0.0002 0.0002 0.0006
## FL1870         0.1098 0.0405 0.1298 0.0392 0.0044 0.0033 0.0148
## FL1892         0.0038 0.0015 0.0028 0.0015 0.0008 0.0005 0.0006
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
## IA1859         0.0036 0.0053 0.0038 0.0048 0.0009 0.0008 0.0190
## ID1864         0.0184 0.0297 0.0182 0.0273 0.0016 0.0013 0.0066
## ID1881         0.0154 0.0427 0.0162 0.0357 0.0032 0.0023 0.0084
## IL1866         0.0004 0.0003 0.0003 0.0003 0.0002 0.0002 0.0005
## IL1933         0.0010 0.0004 0.0011 0.0005 0.0003 0.0003 0.0009
## IN1843         0.0005 0.0010 0.0005 0.0010 0.0004 0.0003 0.0007
## IN1852         0.0073 0.0079 0.0085 0.0071 0.0010 0.0008 0.0083
## KS1859         0.0124 0.0119 0.0141 0.0112 0.0014 0.0010 0.2952
## KS1868         0.0081 0.0130 0.0092 0.0118 0.0013 0.0010 0.1385
## KY1851         0.0062 0.0076 0.0064 0.0062 0.0013 0.0010 0.0478
## KY1854         0.0035 0.0056 0.0039 0.0044 0.0009 0.0007 0.0302
## LA1825         0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000
## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## LC1867         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
## LC1867french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000
## MA1836         0.0003 0.0005 0.0004 0.0005 0.0003 0.0003 0.0004
## MA1851         0.0001 0.0000 0.0001 0.0000 0.0000 0.0000 0.0002
## MA1858         0.0004 0.0006 0.0003 0.0005 0.0004 0.0004 0.0004
## MD1855         0.0001 0.0000 0.0001 0.0000 0.0000 0.0000 0.0001
## MD1859         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0003
## ME1840         0.0003 0.0004 0.0003 0.0004 0.0003 0.0002 0.0004
## MI1853         0.0009 0.0004 0.0007 0.0003 0.0002 0.0001 0.0003
## MN1851         0.0219 0.0562 0.0209 0.0508 0.0021 0.0015 0.0074
## MN1859         0.0371 0.1052 0.0350 0.0917 0.0034 0.0026 0.0114
## MO1835         0.0002 0.0001 0.0002 0.0001 0.0002 0.0002 0.0004
## MO1849         0.0208 0.0069 0.0186 0.0061 0.0011 0.0008 0.0072
## MO1856         0.0117 0.0046 0.0117 0.0044 0.0011 0.0007 0.0071
## MO1879         0.0072 0.0032 0.0069 0.0031 0.0008 0.0006 0.0052
## MS1848         0.0002 0.0003 0.0002 0.0003 0.0002 0.0002 0.0004
## MS1850         0.0134 0.0021 0.0081 0.0018 0.0004 0.0003 0.0031
## MS1857         0.0007 0.0005 0.0009 0.0004 0.0003 0.0003 0.0020
## MT1865         0.0173 0.0299 0.0182 0.0281 0.0017 0.0013 0.0106
## MT1895         0.0113 0.0526 0.0122 0.0331 0.0120 0.0093 0.0067
## NC1868         0.0811 0.0351 0.0934 0.0330 0.0040 0.0029 0.0130
## ND1877         0.0576 0.0379 0.0667 0.0357 0.0051 0.0038 0.0264
## ND1877extended 0.0402 0.0326 0.0465 0.0301 0.0044 0.0033 0.0186
## NE1857         0.0015 0.0037 0.0022 0.0031 0.0005 0.0004 0.0050
## NE1859         0.0117 0.0122 0.0135 0.0106 0.0015 0.0012 0.3386
## NE1866         0.0071 0.0119 0.0077 0.0107 0.0012 0.0009 0.1572
## NH1842         0.0001 0.0002 0.0002 0.0002 0.0001 0.0001 0.0003
## NJ1847         0.0001 0.0002 0.0002 0.0002 0.0002 0.0001 0.0005
## NM1865         0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0002
## NM1897         0.0057 0.0059 0.0081 0.0057 0.0012 0.0010 0.0105
## NV1861         0.0272 0.0447 0.0275 0.0404 0.0022 0.0018 0.0092
## NV1869         0.0237 0.0406 0.0250 0.0371 0.0021 0.0016 0.0091
## NY1848         0.0923 0.0271 0.0756 0.0233 0.0027 0.0020 0.0078
## NY1849             NA 0.0462 0.2030 0.0418 0.0047 0.0034 0.0130
## NY1850             NA     NA 0.0476 0.3980 0.0054 0.0039 0.0128
## NY1851             NA     NA     NA 0.0456 0.0052 0.0037 0.0146
## NY1853             NA     NA     NA     NA 0.0053 0.0038 0.0113
## NY1876             NA     NA     NA     NA     NA 0.3107 0.0016
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
## AK1900                 0.0044 0.0019 0.0038 0.0044 0.0287 0.1341 0.0139
## AL1852                 0.0004 0.0004 0.0005 0.0004 0.0008 0.0006 0.0005
## AR1868                 0.0247 0.0076 0.0083 0.0189 0.0039 0.0040 0.0048
## AR1874                 0.0238 0.0054 0.0098 0.0176 0.0040 0.0030 0.0054
## AZ1865                 0.0110 0.0036 0.0097 0.0086 0.0647 0.0314 0.0292
## AZ1887                 0.0023 0.0014 0.0022 0.0021 0.0034 0.0030 0.0044
## BI1859                 0.0002 0.0001 0.0002 0.0002 0.0002 0.0001 0.0002
## CA1850                 0.0106 0.0024 0.0077 0.0076 0.0293 0.0182 0.0538
## CA1851                 0.0122 0.0037 0.0102 0.0093 0.0638 0.0313 0.0312
## CA1858                 0.0099 0.0034 0.0120 0.0080 0.0490 0.0266 0.0228
## CA1868                 0.0078 0.0030 0.0101 0.0062 0.0357 0.0199 0.0162
## CA1868extended         0.0033 0.0019 0.0043 0.0030 0.0144 0.0097 0.0065
## CA1872                 0.0092 0.0039 0.0160 0.0080 0.0286 0.0378 0.0170
## CO1868                 0.0005 0.0005 0.0006 0.0006 0.0009 0.0004 0.0003
## CO1877                 0.0065 0.0023 0.0080 0.0067 0.0245 0.0128 0.0190
## CT1854                 0.0006 0.0002 0.0002 0.0005 0.0003 0.0002 0.0003
## CT1879                 0.0003 0.0001 0.0001 0.0002 0.0002 0.0002 0.0006
## CT1879extended         0.0004 0.0003 0.0003 0.0004 0.0003 0.0003 0.0005
## DC1857                 0.0281 0.0089 0.0325 0.0243 0.0333 0.0139 0.0183
## DE1852                 0.0003 0.0003 0.0004 0.0002 0.0004 0.0002 0.0002
## DT1862                 0.2238 0.0350 0.0095 0.1375 0.0092 0.0063 0.0120
## DT1868                 0.0091 0.0026 0.0073 0.0072 0.0314 0.0188 0.1323
## DT1887                 0.0094 0.0036 0.0163 0.0088 0.0156 0.0107 0.0292
## FL1847                 0.0007 0.0006 0.0008 0.0006 0.0014 0.0004 0.0003
## FL1870                 0.0118 0.0034 0.0093 0.0097 0.0382 0.0239 0.1625
## FL1892                 0.0007 0.0006 0.0009 0.0007 0.0015 0.0009 0.0028
## FR1806                 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## GA1851                 0.0004 0.0004 0.0003 0.0003 0.0002 0.0002 0.0001
## GA1860                 0.0004 0.0004 0.0007 0.0004 0.0003 0.0003 0.0002
## GB1852                 0.0001 0.0001 0.0001 0.0001 0.0002 0.0001 0.0001
## GB1854                 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0000
## GB1873                 0.0001 0.0000 0.0001 0.0001 0.0001 0.0000 0.0001
## GB1875                 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
## HI1859                 0.0014 0.0004 0.0007 0.0008 0.0016 0.0005 0.0024
## HI1897                 0.0013 0.0005 0.0008 0.0010 0.0021 0.0008 0.0027
## IA1839                 0.0004 0.0002 0.0002 0.0003 0.0015 0.0001 0.0001
## IA1851                 0.0017 0.0007 0.0037 0.0025 0.0027 0.0026 0.0014
## IA1859                 0.0163 0.0056 0.0073 0.0130 0.0042 0.0041 0.0044
## ID1864                 0.0075 0.0027 0.0099 0.0063 0.0423 0.0215 0.0176
## ID1881                 0.0083 0.0031 0.0143 0.0072 0.0297 0.0230 0.0173
## IL1866                 0.0006 0.0005 0.0006 0.0005 0.0011 0.0004 0.0003
## IL1933                 0.0007 0.0004 0.0006 0.0006 0.0006 0.0004 0.0009
## IN1843                 0.0033 0.0019 0.0083 0.0028 0.0027 0.0010 0.0004
## IN1852                 0.0072 0.0045 0.1064 0.0128 0.0058 0.0052 0.0086
## KS1859                 0.2219 0.0348 0.0099 0.1668 0.0100 0.0069 0.0127
## KS1868                 0.1615 0.0407 0.0102 0.2359 0.0075 0.0057 0.0084
## KY1851                 0.0375 0.0089 0.0101 0.0235 0.0049 0.0047 0.0064
## KY1854                 0.0250 0.0072 0.0076 0.0170 0.0035 0.0035 0.0040
## LA1825                 0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000
## LA1825french           0.0000 0.0001 0.0000 0.0000 0.0000 0.0001 0.0000
## LC1867                 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
## LC1867french           0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000
## MA1836                 0.0008 0.0010 0.0007 0.0005 0.0041 0.0006 0.0003
## MA1851                 0.0001 0.0001 0.0001 0.0001 0.0002 0.0000 0.0001
## MA1858                 0.0006 0.0009 0.0007 0.0006 0.0020 0.0006 0.0003
## MD1855                 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001 0.0001
## MD1859                 0.0002 0.0001 0.0001 0.0002 0.0002 0.0001 0.0001
## ME1840                 0.0004 0.0009 0.0009 0.0005 0.0011 0.0005 0.0003
## MI1853                 0.0003 0.0002 0.0001 0.0003 0.0003 0.0002 0.0007
## MN1851                 0.0064 0.0022 0.0039 0.0060 0.0407 0.0207 0.0205
## MN1859                 0.0099 0.0033 0.0071 0.0090 0.0713 0.0372 0.0338
## MO1835                 0.0004 0.0002 0.0003 0.0003 0.0024 0.0002 0.0002
## MO1849                 0.0052 0.0013 0.0033 0.0033 0.0099 0.0050 0.0175
## MO1856                 0.0053 0.0018 0.0027 0.0039 0.0086 0.0051 0.0138
## MO1879                 0.0040 0.0013 0.0021 0.0035 0.0052 0.0037 0.0085
## MS1848                 0.0006 0.0005 0.0005 0.0005 0.0005 0.0003 0.0002
## MS1850                 0.0021 0.0005 0.0008 0.0015 0.0055 0.0029 0.0077
## MS1857                 0.0017 0.0007 0.0006 0.0014 0.0010 0.0006 0.0008
## MT1865                 0.0113 0.0036 0.0094 0.0095 0.0428 0.0214 0.0179
## MT1895                 0.0072 0.0052 0.0120 0.0068 0.0226 0.0316 0.0128
## NC1868                 0.0108 0.0034 0.0080 0.0084 0.0339 0.0215 0.1236
## ND1877                 0.0216 0.0061 0.0077 0.0191 0.0394 0.0232 0.0835
## ND1877extended         0.0173 0.0061 0.0217 0.0155 0.0290 0.0189 0.0577
## NE1857                 0.0050 0.0010 0.0034 0.0051 0.0078 0.0021 0.0019
## NE1859                 0.2520 0.0357 0.0092 0.1328 0.0089 0.0064 0.0117
## NE1866                 0.1799 0.0412 0.0090 0.1157 0.0094 0.0049 0.0074
## NH1842                 0.0003 0.0002 0.0002 0.0002 0.0003 0.0002 0.0001
## NJ1847                 0.0005 0.0003 0.0003 0.0004 0.0012 0.0002 0.0002
## NM1865                 0.0002 0.0001 0.0025 0.0003 0.0007 0.0001 0.0001
## NM1897                 0.0089 0.0029 0.0043 0.0068 0.0115 0.0063 0.0106
## NV1861                 0.0106 0.0036 0.0139 0.0085 0.0621 0.0289 0.0277
## NV1869                 0.0102 0.0035 0.0126 0.0081 0.0523 0.0268 0.0248
## NY1848                 0.0059 0.0016 0.0048 0.0042 0.0209 0.0123 0.0507
## NY1849                 0.0105 0.0027 0.0072 0.0074 0.0338 0.0197 0.0974
## NY1850                 0.0170 0.0057 0.0078 0.0127 0.0374 0.0642 0.0365
## NY1851                 0.0117 0.0030 0.0081 0.0090 0.0385 0.0209 0.1139
## NY1853                 0.0150 0.0049 0.0073 0.0116 0.0344 0.0421 0.0357
## NY1876                 0.0015 0.0011 0.0012 0.0014 0.0025 0.0027 0.0049
## NY1879                 0.0011 0.0008 0.0010 0.0010 0.0019 0.0021 0.0036
## OH1853                 0.6374 0.0381 0.0085 0.1353 0.0090 0.0065 0.0128
## OH1853extended             NA 0.0626 0.0097 0.1550 0.0074 0.0059 0.0101
## OH1879                     NA     NA 0.0038 0.0392 0.0028 0.0025 0.0029
## OK1891                     NA     NA     NA 0.0108 0.0063 0.0050 0.0082
## OK1893                     NA     NA     NA     NA 0.0067 0.0057 0.0081
## OR1854                     NA     NA     NA     NA     NA 0.0563 0.0373
## OR1862                     NA     NA     NA     NA     NA     NA 0.0233
## SC1870                     NA     NA     NA     NA     NA     NA     NA
## TN1858                     NA     NA     NA     NA     NA     NA     NA
## UT1853                     NA     NA     NA     NA     NA     NA     NA
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
##                TN1858 UT1853 UT1870 UT1884 VA1841 VA1860 WA1855 WA1873
## AK1900         0.0006 0.0000 0.0105 0.0054 0.0001 0.0002 0.0132 0.0103
## AL1852         0.0031 0.0000 0.0005 0.0003 0.0002 0.0002 0.0004 0.0004
## AR1868         0.0004 0.0001 0.0027 0.0024 0.0001 0.0005 0.0050 0.0034
## AR1874         0.0003 0.0001 0.0029 0.0023 0.0001 0.0001 0.0054 0.0033
## AZ1865         0.0006 0.0001 0.1154 0.0263 0.0001 0.0002 0.0346 0.0177
## AZ1887         0.0004 0.0000 0.0063 0.0030 0.0004 0.0002 0.0036 0.0121
## BI1859         0.0001 0.0000 0.0001 0.0001 0.0002 0.0001 0.0002 0.0002
## CA1850         0.0003 0.0001 0.0158 0.0057 0.0001 0.0001 0.0265 0.0141
## CA1851         0.0006 0.0000 0.1041 0.0254 0.0001 0.0002 0.0349 0.0183
## CA1858         0.0006 0.0000 0.0969 0.0217 0.0001 0.0002 0.0278 0.0139
## CA1868         0.0005 0.0000 0.0778 0.0201 0.0001 0.0002 0.0210 0.0112
## CA1868extended 0.0003 0.0000 0.0288 0.0093 0.0000 0.0001 0.0084 0.0048
## CA1872         0.0007 0.0000 0.0405 0.0456 0.0001 0.0002 0.0140 0.0158
## CO1868         0.0005 0.0001 0.0003 0.0002 0.0006 0.0003 0.0005 0.0006
## CO1877         0.0004 0.0000 0.0483 0.0138 0.0001 0.0002 0.0161 0.0111
## CT1854         0.0002 0.0001 0.0002 0.0001 0.0003 0.0001 0.0003 0.0003
## CT1879         0.0000 0.0000 0.0001 0.0001 0.0000 0.0000 0.0002 0.0001
## CT1879extended 0.0001 0.0000 0.0002 0.0001 0.0000 0.0001 0.0003 0.0002
## DC1857         0.0005 0.0000 0.0143 0.0060 0.0001 0.0017 0.0348 0.0176
## DE1852         0.0002 0.0000 0.0001 0.0001 0.0001 0.0002 0.0003 0.0003
## DT1862         0.0005 0.0000 0.0055 0.0044 0.0002 0.0003 0.0078 0.0051
## DT1868         0.0004 0.0001 0.0117 0.0059 0.0001 0.0002 0.0206 0.0132
## DT1887         0.0005 0.0000 0.0104 0.0090 0.0001 0.0002 0.0081 0.0093
## FL1847         0.0006 0.0001 0.0002 0.0001 0.0009 0.0002 0.0015 0.0010
## FL1870         0.0004 0.0001 0.0166 0.0066 0.0001 0.0002 0.0266 0.0158
## FL1892         0.0005 0.0000 0.0005 0.0006 0.0005 0.0009 0.0009 0.0011
## FR1806         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## GA1851         0.0003 0.0001 0.0002 0.0001 0.0007 0.0003 0.0003 0.0003
## GA1860         0.0004 0.0000 0.0002 0.0001 0.0002 0.0004 0.0004 0.0004
## GB1852         0.0001 0.0000 0.0001 0.0001 0.0002 0.0002 0.0001 0.0001
## GB1854         0.0000 0.0000 0.0000 0.0000 0.0001 0.0000 0.0001 0.0001
## GB1873         0.0000 0.0000 0.0000 0.0000 0.0001 0.0001 0.0000 0.0001
## GB1875         0.0001 0.0000 0.0001 0.0001 0.0000 0.0001 0.0001 0.0001
## HI1859         0.0001 0.0001 0.0022 0.0013 0.0001 0.0000 0.0021 0.0009
## HI1897         0.0002 0.0001 0.0017 0.0012 0.0006 0.0002 0.0021 0.0012
## IA1839         0.0001 0.0001 0.0001 0.0001 0.0003 0.0001 0.0002 0.0002
## IA1851         0.0050 0.0031 0.0015 0.0013 0.0001 0.0002 0.0022 0.0013
## IA1859         0.0044 0.0015 0.0028 0.0018 0.0001 0.0003 0.0042 0.0029
## ID1864         0.0006 0.0000 0.0789 0.0171 0.0001 0.0002 0.0234 0.0147
## ID1881         0.0006 0.0000 0.0396 0.0593 0.0001 0.0002 0.0141 0.0098
## IL1866         0.0006 0.0001 0.0003 0.0002 0.0006 0.0003 0.0004 0.0005
## IL1933         0.0002 0.0000 0.0003 0.0002 0.0001 0.0001 0.0006 0.0004
## IN1843         0.0006 0.0000 0.0004 0.0002 0.0003 0.0003 0.0018 0.0013
## IN1852         0.0006 0.0000 0.0034 0.0019 0.0001 0.0003 0.0314 0.0234
## KS1859         0.0005 0.0000 0.0062 0.0044 0.0002 0.0003 0.0083 0.0055
## KS1868         0.0009 0.0001 0.0053 0.0039 0.0001 0.0003 0.0115 0.0076
## KY1851         0.0004 0.0000 0.0030 0.0030 0.0001 0.0006 0.0060 0.0044
## KY1854         0.0004 0.0000 0.0023 0.0024 0.0001 0.0005 0.0043 0.0029
## LA1825         0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0001
## LA1825french   0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## LC1867         0.0001 0.0000 0.0001 0.0001 0.0000 0.0001 0.0001 0.0001
## LC1867french   0.0001 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
## MA1836         0.0004 0.0000 0.0002 0.0005 0.0001 0.0011 0.0016 0.0010
## MA1851         0.0000 0.0000 0.0001 0.0000 0.0000 0.0000 0.0003 0.0002
## MA1858         0.0004 0.0000 0.0002 0.0003 0.0001 0.0010 0.0012 0.0009
## MD1855         0.0001 0.0000 0.0001 0.0000 0.0000 0.0001 0.0001 0.0001
## MD1859         0.0001 0.0001 0.0001 0.0001 0.0002 0.0001 0.0001 0.0001
## ME1840         0.0004 0.0001 0.0002 0.0002 0.0001 0.0003 0.0008 0.0008
## MI1853         0.0001 0.0000 0.0004 0.0001 0.0001 0.0001 0.0002 0.0002
## MN1851         0.0006 0.0001 0.0110 0.0076 0.0001 0.0002 0.0131 0.0089
## MN1859         0.0009 0.0001 0.0182 0.0119 0.0001 0.0002 0.0231 0.0147
## MO1835         0.0004 0.0001 0.0002 0.0001 0.0004 0.0001 0.0003 0.0002
## MO1849         0.0002 0.0001 0.0052 0.0018 0.0001 0.0001 0.0065 0.0046
## MO1856         0.0002 0.0000 0.0046 0.0013 0.0003 0.0001 0.0046 0.0031
## MO1879         0.0002 0.0000 0.0033 0.0009 0.0002 0.0002 0.0035 0.0024
## MS1848         0.0006 0.0001 0.0002 0.0001 0.0116 0.0007 0.0004 0.0005
## MS1850         0.0000 0.0000 0.0027 0.0005 0.0001 0.0000 0.0053 0.0030
## MS1857         0.0006 0.0001 0.0006 0.0002 0.0062 0.0008 0.0009 0.0007
## MT1865         0.0007 0.0001 0.0700 0.0162 0.0001 0.0002 0.0241 0.0149
## MT1895         0.0006 0.0000 0.0299 0.0386 0.0001 0.0002 0.0111 0.0127
## NC1868         0.0005 0.0001 0.0139 0.0060 0.0002 0.0003 0.0229 0.0148
## ND1877         0.0006 0.0000 0.0206 0.0167 0.0001 0.0003 0.0192 0.0134
## ND1877extended 0.0006 0.0000 0.0175 0.0148 0.0001 0.0003 0.0148 0.0154
## NE1857         0.0049 0.0038 0.0017 0.0012 0.0001 0.0002 0.0031 0.0018
## NE1859         0.0005 0.0000 0.0051 0.0040 0.0002 0.0003 0.0072 0.0049
## NE1866         0.0014 0.0000 0.0057 0.0028 0.0002 0.0002 0.0057 0.0036
## NH1842         0.0002 0.0000 0.0001 0.0001 0.0001 0.0001 0.0002 0.0002
## NJ1847         0.0002 0.0000 0.0001 0.0001 0.0007 0.0003 0.0002 0.0003
## NM1865         0.0002 0.0001 0.0001 0.0001 0.0005 0.0001 0.0005 0.0005
## NM1897         0.0006 0.0001 0.0036 0.0020 0.0002 0.0003 0.0065 0.0037
## NV1861         0.0007 0.0000 0.1218 0.0267 0.0002 0.0002 0.0333 0.0176
## NV1869         0.0006 0.0001 0.1655 0.0272 0.0001 0.0002 0.0263 0.0138
## NY1848         0.0003 0.0000 0.0093 0.0041 0.0001 0.0001 0.0131 0.0088
## NY1849         0.0004 0.0000 0.0141 0.0055 0.0001 0.0002 0.0222 0.0132
## NY1850         0.0010 0.0001 0.0234 0.0175 0.0001 0.0002 0.0192 0.0118
## NY1851         0.0004 0.0000 0.0143 0.0058 0.0001 0.0002 0.0244 0.0150
## NY1853         0.0009 0.0000 0.0216 0.0148 0.0001 0.0002 0.0180 0.0110
## NY1876         0.0003 0.0000 0.0015 0.0011 0.0000 0.0002 0.0015 0.0013
## NY1879         0.0003 0.0000 0.0011 0.0009 0.0000 0.0002 0.0012 0.0010
## OH1853         0.0005 0.0000 0.0055 0.0040 0.0002 0.0002 0.0076 0.0049
## OH1853extended 0.0006 0.0001 0.0067 0.0037 0.0002 0.0003 0.0071 0.0043
## OH1879         0.0006 0.0000 0.0022 0.0013 0.0001 0.0003 0.0026 0.0031
## OK1891         0.0005 0.0001 0.0073 0.0039 0.0001 0.0003 0.0238 0.0160
## OK1893         0.0008 0.0000 0.0054 0.0034 0.0001 0.0002 0.0109 0.0067
## OR1854         0.0008 0.0001 0.0281 0.0120 0.0002 0.0003 0.0699 0.0425
## OR1862         0.0007 0.0001 0.0148 0.0098 0.0001 0.0002 0.0219 0.0160
## SC1870         0.0004 0.0001 0.0142 0.0064 0.0001 0.0002 0.0243 0.0157
## TN1858             NA 0.0006 0.0004 0.0003 0.0001 0.0003 0.0004 0.0004
## UT1853             NA     NA 0.0001 0.0000 0.0000 0.0000 0.0000 0.0001
## UT1870             NA     NA     NA 0.0180 0.0001 0.0002 0.0156 0.0080
## UT1884             NA     NA     NA     NA 0.0000 0.0001 0.0078 0.0053
## VA1841             NA     NA     NA     NA     NA 0.0006 0.0002 0.0001
## VA1860             NA     NA     NA     NA     NA     NA 0.0002 0.0002
## WA1855             NA     NA     NA     NA     NA     NA     NA 0.1098
## WA1873             NA     NA     NA     NA     NA     NA     NA     NA
## WI1849             NA     NA     NA     NA     NA     NA     NA     NA
## WI1856             NA     NA     NA     NA     NA     NA     NA     NA
## WI1858             NA     NA     NA     NA     NA     NA     NA     NA
## WOOD1857           NA     NA     NA     NA     NA     NA     NA     NA
## WV1868             NA     NA     NA     NA     NA     NA     NA     NA
## WY1870             NA     NA     NA     NA     NA     NA     NA     NA
## WY1886             NA     NA     NA     NA     NA     NA     NA     NA
##                WI1849 WI1856 WI1858 WOOD1857 WV1868 WY1870 WY1886
## AK1900         0.0029 0.0113 0.0102   0.0128 0.0003 0.0046 0.0013
## AL1852         0.0005 0.0007 0.0006   0.0006 0.0002 0.0005 0.0003
## AR1868         0.0004 0.0053 0.0030   0.0031 0.0009 0.0205 0.0080
## AR1874         0.0002 0.0062 0.0025   0.0031 0.0001 0.0223 0.0089
## AZ1865         0.0013 0.0321 0.0148   0.1625 0.0003 0.0171 0.0026
## AZ1887         0.0004 0.0042 0.0023   0.0080 0.0003 0.0049 0.0010
## BI1859         0.0002 0.0001 0.0002   0.0001 0.0001 0.0002 0.0001
## CA1850         0.0011 0.0670 0.0238   0.0215 0.0002 0.0106 0.0029
## CA1851         0.0013 0.0355 0.0164   0.1785 0.0003 0.0183 0.0030
## CA1858         0.0012 0.0259 0.0138   0.1710 0.0003 0.0162 0.0022
## CA1868         0.0010 0.0176 0.0103   0.1164 0.0002 0.0121 0.0019
## CA1868extended 0.0007 0.0063 0.0054   0.0450 0.0002 0.0050 0.0009
## CA1872         0.0019 0.0142 0.0117   0.0607 0.0003 0.0121 0.0029
## CO1868         0.0079 0.0003 0.0043   0.0003 0.0005 0.0065 0.0024
## CO1877         0.0016 0.0205 0.0105   0.0576 0.0002 0.0154 0.0037
## CT1854         0.0003 0.0003 0.0003   0.0002 0.0001 0.0003 0.0002
## CT1879         0.0000 0.0005 0.0002   0.0002 0.0000 0.0002 0.0001
## CT1879extended 0.0001 0.0004 0.0003   0.0003 0.0001 0.0003 0.0002
## DC1857         0.0020 0.0176 0.0101   0.0187 0.0025 0.0254 0.0087
## DE1852         0.0008 0.0001 0.0006   0.0002 0.0002 0.0002 0.0001
## DT1862         0.0007 0.0126 0.0064   0.0070 0.0003 0.1736 0.0376
## DT1868         0.0020 0.0883 0.0412   0.0168 0.0004 0.0093 0.0029
## DT1887         0.0024 0.0209 0.0167   0.0132 0.0003 0.0080 0.0027
## FL1847         0.0044 0.0002 0.0038   0.0003 0.0003 0.0005 0.0003
## FL1870         0.0011 0.1245 0.0496   0.0214 0.0002 0.0117 0.0033
## FL1892         0.0033 0.0005 0.0030   0.0004 0.0008 0.0005 0.0003
## FR1806         0.0000 0.0000 0.0000   0.0000 0.0000 0.0000 0.0000
## GA1851         0.0004 0.0001 0.0003   0.0002 0.0002 0.0003 0.0002
## GA1860         0.0004 0.0001 0.0003   0.0003 0.0004 0.0004 0.0002
## GB1852         0.0002 0.0001 0.0001   0.0001 0.0003 0.0002 0.0001
## GB1854         0.0001 0.0001 0.0001   0.0001 0.0000 0.0001 0.0001
## GB1873         0.0001 0.0001 0.0001   0.0000 0.0001 0.0001 0.0000
## GB1875         0.0001 0.0001 0.0001   0.0001 0.0001 0.0001 0.0001
## HI1859         0.0001 0.0034 0.0010   0.0026 0.0000 0.0015 0.0005
## HI1897         0.0012 0.0024 0.0020   0.0022 0.0001 0.0015 0.0005
## IA1839         0.0006 0.0001 0.0001   0.0001 0.0001 0.0003 0.0003
## IA1851         0.0007 0.0016 0.0012   0.0019 0.0002 0.0204 0.0006
## IA1859         0.0007 0.0046 0.0027   0.0033 0.0003 0.0264 0.0051
## ID1864         0.0025 0.0208 0.0123   0.0963 0.0003 0.0123 0.0021
## ID1881         0.0017 0.0143 0.0105   0.0506 0.0003 0.0115 0.0031
## IL1866         0.0069 0.0003 0.0045   0.0003 0.0007 0.0055 0.0004
## IL1933         0.0002 0.0011 0.0004   0.0005 0.0001 0.0007 0.0004
## IN1843         0.0054 0.0006 0.0038   0.0005 0.0004 0.0016 0.0005
## IN1852         0.0014 0.0093 0.0052   0.0042 0.0003 0.0083 0.0030
## KS1859         0.0006 0.0134 0.0070   0.0073 0.0004 0.1914 0.0380
## KS1868         0.0009 0.0096 0.0057   0.0065 0.0004 0.1153 0.0242
## KY1851         0.0003 0.0064 0.0034   0.0038 0.0005 0.0259 0.0109
## KY1854         0.0003 0.0045 0.0026   0.0028 0.0009 0.0175 0.0076
## LA1825         0.0000 0.0000 0.0000   0.0000 0.0000 0.0000 0.0000
## LA1825french   0.0000 0.0000 0.0000   0.0000 0.0001 0.0000 0.0000
## LC1867         0.0001 0.0001 0.0001   0.0001 0.0001 0.0001 0.0001
## LC1867french   0.0000 0.0000 0.0000   0.0000 0.0000 0.0000 0.0000
## MA1836         0.0158 0.0002 0.0103   0.0005 0.0012 0.0004 0.0002
## MA1851         0.0001 0.0001 0.0001   0.0000 0.0000 0.0001 0.0000
## MA1858         0.0079 0.0002 0.0060   0.0004 0.0010 0.0005 0.0002
## MD1855         0.0001 0.0001 0.0001   0.0000 0.0001 0.0001 0.0001
## MD1859         0.0001 0.0001 0.0001   0.0001 0.0001 0.0002 0.0001
## ME1840         0.0034 0.0002 0.0026   0.0002 0.0003 0.0004 0.0002
## MI1853         0.0003 0.0009 0.0005   0.0004 0.0001 0.0003 0.0002
## MN1851         0.0343 0.0194 0.0433   0.0156 0.0002 0.0073 0.0020
## MN1859         0.0543 0.0337 0.0795   0.0269 0.0003 0.0106 0.0029
## MO1835         0.0029 0.0002 0.0009   0.0002 0.0001 0.0004 0.0003
## MO1849         0.0007 0.0216 0.0065   0.0066 0.0001 0.0052 0.0018
## MO1856         0.0022 0.0145 0.0059   0.0048 0.0001 0.0052 0.0020
## MO1879         0.0013 0.0089 0.0038   0.0033 0.0002 0.0040 0.0017
## MS1848         0.0008 0.0002 0.0006   0.0003 0.0006 0.0006 0.0003
## MS1850         0.0000 0.0115 0.0029   0.0028 0.0000 0.0019 0.0007
## MS1857         0.0006 0.0010 0.0008   0.0006 0.0006 0.0017 0.0007
## MT1865         0.0021 0.0197 0.0106   0.0894 0.0003 0.0181 0.0030
## MT1895         0.0018 0.0105 0.0094   0.0389 0.0003 0.0096 0.0038
## NC1868         0.0019 0.0889 0.0430   0.0190 0.0003 0.0107 0.0029
## ND1877         0.0043 0.0613 0.0376   0.0283 0.0004 0.0207 0.0063
## ND1877extended 0.0037 0.0409 0.0299   0.0250 0.0004 0.0153 0.0047
## NE1857         0.0046 0.0021 0.0048   0.0020 0.0002 0.0333 0.0012
## NE1859         0.0007 0.0124 0.0068   0.0067 0.0003 0.1590 0.0363
## NE1866         0.0027 0.0069 0.0060   0.0063 0.0004 0.1812 0.0247
## NH1842         0.0004 0.0001 0.0003   0.0001 0.0001 0.0002 0.0001
## NJ1847         0.0017 0.0002 0.0004   0.0002 0.0002 0.0004 0.0002
## NM1865         0.0003 0.0001 0.0002   0.0001 0.0001 0.0003 0.0002
## NM1897         0.0057 0.0097 0.0098   0.0036 0.0005 0.0076 0.0027
## NV1861         0.0031 0.0307 0.0174   0.1571 0.0003 0.0187 0.0028
## NV1869         0.0012 0.0264 0.0134   0.1317 0.0003 0.0240 0.0026
## NY1848         0.0006 0.0609 0.0222   0.0134 0.0001 0.0056 0.0019
## NY1849         0.0025 0.1091 0.0443   0.0196 0.0002 0.0099 0.0028
## NY1850         0.0049 0.0337 0.0269   0.0342 0.0003 0.0116 0.0028
## NY1851         0.0026 0.1202 0.0477   0.0197 0.0002 0.0110 0.0031
## NY1853         0.0047 0.0328 0.0259   0.0314 0.0003 0.0106 0.0026
## NY1876         0.0013 0.0033 0.0032   0.0018 0.0002 0.0013 0.0008
## NY1879         0.0010 0.0028 0.0027   0.0015 0.0002 0.0010 0.0005
## OH1853         0.0007 0.0131 0.0065   0.0067 0.0003 0.1550 0.0368
## OH1853extended 0.0011 0.0102 0.0058   0.0078 0.0004 0.1237 0.0311
## OH1879         0.0010 0.0028 0.0028   0.0028 0.0006 0.0243 0.0508
## OK1891         0.0010 0.0080 0.0051   0.0086 0.0004 0.0081 0.0035
## OK1893         0.0010 0.0085 0.0055   0.0060 0.0004 0.1127 0.0243
## OR1854         0.0153 0.0372 0.0339   0.0391 0.0003 0.0110 0.0029
## OR1862         0.0042 0.0191 0.0172   0.0199 0.0003 0.0071 0.0019
## SC1870         0.0031 0.1074 0.0474   0.0192 0.0002 0.0105 0.0029
## TN1858         0.0010 0.0003 0.0010   0.0005 0.0004 0.0008 0.0003
## UT1853         0.0001 0.0001 0.0001   0.0000 0.0000 0.0000 0.0000
## UT1870         0.0007 0.0148 0.0074   0.0708 0.0002 0.0120 0.0018
## UT1884         0.0005 0.0058 0.0043   0.0186 0.0002 0.0057 0.0016
## VA1841         0.0002 0.0001 0.0001   0.0001 0.0003 0.0002 0.0001
## VA1860         0.0008 0.0002 0.0003   0.0002 0.0616 0.0003 0.0002
## WA1855         0.0054 0.0261 0.0142   0.0202 0.0003 0.0071 0.0023
## WA1873         0.0014 0.0157 0.0100   0.0121 0.0003 0.0049 0.0018
## WI1849             NA 0.0015 0.0985   0.0015 0.0009 0.0009 0.0004
## WI1856             NA     NA 0.0634   0.0214 0.0002 0.0102 0.0032
## WI1858             NA     NA     NA   0.0119 0.0006 0.0061 0.0020
## WOOD1857           NA     NA     NA       NA 0.0002 0.0118 0.0020
## WV1868             NA     NA     NA       NA     NA 0.0004 0.0002
## WY1870             NA     NA     NA       NA     NA     NA 0.0267
## WY1886             NA     NA     NA       NA     NA     NA     NA
```

Session info:


```r
sessionInfo()
```

```
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
## [1] textreuse_0.0.1.9001
## 
## loaded via a namespace (and not attached):
##  [1] assertthat_0.1  magrittr_1.5    tools_3.2.2     htmltools_0.2.6
##  [5] NLP_0.1-8       yaml_2.1.13     Rcpp_0.12.1     stringi_0.5-5  
##  [9] rmarkdown_0.8   knitr_1.11      stringr_1.0.0   digest_0.6.8   
## [13] evaluate_0.8
```
