---
layout: single
title: " Data Science (ish) Q/A Collection"
date: 2018-02-23
categories: blog
tags: [machine-learning, deep-learning]
toc: true # outline page on the right hand side
---

As I'm learning and doing research, I often have a lot of questions that I silently ask myself. A lot of them get answered as I read further, but some of them don't.

And then they just linger in my self-conscious.

As an instructor, when a student has a question but doesn't ask it, it frustrates me because it really helps me understand what I'm not communicating effectively (as well as where the knowledge gaps are). As a student, it frustrates me because sometimes I have the same question but forget to ask it (or it just never occured to me).

In any case, this knowledge is valuable, and I feel that I could add a lot of value to the lives of anyone learning data science simply by listing all the questions that come to mind, as well as answers to them when I get them.

So, I'm going to list any questions I come across (or have). Then, as I have both the answers and the time, I'll put them here as well.

Also, as of 02/27/2018, I found this page: http://www.itshared.org/2015/10/data-science-interview-questions.html

So I'll be adding those in later as well.

## Experiment Design

Explain what resampling methods are and why they are useful. Also explain their limitations.

Explain selection bias (with regards to a dataset, not variable selection). Why is it important? How can data management procedures such as missing data handling make it worse?

Explain the difference between "long" and "wide" format data. Why would you use one or the other?

Is mean imputation of missing data acceptable practice? Why or why not?

What're some missing data imputation schemes (missForest, MICE...)? What're their uses and weaknesses?
Explain Edward Tufte's concept of "chart junk."

How do you treat missing values? What're the pros and cons of using mean, median, K-NN imputation, regression, etc?

What is an outlier? Explain how you might screen for outliers and what you would do if you found them in your dataset. Also, explain what an inlier is and how you might screen for them and what you would do if you found them in your dataset.



Given a black box machine learning algorithm that you can’t modify, how could you improve its error?

How to find the best hyper parameters?

How do you treat outliers? What're the pros and cons of replacement by quartile values, max or min etc.

What're some different types of transformations, what do they do, and when should you do them? (i.e. normalization and variable transformations like x^2 -> z)

What're some different sampling techniques and when/why should you use each of them? Pros and cons? (e.g. simple random sampling, stratified sampling)

What're all the performance measures like confusion matrix, accuracy, sensitivity, specificity, precision, F-Measure, Recall, F1, etc. and what do they do?

Explain what precision and recall are. How do they relate to the ROC curve?

Explain what regularization is and why it is useful. What are the benefits and drawbacks of specific methods, such as ridge regression and LASSO?

Explain likely differences encountered between administrative datasets and datasets gathered from experimental studies. What are likely problems encountered with administrative data? How do experimental methods help alleviate these problems? What problems do they bring?

Explain what a false positive and a false negative are. Why is it important to differentiate these from each other? Provide examples of situations where (1) false positives are more important than false negatives, (2) false negatives are more important than false positives, and (3) these two types of errors are about equally important.

### Feature Selection / Extraction

What is feature selection/ extraction? Why do you do it? How do you do it?

What're the pros and cons of each of these feature selection techniques: Lasso regression, Ridge regression, Subset selection, Random forest

## Statistics

What is hypothesis testing? When/why should you do it? What're the popular hypothesis tests and what do they test? 

What is the Central Limit Theorem? Explain it. Why is it important? When does it fail to hold?

What is statistical power?

Explain what a long tailed distribution is and provide three examples of relevant phenomena that have long tails. Why are they important in classification and prediction problems?

What're the different Bayesian methods (Naïve Bayes, Bayesian model averaging, Bayesian adaptive trials...)? What're their uses and weaknesses?

What're Bayesian networks (pathway mining)? What're their uses and weaknesses?

What is Statistical inference and group testing? Strengths, weaknesses?

How does the distribution of the data affect results for say, neural networks, regression, etc? Can we use it to our advantage?

## Numerical / Convex Optimization

What're the different Optimization algorithms (genetic algorithms, quantum-inspired evolutionary algorithms, simulated annealing, particle-swarm optimization)? What're their uses and weaknesses?

Explain what a local optimum is and why it is important in a specific context, such as k-means clustering. What are specific ways for determining if you have a local optimum problem? What can be done to avoid local optima?

What're the different Gradient-based optimization methods? What're their uses and weaknesses?

### Hypothesis Tests and Supervised Learning

How do hypothesis tests factor into supervised learning models? It seems like we just don't care about some of them when they could add some amount of information.

## Unsupervised Learning

### Clustering

Clustering in a nutshell. What're the different types, assumptions, mistakes, indicators, etc? (e.g. K-Means, distance and dissimilarity measures (for both numerical and non-numerical types of variables), Hierarchical clustering, maybe a few others)

