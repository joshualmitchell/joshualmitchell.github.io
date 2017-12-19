---
layout: post
title: "Day 2: 30 days of learning"
date: 2017-12-18
---

Today is day 2. I'm going to finish up defining some of the vocabulary, then I'm going to do the exercises at the end of Chapter 1:

Generalization Error / Out-Of-Sample Error - The percentage of samples from the test data set the model classifies incorrectly. (i.e. if the training error is low but the test error is high, your model is overfitting the data). It's common to have an 80/20 training/test split.

Validation Set - An intermediary set of data between training and testing that you test hyper parameter optimization on before you see the generalization error on the test set. (This is to prevent overfitting your hyper parameters to your test set.)

Another common technique is to use cross-validation (which is just splitting your training data into subsets and training each model on a different combination of those subsets and then validating it against the other unused subsets).

Here are my attempts at Chapter 1's exercises. I'll put the right answer right after my attempt.

1. How would you define Machine Learning?

ATTEMPT: A machine learns if, given a task T, an experience E, and a performance measure P, the machine's performance on task T improves with experience E.

ANSWER: Machine Learning is about building systems that can learn from data. Learning means getting better at some task, given some performance measure.

2. Can you name 4 types of problems where it shines?

ATTEMPT: I'm not sure if this means the 4 general types of machine learning (i.e. supervised, unsupervised, semisupervised, and reinforcement learning), or if it means some stuff that machine learning can do (i.e. dimensionality reduction, clustering, classification, regression...).

ANSWER: Machine Learning is great for complex problems for which we have no algorithmic solution, to replace long lists of hand-tuned rules, to build systems that adapt to fluctuating environments, and finally to help humans learn (e.g., data mining).

3. What is a labeled training set?

ATTEMPT: It seems like there are multiple obvious answers to this, but the first thing that comes to mind for me is: a set of samples from some population with specific attributes meant to train a model that generalizes to the population the data came from.

ANSWER: A labeled training set is a training set that contains the desired solution (a.k.a. a label) for each instance.

4. What are the two most common supervised tasks?

ATTEMPT: This would probably be classification and regression.

ANSWER: The two most common supervised tasks are regression and classification.

5. Can you name 4 common unsupervised learning tasks?

