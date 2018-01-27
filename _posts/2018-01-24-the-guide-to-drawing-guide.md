---
layout: post
title: "The Guide to Drawing Guide"
date: 2018-01-24
---

This is a write up of DrawingGuide, my application that aids its users in learning to draw.

I talk about what the problem I'm trying to solve is, how I'm trying to solve it, technology I'm using, mistakes I've made, and future plans I have for it.

## Outline

- Motivation
- Components
- Lessons Learned
- Future Plans

## Motivation

Most folks new to drawing struggle with proportions. Learning from mistakes is difficult (or, at least, cumbersome) since it's hard to tell exactly where you went wrong. An OK solution is to take a picture of what you drew and overlay a semitransparent version of it over what you wanted to draw and see exactly where your attempt differs. However, if you're actively practicing and you want to fail fast, this can be a pain. 

Drawing Guide does (well, will do) all of this automatically. All you have to do is take the pictures.

Eventually, I want to bring AI into the picture and find patterns in what you (as the user) tend to mess up, and then automatically generate pictures for you to draw. The idea is that they'll start off really easy (since they're the embodiment of your weakness), and then get progressively harder until it's no longer your weakest link. At that point, some other "weakness" will be capitalized on.

## Components

the cost function for the mean squared error between each foreground pixel in each respective image and used gradient descent to find the affine transformations (minus sheering and reflecting, since we want to maintain fidelity) that overlay the attempt image on the target image optimally (i.e. has a good 'fit').

## Lessons Learned

I was starstruck by the idea of making something people (including myself) actually used, so I really didn't want to rigorously plan it out. I just wanted to get started. I had a vague idea of what I wanted to do (compare two images, overlay them, then show the difference), but I didn't have any computer vision background. Nonetheless, I told myself I'd just learn whatever necessary as I went along, and got started. Here are some of my mistakes.

1. Not doing the research

I'm moderately familiar with the Python-related data science stack, so I knew I'd be using numpy and whatnot, but other than that, I hard-coded everything (the cost function, the partial derivatives of each transformation variable with respect to the cost function, etc). It didn't even occur to me that there were probably libraries and frameworks for that as well. In any case, I figured I had all I needed, so I just did it. 

Here's what went wrong:

- it took 8 hours to run
- it often didn't converge, and when it did, it was grossly inaccurate

Demoralized, I talked to some computer vision professors about it. I explained what was happening and my theories as to why. I figured it had to be some subset of: inaccurate implementation, my theory was wrong, the cost function space was too flat, or I'm being really inefficient with my calculations.

The feedback I got was:

- I should probably use Stochastic Gradient Descent
- I should probably pick the most important pixels instead of using them all (using a combination of stuff like SIFT and Canny Edge Detection)
- I should probably restrict the theta variable to be between -20 and 20 degrees or so (since most users probably won't take a picture at a huge angle)
- I probably shouldn't hardcode the cost function and its partial derivatives (since there are frameworks that do that for you, like PyTorch)

All of which made perfect sense in retrospect, and all of which I could have done from the beginning.

So now, I'm essentially rewriting everything to include those updates.

2. Not testing constantly

The most interesting part to me was the comparison algorithm, so that's what I wrote first. Unfortunately, I was having so much fun writing it that testing it fell to the wayside. When I finally got done, it just plain didn't work and I had no idea why.

So I decided that was unacceptable and shifted gears to make testing more feasible. Here's what I did:

- installed Python's logger library and put logging statements everywhere (both to have a papertrail and get out of the habit of using print statements)
- installed pytest (a minimal boilerplate testing suite) and wrote tests for everything I had
- refactored my project directory to make it more organized and moved any code I was experimenting with into its own experimentation folder

3. Trying to implement V9.0 before V1.0

On one hand, I didn't do extensive research at first, but on the other hand, I did do copious amounts of planning. I used several sheets of scratch paper to do lots of math and architecture planning before I wrote any code. The problem: once I wrote code, I realized immediately that parts of my architecture became useless or redundant, and I really should have been writing this other thing. It was frustrating because I just wasn't getting where I wanted fast enough.

For example: I wanted to write the comparison function, but I realized that I didn't have anything to compare (i.e. no data), and I didn't have any functions to display the images overlayed the way I wanted. So I started to write the display function, but then realized I needed a few other things ready. It became a viscious circle.

I read a few programming blogs and Hacker News posts, and found out that what I did was really common: trying to build the whole thing at once and then getting overwhelmed.

So now: I make incremental improvements, and if I need a component for something to work, I just mock it or make the most absolute minimally functional version.

## Future Plans

https://en.wikipedia.org/wiki/Image_registration#cite_ref-AG_3-6
