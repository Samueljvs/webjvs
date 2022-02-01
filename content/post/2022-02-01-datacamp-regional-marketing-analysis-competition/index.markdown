---
title: Hakuna Moscato. It means drink wine - A targeted approach to regional wine promotions
author: Samuel Verevis
date: '2022-02-01'
slug: datacamp-regional-marketing-anlaysis-competition
categories: []
tags: ["R", "Machine Learning"]
subtitle: ''
summary: 'A Datacamp Competition, using unsupervised Machine Learning to identify the 10 next best regions to target for wine promotions in Russia. I won second prize 🥈 '
authors: []
lastmod: '2022-02-01T15:10:08+13:00'
featured: no
image:
  caption: ''
  focal_point: 'Left'
  preview_only: yes
projects: []
links:
  - icon_pack: custom
    icon: assets/media/icons/brands/datacamp-brand
    name: Datacamp
    url: 'https://app.datacamp.com/workspace/w/9fe41f5d-25aa-44cf-9046-11c7aba12587'
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />





## Executive Summary

* The next 10 regions for targeting wine promotions are as follows: Ivanovo, Kaliningrad, Kaluga, Kursk, Lipetsk, Orenburg, Ryazan, Samara, Volgograd, and Yaroslavl (Oblasts).
* The regional wine promotion analysis draws on several underlying features from the alcohol data to help target the next 10 regions for the up-coming wine promotion.
* Each region draws on similarities of Saint Petersburg's consumption preferences for beer and wine, with an emphasis on changes in regional consumer patterns over time. 
* Through clustering, 12 regions were identified that showed a marked change in consumption preferences for wine and beer throughout the period of 1998-2016.
* Each region experienced similar patterns to Saint Petersburg - that is- a marked shift from beer consumption and an increase in wine consumption.
* Of the 12 regions clustered with Saint Petersburg, 10 were selected; two were excluded because they had the least similar traits, relative to the other regions.
* Notwithstanding this, there are limitation to the analysis. It does not account for market size, demographic information and future growth. Therefore these regions need to be considered alongside other strategic business decisions.

## You had me at Merlot - regional consumers wine and beer preferences

Consumers habits, on average, across Russia have been changing over time vis-a-vis the consumption of beer, wine, vodka, champagne and brandy (Figure 1). Since 1998, beer had the highest per capita consumption in litres (on average 20 L per person), following this had been vodka (average 12 L per person), then wine (3 L), champagne (1 L), and brandy (0.3 L). Over time, consumption in beer has risen substantially to an average 66 L per person in 2012, then falling to an average of 49 L per capita in 2016. Vodka has steadily declined in consumption over time to about half that of 1998 per capita consumption levels (7 L).  Whereas wine has increased almost 100% since 1998, going from an average of 3 L to 6 L, per person, surpassing Vodka. Brandy and Champagne are not heavily consumed across Russia, and at present 0.7 L and 1 L per capita was consumed in 2016. 



<p class="caption">Figure 1: Average consumption trends across Russia</p>
<div float="left">
<img src="{{< blogdown/postref >}}index_files/figure-html/chart-1-1.png" width="100" /><img src="{{< blogdown/postref >}}index_files/figure-html/chart-1-2.png" width="100" /></div>

Despite the aggregate trend, these consumption patterns vary across all 84 regions of Russia. Saint Petersburg, whose success from the wine promotion, closely follows aggregate consumption trends for Russia trend (Figure 2). That is, a rise and fall in per capita beer consumption, alongside steadily increasing in wine consumption (Figure 2). 


<div class="figure">
<p class="caption">Figure 2: Figure 2: Consumption trends across Saint Petersburg</p><img src="{{< blogdown/postref >}}index_files/figure-html/chart-2-1.png" alt="Figure 2: Consumption trends across Saint Petersburg" width="50%" /><img src="{{< blogdown/postref >}}index_files/figure-html/chart-2-2.png" alt="Figure 2: Consumption trends across Saint Petersburg" width="50%" /></div>

## Read betweeen the Wines - establishing a meaningful relationship

Comparing Saint Petersburg against other regions wine and beer consumption, several important features arise within the data:  

* Firstly, it would be a manually exhaustive exercise to untangle consumption trends between regions that are similar to Saint Petersburg, given the high (84) number of regions within Russia (as shown by Figure 3).

* Wine consumption across almost all regions has steadily increased over the 1998-2016 time period, with Saint Petersburg among the upper-mid level of wine consumption.

* A notable downward shift in beer consumption has occurred for most regions, returning to similar levels of 1998 per capita consumption   - this is particularly salient for Saint Petersburg.

* There a appears to be some pattern of substitutability between beer and wine consumption over time. That is, as beer consumption has fallen over more recent times, this has coincided with increasing wine consumption.

