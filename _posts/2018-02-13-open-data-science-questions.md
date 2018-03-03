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

Note: There are some duplications in here, for now.

Also, as of 02/27/2018, I found this page: http://www.itshared.org/2015/10/data-science-interview-questions.html

So I'll be adding those in later as well.

### Question 1M (02/13/2018): How do hypothesis tests factor into predictive models? It seems like we just don't care about them when they could add some amount of information.

### Question 2M (02/14/2018): What happens when you do some dimensionality reduction technique on a picture? (i.e. you think of the columns or rows of the picture matrix as features and the other one as samples) - is there a way to do this meaningfully? Can lossy compression algorithms on pictures be thought of as dimensionality reduction? Or is there a meaningful difference?

### 3/3/18 What is the difference between a neural network that has 8 hidden layers with 1 node in each layer, and one that has 1 hidden layer with 8 nodes?

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

### Question 17 (02/19/2018): How do you treat missing values? What're the pros and cons of using mean, median, K-NN imputation, regression, etc?
### Question 18 (02/19/2018): How do you treat outliers? What're the pros and cons of replacement by quartile values, max or min etc.
### Question 19 (02/19/2018): What're Near Zero Variance predictors? How do you deal with them?
### Question 20 (02/19/2018): What is the Variance Inflation Factor (VIF)?
### Question 21 (02/19/2018): What does correlation between numerical-numerical variables, categorical-categorical, categorical and numerical variables mean? What do you do about it? How do you find out it's there?
### Question 22 (02/19/2018): What're some different types of transformations, what do they do, and when should you do them? (i.e. normalization and variable transformations like x^2 -> z)
### Question 23 (02/19/2018): What're some different sampling techniques and when/why should you use each of them? Pros and cons? (e.g. simple random sampling, stratified sampling)
### Question 24 (02/19/2018): What is hypothesis testing? When/why should you do it? What're the popular hypothesis tests and what do they test? 
### Question 25 (02/19/2018): What is feature selection/ extraction? Why do you do it? How do you do it?
### Question 26 (02/19/2018): What're the pros and cons of each of these feature selection techniques: Lasso regression, Ridge regression, Subset selection, Random forest
### Question 27 (02/19/2018): Regression in a nutshell. What're the different types, assumptions, mistakes, indicators, etc? (i.e. Simple / Multiple LR, GLMs, R^2, RMSE, Adj R^2, Predicted R^2, Lasso / Ridge Regression, Regularization, Over/Underfitting, Learning Rate, Bias/Variance Tradeoff...)

https://news.ycombinator.com/item?id=16386183

### Question 28 (02/19/2018): Classification in a nutshell. What're the different types, assumptions, mistakes, indicators, etc? (i.e. K-NN, Logistic Regression with ROC curve and selection of optimal threshold, Decision trees, Bagging / Random Forrests, SVMs, Bayes Classifier, Boosting (e.g. Xgboost, Adaboost, gradient boost), ANNs (perceptron, MLP, etc), performance measures like confusion matrix, accuracy, sensitivity, specificity, precision, F-Measure, Recall, F1)
### Question 29 (02/19/2018): Clustering in a nutshell. What're the different types, assumptions, mistakes, indicators, etc? (e.g. K-Means, distance and dissimilarity measures (for both numerical and non-numerical types of variables), Hierarchical clustering, maybe a few others)
### Question 30 (02/19/2018): Dimensionality Reduction in a nutshell. What're the different types, assumptions, mistakes, indicators, etc? (e.g. PCA, Kernel-PCA, etc and manifold learning techniques like MDS and t-SNe)
### Question 31 (02/19/2018): What is KKT and what're it's conditions?
### Question 32 (02/19/2018): What is Laplace Approximation and what's it used for?
### Question 33 (02/19/2018): What is a Time series? What're some time series methods (ARIMA, SSA, machine-learning-based approaches) and what are their pros and cons?
### Question 34 (02/19/2018): What is Structural equation modeling? It's use? Weakness?
### Question 35 (02/19/2018): What is Factor analysis (exploratory and confirmatory)? It's use? Weakness?
### Question 36 (02/19/2018): What is Power analysis/trial design (particularly simulation-based trial design)? It's use? Weakness?
### Question 37 (02/19/2018): What is Nonparametric testing (deriving tests from scratch, particularly through simulations)/MCMC? It's use? Weakness?
### Question 38 (02/19/2018): What're the different Optimization algorithms (genetic algorithms, quantum-inspired evolutionary algorithms, simulated annealing, particle-swarm optimization)? What're their uses and weaknesses?
### Question 39 (02/19/2018): What're the different Topological data analysis tools (persistent homology, Morse-Smale clustering, Mapper...)? What're their uses and weaknesses?
### Question 40 (02/19/2018): What're the different Bayesian methods (Naïve Bayes, Bayesian model averaging, Bayesian adaptive trials...)? What're their uses and weaknesses?
### Question 41 (02/19/2018): What're the different Gradient-based optimization methods? What're their uses and weaknesses?
### Question 42 (02/19/2018): What're the different Penalized regression models (elastic net, LASSO, LARS...) and adding penalties to models in general (SVM, XGBoost...)? What're their uses and weaknesses?
### Question 43 (02/19/2018): What're Spline-based models (MARS...)? What're their uses and weaknesses?
### Question 44 (02/19/2018): What're Markov chains and stochastic processes? What're their uses and weaknesses?
### Question 45 (02/19/2018): What're Network metrics and algorithms (centrality measures, betweenness, diversity, entropy, Laplacians, epidemic spread, spectral clustering)? What're their uses and weaknesses?

