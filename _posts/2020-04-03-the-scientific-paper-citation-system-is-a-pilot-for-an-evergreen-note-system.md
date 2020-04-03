---
layout: single
title: "The Problems Science Faces (And Why Evergreen Notes Are The Solution)"
date: 2020-03-28
categories: productivity
tags: [productivity, project-management, note-taking]
toc: true # outline page on the right hand side
---

A post on the issues science (and humanity) is running into (particularly with scientific papers) and a possible solution.

## The problem with scientific papers

If the fundamental pillar of science is the scientific method, then the scientific paper is the foundation on which it stands. Papers are an excellent tool for disseminating knowledge, but they have a critical weakness: their terseness.

Wealth and knowledge about a particular field (e.g. Epidemiology) have something in common: extremely few people have almost all of it, and most people have almost none of it - which is actually kind of weird.

Wealth is partially zero-sum (e.g. land) and partially positive-sum (e.g. innovation, patents), but knowledge is *entirely* positive sum (zero marginal cost of replication). Why isn't it more egalitarian?

Why, for example, aren't we all on the same page about COVID-19, even when we know who the reputable sources of information are? [(Or do we?)](https://www.scottaaronson.com/blog/?p=4695)

The answer is accessibility. I'm not talking about papers being hidden behind paywalls (which is also an issue). I'm talking about how, when the average person reads a scientific paper, they get nothing out of it.

Scientists themselves aren't immune to this problem. This is a condensed paper citation graph by field [tweeted](https://twitter.com/david_perell/status/1242209425458212864?s=20) by [David Perell](https://www.perell.com/):

![alt text][sciencegraph]

[sciencegraph]: https://raw.githubusercontent.com/joshualmitchell/joshualmitchell.github.io/master/assets/images/sciencegraph.jpg "Scientific Paper Citations By Field"

Our fields are siloed. It's a lot easier to read a paper in your field than it is in someone else's field. You have the background to understand your field - not theirs. This will only get worse as new fields branch out from others, and existing fields become more complicated.

## A (possible) solution

So how can we fix this (or, at least improve it)?

