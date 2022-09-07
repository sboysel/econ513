# Introduction to Stata

ECON 513 (USC Fall 2022)

This repository contains some introductory code to guide students through basic
Stata usage.  Data used is either available with a network connection (e.g.
`webuse`), packaged with Stata (e.g. `sysuse`), or kept in the `data` directory.

## Usage

1. Download this repository as a `.zip` file.  Click the green "Code" button
   above and select "Download ZIP".
2. Extract the contents of the archive (e.g. `econ513.zip`) to a working
   directory.  A working directory is a directory on your machine that will
   contain all the code, logs, and data needed for analysis.  See the section on
   [directory paths](#paths-and-working-directories) below for more details.
3. Open Stata.
4. Make sure Stata's working directory (listed at the bottom of the toolbar)
   matches where you extracted the contents of the zipfile.  You might have to
   change it using menus: **File > Change Working Directory**
5. The contents of the zipfile you extracted contains Stata code (`.do` files),
   logs, and data needed for the analysis.  When you first download the code
   from GitHub, each `.do` file is set to change the working directory to the
   one on my system (e.g. `~/repos/econ513`).  **Change this value to the full
   path name of your working directory.**
6. Try running each `.do` file in Stata by pressing the **Execute (do)** button
   (file icon with a little blue "play" symbol).
7. Inspect the output of the commands in the corresponding `.log` file, which
   will be generated in the same working directory. 

## Paths and Working Directories

For each project or assignment you do, you should keep all code, data, logfiles,
and additional documentation within a *working directory*.

For example, on my machine there is a subdirectory of my home directory called
`repos`, where I keep all my repositories.  I'd like to keep the code and data
in this repository in a subdirectory of `repos` called `econ513`.  So I would
extract the contents of the `econ513.zip` into the working directory
`/home/sam/repos/econ513`.  After extracting the archive, the working directory
should have the following contents:

```
.
├── 01_basic.do
├── 01_basic.log
├── 02_io.do
├── 02_io.log
├── 03_explore.do
├── 03_explore.log
├── 04_transform.do
├── 04_transform.log
├── 05_regression.do
├── 05_regression.log
├── 06_testing.do
├── 06_testing.log
├── data
│   ├── auto.csv
│   ├── auto.dta
│   ├── auto.xlsx
│   ├── nlswork.dta
│   └── nlswork.xls
├── MISC.md
└── README.md

1 directory, 19 files
```

This will be slightly different on your machine and operating system.  On Windows, 
this will be something like

```
cd "C:\Users\yourusername\repos\econ513" 
```

On Mac OS X

```
cd "/Users/yourusername/repos/econ513"
```

**IMPORTANT NOTE:**  Notice that pathnames in Windows contain backslashes (`\`) and
pathnames in Mac OS X / Unix / Linux contain forward slashes (`/`).  You will
need to make sure to change the references to filepaths in this code accordingly
to match your operating system.  This is a common issue encountered when running
someone else's code on your machine.

## General recommendations

* **If you're stuck and don't know how to do something, learn how to effectively
  [seek help](#getting-help)**
* Avoid doing analysis via menus.  **Strive to write your analysis as code,
  whenever possible.**
* **Log the output of each session to a file.**  For example, if your code is
  `analysis.do`, make sure to log output of the code as each command is executed 
  to a file like `analysis.log`.  Each of the `.do` files in this tutorial
  includes examples of doing this.  You should include a line with `log close`
  at the end of each do file to stop logging to the file.  Unless you
  have a good reason, log using plain text.
* In addition to containing the output of the analysis command, **reading the
  output of your logfile can help diagnose errors.**
* **You can learn a lot from reading other people's code.**
* Related to this last point, **get into the habit of annotating your code with
  comments**, explaining what certain lines are doing.  This will make it easier
  for people reading your code (including yourself) to understand what's going
  on.  There is a balance between including no comments and commenting every 
  individual line.  In this code, we err on the side of verbosity and lean 
  towards the latter.
* **Don't try to memorize everything.**  You'll learn by doing and with repeated
  practice. Another advantage of writing do files is that you can record how
  you did something.

## Getting help

You're going to run into obstacles in computational analysis.  Knowing how to
efficiently seek help is an important component of self learning and can empower
you to tackle more complicated issues as you learn Stata (as well as other
technical computing tools).

### Using the built-in Stata documentation

Open documentation within Stata

```stata
help reg
```

If you see a command you don't understand or run into an error running a
command, this should be the first thing you try.  Documentation shows parameters
required for each command, available options and their possible values, and
usage examples to show how a single command is used.

### Web resources

Suppose your issue isn't as simple as just reading the documentation for a known
Stata command.  Maybe you simply don't know where to start to perform some kind
of analysis (e.g. "What Stata code/command can do task X?").  Maybe you're
getting an error you don't understand.  The internet is a valuable resource
where you can find questions and answers asked by other and can connect you to a
community of Stata users that may assist you.

* Your other TA, Prof. Google.  If you're having a problem, a simple first step
  is to do a quick Google search with the error.
* https://www.stata.com/support/finding-resources/
* https://www.stata.com/links/
* https://www.statalist.org/forums/
* https://www.stata.com/bookstore/stata-cheat-sheets/
* https://stackoverflow.com/questions/tagged/stata
* Forums (e.g. StataList) and Q&A sites (e.g. StackOverflow) are great places to
  ask more complicated questions.  Experienced users will be able to help you
  better if you [ask a good
  question](https://stackoverflow.com/help/how-to-ask).
