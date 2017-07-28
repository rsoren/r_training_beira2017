## Welcome to Data Analysis with R!  
Beira, Mozambique - July 17 to July 28, 2017  
[Clique aqui](index_portuguese.md) para ver esta página em português.

&nbsp;&nbsp;[Introduction](#intro)  
&nbsp;&nbsp;[Setting up R on your computer](#setup)  
&nbsp;&nbsp;[Course materials](#materials)  
&nbsp;&nbsp;[Additional resources for learning R](#resources)  
&nbsp;&nbsp;[About the instructor](#about)  

<br>

---

<a id="intro"></a>
### Introduction 

In this training, we will learn the basics of how to use R to explore, analyze and visualize your data. This website will be updated after each day of the course, including code examples and a summary of what we learned. 

The purpose of the training is to give you practical skills. We will focus on common tasks and problems you encounter in your daily work. If you're currently working on a project and want one-on-one assistance, please feel free to contact me (see "About the instructor"). Your analysis might be a good example to bring to the full group. 

Many software options are available for data analysis, but you might prefer R for a few reasons:
- Unlike SAS, SPSS, Matlab, Stata, Minitab and others, R is completely free.
- Unlike point-and-click programs like Excel, R uses code. This allows you to automate repetitive tasks and track/reproduce your work. 
- Because R is open source, thousands of people have contributed packages that add functionality. Apart from statistical methods, R can make [beautiful graphics](http://www.r-graph-gallery.com/all-graphs/), generate [automatic reports](http://rpubs.com/) and make interactive [web applications](https://www.rstudio.com/products/shiny/shiny-user-showcase/). 
- R is the [language of choice among statisticians](https://www.fastcompany.com/3030716/the-9-best-languages-for-crunching-data) and is [in-demand](http://blog.revolutionanalytics.com/2014/05/companies-using-r-in-2014.html) at big companies like Google and Facebook. 
- It's fun! 

<br>

---

<a id="setup"></a>
### Setting up R on your computer 
1. Download R [here](https://cran.r-project.org/bin/windows/base/). Click on "Download R 3.4.1 for Windows" and run the installer. 
2. Download RStudio [here](https://www.rstudio.com/products/rstudio/download/). Click on "RStudio 1.0.143 - Windows Vista/7/8/10" and run the installer. 

*Note:* If your computer has OS X or another operating system, go to the same websites from 1 and 2 and use the specific installers for your computer.

3. When you're ready to begin, **open RStudio**, not R. RStudio is a development environment designed to make the experience of writing code more comfortable. 
4. After you open RStudio, select the "Console" window, type `install.packages("dplyr")` and follow the prompts. This installs an R package called "dplyr" that I highly recommend for handling spreadsheet-like data. 


<br>

---

<a id="materials"></a>
### Course materials 

<table align="center">
    <tr>
        <td white-space: nowrap>Day 1, Monday, July 17</td>
        <td>Running code in RStudio; R as a calculator; variables and vectors; using R functions</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day1_script.R">Code</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Day 2, Tuesday, July 18</td>
        <td>Creating vectors; logical operators; indexing a vector</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day2_script.R">Code</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Day 3, Wednesday, July 19</td>
        <td>Using Coursera.org; data analysis example; character strings; indexing matrices</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day3_script.R">Code</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Day 4, Thursday, July 20</td>
        <td>R documentation and online help; writing your own functions; intro to data frames</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day4_script.R">Code</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Day 5, Friday, July 21</td>
        <td>Handling data frames; summary statistics; some graphics; saving and loading files</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day5_script.R">Code</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Day 6, Monday, July 24</td>
        <td>'dplyr' functions for data frames and summary statistics</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day6_script.R">Code</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Day 7, Tuesday, July 25</td>
        <td>Intro to regression; describing data with graphics</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day7_script.R">Code</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Day 8, Wednesday, July 26</td>
        <td>Finding and using R packages; loading data from other programs</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day8_script.R">Code</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Day 9, Thursday, July 27</td>
        <td>Using the 'gmodels' package for crosstables; categorical/factor variables; regression</td>
        <td><a href="https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day9_script.R">Code</a></td>
    </tr>
    <tr>
        <td white-space: nowrap>Day 10, Friday, July 28</td>
        <td>Course review with summary tutorial (see "Code" link)</td>
        <td>http://htmlpreview.github.io/?https://github.com/rsoren/r_training_beira2017/blob/master/scripts/day10_review.html</td>
    </tr>
</table>


<br>

---

<a id="resources"></a>
### Additional resources for learning R 

<dl>
  <dt>"Try R" website</dt>
    <dd>An interactive tutorial that lives in your browser. If you're new to R, this would be a great place to start. Requires internet. <br />
    http://tryr.codeschool.com/ </dd>
  
  <dt>"R for Beginners" by Emmanuel Paradis</dt>
    <dd>A review of essential R concepts. Most of its 72 pages are spent explaining the examples; it's one of the more readable tutorials out there. <br />
    https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf </dd>
  
  <dt>"The Art of R Programming" by Norman Matloff</dt>
    <dd>A more comprehensive (~350 page) review of R concepts. All concepts have example code. If you want to invest time to learn R well, I recommend typing out each example.  <br />
    http://www.atmos.albany.edu/facstaff/timm/ATM315spring14/R/The%20Art%20of%20R%20Programming.pdf </dd>
    
  <dt>Data Science certificate from Johns Hopkins University</dt>
    <dd>You can take these courses for free on Coursera.org. I recommend the first 4 courses in the series: "The Data Scientists' Toolbox", "R Programming", "Getting and Cleaning Data" and "Exploratory Data Analysis". If you're interested hypothesis testing (e.g. getting p-values and confidence intervals), also check out the courses "Statistical Inference" and "Regression Models". <br />
    https://www.coursera.org/specializations/jhu-data-science</dd>
    
  <dt>Other resources, including some in Portuguese</dt>
    <dd>This site links to many resources (os escritos em português começam no número 25). <br />
        https://producaoanimalcomr.wordpress.com/2015/12/15/livros-r-gratuitos-para-downloads/ </dd>
    
</dl>


<br>

---

<a id="about"></a>
### About the instructor 

Name: Reed Sorensen  
Email: rsoren@uw.edu

I'm a PhD student at the University of Washington, visiting Mozambique as part of a three-month study abroad opportunity. With a background in epidemiology, my work focuses on understanding patterns of illness and mortality in a population, and using quantitative methods to determine the most effective ways to make people healthier. For example, at the Institute for Health Metrics and Evaluation (IHME), I conduct simulations to predict the costs and health benefits that would result from a proposed program or policy. Similarly, my dissertation will focus on estimating how much of a population's future disease burden could be avoided. I've been using R for my daily work since 2011, and consider myself an advocate for open science and reproducible research. I live in Seattle with my wife, Lisa, and our golden retriever, Oliver. 

