---
layout: single
title: "Gathering Housing Insights From The Zillow Dataset (on Kaggle)"
date: 2018-06-15
categories: project
tags: [machine-learning]
toc: true # outline page on the right hand side
---

## Intro

I've always been passively "interested in real estate" - but when I sat down and thought about what that meant, it dissolved mostly into, "I'd really like to just own a bunch of $REAL_ESTATE_PROPERTIES, rent them out, and live off the profit." I imagine I'm not alone in that regard - there are probably a ton of "wannabe" real-estate moguls like me. 

Whether or not I decide to develop that interest later, I'd still like to ask some questions and look at some numbers (using the [Zillow Prize Dataset](https://www.kaggle.com/c/zillow-prize-1/data)). To set an initial direction of this project, I'd like to know:

- In general, what makes a house expensive?
- Over time, what correlates with rising house values? 
- When's the best time to buy a house?
- Where's the best place to buy a house?
- How much of an impact do surrounding municipal/residential/commercial entities have on the value of a house?

I'll be updating this as I make progress on it.

## Update 1 (06/18/2018):

After taking a closer look at the data and what some people have done, it seems like most of what could be done with this dataset has [already](https://www.kaggle.com/philippsp/exploratory-analysis-zillow) [been](https://www.kaggle.com/sudalairajkumar/simple-exploration-notebook-zillow-prize) [done](https://www.kaggle.com/captcalculator/a-very-extensive-zillow-exploratory-analysis). I have to be honest, it does kill some of the motivation I have for this project, and makes it feel more like a regular school assignment. That being said, it's still a great opportunity to touch up on data wrangling techniques for "regular" data.

I want to make this post both informative and novel, so I'll import my favorite kernel (above) here and fill in any gaps I see. In other words, I'll take advantage of any unfamiliarity by picking out stuff I either had to google or think about deeper and explaining it here.
