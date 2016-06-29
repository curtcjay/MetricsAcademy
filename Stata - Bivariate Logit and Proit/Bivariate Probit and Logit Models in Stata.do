* Bivariate Probit Model in Stata
* Copyright 2013 by Ani Katchova

clear all
set more off

use C:\Econometrics\Data\bivariate_health

global y1list hlthe
global y2list dmdu
global xlist age linc ndisease
global zlist age linc

describe $y1list $y2list $xlist 
summarize $y1list $y2list $xlist

tabulate $y1list $y2list 
correlate $y1list $y2list 

* Probit models
probit $y1list $xlist
probit $y2list $xlist

* Bivariate probit model
biprobit $y1list $y2list $xlist

* Predicted marginal probabilities of y1=1 and y2=1
predict biprob1, pmarg1 
predict biprob2, pmarg2 

* Predicted joint probabilities of y1=0 and y2=0, y1=0 and y2=1, y1=1 and y2=0, and y1=1 and y2=1
predict biprob00, p00 
predict biprob01, p01 
predict biprob10, p10 
predict biprob11, p11 

* Summarizing predicted values
summarize $y1list $y2list biprob1 biprob2 
summarize biprob00 biprob01 biprob10 biprob11
tabulate $y1list $y2list

* Marginal effects 
margins, dydx(*) atmeans predict(p00)
margins, dydx(*) atmeans predict(p01)
margins, dydx(*) atmeans predict(p10)
margins, dydx(*) atmeans predict(p11)

* Bivariate probit with different sets of regressors
biprobit ($y1list = $zlist) ($y2list = $xlist)