### Question 46 (02/19/2018): What're some missing data imputation schemes (missForest, MICE...)? What're their uses and weaknesses?
### Question 47 (02/19/2018): What're Bayesian networks (pathway mining)? What're their uses and weaknesses?
### Question 48 (02/19/2018): What is Survival analysis? Strengths, weaknesses?
### Question 49 (02/19/2018): What is Mixture modeling? Strengths, weaknesses?
### Question 50 (02/19/2018): What is Statistical inference and group testing? Strengths, weaknesses?
### Question 51 (02/25/2018): How does the distribution of the data affect results for say, neural networks, regression, etc? Can we use it to our advantage?
### Question 52 (02/25/2018): Does linear regression perform slightly better than chance for image classification? Or is it just not even worth it?

### 3/3/2018

### Explain what regularization is and why it is useful. What are the benefits and drawbacks of specific methods, such as ridge regression and LASSO?
### Explain what a local optimum is and why it is important in a specific context, such as k-means clustering. What are specific ways for determining if you have a local optimum problem? What can be done to avoid local optima?
### Assume you need to generate a predictive model of a quantitative outcome variable using multiple regression. Explain how you intend to validate this model.
### Explain what precision and recall are. How do they relate to the ROC curve?
### Explain what a long tailed distribution is and provide three examples of relevant phenomena that have long tails. Why are they important in classification and prediction problems?
### What is latent semantic indexing? What is it used for? What are the specific limitations of the method?
### What is the Central Limit Theorem? Explain it. Why is it important? When does it fail to hold?
### What is statistical power?
### Explain what resampling methods are and why they are useful. Also explain their limitations.
### Explain the differences between artificial neural networks with softmax activation, logistic regression, and the maximum entropy classifier.
### Explain selection bias (with regards to a dataset, not variable selection). Why is it important? How can data management procedures such as missing data handling make it worse?
### Provide a simple example of how an experimental design can help answer a question about behavior. For instance, explain how an experimental design can be used to optimize a web page. How does experimental data contrast with observational data.
### Explain the difference between "long" and "wide" format data. Why would you use one or the other?
### Is mean imputation of missing data acceptable practice? Why or why not?
### Explain Edward Tufte's concept of "chart junk."
### What is an outlier? Explain how you might screen for outliers and what you would do if you found them in your dataset. Also, explain what an inlier is and how you might screen for them and what you would do if you found them in your dataset.
### What is principal components analysis (PCA)? Explain the sorts of problems you would use PCA for. Also explain its limitations as a method.
### You have data on the duration of calls to a call center. Generate a plan for how you would code and analyze these data. Explain a plausible scenario for what the distribution of these durations might look like. How could you test (even graphically) whether your expectations are borne out?
### Explain what a false positive and a false negative are. Why is it important to differentiate these from each other? Provide examples of situations where (1) false positives are more important than false negatives, (2) false negatives are more important than false positives, and (3) these two types of errors are about equally important.
### Explain likely differences encountered between administrative datasets and datasets gathered from experimental studies. What are likely problems encountered with administrative data? How do experimental methods help alleviate these problems? What problems do they bring?
### 3/3/2018
### Explain what regularization is and why it is useful. What are the benefits and drawbacks of specific methods, such as ridge regression and LASSO?
### Explain what a local optimum is and why it is important in a specific context, such as k-means clustering. What are specific ways for determining if you have a local optimum problem? What can be done to avoid local optima?
### Assume you need to generate a predictive model of a quantitative outcome variable using multiple regression. Explain how you intend to validate this model.
### Explain what precision and recall are. How do they relate to the ROC curve?
### Explain what a long tailed distribution is and provide three examples of relevant phenomena that have long tails. Why are they important in classification and prediction problems?
### What is latent semantic indexing? What is it used for? What are the specific limitations of the method?
### What is the Central Limit Theorem? Explain it. Why is it important? When does it fail to hold?
### What is statistical power?
### Explain what resampling methods are and why they are useful. Also explain their limitations.
### Explain the differences between artificial neural networks with softmax activation, logistic regression, and the maximum entropy classifier.
### Explain selection bias (with regards to a dataset, not variable selection). Why is it important? How can data management procedures such as missing data handling make it worse?
### Provide a simple example of how an experimental design can help answer a question about behavior. For instance, explain how an experimental design can be used to optimize a web page. How does experimental data contrast with observational data.
### Explain the difference between "long" and "wide" format data. Why would you use one or the other?
### Is mean imputation of missing data acceptable practice? Why or why not?
### Explain Edward Tufte's concept of "chart junk."
### What is an outlier? Explain how you might screen for outliers and what you would do if you found them in your dataset. Also, explain what an inlier is and how you might screen for them and what you would do if you found them in your dataset.
### What is principal components analysis (PCA)? Explain the sorts of problems you would use PCA for. Also explain its limitations as a method.
### You have data on the duration of calls to a call center. Generate a plan for how you would code and analyze these data. Explain a plausible scenario for what the distribution of these durations might look like. How could you test (even graphically) whether your expectations are borne out?
### Explain what a false positive and a false negative are. Why is it important to differentiate these from each other? Provide examples of situations where (1) false positives are more important than false negatives, (2) false negatives are more important than false positives, and (3) these two types of errors are about equally important.
### Explain likely differences encountered between administrative datasets and datasets gathered from experimental studies. What are likely problems encountered with administrative data? How do experimental methods help alleviate these problems? What problems do they bring?
