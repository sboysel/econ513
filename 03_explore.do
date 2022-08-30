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
webuse nlswork, clear

describe

* if the data is in native Stata format, often then is a codebook available with
* variable definitions
codebook

* for single variables
codebook ln_wage

* generate histogram for single variable, shows number of missing values
inspect tenure
inspect tenure if !missing(tenure)

* plot histogram of variable
histogram ln_wage, frequency

* frequency counts for distinct values of a variable
tabulate race

* calculate summary statistics by a grouping variable
tabstat ln_wage age union, by(collgrad) stat(mean sd n)

log close