* Two notable peaks within the data. First, a spike in wine consumption around 2005, which likely reflects a phenomenal vintage experienced globally for wine producers. Second, a general upwards shift in alcohol consumption occurred around the 2008-09 global recession.

* One obvious outlier is beer consumption per capita for Zabaykalsky Krai; reaching the heights of 207 L in 2006, this amounts to 6 L of beer per day, per person.

<div class="figure">
<p class="caption">Figure 3: Figure 3: Wine and beer consumption, regional comparisons</p><img src="{{< blogdown/postref >}}index_files/figure-html/wine-vs-beer-1.png" alt="Figure 3: Wine and beer consumption, regional comparisons" width="50%" /><img src="{{< blogdown/postref >}}index_files/figure-html/wine-vs-beer-2.png" alt="Figure 3: Wine and beer consumption, regional comparisons" width="50%" /></div>


Notwithstanding the chaos of Figures 3 & 4, a pattern of substitutability of beer and wine emerges, and is a salient feature for Saint Petersburg beer and wine consumption. substitutability might be more prevalent in Saint Petersbrug, as a major Russian port, might be more sensitive to prices changes and choices for beer and wine, thereby having a greater impact on consumer choices. Inland regions within Russia may be less sensitive to prices, as they have less to choose from, and likely faces higher (possibly fixed) costs.

Leveraging this relationship to find other regions within Russia whose consumption patterns are similar to Saint Petersburg, Figure 4 plots a ratio of beer and wine consumption over time for all regions. This captures changes in consumers beer and wine habits across regions and will be used to identify regions, that: 

1. Have initially high beer and low wine consumption that is somewhat stable,
2. Then experience a decrease in beer to wine consumption (through either consuming less beer/and or more wine).  

There are also other regional trends within Figure 4, Namely, regions with constant low beer to wine consumption, constant high beer to wine consumption and then regions where there is no clear pattern; likely due to other unobserved factors.


<div class="figure">
<p class="caption">Figure 4: Figure 4: Beer to wine consumption ratio, regional comparisons</p><img src="{{< blogdown/postref >}}index_files/figure-html/beer-wine-1.png" alt="Figure 4: Beer to wine consumption ratio, regional comparisons" width="672" /></div>


## Here for the right Riesling - A clustered apporach to identifying sub-groups 

Taking a clustering approach to group sub-populations of regions across Russia over time vis-a-vis the wine-beer ratio, identifies data-driven groups (regions) who have similar features to each other. This serves as an initial benchmark for grouping regions by similar beer and wine consumption patterns. Based on initial exploratory data analysis, 4 cluster groups are chosen. This yields 4 distinct groups, whose consumption patterns are shown in the below table - showing average alcohol consumption between 1998 and 2016.






<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
<caption>Table 1: Table 1: Comparing Regional Groupings Average Alcohol Consumption</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Wine</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Beer</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Vodka</div></th>
</tr>
  <tr>
   <th style="text-align:left;"> Group </th>
   <th style="text-align:left;"> Regions </th>
   <th style="text-align:left;"> 1998 </th>
   <th style="text-align:left;"> 2007 </th>
   <th style="text-align:center;"> 2016 </th>
   <th style="text-align:center;"> 1998 </th>
   <th style="text-align:center;"> 2007 </th>
   <th style="text-align:right;"> 2016 </th>
   <th style="text-align:right;"> 1998 </th>
   <th style="text-align:right;"> 2007 </th>
   <th style="text-align:left;"> 2016 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 11 </td>
   <td style="text-align:left;"> 2.6 </td>
   <td style="text-align:left;"> 4.1 </td>
   <td style="text-align:center;"> 4.1 </td>
   <td style="text-align:center;"> 22.2 </td>
   <td style="text-align:center;"> 72.8 </td>
   <td style="text-align:right;"> 55.4 </td>
   <td style="text-align:right;"> 12.5 </td>
   <td style="text-align:right;"> 11.9 </td>
   <td style="text-align:left;"> 5.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 25 </td>
   <td style="text-align:left;"> 3.6 </td>
   <td style="text-align:left;"> 6.5 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 21.0 </td>
   <td style="text-align:center;"> 68.6 </td>
   <td style="text-align:right;"> 55.4 </td>
   <td style="text-align:right;"> 12.9 </td>
   <td style="text-align:right;"> 12.2 </td>
   <td style="text-align:left;"> 5.8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 13 </td>
   <td style="text-align:left;"> 2.1 </td>
   <td style="text-align:left;"> 6.9 </td>
   <td style="text-align:center;"> 6.8 </td>
   <td style="text-align:center;"> 25.2 </td>
   <td style="text-align:center;"> 72.6 </td>
   <td style="text-align:right;"> 45.8 </td>
   <td style="text-align:right;"> 12.4 </td>
   <td style="text-align:right;"> 11.4 </td>
   <td style="text-align:left;"> 5.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> 32 </td>
   <td style="text-align:left;"> 3.1 </td>
   <td style="text-align:left;"> 7.6 </td>
   <td style="text-align:center;"> 6.8 </td>
   <td style="text-align:center;"> 17.4 </td>
   <td style="text-align:center;"> 50.8 </td>
   <td style="text-align:right;"> 45.4 </td>
   <td style="text-align:right;"> 12.6 </td>
   <td style="text-align:right;"> 13.3 </td>
   <td style="text-align:left;"> 8.1 </td>
  </tr>
