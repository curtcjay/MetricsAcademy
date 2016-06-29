* Conditional Logit Model in Stata
* Copyright 2013 by Ani Katchova

clear all
set more off

use C:\Econometrics\Data\conditional_fishing

* Dependent variable is 1 or 0 whether the alternative is selected or not
* xlist is case-specific regressors and zlist is alternative-specific regressors
global ylist d
global xlist income
global zlist p q

global id id
global alternative fishmode
global basealternative1 pier
global basealternative2 charter

describe $id $alternative $ylist $xlist $zlist 
summarize $id $alternative $ylist $xlist $zlist

* Conditional logit model with base outcome set as basealternative1
asclogit $ylist $zlist, case($id) alternatives($alternative) casevars($xlist) basealternative($basealternative1)

* Conditional logit model with base outcome set as basealternative2
asclogit $ylist $zlist, case($id) alternatives($alternative) casevars($xlist) basealternative($basealternative2)

* Conditional logit marginal effects
estat mfx, varlist($xlist $zlist)

* Conditional logit predicted probabilities
predict pasclogit, pr
summarize pasclogit
tabulate $ylist

* Multinomial logit is conditional logit with no alternative-specific variables
asclogit $ylist, case($id) alternatives($alternative) casevar($xlist)
