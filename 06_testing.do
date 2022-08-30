/*
filename: 06_testing.do
author: Sam Boysel <sboysel@gmail.com>
description: Basic hypothesis testing with regression analysis in Stata
*/

cd ~/repos/econ513 
capture log close
log using 06_testing.log, replace text

* load nlswork data (National Longitudinal Survey of Young Women, 14-24 years
* old in 1968)
import excel "data/nlswork.xls", sheet("Sheet1") firstrow clear
sum

* important: let Stata know that this is panel data (i.e. varies over
* individuals and time)
xtset idcode year

* convert race to categorical
egen racec = group(race) 
label define race_label 1 "Black" 2 "Other" 3 "White"
label values racec race_label

* create some additional variables
gen age2 = age^2
gen ln_wage_l1 = l.ln_wage

* baseline regression
xtreg ln_wage age

/*
Wald Test: 
    
    Performs a test to determine if there is sufficient evidence to suggest a
    the data fits "unrestricted" version of the model relative to a "restricted"
    version.  Often used simply to test if certain coefficients are non-zero.

Example:  Does age have a statistically significant impact on log wage?

    Null Hypothesis:          coef(age) = 0
    Alternative Hypothesis:   coef(age) != 0
*/

test age

/*
Chow Test:

    Performs a test to determine if different subsamples have significantly
    different estimated coefficients.  Often used in time series analysis (i.e.
    event studies using pre and post periods) to detect "structural breaks"

Example: Is the effect of age on log wage any different for year after 1978?

    Null Hypothesis:          coef(age | year > 1978) = coef(age | age <= 1978)
    Alternative Hypothesis:   coef(age | year > 1978) = coef(age | age <= 1978)

Reference:
    
    https://www.stata.com/support/faqs/statistics/chow-tests/
    https://www.stata.com/support/faqs/statistics/computing-chow-statistic/
*/

* generate post 1978 indicator
gen post = year > 78

* estimate the model separately for the pre and post subsamples
xtreg ln_wage age if post==1
xtreg ln_wage age if post==0

* estimate the model with the full sample
xtreg ln_wage age

/*
From the output of the 3 regresson results above, you should be able to
compute the Chow test statistic using the formula contained in these notes:
https://www.stata.com/support/faqs/statistics/computing-chow-statistic/  
*/

* Alternatively you can esitmate a joint, fully interacted model and perform the
* test directly with Stata
generate postXage = post*age
regress y age post postXage
test post postXage
