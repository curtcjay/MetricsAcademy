* Count Data Models in Stata
* Copyright 2013 by Ani Katchova

clear all
set more off

use C:\Econometrics\Data\count_docvisit

* Different x variables for two-step models
global ylist docvis
global xlist private medicaid age educyr 
global x1list private medicaid age educyr 

describe $ylist $xlist
summarize $ylist $xlist

tabulate $ylist


* Count data models

* Poisson model coefficients and marginal effects
poisson $ylist $xlist 
margins, dydx(*) atmeans

* Poisson predicted values
predict yhat, n
summarize yhat
summarize $ylist

* Negative binomial model coefficients and marginal effects
nbreg $ylist $xlist
margins, dydx(*) atmeans

* Negative binomial predicted values
predict yhatnb, n
summarize yhatnb
summarize $ylist

* Poisson and negative binomial models incidence rate ratios exp(b)
poisson $ylist $xlist, irr
nbreg $ylist $xlist, irr


* Truncated count data models

* Truncated sample summary statistics
summarize $ylist $xlist if $ylist>0

* Logit model
logit $ylist $x1list

* Zero truncated Poisson
ztp $ylist $xlist if $ylist>0
margins, dydx(*) atmeans

* Zero truncated negative binomial
ztnb $ylist $xlist if $ylist>0
margins, dydx(*) atmeans


* Zero-inflated count data models

* Zero-inflated Poisson model
zip $ylist $xlist, inflate($x1list)
margins, dydx(*) atmeans

* Zero-inflated negative binomial model
zinb $ylist $xlist, inflate($x1list)
margins, dydx(*) atmeans
