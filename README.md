# Introduction to Stata

Author: Sam Boysel
Course: ECON 513 (USC Fall 2022)
Version: Stata 17

This repository contains some introductory code to guide students through basic
Stata usage.  Data used is either available with a network connection (e.g.
`webuse`), packaged with Stata (e.g. `sysuse`), or kept in the `data`

## Usage

1. Download this reposiotory as a `.zip` file
2. Extract the contents of the archive (e.g. `econ513.zip`) to a working
   directory. For example, on my machine there is a subdirectory of my home
   directory called `repos`, where I keep all my repositories.  I'd like to keep
   the code and data in this repository in a subdirectory of `repos` called
   `econ513`.  So I would extract the contents of the `econ513.zip` into the
   directory `/home/sam/repos/`.  This will be slightly different on your
   machine and operating system.
3. Open Stata
4. Each `.do` file changes the working directory to the one on my system (e.g.
   `~/repos/econ513`).  Change this value to the full path name of your working
   directory.  On Windows, this will be something like
   ```
   cd "C:\Users\yourusername\repos\econ513" 
   ```
   On Mac OS X
   ```
   cd "/Users/yourusername/repos/econ513"
   ```
5. Try running each `.do` file in Stata and inspecting the output of the
   commands in the corresponding `.log` file, which will be generated in the
   same working directory. 

## General recommendations

* **If you're stuck and don't know how to do something, learn how to effectively
  [seek help](#getting-help)**
* Avoid doing analysis via menus.  Strive to write your analysis as code.
* Log the output of each session to a file.  For example, if your code is
  `analysis.do`, make sure to log to a file like `analysis.log`.  Unless you
  have a good reason, log using plain text.
* eading the output of your logfile can help diagnose errors.
* You can learn alot from reading other people's code.
* Don't try to memorize everything.  You'll learn by doing and with repeated
  practice.  Another advantage of writing do files is that you can record how
  you did something.

## Getting help

You're going to run into obstacles in computational analysis.  Knowing how to
seek help is an important component of self learning and can empower you to
tackle more complicated issues as you learn Stata (as well as other technical
computing tools). 

## Using the built-in Stata documnetation

Open documentation within Stata

```stata
. help reg
```

## Web resources

Suppose your issue isn't as simple as just reading the documentation for a known
Stata command.  Maybe you simply don't know where to start to perform some kind
of ananlysis (e.g. "What Stata code/command can do task X?").  Maybe you're
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
