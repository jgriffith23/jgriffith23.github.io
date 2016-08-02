---
layout: post
title:  "Coding Bootcamp (Or, How I Learned to Stop Worrying and Love Failure)"
date:   2016-08-01
categories: Programming
---

Failure is frustrating and often feels unfair, but it's also one of the most effective 
teachers I've ever had, both in life and in programming. 

"Fail fast" is a common saying in tech for good reason. I can write working code 
all day and have to look up the same patterns later, but throw a bug in my path, 
and I'll remember how to avoid it next time. My pair programming partners 
and I have had some pretty good "failures" that taught me some important questions to 
ask myself whenever a program goes sideways.

# Is That Thing *Really* What You Think It Is?

An application I was working on last week could fetch multiple rows of data from a database and store
those rows as a list of tuples. In an effort to automate some Jinja templating and display
that data, my pair programming partner and I did something like the loop in the code below:

{% highlight python %}
>>> o = ("oh", "em", "gee")
>>> w = ("double-u","tee","eff")
>>> b = ("bee","bee","cue")
>>> omgwtfbbq = [o,w,b]
>>> omgwtfbbq
[('oh', 'em', 'gee'), ('double-u', 'tee', 'eff'), ('bee', 'bee', 'cue')]
>>> for ac,ro,nym in omgwtfbbq:
...     print ac
...     print ro
...     print nym
...
oh
em
gee
double-u
tee
eff
bee
bee
cue
{% endhighlight %}

This code creates tuples representing some phonetic-ish spellings 
for three acronyms and plops them into a list. Each iteration of the
`for` loop grabs the next tuple, unpacks it into three variables, and prints the
value of each variable to say something incoherent.

Our loop did the job so well and with so few lines of code that the next time we 
needed to display a row of data from the database, we knew exactly what to do. Just
unpack it in a `for` loop! 

Well, that didn't work. We scoured our code, Googled all the (relevant) things, 
and checked our routes. We tested our process in the console. There were no typos, 
unpacking worked the way we thought, and we could access all of our pages just fine.

Turns out we had a big case of "that thing is not what you think it is." The 
application we were modifying actually gave us single rows from the database as
single tuples, *not* lists of tuples. Oops. 

This is roughly what was happening:

{% highlight python %}
>>> tup = ("this", "is a tuple", 42)
>>> for a, b, c in tup:
...     print(a)
...     print(b)
...     print(c)
    
Traceback (most recent call last):
  File "<pyshell#7>", line 1, in <module>
    for a, b, c in tup:
ValueError: too many values to unpack (expected 3)
{% endhighlight %}

Remember how strings are lists? Well, this `for` loop tries to unpack every string 
as its component characters. Because y'know, the strings are lists. It's trying to
do exactly what the previous `for` loop did, but there just aren't enough variables
for it to unpack all those characters into. 

We figured this out by talking our problem through with one of our amazing instructors 
and by printing the output from both data fetching operations to the screen. Once we
knew what we were actually working with, getting the data to display without errors was easy.

And now I'll never forget how unpacking works--or perhaps more importantly, I'll never
forget to actually confirm my data types. 

Probably. Most of the time. 

In a sentence: Before you begin coding, be aware of the nature of your data.

# Are You Going Where You Think You're Going?

The best-planned program's execution path can be totally different from
what you intended it to be if there's a bug in your code. How perfect
your loop or if statement is doesn't matter if execution never lands inside that
block.

I've run into this issue enough now that sometimes even before a program starts
misbehaving, I'll throw down a print statement inside a loop just to have the 
console tell me "Hey, I'm inside that awesome for loop!" (Don't judge. Complimenting
your own code might just brighten your day, too.)

Printing debug statements has been especially handy now that we're using JavaScript, 
because JavaScript code seems to involve a lot of callbacks. A *callback function*,
also called an *event handler*, is a function that gets executed in response to an event.
In the browser, those events include clicks, key presses, and so on. You can add
an *event listener* to an HTML element (like a button), and the event listener 
actually tells JavaScript which callback to run when an event happens to the element. 

