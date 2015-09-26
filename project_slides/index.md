---
title       : Illustrating the extent of Arctic sea-ice
subtitle    : data from late 1978 to early 2013
author      : Developing Data Products
job         : Coursera Data Science specialization
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<!-- change the greenish title slide to blueish (for ice) -->
<style>
.title-slide {
  background-color: #CCE5FF;
}
.title-slide hgroup > h1, 
.title-slide hgroup > h2 {
  color: #004C99;
}
</style>

## Background

US [National Snow and Ice Data Center](http://nsidc.org/) measures the extent of Arctic sea-ice. [The project app](https://johanna.shinyapps.io/Project) aims to illustrate the diminishing trend in Arctic sea-ice by letting the user explore the measurements available at UsingR package in a dashboard-like fashion.

The application supports three types of graphics that are all demonstrated on the following slides.

1. an annual timeseries as boxplot 
2. seasonal variation as monthly boxplot
3. seasonal variations as lines for each year with a selected year highlighted in red

The user can choose the range of years pictured.

[R-bloggers](http://www.r-bloggers.com/arctic-sea-ice-at-lowest-levels-since-observations-began/) inspired the line chart with a highlighted year.

--- 

## Annual time series shows a diminishing trend

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 

---- 

## Monthly boxplot illustrates the seasonal variation

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 

--- &twocol

## Line chart with a highlighted year combines the two

*** =left
![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 

*** =right

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png) 

*** =fullwidth

Credits for the two-column layout go to [Zev Ross](http://zevross.com/blog/2014/11/19/creating-elegant-html-presentations-that-feature-r-code/).
