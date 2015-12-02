Count the number of sections in each code.

    library("magrittr")
    library("readr")
    library("dplyr")

    ## 
    ## Attaching package: 'dplyr'
    ## 
    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag
    ## 
    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    library("stringr")
    library("knitr")
    code_files <- Sys.glob("legal-codes/*")
    codes <- lapply(code_files, read_lines)
    names(codes) <- code_files %>% basename() %>% str_replace_all("\\.txt", "")
    code_info <- read_csv("codes/code-generations.csv")

A section is a line with `§` or `SEC.` at the very beginning.

    pattern_clean <- regex("(^§|^SEC\\.)", ignore_case = FALSE)
    counts <- codes %>% 
      lapply(str_detect, pattern_clean) %>% 
      sapply(sum, na.rm = TRUE)
    section_counts <- data_frame(code = names(counts), sections = counts) %>% 
      left_join(code_info)

    ## Joining by: "code"

The number of sections in each generation.

    section_counts %>% 
      group_by(generation) %>% 
      summarise(sections = sum(sections)) %>% 
      kable()

<table>
<thead>
<tr class="header">
<th align="left">generation</th>
<th align="right">sections</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">first generation field code</td>
<td align="right">22154</td>
</tr>
<tr class="even">
<td align="left">later generation field code</td>
<td align="right">27981</td>
</tr>
<tr class="odd">
<td align="left">non field code</td>
<td align="right">3214</td>
</tr>
<tr class="even">
<td align="left">NA</td>
<td align="right">8310</td>
</tr>
</tbody>
</table>

The number of sections in each code.

    section_counts %>% 
      kable()

<table>
<thead>
<tr class="header">
<th align="left">code</th>
<th align="right">sections</th>
<th align="left">generation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">AK1900</td>
<td align="right">1042</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">AL1852</td>
<td align="right">940</td>
<td align="left">non field code</td>
</tr>
<tr class="odd">
<td align="left">AR1868</td>
<td align="right">891</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">AR1874</td>
<td align="right">332</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">AZ1865</td>
<td align="right">638</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">AZ1887</td>
<td align="right">805</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">BI1859</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">CA1850</td>
<td align="right">310</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">CA1851</td>
<td align="right">649</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">CA1858</td>
<td align="right">661</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">CA1868</td>
<td align="right">740</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">CA1872</td>
<td align="right">1645</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">CO1868</td>
<td align="right">288</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">CO1877</td>
<td align="right">437</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">CT1854</td>
<td align="right">2</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">CT1879</td>
<td align="right">123</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">DC1857</td>
<td align="right">820</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">DE1852</td>
<td align="right">271</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">DT1862</td>
<td align="right">575</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">DT1868</td>
<td align="right">31</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">DT1887</td>
<td align="right">1333</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">FL1847</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">FL1870</td>
<td align="right">387</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">FL1892</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">FR1806</td>
<td align="right">12</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">GA1851</td>
<td align="right">2</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">GA1860</td>
<td align="right">987</td>
<td align="left">non field code</td>
</tr>
<tr class="even">
<td align="left">GB1852</td>
<td align="right">226</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">GB1854</td>
<td align="right">106</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">GB1873</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">GB1875</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">HI1859</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">HI1897</td>
<td align="right">270</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">IA1839</td>
<td align="right">61</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">IA1851</td>
<td align="right">1020</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">IA1859</td>
<td align="right">255</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">ID1864</td>
<td align="right">682</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">ID1881</td>
<td align="right">806</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">IL1866</td>
<td align="right">68</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">IL1933</td>
<td align="right">135</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">IN1843</td>
<td align="right">4</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">IN1852</td>
<td align="right">472</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">KS1859</td>
<td align="right">608</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">KS1868</td>
<td align="right">637</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">KY1851</td>
<td align="right">740</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">KY1854</td>
<td align="right">919</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">LA1825</td>
<td align="right">24</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">LA1825french</td>
<td align="right">27</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">LA1844</td>
<td align="right">1158</td>
<td align="left">non field code</td>
</tr>
<tr class="even">
<td align="left">LC1867</td>
<td align="right">43</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">LC1867french</td>
<td align="right">53</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">MA1836</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">MA1851</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">MA1858</td>
<td align="right">1</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">MD1855</td>
<td align="right">139</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">MD1859</td>
<td align="right">108</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">ME1840</td>
<td align="right">1</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">MI1853</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">MN1851</td>
<td align="right">555</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">MN1859</td>
<td align="right">1073</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">MO1835</td>
<td align="right">229</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">MO1849</td>
<td align="right">226</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">MO1856</td>
<td align="right">388</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">MO1879</td>
<td align="right">396</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">MS1848</td>
<td align="right">129</td>
<td align="left">non field code</td>
</tr>
<tr class="even">
<td align="left">MS1850</td>
<td align="right">15</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">MS1857</td>
<td align="right">470</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">MT1865</td>
<td align="right">572</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">MT1895</td>
<td align="right">4</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">NC1868</td>
<td align="right">592</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">ND1877</td>
<td align="right">752</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">NE1855</td>
<td align="right">1020</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">NE1857</td>
<td align="right">689</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">NE1859</td>
<td align="right">597</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">NE1866</td>
<td align="right">1098</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">NH1842</td>
<td align="right">17</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">NJ1847</td>
<td align="right">1</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">NM1865</td>
<td align="right">21</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">NM1897</td>
<td align="right">871</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">NV1861</td>
<td align="right">709</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">NV1869</td>
<td align="right">600</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">NY1829</td>
<td align="right">3515</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">NY1848</td>
<td align="right">389</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">NY1849</td>
<td align="right">491</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">NY1850</td>
<td align="right">1886</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">NY1851</td>
<td align="right">474</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">NY1853</td>
<td align="right">1740</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">NY1876</td>
<td align="right">1495</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">NY1879</td>
<td align="right">1459</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">OH1853</td>
<td align="right">898</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">OH1879</td>
<td align="right">1416</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">OK1891</td>
<td align="right">982</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">OK1893</td>
<td align="right">974</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">OR1854</td>
<td align="right">499</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">OR1862</td>
<td align="right">1132</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">SC1870</td>
<td align="right">386</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">TN1858</td>
<td align="right">1830</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">TX1855</td>
<td align="right">1557</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">UT1853</td>
<td align="right">50</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">UT1859</td>
<td align="right">556</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">UT1870</td>
<td align="right">597</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">UT1884</td>
<td align="right">746</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">VA1841</td>
<td align="right">0</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">VA1860</td>
<td align="right">4</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">VA1893</td>
<td align="right">27</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">WA1855</td>
<td align="right">600</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">WA1873</td>
<td align="right">154</td>
<td align="left">later generation field code</td>
</tr>
<tr class="even">
<td align="left">WI1849</td>
<td align="right">1255</td>
<td align="left">NA</td>
</tr>
<tr class="odd">
<td align="left">WI1856</td>
<td align="right">311</td>
<td align="left">first generation field code</td>
</tr>
<tr class="even">
<td align="left">WI1858</td>
<td align="right">1317</td>
<td align="left">later generation field code</td>
</tr>
<tr class="odd">
<td align="left">WV1868</td>
<td align="right">9</td>
<td align="left">NA</td>
</tr>
<tr class="even">
<td align="left">WY1870</td>
<td align="right">825</td>
<td align="left">first generation field code</td>
</tr>
<tr class="odd">
<td align="left">WY1886</td>
<td align="right">577</td>
<td align="left">later generation field code</td>
</tr>
</tbody>
</table>
