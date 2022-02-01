---
title: Neither too much, nor too little, but just right'. A portfolio assessment on the Goldie-locks of Bitcoin 
author: Samu Verevis
date: '2022-02-01'
slug: datacamp-portfolio-analysis
categories: []
tags: ["R", "Market Analytics"]
subtitle: ''
summary: 'Datacamp competition, finding the optimal portfolio. I won second prize 🥈'
lastmod: '2022-02-01T16:13:22+13:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: yes
projects: []
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />




## Recommendations

* In a non-traditional fashion, **Bitcoin appears to take the elevator down and the elevator back up** when it comes to stock-market performance,
* Therefore, we recommend the **Glodie-locks** portfolio for the company, with shares approximately at 60% in US gold, 35% in the S&P 500 and 5% in Bitcoin,
* This amount leads to highest returns per unit of risk, relative to holding little to none, despite the increase in overall portfolio volatility,
* We believe that Bitcoin will also be a suitable hedge for inflation given the associated high returns it yields,
* It's also important to maintain a high portfolio weight in gold, as this appears to naturally hedge against some of the downside risk that comes with holding Bitcoin,  
* And although the nature of the asset is highly volatile with large down-side risks, diversification still remains a better strategy for reducing overall portfolio risk-return, than putting all the eggs in one basket.



## Potfolio analysis

When selecting the amount of Bitcoin to invest in, we need to find a balance in the expectation of gains vs.  the risk of losses. We can reduce the risks of suffering large losses via two simple methods. 

1. Carefully selecting a diversified portfolio and avoid investing in one single investment can reduce risk and increase returns,  
2. Use back testing to test the portfolio analysis. 

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-1.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-2.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-3.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-4.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-5.png" width="672" />

Firstly, the figures above show how dips in each equity occurring at different time points, but a general upwards trend in close prices.

Secondly, the final figure above shows the close prices of S&P500 against Bitcoin. Despite Bitcoin outstripping the value of SP 500, it's wise to invest in both assets that generates solid returns whilst mitigating loss. To do this, we need to understand the inherent risk associated with each equity and their return performance. This information which will guide the constraints we want to set in order to optimize a risk-off portfolio for the company.

To decide how much Bitcoin we want in the portfolio we need to define the portfolio weights and their returns: 

* Weights tell you the percentage of total value invested into each asset
* returns measure relative increase over the period

### A general stratergy for weight selections over time

In general, there a three ways to think about setting weights:  

1. Betting on 1 Asset - speculative and likely to be inefficient,  
2. Equal weights - perfect diversification of assets in each risky asset (if assets are similar in terms of risk and reward),  
3. Weights proportional to the market value to the assets, over-weighting stocks of big firms an under-weighting stocks of small firms. 

However, to avoid extreme losses, *'don't put all your eggs into one basket'*, that is - a portfolio made up of only the S&P500 or Bitcoin or US gold. Further from this, we need to consider how to manage returns over time.

As the values of assets change over time, you can either be a *passive investor and not trade any further*; this is called the buy and hold strategy. **Or** to buy and trade at the close of each day, month, quarter or year. This process results in re-balancing a portfolio, such that the portfolio is re-weighted correctly to reflect the desired proportional amount of each asset.

## Portoflio Perofrmance

### Returns and the Sharpe ratio

<div class="figure">
<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" alt="Returns over time" width="672" />
<p class="caption">Figure 1: Returns over time</p>
</div>

Portfolio performance is used make predictions about the past and future performance of any given portfolio. To do this, we need consider the performance of risks and rewards for each equity (portfolio volatility, and mean return). Portfolio volatility is the de-meaned return -that is, how much it varies from the mean. The higher the volatility the higher the probability of  positive and/or negative returns occurring for a given time period. 

