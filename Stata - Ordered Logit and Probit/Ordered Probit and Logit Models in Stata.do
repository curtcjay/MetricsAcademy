* Ordered Probit and Logit Models in Stata
* Copyright 2013 by Ani Katchova

clear all
set more off

use C:\Econometrics\Data\ordered_health.dta

* Dependent variable has 3 categories denoted 1,2,3
global ylist healthstatus
global xlist age logincome numberdiseases

describe $ylist $xlist
summarize $ylist $xlist

tabulate $ylist

* Ordered logit model
ologit $ylist $xlist

* Ordered logit marginal effects 
margins, dydx(*) atmeans predict(outcome(1))
margins, dydx(*) atmeans predict(outcome(2))
margins, dydx(*) atmeans predict(outcome(3))

* Ordered logit predicted probabilities
predict p1ologit p2ologit p3ologit, pr
summarize p1ologit p2ologit p3ologit
tabulate $ylist


* Ordered probit model coefficients
oprobit $ylist $xlist

* Ordered probit model marginal effects
margins, dydx(*) atmeans predict(outcome(1))
margins, dydx(*) atmeans predict(outcome(2))
margins, dydx(*) atmeans predict(outcome(3))

* Ordered probit model predicted probabilities
predict p1oprobit, pr outcome(1)
predict p2oprobit, pr outcome(2)
predict p3oprobit, pr outcome(3)
summarize p1oprobit p2oprobit p2oprobit
tabulate $ylist