</tbody>
</table>


Each group of regions per capita alcohol consumption patterns are nuanced but the following can be inferred:     

* All clusters experience initially high average beer consumption increases from 1998 to 2007 with tapering consumption from 2007 to 2016. However, the first two (groups 1 and 2) groups have lower overall wine consumption and does not increase between 2007 and 2016. 
* The third group has similar beer consumption patterns but experiences the steepest decline in beer consumption from 2007 to 2016, whilst wine consumption remains high. 
* Finally, the fourth group increases beer consumption in 2007 but this remains the lowest level of beer consumption relative to the other regions, and remains low through to 2016, with high wine consumption through the 2007-16 period. 
* All regions experience decreases in Vodka consumption, although this is not as salient for the fourth group.


<div class="figure">
<p class="caption">Figure 5: Figure 5: Cluster beer to wine comparisons, over time</p><img src="{{< blogdown/postref >}}index_files/figure-html/cluster-line-1.png" alt="Figure 5: Cluster beer to wine comparisons, over time" width="672" /></div>


These trends are more easily interpreted from Figure 5. Where group 3's beer to wine ratio is the most similar to Saint Petersburg beer to wine consumption ratio. This is because both Saint Petersburg is within Group 3 and contains 12 other regions with a similar beer to wine consumption pattern.

Finally, Figure 6 plots a region by region break down for group 3 to inspect visually how well clustering worked. In general, this appears to have captured regions similar to Saint Petersburg. There are two outliers,  Ulyanovsk (Oblast) whose initially high and spiked beer to wine consumption stands out. Secondly, Primorky (Krai), who geographical location is much further away than all other regions.

The remaining regions - Ivanovo, Kaliningrad, Kaluga, Kursk, Lipetsk, Orenburg, Ryazan, Samara, Volgograd, and Yaroslavl (Oblasts) - are considered the next 10 regions should be targeted for wine promotion events.

        
<div class="figure">
<p class="caption">Figure 6: Figure 6: A apaghetti chart of cluster 3, beer to wine consumption ratio</p><img src="{{< blogdown/postref >}}index_files/figure-html/cluster-compare-1.png" alt="Figure 6: A apaghetti chart of cluster 3, beer to wine consumption ratio" width="90%" /></div>


Figure 7 shows beer (LHS) and wine (RHS) per capita consumption over time. This shows that Cluster 3's aggregate beer and wine consumption trend looks similar to that of Saint Petersburg consumption patterns in Figure 3. Giving more confidence that the clustering method has performed the task well. 


<div class="figure">
<p class="caption">Figure 7: Figure 7: Beer and wine consumption, compared by cluster</p><img src="{{< blogdown/postref >}}index_files/figure-html/group-beer-wine-1.png" alt="Figure 7: Beer and wine consumption, compared by cluster" width="50%" /><img src="{{< blogdown/postref >}}index_files/figure-html/group-beer-wine-2.png" alt="Figure 7: Beer and wine consumption, compared by cluster" width="50%" /></div>





