---
layout: post
title: "A list of stuff I think about a lot"
date: 2017-10-06
---

As a new graduate student, I have a ton of shallow interests with next to none of the vocabulary to articulate where I want to go with each of them. I suspect I have a deeper interest in a subset of those, but when I get asked, "What're your research interests?" - I don't have those immediately available. This tends to be a problem.

I expect that, as I learn more, new vocabulary and paths will emerge, but for now, I'd like to keep a running list of concepts I'm fascinated by and questions I've wondered about more than once. That way, at the very least, I can point to here and say, "here's what I've got so far" - possibly even learn some new vocabulary to map the concepts to. So far I know they tend to be very Mathematics/Computer Science/Logic/Language related.

The list goes (neither the lists nor the list of lists are in any particular order of importance or significance):

- General Subjects
- Concepts / Known Problems
- Questions / Unknown Concepts

## General Subjects

- Formal Languages
- Automata Theory
- Category Theory
- Type Theory
- Information Theory
- Graph Theory
- Statistics
- Artificial Intelligence
- Machine Learning
- Natural Language Processing
- Computer Vision

## Concepts / Known Problems

- The P = NP problem
- Gödel's Incompleteness Theorem (and, by extension: Tarski's undefinability theorem from Mathematical Logic)
- Kolmogorov Complexity (from Information Theory)
- Zero/One/Many Shot Learning (from Computer Vision)

## Questions / Unknown Concepts

- For all things (i.e. every person, place, idea, entity, "everything"), is it possible to create a 1 dimensional spectrum (like the real number line), such that there is a bijective function (or, maybe an algorithm) that maps each thing to a spot on the spectrum?

In other words, can we order literally anything and everything in such a way that no matter what we discover, create, or think about, we can take that thing and map it to a spot on that spectrum? The moment we know something exists, can we find out where it exists on the spectrum next to everything else that exists or could possibly exist?
- What is the largest amount of incompressible information possible?

This has to depend on the compressor at some point, since it would just be trivial to map all the information to one bit and then compress it to that bit. However, can we define that compressor by some compressible amount of information? Can we then compress that compressor with another compressor? Can we create a system of these in such a way that the last compressor can be compressed by the first (like a snake eating its tail)? What implications does this have for the information?
- If one proof for a statement is valid and another proof for a statement is valid (e.g. the Pythagorean Theorem has hundreds of known proofs), is it possible to find/generate an exhaustive list of all possible proofs for a certain statement and prove that list is exhaustive?
- How do we create information? Is information created or discovered?

In order to generate information randomly, we need categories or previously established groups. For example, generating numbers requires a list of numbers to chose from or a list of numerable properties to pick a permutation of. Generating information doesn't really seem like generating information itself, more like taking our current information and exhausting all possible combinations of its qualities. If the information is the categories itself. How do we generate new categories? Categories for categories. Where does it end, if it does? Where does it begin?
- The sum of numbers from 1 to n is equal to n(n-1)/2 - and there’s a proof for that. What other tricks are there like that? Is there a science/art/methodology of finding tricks like that?

That trick only works because the numbers are ordered and evenly spaced apart - what if only one or neither is true?
- Is there a way to decide if a graph has to be at least n-dimensional based on its edges and vertices?

For example (a Q3 hypergraph):

