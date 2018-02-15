---
layout: post
title: "Open (Usually Data Science) Questions"
date: 2018-02-23
---

As I'm learning and doing research, I often have a lot of questions that I silently ask myself. A lot of them get answered as I read further, but some of them don't.

And then they just linger in my self-conscious.

As an instructor, when a student has a question but doesn't ask it, it frustrates me because it really helps me understand what I'm not communicating effectively (as well as where the knowledge gaps are). As a student, it frustrates me because sometimes I have the same question but forget to ask it (or it just never occured to me).

In any case, this knowledge is valuable, and I feel that I could add a lot of value to the lives of anyone learning data science simply by listing all the questions that come to mind, as well as answers to them when I get them.

So, in chronological order, from now on, I'm going to list any questions I have (or come across). Then, as I have both the answers and the time, I'll put them here as well. If the question has just a number (i.e. Question 3) then it's not a question I came up with, just one I saw somewhere (e.g. an interview question). If it has an M (e.g. Question 1M) it's a question I thought of myself.

### Question 1M (02/13/2018): How do hypothesis tests factor into predictive models? It seems like we just don't care about them when they could add some amount of information.

### Question 2M (02/14/2018): What happens when you do some dimensionality reduction technique on a picture? (i.e. you think of the columns or rows of the picture matrix as features and the other one as samples) - is there a way to do this meaningfully? Can lossy compression algorithms on pictures be thought of as dimensionality reduction? Or is there a meaningful difference?

### Question 3 (02/15/2018): What is an auto-encoder? Why do we "auto-encode"? Hint: it's really a misnomer.

### Question 4 (02/15/2018): What is a Boltzmann Machine? Why a Boltzmann Machine?

### Question 5 (02/15/2018): Why do we use sigmoid for an output function? Why tanh? Why not cosine? Why any function in particular?

### Question 6 (02/16/2018): Why are CNNs used primarily in imaging and not so much other tasks?

### Question 7 (02/17/2018): Explain backpropagation simply.

### Question 8 (02/18/2018): Is it OK to connect from a Layer 4 output back to a Layer 2 input?

### Question 9 (02/19/2018): A data-scientist person recently put up a YouTube video explaining that the essential difference between a Neural Network and a Deep Learning network is that the former is trained from output back to input, while the latter is trained from input toward output. Do you agree? Explain.

### Question 10 (02/19/2018): Implement dropout during forward and backward pass?
### Question 11 (02/19/2018): Neural network training loss/testing loss stays constant, what do you do?
### Question 12 (02/19/2018): Why do RNNs have a tendency to suffer from exploding/vanishing gradient? How do you prevent this?
### Question 13 (02/19/2018): Does using full batch means that the convergence is always better given unlimited power?
### Question 14 (02/19/2018): What is the problem with sigmoid during backpropagation?
### Question 15 (02/19/2018): Given a black box machine learning algorithm that you can’t modify, how could you improve its error?
### Question 16 (02/19/2018): How to find the best hyper parameters?

Missing value treatmentmethods:
Different methods: Mean, median, K-NN imputation, regression based etc.
Outlier treatment methods:
Different methods: Replacement by quartile values, max or min etc.
Near zero variance
Variance inflation factor (VIF)
Correlation: between numerical-numerical variables, categorical-categorical, categorical and numerical variables
Plotting: ggplot2(R), Matplotlib and Seaborn (Python) etc. Sound understanding of various plots and their usage such as Bar plot should be used for categorical variables and Histogram should be used for continuous variables etc.
Transformations:
Normalization- scaling
Variable transformations (e.g. x^2 -> z)
Sampling techniques- Simple random sampling, Stratified sampling
Hypothesis testing (This is sort of essential because you will have better understanding of various tests and model outputs if you know this.)
3. Feature selection/ extraction:

Lasso regression
Ridge regression
Subset selection
Using Random forest
4. Modeling algorithms

Regression:
Simple linear regression
Multiple linear regression
GLM
With proper understanding of assumptions, multicollinearity etc
Goodness of fit measures such as R^2, RMSE, Adjusted-R^2, Predicted-R^2 etc
Lasso regression
Ridge regression
Concept of regularization
Concpt of over-fitting and underfitting, learning rate
Concept of bias and variance
Classification
K-NN
Logistics regression with ROC curve and selection of optimal threshold
Decision tree
Concept of Bagging: Random forest
Support vector machine
Bay’s classifier
Concept of Boosting: Xgboost, Adaboost
Artificial neural networks: Perceptron, Multiplayer perceptron (Feed forward neural networks)
Classification performance measures: confusion matrix, accuracy, sensitivity, specificity, precision, F-measure
Clustering:
K-means with fair understanding of distance and dissimilarity measures for non-numerical type of variables.
Hierarchical clustering
Dimensionality reduction techniques:
PCA