---
layout: single
title: "Andy Matuschak's Evergreen Note Taking System On Roam"
date: 2020-03-28
categories: productivity
tags: [productivity, project-management, note-taking]
toc: true # outline page on the right hand side
---

## Andy Matuschak's Note Taking System ("The Evergreen System")

This is a post describing the "Evergreen" system, how it excels over traditional note-taking, and how to use it on Roam.

### What is it?

Fundamentally, it's his note taking system designed to [help insights accumulate](https://notes.andymatuschak.org/Evergreen_note-writing_helps_insight_accumulate) by making notes [useful and worth building on top of](https://notes.andymatuschak.org/Evergreen_notes).

In traditional note taking systems, you spend most of your time pigeonholing notes into categories (you'll still probably have trouble finding them) and coalescing duplicates (to keep yourself sane).

In the Evergreen System, you spend most of your time doing "productive" work, like fleshing out your ideas and connecting the dots - the organization takes care of itself.

### The problem with existing note taking systems

A tweetstorm from Conor White-Sullivan (CEO/Founder of Roam Research) on why [current note-taking apps](https://twitter.com/Conaw/status/1099181050045952006) aren't getting the job done:

<blockquote style="font-style: normal">3. That's how things work in your brain -- There is a structure between the thoughts -- the structure resembles something like a graph of nodes and edges with probabilistic weights.</blockquote>

<blockquote style="font-style: normal">6. The thing is, if you want to take those thoughts out of your head, basic human I/O says you have to turn the graph into a stream. You can only speak or write one word at a time.</blockquote>

<blockquote style="font-style: normal">7. For others (including your future self) to absorb, effectively criticize, and build upon your thoughts, they have to take that stream of words/ideas, and rebuild the original graph in their own heads.</blockquote>

<blockquote style="font-style: normal">8. Good communicators make this process easier -- this is why speakers, teachers, and salespeople will often follow the formula of

- Tell them what you're going to tell them
- Tell them
- Tell them what you told them.

It lays out the scaffold of the idea, then fills it in</blockquote>

<blockquote style="font-style: normal">10. The problem with our note taking systems is this -- even if we have to eventually present our thoughts in a linear sequence -- writing isn't just a tool for communication. First and foremost, writing is a tool for thinking, it is a way of expressing our thoughts to ourselves</blockquote>

<blockquote style="font-style: normal">11. The kind of thinking I'm talking about, the kind where you are carefully thinking about the structure of your beliefs, is incredibly exhausting, and rare. Kahnemann calls it "System 2" -- its also essential if you want to do things like launch rockets and cure disease.</blockquote>

<blockquote style="font-style: normal">12. System 2 thinking is exhausting because it requires holding so much in your head -- the relationships between complex beliefs, the models you've built from years of experience and observation, 2nd and 3rd order effects of actions you might take.</blockquote>

<blockquote style="font-style: normal">14. The problem with existing notes systems is that they're locked into metaphors from when everything was analog. Files go in folders, and can get tags. At best, they add in the capacity for links to other files-- since links are now something everyone will be familiar with.</blockquote>

<blockquote style="font-style: normal">14. Our thoughts -- particularly the sort of thoughts we have when we're trying to work through complex problems, don't fit neatly (or at all) into those sorts of metaphors</blockquote>

<blockquote style="font-style: normal">24. What I want in a second brain: I see something online (or I capture a thought myself) and think -- oh, that's interesting. Interesting for what? I don't know yet, but if it's good, it's because I expect it to influence my thinking about something else in the future.</blockquote>

**[The Roam Whitepaper](https://roamresearch.com/#/v8/help/page/rdUZzTcyw)**

Highlights:

<blockquote style="font-style: normal">Unlike the brain, the file cabinet approach makes it difficult or impossible to remix or reuse the same piece of information. Each time a change is made to any given file, it has to be tracked down and updated in every location in which it exists. This leads to redundancy, with a cluttering of near-identical ideas, and significant work any time a system-wide change is required.</blockquote>

<blockquote style="font-style: normal">Current solutions also lack interconnectivity. Many files are divorced from context; cast into a drawer, rather than methodically fitted into a broader framework of knowledge. Knowledge trees can create pseudo-relationships between files nested within a given hierarchy, but these are not explicit, and can only describe a vertical ‘parent and child’ taxonomy. Some tools, such as web pages and wikis, also allow for orthogonal linking between related files, but this takes place in an ad hoc fashion, and again, there is no ability to explicitly define relationships.</blockquote>

### Why The Evergreen System is a better solution

**The value proposition in three sentences:**

In the past, when considering new ideas, you had to start from scratch connecting everything into a cohesive thought process. With this system, you save all that work you've done in the past into a form usable for new work. All you have to do is build on top of your existing knowledge base and add a few connections.

**From Andy Matuschak's [notes](https://notes.andymatuschak.org/Note-writing_helps_insight_accumulate)**:

<blockquote style="font-style: normal">Consider some hypothetical leap of insight you’d like to be able to make. To make that leap, you’ll typically need to evolve many independent, partially-formed ideas simultaneously, until they suddenly converge in a flash of inspiration. If you need to iterate on more than a few pieces at once, you may struggle to keep them all in your head.</blockquote>

This is the story of a folder-based note taking system: it's likely that all of these prerequisite ideas are strewn across different folders as sections of different files.

However, in the Evergreen notes system, you've already thought about all those ideas and crystallized them into notes that all connect to each other. Having insights becomes much more feasible because you're building incrementally on top of a strong foundation of ideas (as opposed to waiting for the stars to align).

### How does it work? How's it different?

Long story short: each note is meant to be [Evergreen](https://notes.andymatuschak.org/Evergreen_notes).

**Properties of Evergreen notes:**

- [Atomic](https://notes.andymatuschak.org/Evergreen_notes_should_be_atomic): Evergreen notes should be about one thing, and fleshing out that one thing *well*.

Why atomic?

When you make a note of something, it's assumed to be important, which means it should be

1. easily findable (no broad notes), and
2. easy to build on top of (no fragmented notes) 

If a note is broad (i.e. contains more than one concept), it makes finding any concept contained in that note harder (since you have to sort through concepts).

(This is "solvable" by storing an additional copy of *just* that one concept somewhere else, but if you do that, why not store just the concept to begin with and refer to it from within the broad note to avoid duplication and extra note maintenance?)

If a note is fragmented, it's hard to build on top of. Building on top of it requires fetching the other pieces, which introduces friction and fragility. If, every time you fetch a fragment you have to fetch the other pieces, why not store them in the same note and make it self-contained?

Note: This is very similar in principle to the software engineering concept of loose coupling (low inter-dependency) and high cohesion (high intra-dependency). [More info about what that means here](https://stackoverflow.com/questions/14000762/what-does-low-in-coupling-and-high-in-cohesion-mean).

- [Well-titled](https://notes.andymatuschak.org/Evergreen_note_titles_are_like_APIs): Atomic notes act as building blocks, and a good title acts as a handle for grabbing the idea and moving it fluidly to wherever it needs to go.

With atomicity and a good title, you can treat Evergreen notes like [APIs](https://notes.andymatuschak.org/Evergreen_note_titles_are_like_APIs): "on-demand" concepts.

- [Concept-oriented](https://notes.andymatuschak.org/Evergreen_notes_should_be_concept-oriented): Evergreen notes should be as concept oriented as possible for 3 reasons.

1. Concepts can manifest across different domains. When your notes are concepts, they're easier to find and reference in future notes.
2. Concepts are "evergreen" in the sense that they're pure. They're not biased towards a particular domain, point of view, or time period. Thus, in theory, any note on a particular concept should only change if you learn more about the concept. Other than that, they're sturdy building blocks for other ideas.
3. Concepts are the most "bang for your buck" in terms of note taking. They are, in theory, the most general Single Sources of Truth in existence. They're an answer to the question, "What's the largest overlap between all of these things?" 

- [Densely-linked](https://notes.andymatuschak.org/Evergreen_notes_should_be_densely_linked): Concepts don't exist in isolation - they're compositions of other concepts.

The more connections you find, The more the value of your network of ideas grows. In fact, actively pursuing connections between concepts creates pressure to [think carefully, foster learning, and discover insights](https://notes.andymatuschak.org/Understanding_requires_effortful_engagement).

In this system, [organization isn't decided beforehand - it happens organically (through association)](https://notes.andymatuschak.org/Prefer_associative_ontologies_to_hierarchical_taxonomies). Ideas build on each other in unexpected ways and insights happen when you least expect them - this system is flexible enough to support that.

## Roam Research

[Roam](https://www.roamresearch.com/) is a note-taking tool for networked thought. It's key distinguishing feature is the ability to bidirectionally link notes to each other. For example, if you link to note B from note A, then you can go to B from A, and when you're on B, you'll see that A linked to B.

Check out the [Roam White Paper](https://roamresearch.com/#/v8/help/page/Vu1MmjinS) for an example / demo.

Anecdotally, I first discovered it on [Nate Eliason's blog](https://www.nateliason.com/blog/roam). I use it as my primary idea database, although it does have functionality for other things (I also use it as a to-do list, a calendar, and a journal).

During undergrad, I took notes - but never looked at them again. I had a latent "distrust" for them. In the back of my mind, I knew they weren't complete - that they were just going to be step 1 in a wild goose chase towards understanding. It didn't occur to me to update my notes because it seemed pointless: I'd have to update them "everywhere," but I had no idea where "everywhere" was.

Now, I don't have to do the leg work of finding notes to update. I just stumble upon them naturally and update them as needed.

## Implementing the Evergreen system on Roam

### Creating a Roam Research account and using Roam

You can make an account on the [Roam website](). Once you've made an account, there are a few options for learning how to use it:

1. [The Demo Videos](https://roamresearch.com/#/v8/help/page/k5RxbGuJN) - A free quick-start guide for using Roam.
2. [Nate Eliason's Roam Course](https://learn.nateliason.com/) - A paid course  walking you through all of Roam's features. I bought this course. I'm satisfied with it and would recommend it (I don't get any referral fees). That being said, I didn't do much research trying to find free alternatives, so it's possible you could find the same information elsewhere. YMMV. 

### Creating an Evergreen note

Caveat: If I had generalizing and relating information down to an exact science, I'm pretty sure I'd be 1 step away from inventing true AI and starting a Singularity event. :) To my knowledge, it's not an exact science. However, I can give you some examples from Andy.

Remember: we want our notes to act as flexible (concept-oriented) building blocks (atomic) that are frictionlessly reachable from related ideas (densely-linked) through reasonable handles (well-titled).

Some categories of Evergreen notes from Andy's site:
- Arguments:
    * [Prefer declarative and imperative note titles to sharpen claims](https://notes.andymatuschak.org/Prefer_declarative_and_imperative_note_titles_to_sharpen_claims)
    * [Prefer positive note titles to promote systematic theory](https://notes.andymatuschak.org/Prefer_positive_note_titles_to_promote_systematic_theory)
- Systems:
    * [A writing inbox for transient and incomplete notes](https://notes.andymatuschak.org/A_writing_inbox_for_transient_and_incomplete_notes))
    * [Andy's morning writing practice](https://notes.andymatuschak.org/My_morning_writing_practice)
- Ideas
    * [Evergreen notes](https://notes.andymatuschak.org/Evergreen_notes)
- Objects
    * [Pocket memo pad to capture into writing inbox while out](https://notes.andymatuschak.org/Pocket_memo_pad_to_capture_into_writing_inbox_while_out)
- Advice
    * [Write about what you read](https://notes.andymatuschak.org/Write_about_what_you_read)
    * [Do your own thinking](https://notes.andymatuschak.org/Do_your_own_thinking)
- Observations
    * [The most effective readers and thinkers I know don’t take notes when reading](https://notes.andymatuschak.org/The_most_effective_readers_and_thinkers_I_know_don%E2%80%99t_take_notes_when_reading)

Another tip: [Keep associations as fine-grained as possible](https://notes.andymatuschak.org/Prefer_fine-grained_associations). In other words, lots of atomic notes with many inline connections is preferred to bloated (non-atomic) notes with few "foot-note" style connections between other notes.

### Using your notes to write more notes, papers, essays, etc.

I liked [Andy's thoughts](https://notes.andymatuschak.org/Executable_strategy_for_writing) on this, so I'll pull a few excerpts: 

<blockquote style="font-style: normal">A naive writing process begins with a rough inkling about what one wants to write and a blank page. Progress from this point requires an enormous amount of activation energy and cognitive effort: there’s nothing external, so you must juggle all of the piece-to-be in your head.

By contrast, if you’ve already written lots of concept-oriented [Evergreen notes](https://notes.andymatuschak.org/Evergreen_notes) around the topic, your task is more like editing than composition. You can make an outline by shuffling the note titles, write notes on any missing material, and edit them together into a narrative. In fact, because you can [Create speculative outlines while you write](https://notes.andymatuschak.org/Create_speculative_outlines_while_you_write), you might find that the first of these steps is already accomplished, too. And writing each note isn’t hard.

Instead of having a task like “write an outline of the first chapter,” you have a task like “find notes which seem relevant.” Each step feels doable. This is an executable strategy (see [Executable strategy](https://notes.andymatuschak.org/Executable_strategy)).

I describe two approaches here: an **undirected** version, in which writing projects emerge organically from daily work; and a **directed** version, in which you’re trying to write about something specific.

- Undirected version:
     * Write durable notes continuously while reading and thinking. ([Evergreen note-writing as fundamental unit of knowledge work](https://notes.andymatuschak.org/Evergreen_note-writing_as_fundamental_unit_of_knowledge_work))
     * Each time you add a note, add a link to it to an outline, creating one if necessary ([Create speculative outlines while you write](https://notes.andymatuschak.org/Create_speculative_outlines_while_you_write)).
     * Eventually, you’ll feel excited about fleshing out one of those outlines. ([Let ideas and beliefs emerge organically](https://notes.andymatuschak.org/Let_ideas_and_beliefs_emerge_organically))
     * Write new notes to fill in missing pieces of the outline.
     * Concatenate all the note texts together to get an initial manuscript
     * Rewrite it.
 
 - Directed version:
     * Review notes related to your topic (and a step or two beyond those—[Notes should surprise you](https://notes.andymatuschak.org/Notes_should_surprise_you))
     * Write an outline
     * Attach existing notes to each point in the outline; write new notes as needed.
     * Concatenate all the note texts together to get an initial manuscript
     * Rewrite it.
 
One other nice benefit of this approach: [Evergreen notes lower the emotional stakes in editing manuscripts](https://notes.andymatuschak.org/Evergreen_notes_lower_the_emotional_stakes_in_editing_manuscripts).</blockquote>

### Questions I still have:

**Should *every* note to be Evergreen?**

- Is there an advantage to having some notes that aren't Evergreen?
- Are there some notes that intrinsically are not Evergreen?

**How does one measure Evergreen-ness?** I can think of several metrics:

- usefulness: How many notes does it act as a building block for?
- generalizability: How many different *types* of notes is this a building block for?
- robustness: How many times does this note need to be updated?
- accessibility: How easy is the note to understand? How easy is it to find relative to the notes it's related to?

**What's a good system for cleaning your knowledge database (e.g. removing duplicates and replacing with references to Evergreen notes)?**

**Andy has a note that says [tags are an ineffective association structure](https://notes.andymatuschak.org/Tags_are_an_ineffective_association_structure). Could tags still work beneficially here?**

Could we just think of tags as cupid matchmakers for various entities?

In other words, tagging is the first step to creating associations. At first, it goes

entity 1 <--> tag <--> entity 2

Perhaps the second step is a pass through everything you've tagged, and ask,

entity 1 <--> entity 2?

This could be seen as a coalescing step. It might be the case that a small part of entity 1 is related to a small part of entity 2. We could refactor our notes to take out the one concept in common with entity 1 and 2, make it into an evergreen note, and then link to the evergreen note from entity 1 and entity 2.

Perhaps, eventually, after repeated iterations, any large entity (blog post, article, etc) will eventually be a composition of evergreen notes. It'd be like when all the kids talk in nothing but memes.

**What does graph theory have to say about organizing information into knowledge graphs?**

- Are there any theorems or lemmas that discuss "optimal" graphs with respect to knowledge?
- So far we've used links to indicate "related" - are there ways to extend this? What about different types of edges or links?