![Q3 Hypergraph - Image Not Found](https://raw.githubusercontent.com/joshualmitchell/joshualmitchell.github.io/master/img/q3.png "Q3 Hypergraph")

Can we flatten this such that no edges are laying on another edge? Does this mean it has to be 3D?
- Summarizing an entire textbook or picture into one word or pixel is kind of useless, but how big/small does the summary have to be before it becomes useful?

Imagine summarizing an entire textbook into one word. It’s kind of like shrinking a 500x500px picture to one pixel, right? In the sense that whatever you’re leftover with probably won’t have much relevance to the original object.

It would be THE most important part though. It’s just that, depending on what you’re summarizing, the variance of importance might not be that high.

However, if we had an incredibly great summary system that spit out one word or one pixel based on a whole object, and we knew for a fact this was the most important thing… wouldn’t that be a GREAT feature to have for prediction models?

We’d have a hard time getting to the most important single piece, but it’d be a lot easier (but still hard) to get to the most important, say, 25 pieces, right? a 5x5 pixel summary? A 25 word summary?

In terms of the 80/20 principle, in theory, how much information could we keep while still wiping out content?

According to it, we only need 0.001% of the effort to get 20% of the way there. So, in the case of the 500x500px picture, to get a 224x224px picture (20% of the information), we should, in theory, need only 0.001% of the effort. That seems too easy to me, but maybe there’s something there?
- Related to the above, what if we only taught complete ideas at a time, and then expanded outward instead of teaching sequentially?

Highly related to the previous train of thought, what if we started teaching courses this way? What if we literally started with the top 0.001% of information? (Assuming we had a way to get the top 0.001% of information). I feel that we wouldn’t necessarily be delivering 20% of the content with 0.001% of the effort, but whatever we deliver would be THE most important information (and also enough to get the whole idea).

In other words, we would start with an original idea, shrinking it down to a sentence or two (so that they still understand the whole principle without actually learning much yet), and then any further information can be added onto that model / perspective. This has the advantage that you can quit at any point you feel like you know enough, and you’re still able to be productive.

There are many other ways I feel this could go. More than likely, summarizing stuff won’t be that smooth. Chunks of information are likely discrete. There might be a gap between 2% and 5% of the most important information that includes a critical concept. It’s interesting to me to think about how this could be smoothed out (could making it slightly inaccurate make it able to be broken down? It might be easier to teach it wrong, then correct a mistake later as opposed to teaching the whole thing…)
- Compilers + Context - 100% Accuracy = New Machine Learning Model?

If we found some ancient tablet, and we decided we were going to analyze it at some point, so we wanted to come up with as many features as possible for it based entirely on the tablet itself and any context… how would we do it? We could take a picture and come up with features from there (a whole field of study itself). We could add the date the picture was taken, the date the tablet appears to have been created, and any other features we wouldn’t know immediately from looking at the tablet but we know right then because of context.

I think this is parallel to what a compiler does except without the context. If we think of the compiler as a statistical model, it makes a prediction with literally one data point with tons of features and 100% accuracy. (Of course, we assume the data is incredibly clean, complete, and follows an extremely comprehensive pattern). But what if we add in context? Could we make it more powerful? Compilers can’t take some shortcuts because they have to be 100% reflective of the code they compile, but what if they only had to be 99.9% accurate? What if we could add, as another parameter, a list of information about the context for the code?
- Is there algorithm to teach/deliver the sum of all parts that equal a concept in the most efficient way possible?

So let’s say we’re trying to teach a concept: x

When we teach something, in theory, we want to start with something that is “x” minus some amount of complexity, that happens to be as close to 0 complexity as possible.

If we want to avoid teaching someone false information (specifically: oversimplifying something), usually we can reduce the complexity of x at least a little bit, but for a lot of concepts, x can’t be reduced in complexity without either (a) blatantly leaving out critical information (i.e. information whose presence is necessary to understanding a bigger piece of information that has the critical information as a component) or (b) just changing the information slightly so it’s still mostly true, but a lot of complexity is cut out.

Let’s say x is composed of y and z, and z is composed of a and b.

So: 

x = y + z

z = a + b

Let’s say 

a has 5 complexity, 
b has 40 complexity, and
y has 5 complexity,

This means that z has 45 complexity, but without b, it only has 5.
So if we just took z to only contain a, we can explain x (y = 5 + z = 5) using 10 complexity, where as if we included b, it’d be 50.

Only 20% of the work.

The question would be - how critical is b to understanding x? If b is a massive amount of edge cases and a is the general concept, then we could probably get 80% understanding with only 20% of the work.



