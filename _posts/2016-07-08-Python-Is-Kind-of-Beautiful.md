---
layout: post
title:  "Python Is Kind of Beautiful"
date:   2016-07-08
categories: Hackbright
---

There. I said it: a programming language is beautiful. Now I'm one of *those* people. I'm okay with this.

Kidding aside, I really never thought I'd describe a programming language with that word. Assembly is appealing to me not because it's elegant but because when you use it, you have to understand every single little step the computer is taking to make something happen. I find C appealing because while it abstracts away a lot, there's still not much magic to it. Everything goes in a particular place, you have to manage memory carefully, and pointers are pretty cool. Of course, C also gives you enough rope to hang yourself, but hey--debugging is half the fun, right? 

Given all that, I honestly wasn't sure how much I'd like Python. I've always gotten a lot of satisfaction out of being able to see what's going on under the hood and to understand what I'm seeing in a program. Python is growing on me, though. Being able to basically read your program like English without actually translating it to pseudocode is fantastic, and it makes Python a great option for beginners. 

Anyway, I learned a couple of really fascinating things this week that I wanted to jot down.

# Slices Are Cool

There are a couple of Python elements that I had trouble getting my head around before Hackbright. Slicing is one of those elements. When you slice a list, set, or tuple, you're asking Python to give you the elements from one index up to but not including another. A slice looks like this:

{% highlight python %}
list[<start>:<stop>:<step>]
{% endhighlight %}

Here's an example with actual values:

{% highlight python %}
stuff[0, 1, 2, 3]
some_stuff = stuff[1:3]
{% endhighlight %}

In this code, `some_stuff` will be `[1, 2]`. When I first started messing with Python, I found the "up to but not including" part a little tricky. And don't even get me started on stepping. Now, after some pair programming practice and a great homework assignment, I feel a lot more comfortable slicing things up, and I think the feature is pretty awesome. My favorite thing about slices is how Python always gives a simple, logical answer when you try to slice out of bounds. For instance, a line sort of like this appeared on one of our slides: 

{% highlight python %}
stuff[42:]           # This slice gives [].
{% endhighlight %}

`[]` is an empty list. Rather than give an error, Python basically says, "You want the stuff from indices 42 and up? There is no index 99, so there are no elements. That means the list of stuff from those indices is empty." Pretty neat, right? 

Some other interesting slices:

{% highlight python %}
stuff[0, 1, 2, 3]
letters = ['a', 'b', 'c']

stuff[:-2]      #Gives [0, 1]  
stuff[-1::-1]   #Gives [3, 2, 1, 0]
letters[10:20]  #Gives []
{% endhighlight %}

First thing to note: In Python, you can have negative indices! They index from the end, where the last element in the list is at index -1. This gives you a super convenient way to work from the end of a list in Python, something that can be much more frustrating in other languages.

In any case, the first slice above gives the elements from indices 0 to -2. Since `stuff[:-2]` is 2, you end up with the first two elements. The second slice above shows how combining a negative start index with a negative step value can let you reverse the list. The third slice is another great example of Python's logic at work. There's nothing in this list from indices 10 up to but not including 20, so the slice just gives an empty list. 

# In Python, Memory Actually Acts Like a Box

You know how I like to know what's going on under the hood in a program? Well, one lecture this week was all about memory, so I was psyched. And I discovered that some memory-related aspects of Python don't work like I expected them to.

Take variables, for example. In other languages, if you assign a value to a variable and then assign a new value, the old value gets overwritten in memory, never to be heard from again. It seems like an efficient system, especially since you don't necessarily need to implement garbage collection. (Disclaimer: I don't pretend to know it actually is efficient.)

But think about how that might work in the physical world. Say you've got a box with a d6 in it. You want to play D&D, so you want to put a d20 in the box instead. You take the d6 out, place the d20 inside, and put the d6 outside the box. The d6 doesn't poof out of existence--the box just no longer contains it. 

That's how memory works in Python--it's like a box. Boxes are a pretty standard metaphor for memory, but this is the first time I've seen a system that works so much like the classic metaphor in practice. 

Lists demonstrate the concept better, though. Say you're looking at the following box:

{% highlight python %}
game_box = ['d20', 'pencils', 'notepad', 'holy staff']
{% endhighlight %}

Now, your friend wants to ride to D&D with you, so you ask her to check the box to make sure she has everything. You might say:

{% highlight python %}
our_box = game_box
{% endhighlight %}

In other languages, `our_box` would be a copy of `game_box`, and changing `game_box` wouldn't affect `our_box` at all. Not so in Python. All you've done is put another sharpie label on the box.

Your friend says, "I'm an archer, so I want to bring my bow and arrows to help me get into character." (You're playing a cleric, hence the holy staff.) So, you add her bow and arrows to `our_box` so she can get totally in character.

{% highlight python %}
our_box = ['d20', 'pencils', 'notepad', 'holy staff', 'bow and arrows']
{% endhighlight %}

Since you and your friend are still looking at the same box, `game_box` should now include `'bow and arrows'` as well. I think Python 3 may have changed this, because it doesn't work in the Python 3.4.3 Shell version of IDLE, but we're using Python 2 at Hackbright, and that memory weirdness totally works there. 

This whole concept seemed so crazy to me at first, but once I started visualizing memory as a box that multiple people can look at, everything started making a lot more sense. It's kind of an elegant way of handling rebinding values, and the analog to something in the physical world just works so well. 

I've been doodling visuals whenever I find a useful metaphor like this during lecture. Maybe I'll draw those up and post them sometime...   

> Quote of the day: 
> "Wherever there's an equals sign in Python, an arrow is being drawn somewhere."
> -- A wise Hackbright instructor