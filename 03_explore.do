/*
filename: 03_explore.do
author: Sam Boysel <sboysel@gmail.com>
description: Explore data in Stata
*/

cd ~/repos/econ513 
capture log close
log using 03_explore.log, replace text

* load nlswork data (National Longitudinal Survey of Young Women, 14-24 years
* old in 1968)
use "data/nlswork.dta", clear

* describe the variables by type
describe

* generate summary statistucs
summarize

* if the data is in native Stata format, often then is a codebook available with
* variable definitions
* for single variables
codebook ln_wage

* run without parameters to access the entire codebook
* codebook

* generate histogram for single variable, shows number of missing values
inspect tenure
inspect tenure if !missing(tenure)

* list the first few rows of data for several variables
list ln_wage age collgrad grade in 1/5

* conditional listing of rows
list ln_wage if missing(age)
list ind_code if !missing(occ_code) & ttl_exp > 10

* show the unique values of a variable (only do this for low dimension, discrete
* variables)
levelsof race

* frequency counts for distinct values of a variable
tabulate race

* calculate summary statistics by a grouping variable
* see `help tabstat` for usage and a list of possible statistics
tabstat ln_wage age union, by(collgrad) stat(n mean sd min p25 median p75 max)
tabstat ln_wage msp nev_mar collgrad grade ttl_exp, by(year) stat(n mean sd min p25 median p75 max)

* plot histogram of variable
histogram ln_wage, frequency

log close