The whole system of events, event listeners, and callbacks is fun to play with (it's
like using interrupts in hardware land <3), but it can be frustrating too. If you
click a button you've placed an event listener on and nothing happens, maybe there's
an error in your callback--but maybe you're never actually reaching the callback
in the first place. 

I've found the latter to be my issue often enough that every time I write a callback now,
I plan to include a `console.log()` statement until the code is finalized so I have
some indication that the callback even happened. 

In a more literal situation, last week also reminded me yet again to make doubly sure
that my route names in my HTML files actually match the route names in my server
application correctly. If you have a link in HTML that tries to send a user to a
route that doesn't exist, you'll never be able to reach that route! 

Ironically, typos are worse to me when I'm programming than they are when I'm 
editing! At least typos that get past developmental edits will get caught by a copyeditor or proofreader; in code, unless you're pair programming, there's no one to check your 
work but you. And a typo won't break a book, even if it is embarrassing when one slips through. 

# Are You Working in the Environment You Think You Are?

*Related question: Are you actually importing the modules you think you're
importing?* 

If the first rule of tech support is "check whether the machine is plugged in," 
then this question definitely belongs in every debugging checklist.

In Python, it's really helpful to create a virtual environment for a project 
you're working on, so you can export the package requirements for easy installation 
with `pip` later. Just remember to activate your environment next time you work on 
the project, or you might not have the right version of, well, anything. 

When you install packages from another person's requirements file, if the project
doesn't run out the gate, don't panic. Check that requirements file, and make sure
all the modules your code relies on are actually listed there. If a module is 
missing, then install it manually and recreate the requirements file. 

Programs with tab functionality rock. Browser tabs, text editor tabs, terminal
tabs--they're great. Just one small drawback: when you get too many tabs open,
the titles shrink. When you're editing documents, that might mean you can't read
the filename anymore. (At that point, maybe you've gone overboard with the tabs, 
but that's a separate issue...)

That's not a big deal if you're editing files that look completely different. But 
if for some reason you have, say, two different CSS stylesheets open that have very
similar information in them, then mixing them up is entirely too easy. And yes, 
I know this from experience. I'm not even embarrassed: I learned a valuable
lesson!

# Are You Missing a [Syntax Element]?

*Related question: Do you have a [syntax element] that doesn't belong?*

When I started learning Python, I wanted to treat `print` like a function and use
parentheses. We're learning Python 2; apparently, I was just anticipating Python 3. I also 
had to break myself from using semicolons everywhere and teach myself to use indentation
instead of curly braces to indicate block scope.

Then, Hackbright sent us to JavaScript Land, where I had to unlearn everything I
overwrote in my muscle memory. Now, I keep trying to end statements with semicolons
in Python and use colons after `if` statements and the openings of `for` loops in
JavaScript. 

Mixing up syntax on occasion is just a consequence of knowing multiple languages,
and I'll happily accept it. Hooray for error messages! 

# Closing Thoughts

Confession time--

The title of this post is more aspirational than truthful. I definitely still
worry about failing, but Hackbright is doing an amazing job of convincing me
that failing is perfectly acceptable, even encouraged. Everyone here is so 
supportive and smart, and no one looks down on you for having a bug, even if 
it's silly. If anything, one of the staff will say, "Oh, let me tell you about 
a time I had the same bug!" 

Either way, the staff here are all brilliant at guiding you to solving problems 
yourself, rather than just solving them for you and leaving you mystified. 
That's one of the best things about Hackbright--they teach us to think
through problems, not just memorize everything. The solution may not always be 
the same, but you can apply a good process for problem solving to just about any
bug you encounter. 

> Relevant Quotes:
>
> "Make sure you're actually getting to the place you think you're getting to!"
> --Meggie
>
> "The first solution isn't always the best, but if it works, try it.
>  Then refactor your code."
>--A fellow Hackbrighter whose name I didn't write down... >.<





