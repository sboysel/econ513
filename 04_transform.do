/*
filename: 04_transform.do
author: Sam Boysel <sboysel@gmail.com>
description: Basic data transformation in Stata
*/

cd ~/repos/econ513 
capture log close
log using 04_transform.log, replace text

* load nlswork data (National Longitudinal Survey of Young Women, 14-24 years
* old in 1968)
webuse nlswork, clear
summarize

* important: let Stata know that this is panel data (i.e. varies over
* individuals and time)
xtset idcode year

* describe panel data
xtdescribe

* summarize panel data
xtsum

* create new variables
gen age2 = age^2
gen collgradXnev_mar = collgrad * nev_mar
gen days_ue = 7 * wks_ue
gen annual_income = wks_work * hours * exp(ln_wage)

* rename variables
rename age2 age_squared
inspect age_squared
rename age_squared age2

* replace values if they meet certain conditions
replace wks_work = 52 if wks_work > 52

* recode certain values
recode race (0 = 1 "white") (1 = 2 "black") (2 = 3 "other"), gen(race2)
codebook race
codebook race2

* drop data rows where age squared is missing
drop if missing(age2)

* take a 25% random sample of the data
sample 25

* close logfile
close
