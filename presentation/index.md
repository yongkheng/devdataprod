---
title       : Developing Data Products
subtitle    : Course Project Presentation
author      : Yong Kheng Goh
job         : 
framework   : html5slides        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

# Developing Data Products - Course Project Presentation

*Yong Kheng Goh* (goh.yongkheng@gmail.com)

*28 September 2015*

This presentation is being created as part of the course project for the coursera developing data products course. 

You can get the demo of the app at shinyapps.io:

https://yongkheng.shinyapps.io/bursamon

--- .class #id 

## Bursamon - Friendly App for your Stock Prices

<img src="bursamon.png" alt="Drawing" style="width: 800px;"/>

--- .class #id 

## Bursamon - The App

**Features and Advantages:**
- Covers all counters at Bursa Malaysia Stock Exchange
- Easy to use interface
- Adjustable dates
- Historical prices chart to aid your analysis
- Easy to sort data

--- .class #id 

## Bursamon - The Data

The app is based on the daily stock prices from Yahoo!Finance. The stock counters are identified by codes. For example the code '6033.KL' is for the stock Petronas Gas Berhad.


```r
library(quantmod)
symbol = '6033.KL'
getQuote(symbol, what=yahooQF('Name'))
```

```
##                  Trade Time             Name
## 6033.KL 2015-09-25 04:50:00 PETRONAS GAS BHD
```

--- .class #id 

## Bursamon - The Chart

The chart produced in the app is predefined. Clients are welcome to feedback on the type of chart that they would like to have in the Bursamon app. We will customize for you! Here is a candlestick chart.



```r
getSymbols("YHOO")
chartSeries(YHOO, type='candlestick')
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 