My answer: [Andy Matuschak's Evergreen Note System On Roam](https://lelon.io/productivity/andy-matuschaks-evergreen-note-taking-system-on-roam/). Let me explain.

What stops people from reading scientific papers, exactly?

Answer: The fact that it's all gibberish. Words and symbols that (almost) nobody understands.

You might say, well, it's obvious! The solution is Google!

Well if you're like me, you've read a few papers and googled a few words. What happens? You have to google more stuff! 

But wait, how does that first thing *relate* to this new thing?

Aha!

So maybe you search for a blog post explaining these two things in context. There isn't a good one. Crap. You're stuck.

Or maybe you got lucky and had some knowledge of the first few terms. And *then* you got stuck.

Unfortunately, for the average paper, this is very likely to happen *a lot*. And this assumes that the paper was written well! And that you have some prior knowledge!

If only there were something that would answer *those* questions, too! Maybe a kind of knowledge graph that had the concepts for a given field and the relationship between them.

Aha!

That's what the [Evergreen Note System](https://lelon.io/productivity/andy-matuschaks-evergreen-note-taking-system-on-roam/) is.

## But isn't that how scientific papers already work? (i.e. citations)

Yes! Kind of.

I would argue that the scientific paper citation system is a v0.1 version of the Evergreen Note System. It has the same structure (i.e. a network) and similar functionality (showing you how ideas are related).

The main problem: The floor is unnecessarily high.

If you were to imagine an entire scientific field as a knowledge [graph](https://en.wikipedia.org/wiki/Graph_theory) (i.e. concepts with connections between them describing their relationship), the list of things you need to understand to read a scientific paper would be a [tree](https://en.wikipedia.org/wiki/Tree_(graph_theory)) in that graph (think: flowchart).

A metaphor: a degree plan for a bachelor's degree. You have prerequisites. And those prerequisites have prerequisites. And so on.

To elaborate on the metaphor: the scientific paper is the bachelor's degree. To complete the bachelor's degree (understand the paper), you need to complete the required classes (understand the fundamental concepts of the field and look at the cited papers), which will have prerequisites (papers cited by the originally cited papers *and* prerequisite concepts to the fundamental concepts), which will... and so on.

A more concrete example: [MIP*=RE](https://arxiv.org/abs/2001.04383)

<blockquote style="font-style: normal">We show that the class MIP∗ of languages that can be decided by a classical verifier interacting with multiple all-powerful quantum provers sharing entanglement is equal to the class RE of recursively enumerable languages.</blockquote>

(Uh, come again?)

To understand this paper, we probably need to know what an all-powerful quantum prover is.

To understand what an all-powerful quantum prover is, we probably need to know what a quantum prover is.

And so on...

Long story short: the "floor" of understanding you have to get to in order to understand a scientific paper is extremely high. If you're starting from scratch, you either have to spend years getting a degree or spend days, weeks, or possibly months googling and hitting your head against the wall.

## Can we do better?

But wait! Months googling is still a lot less time than years getting a degree. Can we do even *better*? Most people don't have months to go on a wild goose chase. What if we eliminated the head-wall factor entirely?

Take any scientific paper.

Now imagine if you had the author right there in front of you that you could ask questions until you understood the paper. You could even start with the basics. He or she won't be like those professors that yell at you for asking questions about "things you should already know" - they'll answer politely, succinctly, and informatively. Imagine you're a 5 year old that won't stop asking why.

- You could throw examples at them to verify your understanding.
- You could ask if it's the same thing as this other thing.
- You could ask what assumptions are being made, and what happens if they're not true.

It's like doing the Feynman technique, except when you notice gaps in your knowledge, they're instantly remedied.

What's your estimation for how long it might take to understand a paper with your author friend?

Obviously it depends on the paper, but maybe.. a few hours? A few weeks if it's a doozy of a paper. (The next paper in the field would be even easier! Probably hours or days.)

The point is that college degrees are too broad (you spend too much time covering unnecessary information), and Google searches are too fragmented (you might what you're looking for, but you also need to track down any/all context).

The Goldilocks solution: a knowledge graph that contains atomic (neither broad nor fragmented) pieces of information and their relationship to other pieces of information (i.e. the answers to all the questions you asked to get to your understanding).

With a tool like this, we could lower the barrier of entry *significantly*. And that's just for one field.

Each field having its own knowledge graph would be extremely helpful, but because it's a network, its value scales quadratically with its size ("[network effects](https://en.wikipedia.org/wiki/Network_effect)"). This means that if we assimilated *all* fields into one big knowledge graph, we could unsilo everyone and make all sorts of new connections.

What happens when you mix Biotech and manufacturing engineering? Robotics and Medicine? How about political science, [HCI](https://en.wikipedia.org/wiki/Human%E2%80%93computer_interaction), and machine learning? I'd love to see some of the outcomes of those idea clashes. :)

## A solution for research debt

I think it might be solution for [research debt](https://distill.pub/2017/research-debt/) as well.

From the article, research debt has 4 forms:

- Poor Exposition
- Undigested Ideas
- Bad abstractions and notation
- Noise

If I had to summarize research debt, it's essentially:

"I can't find what I'm looking for, and when I do, I have trouble understanding it."

### Finding what you're looking for

Ever hear of the [Six Degrees of Separation](https://en.wikipedia.org/wiki/Six_degrees_of_separation)?

It's the idea that all people are six, or fewer, social connections away from each other.

I'm not sure what the degrees of separation would be for a robust knowledge graph, but I'm betting it's in the same ball-park.

In other words, if you're looking for a certain idea or concept, it's likely that starting with what you know can get you there in just a few clicks. :)

### Understanding what you've found

Similar to how formatting data in tabular form makes it easier to read, formatting concepts in an atomic form makes them easier to digest. 

When you find what you're looking for, it'll be succinct, but still comprehensive. If you're wondering, "Oh, so it's like X?" or, "So it's basically Y + Z?" - that relationship is there, and you can read about it to further your understanding!

## So it's a Panacea (cure-all)?

Don't get me wrong, I'm really excited about this idea, and I think it could really move the needle on humanity's progress.

That being said, there *will* be new issues (and probably old ones). This is just a concept sketch. Here are *some* areas I think we will run into problems:

- How do we convert a broad work into atomic notes? What do we do with the leftover fragments?
- How do you search for duplicates?
- What does the pruning process look like?
- How do you add a new evergreen note? (Is it an O(n) search through all the other notes? What are we looking for, exactly?)
- Speaking of tabular data, how the heck does data itself fit in here? What about relational data? What about.. pictures? Or videos? Is this just for academic concepts?

Still, I love the idea that I could pick up any scientific paper, know the tree of dependencies for understanding it, and have all the relationships between each concept available to me on demand.

I think that's totally possible in this paradigm, and I think it could result in e.g. cancer being cured n - 15 years from now, instead of n years from now.
