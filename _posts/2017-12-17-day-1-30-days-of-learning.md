---
layout: post
title: "Day 1: 30 days of learning"
date: 2017-12-17
---

Since most of my exposure to machine learning in general has been through classes and theory, I decided to try a more hands-on project based method for the winter break.

Here's the book I decided to follow, which has been raved about in really techy communities like Hacker News:

<a target="_blank" href="https://www.amazon.com/gp/product/1491962291/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1491962291&linkCode=as2&tag=jlelonm-20&linkId=581ccf9e368b9a436e24b12d97cf70f5">Hands-On Machine Learning with Scikit-Learn and TensorFlow: Concepts, Tools, and Techniques to Build Intelligent Systems</a><img src="//ir-na.amazon-adsystem.com/e/ir?t=jlelonm-20&l=am2&o=1&a=1491962291" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

I'm going to go through as much of this book as I can, and use PyTorch instead of Tensorflow as much as I can (but possibly just learn TensorFlow to start off with).

Then, after this, I'll apply it to some of my own projects (via a custom Alexa skill, maybe?) towards the end.

I spent today reading all of Ch 1 of Hands-On ML. So far I really like this book. I intend to answer all of the exercise questions tomorrow, but for now, here are some definitions I made sure to physically type (i.e. not copy / paste).

Attribute vs Feature - Although they tend to be used interchangeably, attribute means property of the data (i.e. weight), and feature means that property with it's given value (i.e. it has a weight of 100 pounds)

Dimensionality Reduction - trying to simplify the data without losing too much information

Feature Extraction - combining correlated features into one feature

Instance-based learning - taking samples of data and then categorizing new samples based on their similarity to original samples

Model-based learning - taking samples of data, building a model that represents that data, and then predicting new samples based on the model created from the old samples.

Noisy - by definition means partially random

Utility / Fitness function - measures how good your model is
Cost function - measures how bad your model is

Inference - just means predicting new cases with your model

Sampling noise - not representative data as a result of random chance
Sampling Bias - getting data that doesn't generalize well to what new cases you want to predict because of a flawed sampling method

If your data is missing a few features you have to decide between ignoring the samples with missing features, filling in the gaps (with, say, the median), ignoring the attribute itself, and/or train a model with the feature(s) and one without.

Feature Engineering - composed of Feature Selection (i.e. sorting between relevant and irrelevant features), Feature Extraction (combining existing features to produce more useful ones), and possibly gathering more data to get new features

Overfitting - when the complexity of your model is too large relative to the amount and noise of your training data. You can fix this by selecting a model with fewer parameters, reducing the number of attributes in your training data, constraining the model somehow, gathering more data, or reducing noise in your model, like fixing data errors and removing outliers)

Regularization - constraining the model (i.e. making it simpler and reducing risk of overfitting).

Hyperparameter - a parameter of the learning algorithm (not the model itself)

Underfitting - when the model is too simple to learn the underlying structure of the data. Can be fixed by using a more complex / less simple model, adding more features (i.e. feature engineering), reducing model constraints (i.e. reducing the regularization hyper parameter).

I also learned that when you become an Amazon Affiliate, you have 180 days to make your first 3 sales or they cancel your account.
