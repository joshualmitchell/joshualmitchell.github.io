---
layout: post
title: "Learning Neural Networks as easy and with as little math as possible"
date: 2017-09-30
---

SUPER rough draft.

- goal is to never lose you. the idea is that getting lost is a waste of time, and as long as i don't lose you, we can go as fast as we want
- in order to go super fast, the progression of ideas needs to be very smooth and granular - each transition must be a very easy jump. we want a maximum amount of minimal jumps
- here are some other guides I found good in case mine is inadequate: michael nielsen's, andrej karpathy's, etc.

Roughly, the table of contents will be:

- goal: here's a bunch of pictures of you (smiley faces), here's a picture we want to know if it's a smiley face or not.
- let's try and do this with regression
- here's regression with one regressor (to show what regression is)
- here's one strip of pixels (or, probably even start with one pixel)
- for the regression graph, instead the x is going to be pixel intensity (0-255)
- pretty accurate for the sides, but not for the middle
- what if we do it for the whole thing? (ie all strips)
- still not too accurate
- here's a function (with a picture of a factory conveyor belt)
- here's a derivative (with a picture of multiple items going into and coming out of the conveyor belt being put into the conveyor belt itself)
- basic neuron/perceptron
- add a layer
- visualization of what's happening
- train it
- wha-lah!