The S&P 500 is generally considered the most important benchmark portfolio for investors in stocks. To interpret these numbers we need a benchmark to compare with - typically a risk free asset such as the TSY bill. And because there is no risk - the expected return itself is called the risk free rate. The difference between the risk-free-rate (asset) and the risky portfolio is called the excess Return of Risky Portfolio, and it tells us that how much additional return you can expect on the portfolio compared to the risk free rate.

Using the excess return and volatility in combinations gives us the Sharpe ratio, which shows the return per unit of risk taken. The higher the ratio is the more return your portfolio gets, for the same per unit of risk.

<img src="{{< blogdown/postref >}}index_files/figure-html/portfolio-performance-1.png" width="672" /><table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> gold_usd </th>
   <th style="text-align:right;"> Bitcoin </th>
   <th style="text-align:right;"> SP500 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Annualized Return </td>
   <td style="text-align:right;"> 0.0520 </td>
   <td style="text-align:right;"> 1.0227 </td>
   <td style="text-align:right;"> 0.1282 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Annualized Std Dev </td>
   <td style="text-align:right;"> 0.1253 </td>
   <td style="text-align:right;"> 0.7953 </td>
   <td style="text-align:right;"> 0.1427 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Annualized Sharpe (Rf=0%) </td>
   <td style="text-align:right;"> 0.4151 </td>
   <td style="text-align:right;"> 1.2860 </td>
   <td style="text-align:right;"> 0.8987 </td>
  </tr>
</tbody>
</table>

### Rolling estimation of returns
 
We also need to consider the rolling estimation of returns within out portfolio, which is using the K most recent values to help inform us of the business cycle and market direction. These are persistent periods of calm and/or stress in the market. Therefore, current performance is better estimated when we give more weight to recent observations than to the distant observations, as it captures the current business cycle.

We pick a window length that's large enough to reduce the noise of the market, but the longer the window is the more it smooths over the highs and lows and thereby becoming less informative of the current market conditions. This is down to personal preference, and we believe it's best to go with a 1 year rolling estimation.

The plots below show the rolling annualized returns, standard deviations (volatility) and the Sharpe ratio for S&P 500, Bitcoin and US Gold. This reveals both **how volatile Bitcoin is, as well as how high the returns can be**. It also reveals, the continually changing behavior's of the equities within the market, and how the Sharpe ratio changes over time.


<img src="{{< blogdown/postref >}}index_files/figure-html/window-performance-1.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/window-performance-2.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/window-performance-3.png" width="672" />

## Measring porfolio risk to returns

### Non-normal returns and downside risk

If Portfolio returns have a normal distribution and the density function is bell shaped this means it's symmetric and gains and losses occur in equal amounts. However, this isn't typical of most stocks, which have longer fatter tails at negative values. We also use the skewness and kurtosis (symmetry and tail fatness) of the distribution to inform on risk. Left-skewed means that more negative values occurs more often than large positive returns (long left tail).Fat tails are a cause of non-normality, which means fatter-tails are a sign of larger extreme values occurring in the distribution. Non-normal returns are often skewed to the left, and more extreme negative values happen than what one would expect under a normal distribution. The s.d is not enough of a measure for volatility.

There are other measures - such as the value at risk and expected shortfall (at 5%), as a way of capturing the inherent risk in each equity. To explain, the value at risk quantifies the risk of the 5% most extreme losses - 5% value at risk are returns that are so extremely negative,  there is a 5% change of observing a return that is even more negative. We can compute the value of the 5% most negative returns - thus giving the 5% expected shortfall.

Using the below information we can infer that:  

