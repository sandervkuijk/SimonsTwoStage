# install.packages("OneArmPhaseTwoStudy")
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