<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
<caption>Table 2: Table 2: The 10 Final Regions: Wine, Beer and Vodka Consumption, Over Time</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Wine</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Beer</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Vodka</div></th>
</tr>
  <tr>
   <th style="text-align:left;"> Regions </th>
   <th style="text-align:left;"> 1998 </th>
   <th style="text-align:left;"> 2016 </th>
   <th style="text-align:center;"> 1998 </th>
   <th style="text-align:center;"> 2016 </th>
   <th style="text-align:right;"> 1998 </th>
   <th style="text-align:right;"> 2016 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Ivanovo Oblast </td>
   <td style="text-align:left;"> 1.4 </td>
   <td style="text-align:left;"> 8.2 </td>
   <td style="text-align:center;"> 20.7 </td>
   <td style="text-align:center;"> 55.4 </td>
   <td style="text-align:right;"> 16.1 </td>
   <td style="text-align:right;"> 7.8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kaliningrad Oblast </td>
   <td style="text-align:left;"> 2.7 </td>
   <td style="text-align:left;"> 8.6 </td>
   <td style="text-align:center;"> 21.6 </td>
   <td style="text-align:center;"> 38.2 </td>
   <td style="text-align:right;"> 12.2 </td>
   <td style="text-align:right;"> 6.2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kaluga Oblast </td>
   <td style="text-align:left;"> 2.8 </td>
   <td style="text-align:left;"> 7.5 </td>
   <td style="text-align:center;"> 24.2 </td>
   <td style="text-align:center;"> 45.1 </td>
   <td style="text-align:right;"> 15.6 </td>
   <td style="text-align:right;"> 7.6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kursk Oblast </td>
   <td style="text-align:left;"> 1.5 </td>
   <td style="text-align:left;"> 5.3 </td>
   <td style="text-align:center;"> 22.9 </td>
   <td style="text-align:center;"> 43.2 </td>
   <td style="text-align:right;"> 4.4 </td>
   <td style="text-align:right;"> 4.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lipetsk Oblast </td>
   <td style="text-align:left;"> 2.6 </td>
   <td style="text-align:left;"> 6.2 </td>
   <td style="text-align:center;"> 29.6 </td>
   <td style="text-align:center;"> 39.7 </td>
   <td style="text-align:right;"> 15.3 </td>
   <td style="text-align:right;"> 4.6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Orenburg Oblast </td>
   <td style="text-align:left;"> 1.7 </td>
   <td style="text-align:left;"> 4.5 </td>
   <td style="text-align:center;"> 19.0 </td>
   <td style="text-align:center;"> 42.4 </td>
   <td style="text-align:right;"> 9.1 </td>
   <td style="text-align:right;"> 3.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ryazan Oblast </td>
   <td style="text-align:left;"> 1.6 </td>
   <td style="text-align:left;"> 6.3 </td>
   <td style="text-align:center;"> 28.4 </td>
   <td style="text-align:center;"> 41.1 </td>
   <td style="text-align:right;"> 14.8 </td>
   <td style="text-align:right;"> 4.9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Saint Petersburg </td>
   <td style="text-align:left;"> 2.7 </td>
   <td style="text-align:left;"> 7.1 </td>
   <td style="text-align:center;"> 27.9 </td>
   <td style="text-align:center;"> 33.7 </td>
   <td style="text-align:right;"> 12.3 </td>
   <td style="text-align:right;"> 6.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Samara Oblast </td>
   <td style="text-align:left;"> 2.8 </td>
   <td style="text-align:left;"> 6.2 </td>
   <td style="text-align:center;"> 23.1 </td>
   <td style="text-align:center;"> 59.9 </td>
   <td style="text-align:right;"> 11.2 </td>
   <td style="text-align:right;"> 4.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volgograd Oblast </td>
   <td style="text-align:left;"> 2.9 </td>
   <td style="text-align:left;"> 5.5 </td>
   <td style="text-align:center;"> 27.9 </td>
   <td style="text-align:center;"> 39.8 </td>
   <td style="text-align:right;"> 12.9 </td>
   <td style="text-align:right;"> 3.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Yaroslavl Oblast </td>
   <td style="text-align:left;"> 3.5 </td>
   <td style="text-align:left;"> 10.2 </td>
   <td style="text-align:center;"> 32.4 </td>
   <td style="text-align:center;"> 38.0 </td>
   <td style="text-align:right;"> 21.1 </td>
   <td style="text-align:right;"> 8.9 </td>
  </tr>
</tbody>
</table>


## Time to Wine down 

Through clustering (kmeans) techniques, guided by exploratory analysis, 10 regions were identified that showed similar changes in consumption patterns to Saint Petersburg. The focus on trends over time to capture consumers preference changes as the means for grouping regions together is one way of doing this but there are likely other approaches.

For instances, taking the latest year of consumer preferences to cluster regions by, but this may lead to miss-judging important features of the data. Namely, the change in regions beer and wine consumption over time.

### A Word of Caution

This is only one approach to identifying regions similar to Saint Petersburg and due to data constraints, does not consider other important variables of interest that might help determine consumption trends and representative consumer insights. Ideally there would additional information such as:  

* Demographic differences between regions,
* Price data for commodities to determine substitution effects,
* Geographical data, such as distance from Saint Petersburg or distance from Capital, as well as indicators for being landlocked or not.

Finally, and most importantly, this analysis should be consider alongside other strategical goals of the business. For instance, this clustering technique does not considered potential future regional economic growth and market size or identifying best future opportunities. It's unclear how well these regions align logistically to stores around Russia. Further research is required to make the best decision possible for successful wine promotions campaign across Russia. 

## Annex


<div class="figure">
<p class="caption">Figure 8: Figure 1 Annex: Elbow (LHS) and Silhouette (RHS) plot</p><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" alt="Figure 1 Annex: Elbow (LHS) and Silhouette (RHS) plot" width="50%" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-2.png" alt="Figure 1 Annex: Elbow (LHS) and Silhouette (RHS) plot" width="50%" /></div>


