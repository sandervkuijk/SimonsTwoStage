################################################################################
### Sample size calculations
### Git version controlled
### Sander van Kuijk, 2020/2021
# R version 4.0.4 (2021-02-15)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 18363)

# locale:
# [1] LC_COLLATE=English_Netherlands.1252  LC_CTYPE=English_Netherlands.1252
# [3] LC_MONETARY=English_Netherlands.1252 LC_NUMERIC=C
# [5] LC_TIME=English_Netherlands.1252

# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base

# other attached packages:
# [1] OneArmPhaseTwoStudy_1.0.3 Rcpp_1.0.6

# loaded via a namespace (and not attached):
# [1] compiler_4.0.4   tools_4.0.4      codetools_0.2-18

#  install.packages("OneArmPhaseTwoStudy", repos = "https://ftp.belnet.be/mirror/CRAN/")
library(OneArmPhaseTwoStudy)

# Overweging 1, originele berekening Gerard Bos via website
# http://cancer.unc.edu/biostatistics/program/ivanova/SimonsTwoStageDesign.aspx

getSolutions(simon = setupSimon(alpha = 0.05, beta = 0.2, p0 = 0.05, p1 = 0.2),
             useCurtailment = FALSE, curtail_All = FALSE, cut = 0,
             replications = 10000, upperBorder = 0)

# Overweging 2, power = 80%
getSolutions(simon = setupSimon(alpha = 0.05, beta = 0.2, p0 = 0.05, p1 = 0.2),
             useCurtailment = FALSE, curtail_All = FALSE, cut = 0,
             replications = 10000, upperBorder = 0)

# Overweging 3, power = 80%, nulhypothese = 0%
getSolutions(simon = setupSimon(alpha = 0.05, beta = 0.2, p0 = 0.0, p1 = 0.2),
             useCurtailment = FALSE, curtail_All = FALSE, cut = 0,
             replications = 10000, upperBorder = 0)

# Overweging 4, power = 90%, nulhypothese = 0%
getSolutions(simon = setupSimon(alpha = 0.05, beta = 0.1, p0 = 0.0, p1 = 0.2),
             useCurtailment = FALSE, curtail_All = FALSE, cut = 0,
             replications = 10000, upperBorder = 0)

# Overweging 5, power = 90%, nulhypothese = 2%
getSolutions(simon = setupSimon(alpha = 0.05, beta = 0.1, p0 = 0.02, p1 = 0.2),
             useCurtailment = FALSE, curtail_All = FALSE, cut = 0,
             replications = 10000, upperBorder = 0)

### Einde efficacy

## Serious toxicity: >20% onacceptabel/ serieuze discussie (nulhypothese: <5%)
# Actie Sander: continue of two-stage stopping rule (eerste 3 doden, wat doen?)
# Zelfde formule, maar dan uitgaan van %non-toxicity? (dat maakt adt het te
# berekenen is)

# Overweging t1, power = 90%, nulhypothese = 20%, alternatieve hypothese = 5%,
# dus in termen van non-toxicity: H0 = 80%, Ha = 95%.
getSolutions(simon = setupSimon(alpha = 0.05, beta = 0.1, p0 = 0.8, p1 = 0.95),
             useCurtailment = FALSE, curtail_All = FALSE, cut = 0,
             replications = 10000, upperBorder = 0)

# Overweging t2, power = 90%, nulhypothese = 20%, alternatieve hypothese = 2%,
# dus in termen van non-toxicity: H0 = 80%, Ha = 95%.
getSolutions(simon = setupSimon(alpha = 0.05, beta = 0.1, p0 = 0.8, p1 = 0.98),
             useCurtailment = FALSE, curtail_All = FALSE, cut = 0,
             replications = 10000, upperBorder = 0)

# install.packages("gsDesign")
library(gsDesign)

# # alpha is one-sided!
# st <- gsDesign(k = 2, test.type = 1, alpha = 0.05, beta = 0.1, timing = c(1/3, 1),
#                sfu = "Pocock")
# st

# Pocock boundary = 0.0294 bij tweemaal testen

binom.test(3, 11, p = 0.10, alternative = c("greater"), conf.level = 0.95)
3/11
4/11

binom.test(6, 11, p = 0.20, alternative = c("greater"), conf.level = 0.95)
5/11
6/11

binom.test(7, 33, p = 0.10, alternative = c("greater"), conf.level = 0.95)
7/33

### end
