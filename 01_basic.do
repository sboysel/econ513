/*
filename: 01_basic.do
author: Sam Boysel <sboysel@gmail.com>
description: Basic Stata commands and usage
*/

* single line comment

/*
multi-
line
comment
*/

version // in-line comment

* clear any data in memory 
clear

* print current working directory
pwd

* change current working directory.
* IMPORTANT NOTE: you need to change this line to wherever you extracted the
* repository code.
cd ~/repos/econ513 

* print a list of files and directories in current working directory
dir

* close any open log files
capture log close

* create logfile in `log/basic.log`.
* Note that this file is relative to current working directory
log using 01_basic.log, append

* load a dataset packaged with Stata
sysuse auto

* print high-level information for variables in memory
describe

* generate summary statistics for variables
summarize

* generate correlation matrix
correlate

* pairwise correlations
pwcorr price headroom mpg displacement

* confidence intervals for various sample statistics
ci means mpg price, level(95)
ci variances mpg price, level(95)

* end session by closing logfile
log close
