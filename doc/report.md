---
title: "Relating Poverty and Higher Education"
author: "Jomar Sastrillo"
date: "December 10, 2017"
output: github_document
---

# Abstract
It is a common belief that the the path out of poverty is education. The reason being that education opens the path to jobs with higher earnings. It is these higher income outlook and to an extent, avoiding aimless spending which allows one to climb out of poverty. Politicians even present on their platforms ways to expand education as a means to reduce poverty.

There have already been studies that looked into the relationship between education and poverty. However, for this rudimentary analysis, we take a very simplified look into the relationship and find consistency in the hypothesis.


# Analysis
The analysis takes data from the US department of agriculture[1] and extracts for each county the percent of poeple in poverty and the percent of people with a Bacherlor's degree or higher. These will serve as measures for poverty and education respectively. Each pair of observations can be represented in a scatter plot where each point is a county.

![](../results/scatter-relation.png)

One of the simplest models for this data set can be found using a linear regression. Using `ggplot` we can sketch the linear regression line through the data. It doesn't take much analysis to determine that the linear model is poor model for the data. From the scatter plot, we can see that there appears to be some sort of reciprocal relationship for the lowest poverty counties. This suggests to us that the next course of analysis is to try to find a model for the minimum poverty level that can be attained by a county with a given graduation rate. If such a minimum curve can be found, then we might treat the distance between points to the minimum curve to be some measure of a county's inefficiency in reducing poverty.
 

# Sources
* [1] County-level Data Sets . United States Department of Agriculture: Economic Research Service. Accessed 2017. URL: https://www.ers.usda.gov/data-products/county-level-data-sets/
