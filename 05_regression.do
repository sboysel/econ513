/*
filename: 05_regression.do
author: Sam Boysel <sboysel@gmail.com>
description: Basic regression analysis in Stata
*/

cd ~/repos/econ513 
capture log close
log using 05_regression.log, replace text

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
* tabulate racec race

* create some additional variables
gen age2 = age^2
gen ln_wage_l1 = l.ln_wage
egen med_ln_wage = median(ln_wage)
gen hi_wage = 1 if ln_wage > med_ln_wage

* baseline regression
xtreg ln_wage age

* add a quadratic term for age
xtreg ln_wage age age2

* add (endogenous) lag of log wages
xtreg ln_wage ln_wage_l1

* add dummy variables for categorical racec variables
xtreg ln_wage i.racec

* changeing the base category
xtreg ln_wage ib2.racec
xtreg ln_wage ib3.racec

* interaction between union status and whether the individual is in a central
* city
xtreg ln_wage union#c_city

* continuous interactions between union status and age 
xtreg ln_wage union#c.age

* add some more covariates
xtreg ln_wage age age2 ln_wage_l1 i.racec msp nev_mar collgrad grade c_city south union ttl_exp tenure 

* adding robust standard errors
xtreg ln_wage age age2 ln_wage_l1 i.racec msp nev_mar collgrad grade c_city south union ttl_exp tenure, vce(robust) 

* adding fixed effects
xtreg ln_wage age age2 ln_wage_l1 i.racec msp nev_mar collgrad grade c_city south union ttl_exp tenure, fe vce(robust) 

log close