ATTEMPT: Clustering, Dimensionality Reduction, Feature Selection, Feature Extraction (does that count? since they're both part of Feature Engineering?). I know there's at least 1 other one I could have mentioned, though.

ANSWER: Common unsupervised tasks include clustering, visualization, dimensionality reduction, and association rule learning.

6. What type of machine learning algorithm would you use to allow a robot to walk in various unknown terrains?

ATTEMPT: Reinforcement learning! Although, bonus extra-mile answer: Perhaps you could use some kind of online, model-based technique that is constantly adding new data (although I guess you could argue that's what reinforcement learning is. I'm not sure if there's a specific difference, though).

ANSWER: Reinforcement Learning is likely to perform best if we want a robot to learn to walk in various unknown terrains since this is typically the type of problem that Reinforcement Learning tackles. It might be possible to express the problem as a supervised or semisupervised learning problem, but it would be less natural.

7. What type of algorithm would you use to segment your customers into multiple groups?

ATTEMPT: Well, it'd be some kind of clustering algorithm for sure. I'm thinking, to be specific, we might use k-means clustering.

ANSWER: If you don’t know how to define the groups, then you can use a clustering algorithm (unsupervised learning) to segment your customers into clusters of similar customers. However, if you know what groups you would like to have, then you can feed many examples of each group to a classification algorithm (supervised learning), and it will classify all your customers into these groups.

8. Would you frame the problem of spam detection as a supervised or unsupervised learning problem?

ATTEMPT: Well, since we're detecting spam, we can probably assume we have examples of what spam is, so I would say that, since we're looking to classify data as spam or not, that means it's a supervised learning problem.

ANSWER: Spam detection is a typical supervised learning problem: the algorithm is fed many emails along with their label (spam or not spam).

9. What is an online learning system?

ATTEMPT: I believe an online learning system is a {model, machine learning algorithm, system} that is constantly updating its model (or selection algorithm in the case of instance-based learning) with new training data. Not necessarily online as in accessible via the web.

ANSWER: An online learning system can learn incrementally, as opposed to a batch learning system. This makes it capable of adapting rapidly to both changing data and autonomous systems, and of training on very large quantities of data.

10. What is out-of-core learning?

ATTEMPT: This one I don't remember. All that keeps coming up is out-of-sample error, which is the amount of test data the the model trained from training data "gets wrong".

ANSWER: Out-of-core algorithms can handle vast quantities of data that cannot fit in a computer’s main memory. An out-of-core learning algorithm chops the data into mini-batches and uses online learning techniques to learn from these mini-batches.

11. What type of learning algorithm relies heavily on a similarity measure to make predictions?

ATTEMPT: Instance-based learning.

ANSWER: An instance-based learning system learns the training data by heart; then, when given a new instance, it uses a similarity measure to find the most similar learned instances and uses them to make predictions.

12. What is the difference between a model parameter and a learning algorithm's hyper parameter?

ATTEMPT: A parameter of a model directly affects the prediction of new cases, where as a hyper parameter affects the optimization and training of the model (which, I suppose, might impact prediction of new cases, but not directly).

ANSWER: A model has one or more model parameters that determine what it will predict given a new instance (e.g., the slope of a linear model). A learning algorithm tries to find optimal values for these parameters such that the model generalizes well to new instances. A hyperparameter is a parameter of the learning algorithm itself, not of the model (e.g., the amount of regularization to apply).

13. What do model-based learning algorithms search for? What is the most common strategy they use to succeed? How do they make predictions?

ATTEMPT: Model-based learning algorithms search for the underlying structure of the data. I'm not sure what is meant by "most common strategy" since each model has a different strategy. They make predictions by building a model based on training data, and then using attributes of new cases to make predictions based on the constructed model.

ANSWER: Model-based learning algorithms search for an optimal value for the model parameters such that the model will generalize well to new instances. We usually train such systems by minimizing a cost function that measures how bad the system is at making predictions on the training data, plus a penalty for model complexity if the model is regularized. To make predictions, we feed the new instance’s features into the model’s prediction function, using the parameter values found by the learning algorithm.

14. Can you name 4 of the main challenges in machine learning?

ATTEMPT: I'm not sure what this means, but what comes to mind is: the curse of dimensionality, data noise, bias-variance trade off, sampling biases.

ANSWER: Some of the main challenges in Machine Learning are the lack of data, poor data quality, nonrepresentative data, uninformative features, excessively simple models that underfit the training data, and excessively complex models that overfit the data.

15. If your model performs great on the training data but generalizes poorly to new instances, what is happening? Can you give 3 possible solutions?

ATTEMPT: What is happening is you're overfitting the data and finding patterns out of the noise. 3 possible solutions include gathering more training data, cleaning the data (i.e. removing outliers and fixing data errors), and/or reducing the complexity of your model (or constraining it somehow).

ANSWER: If a model performs great on the training data but generalizes poorly to new instances, the model is likely overfitting the training data (or we got extremely lucky on the training data). Possible solutions to overfitting are getting more data, simplifying the model (selecting a simpler algorithm, reducing the number of parameters or features used, or regularizing the model), or reducing the noise in the training data.

16. What is a test set and why would you want to use it?

ATTEMPT: A test set is a portion of the data you have at your disposal from a population that's separate from your training data. It's used to prevent overfitting your model and to test how well it generalizes to new cases.

ANSWER: A test set is used to estimate the generalization error that a model will make on new instances, before the model is launched in production.

17. What is the purpose of a validation set?

ATTEMPT:  The purpose is to prevent your model from choosing the most optimal hyper parameters based on your test set.

ANSWER: A validation set is used to compare models. It makes it possible to select the best model and tune the hyperparameters.

18. What can go wrong if you tune your hyper parameters based on the test set?

ATTEMPT:  You run the risk of not generalizing well, since you tuned your hyper parameters only on one small subset of the population.

ANSWER: If you tune hyperparameters using the test set, you risk overfitting the test set, and the generalization error you measure will be optimistic (you may launch a model that performs worse than you expect).

19. What is cross-validation and why would you prefer it to a validation set?

ATTEMPT: Cross-validation is a technique that makes it possible to compare models (for model selection and hyperparameter tuning) without the need for a separate validation set. This saves precious training data.

ANSWER: Cross validation is splitting your training set into several subsets and then training each model on some subset of the set of subsets and then validating it against the unused subsets. You might prefer it to a validation set if your dataset is small.