* Bitcoin presents the most symmetric distribution, but these gains and losses come in a larger magnitude,
* Bitcoin has the highest downside risk, largest drawdowns, and loss Deviation, compared to the three other equities,
* However, Bitcoin has also seen the highest market returns compared to the other equities.
* US Gold is the least volatile equity of the three, but also presents the lowest returns.
* The S&P 500 performance is the best, with relatively low volatility and modest returns.

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-4-1.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-4-2.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-4-3.png" width="672" /><table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> gold_usd </th>
   <th style="text-align:right;"> Bitcoin </th>
   <th style="text-align:right;"> SP500 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Semi Deviation </td>
   <td style="text-align:right;"> 0.0243 </td>
   <td style="text-align:right;"> 0.1502 </td>
   <td style="text-align:right;"> 0.0306 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gain Deviation </td>
   <td style="text-align:right;"> 0.0251 </td>
   <td style="text-align:right;"> 0.1693 </td>
   <td style="text-align:right;"> 0.0262 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Loss Deviation </td>
   <td style="text-align:right;"> 0.0198 </td>
   <td style="text-align:right;"> 0.0994 </td>
   <td style="text-align:right;"> 0.0321 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Downside Deviation (MAR=10%) </td>
   <td style="text-align:right;"> 0.0264 </td>
   <td style="text-align:right;"> 0.1067 </td>
   <td style="text-align:right;"> 0.0294 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Downside Deviation (Rf=0%) </td>
   <td style="text-align:right;"> 0.0216 </td>
   <td style="text-align:right;"> 0.1024 </td>
   <td style="text-align:right;"> 0.0258 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Downside Deviation (0%) </td>
   <td style="text-align:right;"> 0.0216 </td>
   <td style="text-align:right;"> 0.1024 </td>
   <td style="text-align:right;"> 0.0258 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Maximum Drawdown </td>
   <td style="text-align:right;"> 0.1610 </td>
   <td style="text-align:right;"> 0.7557 </td>
   <td style="text-align:right;"> 0.2000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Historical VaR (95%) </td>
   <td style="text-align:right;"> -0.0536 </td>
   <td style="text-align:right;"> -0.2713 </td>
   <td style="text-align:right;"> -0.0650 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Historical ES (95%) </td>
   <td style="text-align:right;"> -0.0659 </td>
   <td style="text-align:right;"> -0.3292 </td>
   <td style="text-align:right;"> -0.0872 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Modified VaR (95%) </td>
   <td style="text-align:right;"> -0.0512 </td>
   <td style="text-align:right;"> -0.2622 </td>
   <td style="text-align:right;"> -0.0599 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Modified ES (95%) </td>
   <td style="text-align:right;"> -0.0636 </td>
   <td style="text-align:right;"> -0.3265 </td>
   <td style="text-align:right;"> -0.0928 </td>
  </tr>
</tbody>
</table>

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-5-1.png" width="672" />

## How to optimize future portfolio returns

There are typically three types of drivers for a portfolio's performance: (i) the individual performance of the assets in terms of risk and return, (ii) the portfolio weight of each of the assets, (iii) the correlation between the asset returns. We've already discussed the general performance and weights. Finally, it's worth looking at the correlations between the three equities. 



### Correlations

We can also visualize the correlation between differing stocks. If there are more correlated this typically increases variance as when one suffers loss, it is likely so will the other. Thus increasing the risks. These are drivers with the case of two assets in the portfolio. 

As shown below we can see that there is some positive correlation between Bitcoin and S&P 500.This suggests that as one of the equities fall or increase, it is likely that the other will follow. Suggesting they are both somewhat exposed to the same market conditions.  

However, gold appears to be negatively correlated with Bitcoin. This suggests that as Bitcoin falls, gold will increase and acts as a natural hedge for each other. 

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-7-1.png" width="672" />



### A quick word on Harry Markowitz's modern portfolio theory

You can optimize your portfolio performance by setting targets and constraints to give, either the highest return or lowest variability for some combinations of weights within the portfolio. Additionally, it's important to set weight constrains that stop your portfolio form being completely dominated by just a few assets.

Depending on the return targets you set, you find the optimal weights in your portfolio that give you the lowest portfolio variability. A high return target, means higher variability. Mapping out all the return optimization you can obtain the efficient frontier. 

The portfolio that starts the curve is called the minimum variance portfolio, and it's where the return is sufficiently higher than the risk free rate. It's the portfolio that solves the problem of minimized variance without a constraint on expected returns.

