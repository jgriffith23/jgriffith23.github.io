---
layout: post
title:  "On Explaining Well"
date:   2016-07-11
categories: Hackbright
---

Over the last several days, I've been learning about and reaping the benefits of improving my ability to tell people just what the heck I mean. 

Even if you're never going to talk to a customer or a non-technical co-worker about something in your company's code base, you're still going to have to explain your work to *someone*. That might be another member of your engineering team, someone using your program who you'll never even meet, or yourself a few days later. Whoever that person is, they'll thank you for communicating your intentions clearly. 

So far, I'd put the experiences I've had with explaining code into four categories. One involves speaking out loud, and the others involve documenting something about code in writing. Each category I mention here also relates to a slightly different audience. 

# Describing Code Aloud

In pair programming, the idea is that you're constantly discussing what's going on in your program out loud. Since you frequently switch who's driving and who's navigating, talking through each line together as you program is the best way to make sure both you and your partner know what everything does. Maybe you know exactly how a method you want to use works, but if your partner doesn't understand it they'll get confused. Simply describing that method to your partner can help you both think about the program more effectively.

This vocal discussion can (often should) begin even before you start actually coding up a solution to a problem. Grab a pen and paper, and just write a plan in pseudocode. You might have one algorithm in mind while your partner sees the problem differently, and by talking about your ideas, you can find the best solution.

Collaborators you see in person need to know what the program they're helping to create does, but sometimes, programmers and other users you don't interact with will need that information, too. You could keep all the details in your head and just Skype with the other person to get them up to speed, but documenting your code as you write it is much more efficient.

# Writing Useful Docstrings (<3)

I knew from the first docstring I saw that I wanted to learn how to write them well. A docstring is text surrounded by two lines containing three quotes, like this:

{% highlight python %}
"""This is a docstring. Docstrings give a short summary of the thing being 
documented here.

More detailed explanations can go after a blank line.

You can include example code for Python to use to test your program, too, 
like this:

>>>call_function(argument)
"Put the expected output here! :)"

"""

print "This is some actual code that will execute."
{% endhighlight %}

The beautiful thing about docstrings is that they generate documentation for you. Everything you put in a docstring appears in the Python console if someone calls `help()` and passes the name of your function. So if you make a function called `helpful_function()` and include a docstring, a user could enter the following in the Python console to access your explanation:

{% highlight python %}
>>>help(helpful_function)
{% endhighlight %}

And they'd see something like this: 

```
Help on function helpful_function in module __main__:

helpful_function()
    This is a function that does awesome stuff!

    It prints random cat pictures and gifs to make you smile.

    Expects files of the format:
    Cat Species | Image Type | Meme Preference | Number of Images
```

Code inside a docstring doesn't get executed as part of your program. But if you include code after a Python prompt and show the output you expect in the docstring, Python can generate tests for you. You can set those tests up to run automatically any time you run that file, to help you debug.

I've already found myself going back to the docstrings I've written to remember what my functions do at a high level, and I find the documentation from the output of `help()` pretty useful. When your docstrings have the right information, someone should be able to call `help()` to learn how to use your code without ever reading the source itself.

# Commenting All the Things

In our labs, I've taken to commenting blocks of code as soon as I write them, which probably sounds tedious. In some ways it is annoying, especially if I'm excited about the program and just want to run it already. 

But trying to explain part of a program as you write it is useful because it prompts you to really think about your own solution. You're already elbows deep in the guts of this problem, and your brain will probably never understand the solution as well as it does at that moment.

When I'm done commenting, I like to step through the block I wrote like a computer and read my comment again to see if everything really works as I think it does. If I'm collaborating with someone, this is often a point where if I've mixed something up, they'll catch it whether I do or not, which helps us find bugs faster, too. 

Commenting as you go is extra useful when you have to leave your program for a while and come back to finish it later. I don't know how many times I would've been scratching my head for trying to figure out what some line was doing without my own comments there to tell me. If I hadn't been commenting as part of my workflow, adding comments several hours later would've been more difficult.

If docstrings are for people who don't need to look at source code, comments are particularly important for anyone actually maintaining or collaborating on that source code. For instance, I've had TAs and pair programming partners come over to look at something I wrote without comments and get totally lost. But once I took a few minutes to comment the same block of code up (and style it a little better, with new lines between blocks for a clean progression of "ideas"), they were able to see where I was going.

# Writing (Useful) Commit Messages

Commiting code to Git with descriptive commit messages is like giving your future self a roadmap into your project's development. At some point, you're going to make a ton of changes, realize you should've taken that left turn at Albuquerque, and not remember how to get back there manually. But if your commit messages clearly explain what's changed with each commit, you should be able to read the log and get back. 

Commit messages don't have to be novels, either; a single sentence (maybe two, or even just a few phrases) is usually enough. Keeping your messages short and to the point will probably encourage you to commit more often, too. Any time I notice that I have a lot to say in a commit, my last one didn't happen recently enough.

One of our lecture slides linked to a [very amusing xkcd](https://xkcd.com/1296/) about how easy it is to slip into writing nonsense Git commit messages. I've been trying to remember to be descriptive in my commit messages (admittedly, that doesn't always happen yet...) because I've also had moments when I couldn't remember where I left off in a project, and the commit log was super helpful.

And of course, if someone's following your project or collaborating with you, making sure they know how and why you made the changes you made can help them be consistent when adding code themselves.

# Explaining Regularly Can Teach You to Think Faster

Apart from getting better at explaining code in general, I think all of these situations are also helping me think faster on my feet. I tend to be very methodical in my thought processes, so if I try to just speak on the fly, I can trip myself up. (That's why I love writing so much--it gives me more time to process my thoughts.) But I really feel that I'm starting to organize my thoughts more quickly, which is fantastic. 



