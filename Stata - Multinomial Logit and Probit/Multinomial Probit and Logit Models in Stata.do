* Multinomial Probit and Logit Models in Stata
* Copyright 2013 by Ani Katchova

clear all
set more off

use C:\Econometrics\Data\multinomial_fishing

* Dependent variable has 4 categories denoted 1,2,3,4
global ylist mode
global xlist income

describe $ylist $xlist
summarize $ylist $xlist

tabulate $ylist

* Multinomial logit model with base outcome the most frequent alternative
mlogit $ylist $xlist

* Multinomial logit with base outcome alternative 2
mlogit $ylist $xlist, baseoutcome(2) 

* Multinomial logit marginal effects
margins, dydx(*) atmeans predict(pr outcome(1))
margins, dydx(*) atmeans predict(pr outcome(2))
margins, dydx(*) atmeans predict(pr outcome(3))
margins, dydx(*) atmeans predict(pr outcome(4))

* Multinomial logit predicted probabilities
predict pmlogit1 pmlogit2 pmlogit3 pmlogit4, pr
summarize pmlogit1 pmlogit2 pmlogit3 pmlogit4
tabulate $ylist


* Multinomial probit model with base outcome the most frequent alternative
mprobit $ylist $xlist

* Multinomial probit with base outcome alternative 2
mprobit $ylist $xlist, baseoutcome(2) 

* Multinomial probit marginal effects 
margins, dydx(*) atmeans predict(pr outcome(1))
margins, dydx(*) atmeans predict(pr outcome(2))
margins, dydx(*) atmeans predict(pr outcome(3))
margins, dydx(*) atmeans predict(pr outcome(4))

* Multinomial probit predicted probabilities
predict p1, outcome(1)
predict p2, outcome(2)
predict p3, outcome(3)
predict p4, outcome(4)
summarize p1 p2 p3 p4
tabulate $ylist