You can evaluate each portfolio on the efficient frontier's Sharpe ratio - you can a find a line that is tangent to the portfolio frontier - this is called the tangency portfolio - this portfolio is the one that has the highest Sharpe ratio meaning, it's the highest return on the portfolio per unit of portfolio risk (variability). 

### Better Optimizations for portfolio specifications 

With the above in mind, the aim of this portfolio is to minimize portfolio volatility. We will heavily leverage from the PortfolioAnalytics package so search for the optimal portfolio weights across the 3 assets, gold, S&P 500 and Bitcoin and find our tangency portfolio.

Firstly, we want to define a benchmark for a accurately measuring the relative performance of our portfolio. Then introduce some more constraints to see which portfolio performs the 'best' for the company.

Each portfolio will be re-balanced quarterly, and back-tested on historical data. The analysis will be conducted as follows:

1. Specify an equal weight portfolio,
2. Introduce a base portfolio specification that minimizes the portfolio standard deviation subject to full investment and long only constraints.
3. Add a box constraint with a lower and upper bound on the weights - such that the weight of assets don't go above or below a specified amount. In this case, we will set the minimum investment amount to 5% of any equity, **to avoid the portfolio being completely dominated by one asset**.

The below graphs and figures show the performance of each portfolio on an annualized basis, plus the optimal set of weights, the Sharpe ratio and variability.







<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-9-1.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-9-2.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-9-3.png" width="672" /><table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> benchmark </th>
   <th style="text-align:right;"> base </th>
   <th style="text-align:right;"> Box.constraints </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Annualized Return </td>
   <td style="text-align:right;"> 0.4293 </td>
   <td style="text-align:right;"> 0.1595 </td>
   <td style="text-align:right;"> 0.2226 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Annualized Std Dev </td>
   <td style="text-align:right;"> 0.2788 </td>
   <td style="text-align:right;"> 0.1267 </td>
   <td style="text-align:right;"> 0.1288 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Annualized Sharpe (Rf=0%) </td>
   <td style="text-align:right;"> 1.5399 </td>
   <td style="text-align:right;"> 1.2588 </td>
   <td style="text-align:right;"> 1.7279 </td>
  </tr>
</tbody>
</table>

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-9-4.png" width="672" />

### Output results and a portfolio conclusion

The final output from the portfolio analysis shows that the benchmark of an equal 1/3 split weight in equities, experiences the highest annual returns, however, this is at the expense of having the highest portfolio volatility. 

The base optimization portfolio, experiences the lowest returns across all portfolios but performs the best in portfolio risk mitigation. Finally, the box constraints hit a **Goldie locks** combination, where the best returns are a achieved without exposing the company to unnecessary risk.

This is confirmed by also having the highest Sharpe ratio, meaning this portfolio produces the highest return per unit of risk compared to the other two portfolios. This renders the optimal portfolio for the company, with shares approximately at 60% in US gold, 35% in the S&P 500 and 5% in Bitcoin.

## Citations

  Brian G. Peterson and Peter Carl (2020). PerformanceAnalytics: Econometric Tools for Performance
  and Risk Analysis. R package version 2.0.4. https://github.com/braverock/PerformanceAnalytics
  
  Brian G. Peterson and Peter Carl (2018). PortfolioAnalytics: Portfolio Analysis, Including
  Numerical Methods for Optimization of Portfolios. R package version 1.1.0.
  https://github.com/braverock/PortfolioAnalytics
  
  Jeffrey A. Ryan and Joshua M. Ulrich (2020). quantmod: Quantitative Financial Modelling Framework.
  http://www.quantmod.com https://github.com/joshuaulrich/quantmod.
  
  
  Jeffrey A. Ryan and Joshua M. Ulrich (2020). xts: eXtensible Time Series. R package version
  0.12.1. https://github.com/joshuaulrich/xts

