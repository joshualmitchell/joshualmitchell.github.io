---
layout: post
title: "Day 3: 30 days of learning"
date: 2017-12-19
---

Today is the day to dig into the code and learn some leftover terms.

It turns out that MS_res (which I learned from my Regression Analysis class to be the Mean Residual Sum of Squares, which is an unbiased estimate of the error variance of an estimator) is one of many good indicators for how good your model is (i.e. the closer to 0, the less error your model makes).

The square root of MS_res, the Root Mean Squared Error, can be interpreted as follows:

If your RMSE is 5, then approximately 68% of your estimations will be within 5 units of the actual value, and about 95% of your estimations will be within 10 units of the actual value.

If your data has a lot of outliers, using the RMSE might not be a good idea, since the errors are squared (making outliers more significant). It might be a better idea to use the Mean Absolute Error (which is just the absolute value of the predicted minus the actual, aka the Average Absolute Deviation).

Both RMSE and MAE are just distance metrics between the actual and hypothesized values (i.e. norms). RMSE uses Euclidean distance where as MAE uses Manhattan distance.

The higher the norm value (i.e. higher than Manhattan distance) the more emphasis is placed on larger errors. However, in a majority of cases, when outliers are exponentially rare, RMSE performs well and is generally preferred.

As far as code goes, I did a brief brush up on matplotlib, numpy, and scikit-learn. Here are some specific new things I learned:

- %matplotlib inline makes any plots you generate with python be rendered by jupyter notebook's own backend.

- dpi means dots per inch (i.e. the resolution)

- the lambda keyword in python just signifies an anonymous function being defined