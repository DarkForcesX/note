### cloc工具安装

***

```bash
brew install cloc
```



```shell
xiehz@xiehz  ~/cloudnative/src/k8s.io  cloc kubernetes
   29004 text files.
   20098 unique files.
   13400 files ignored.

github.com/AlDanial/cloc v 1.84  T=46.20 s (339.3 files/s, 113437.4 lines/s)
--------------------------------------------------------------------------------
Language                      files          blank        comment           code
--------------------------------------------------------------------------------
Go                            13396         436982         734221        3302780
JSON                            243             13              0         461177
YAML                            816           1041           1138          98648
Markdown                        476          16603              0          56285
Bourne Shell                    318           5718          11099          28048
PO File                          11           1459           2135          16386
Assembly                        107           2023           2570          11417
Protocol Buffers                116           5106          16075           9901
PowerShell                        7            319            911           2016
make                             63            509            956           1651
yacc                              1             78            142            997
C/C++ Header                      1            399           4367            839
Bourne Again Shell               13             96             87            822
Starlark                         15             91            400            817
Dockerfile                       52            257            767            595
Lua                               1             30             26            453
sed                               4              4             32            414
Python                            7            118            155            411
SVG                               4              4              4            378
TOML                             16            162            196            328
C                                 6             39             67            123
reStructuredText                  1             24              0             66
INI                               1              2              0             10
HTML                              2              0              0              2
vim script                        1              0              0              1
--------------------------------------------------------------------------------
SUM:                          15678         471077         775348        3994565
--------------------------------------------------------------------------------
 xiehz@xiehz  ~/cloudnative/src/k8s.io 
```

