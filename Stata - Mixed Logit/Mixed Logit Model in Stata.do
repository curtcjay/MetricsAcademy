* Mixed Logit Model in Stata
* Copyright 2013 by Ani Katchova

clear all
set more off

use C:\Econometrics\Data\mixed_fishing

global ylist d
global xlist q dbeach dprivate ybeach yprivate
global rand p
 
global id id
global group id

describe $id $ylist $xlist  
summarize $id $ylist $xlist

* Mixed logit or random-parameters logit model
mixlogit $ylist $xlist, group ($group) id($id) rand($rand) 

