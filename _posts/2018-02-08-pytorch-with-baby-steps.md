---
layout: post
title: "PyTorch With Baby Steps: From y = x To Training A Convolutional Neural Network"
date: 2018-02-08
---

(Not finished yet.)

Here's my motivation for this post. Click here (or scroll down) to skip straight to the tutorial.

One thing I've learned lately is that teaching can be hard. You struggle with something, then you get it, then you build on top of it. Suddenly, you're teaching the foundations of what you know to students who haven't even begun the struggle. You explain, write stuff on the board, turn around, and expect everyone to be on the same page. But they're not. They're lost. And you have no idea what part they tripped over.

The PyTorch documentation is fantastic. It's written very well by very smart people. Experts in the field that know how to distill the key ideas in order to find the right balance of conciseness and elaboration.

At the same time, coding, machine learning, and math can be terse to anyone learning any one of them. A lot of people are learning more than one of those at the same time, making the confusion scale nonlinearly. This means that the further away from being an expert someone is, the more potential documentation has to spawn questions instead of resolve them.

It's a hard problem. One very similar to what most teachers face: How do you teach at one pace so that people of all degrees of familiarity learn? How do you teach so that everyone is neither overwhelmed nor bored?

My idea is this (which defines a lot of my teaching methodology):

Instead of teaching one big lesson, teach a sequence of small, self-contained lessons where each lesson builds slightly on the next.

It would work for the unfamiliar (since it's not overwhelming and only goes one step at a time), but it would also ideally go at a faster pace (so that those who pick it up quicker aren't as bored). The key is making sure everyone is always on the same page, so we only explain and never re-explain. 

That's what I want to do with PyTorch: start with a College Algebra-esque linear model, explain the details, and then add another line or two of code. Rinse and repeat until we have a CNN.

# Outline:

- create an absolute bare minimum model with Tensors
- create a basic linear regression model (i.e. no training or anything yet; just initializing it and doing the calculation)
- calculate our (linear regression) model's loss using a loss function
- calculate our gradients based on the loss function
- calculate the change in our weights based on the gradient
- update our weights with the values we got above
- set up a for loop to do the weight update process a few times (epochs)
- make the for loop do that with only a subset of the data (i.e. a batch)
- make our program feed our input x through 2 sets of weights and biases so we get 2 outputs (i.e. adding a node to our layer)
- change our model from a linear regression model to a logistic regression model (i.e. sigmoid(ax + b) instead of just ax + b)
- add another layer (with 2 outputs still)
- change our nonlinearities (i.e. first sigmoid --> ReLU, second sigmoid --> softmax)
- make our inputs images instead of arbitrary vectors
- add a convolutional layer
- add a max pooling layer
- bask in the glory of our newly created convolutional neural network