### Dimensionality Reduction

What effect do the different dimensionality reduction techniques have on a picture? What are the meaningful ones? Can lossy compression algorithms on pictures be thought of as dimensionality reduction? Or is there a meaningful difference?

Dimensionality Reduction in a nutshell. What're the different types, assumptions, mistakes, indicators, etc? (e.g. PCA, Kernel-PCA, etc and manifold learning techniques like MDS and t-SNe)

What is principal components analysis (PCA)? Explain the sorts of problems you would use PCA for. Also explain its limitations as a method.

### Generative Models

What is an auto-encoder? Why do we "auto-encode"? Hint: it's really a misnomer.

## Supervised Learning 

Regression in a nutshell. What're the different types, assumptions, mistakes, indicators, etc? (i.e. Simple / Multiple LR, GLMs, R^2, RMSE, Adj R^2, Predicted R^2, Lasso / Ridge Regression, Regularization, Over/Underfitting, Learning Rate, Bias/Variance Tradeoff...)

Classification in a nutshell. What're the different types, assumptions, mistakes, indicators, etc? (i.e. K-NN, Logistic Regression with ROC curve and selection of optimal threshold, Decision trees, Bagging / Random Forrests, SVMs, Bayes Classifier, Boosting (e.g. Xgboost, Adaboost, gradient boost), ANNs (perceptron, MLP, etc), 

## Regression

Assume you need to generate a predictive model of a quantitative outcome variable using multiple regression. Explain how you intend to validate this model.

Does linear regression perform slightly better than chance for image classification? Or is it just not even worth it?

What does correlation between numerical-numerical variables, categorical-categorical, categorical and numerical variables mean? What do you do about it? How do you find out it's there?

What is the Variance Inflation Factor (VIF)?

What're Near Zero Variance predictors? How do you deal with them?

Why Mean Squared Error or Mean Absolute Error for the loss function?

Explain what regularization is and why it is useful. What are the benefits and drawbacks of specific methods, such as ridge regression and LASSO?

What're the different Penalized regression models (elastic net, LASSO, LARS...) and adding penalties to models in general (SVM, XGBoost...)? What're their uses and weaknesses?

What're Spline-based models (MARS...)? What're their uses and weaknesses?

### Neural Networks

What is the difference between a neural network that has 8 hidden layers with 1 node in each layer, and one that has 1 hidden layer with 8 nodes?

What is a Boltzmann Machine? Why a Boltzmann Machine?

Why do we use sigmoid for an output function? Why tanh? Why not cosine? Why any function in particular?

Why are CNNs used primarily in imaging and not so much other tasks?

Explain backpropagation simply.

Is it OK to connect from a Layer 4 output back to a Layer 2 input?

Explain dropout. What happens during the forward and backward pass?

Neural network training loss/testing loss stays constant, what do you do?

Why do RNNs have a tendency to suffer from exploding/vanishing gradient? How do you prevent this?

Does using full batch means that the convergence is always better given unlimited power?

What is the problem with sigmoid during backpropagation?

Explain the differences between artificial neural networks with softmax activation, logistic regression, and the maximum entropy classifier.

## Scenarios

You have data on the duration of calls to a call center. Generate a plan for how you would code and analyze these data. Explain a plausible scenario for what the distribution of these durations might look like. How could you test (even graphically) whether your expectations are borne out?

Provide a simple example of how an experimental design can help answer a question about behavior. For instance, explain how an experimental design can be used to optimize a web page. How does experimental data contrast with observational data.

## Unsorted

What is KKT and what're it's conditions?

What is Laplace Approximation and what's it used for?

What is a Time series? What're some time series methods (ARIMA, SSA, machine-learning-based approaches) and what are their pros and cons?

What is Structural equation modeling? It's use? Weakness?

What is Factor analysis (exploratory and confirmatory)? It's use? Weakness?

What is Power analysis/trial design (particularly simulation-based trial design)? It's use? Weakness?

What is Nonparametric testing (deriving tests from scratch, particularly through simulations)/MCMC? It's use? Weakness?

What're the different Topological data analysis tools (persistent homology, Morse-Smale clustering, Mapper...)? What're their uses and weaknesses?

What're Markov chains and stochastic processes? What're their uses and weaknesses?

What're Network metrics and algorithms (centrality measures, betweenness, diversity, entropy, Laplacians, epidemic spread, spectral clustering)? What're their uses and weaknesses?

What is Survival analysis? Strengths, weaknesses?

What is Mixture modeling? Strengths, weaknesses?

What is latent semantic indexing? What is it used for? What are the specific limitations of the method?

