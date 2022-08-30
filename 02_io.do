/*
filename: 02_io.do
author: Sam Boysel <sboysel@gmail.com>
description: Import and export data from Stata in various formats
*/

cd ~/repos/econ513 
capture log close
log using 02_io.log, replace text

* load a dataset packaged with Stata
sysuse auto, clear
summarize

* export
save "data/auto.dta", replace
export delimited "data/auto.csv", delimiter(",") replace
export excel "data/auto.xlsx", firstrow(variables) replace

* import
use "data/auto.dta", clear
summarize

import delimited "data/auto.csv", clear
summarize

import excel "data/auto.xlsx", sheet("Sheet1") firstrow clear
summarize

* use a sample dataset from https://www.stata-press.com/data/r17/
* see `help webuse`
* webuse nlswork, clear

* end session by closing logfile
log close
