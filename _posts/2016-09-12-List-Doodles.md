---
layout: post
title:  "Doodles About Lists in Memory"
date:   2016-09-12
categories: doodles
---

For months, I've been meaning to copy one of my earliest Hackbright lecture doodles
to my computer: a fun lil zine-ish comic about lists. Now that I have a bit more free time 
(and some inspiration courtesy of [SF Zine Fest](https://twitter.com/sfzinefest)),
I finally did the thing.

When I learned about how lists work in memory in Python, my mind was blown. I'm used to
living in a land where saying something like this:

```
a = [1, 2, 3]
b = a
``` 

Just means you have two copies of `[1, 2, 3]` in memory. But in Python, assigning one list to 
another binds two names to the same piece of memory. For instance, say Alice wants to 
represent her box of RPG campaign supplies as a list. Here's the box:

![A box (list) of game stuff.](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/39bf3201d1cbb4b8ffab254f864c3464b292e2f2/assets/my_box.png)

And here's Alice's list.

{% highlight python %}
>>> my_box = ['d20', 'pencil', 'character sheet', 'game rule book', 'robe', 'wizard hat']
{% endhighlight %}

Alice is looking at her box, rather pleased with her packing job at this point, when 
her friend Barb comes over.

![Can we share?](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/master/assets/can_we_share.png)

Barb wants to share the box with Alice, so they only have to carry one box around.
Alice figures that's cool, so she updates her Python code, too:

{% highlight python %}
>>> our_box = my_box
>>> our_box
['d20', 'pencil', 'character sheet', 'game rule book', 'robe', 'wizard hat']
{% endhighlight %}

Now, Alice and Barb can refer to `our_box` when they talk about the container for
their game stuff. Sweet!

![Still my_box, but okay.](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/39bf3201d1cbb4b8ffab254f864c3464b292e2f2/assets/still_mine.png)

But just because there's another label on the box, that doesn't
mean the old label went away. Just try asking the Python interpreter whether
the two boxes are the same item in memory:

{% highlight python %}
>>> my_box
['d20', 'pencil', 'character sheet', 'game rule book', 'robe', 'wizard hat']
>>> our_box is my_box
True
{% endhighlight %}

Python says `our_box` and `my_box` are literally the same item. 

Now, Barb wants to spice up the campaign by adding Pokemon to the mix.

![Let's add a Pokeball, ok?](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/39bf3201d1cbb4b8ffab254f864c3464b292e2f2/assets/pokeball.png)

Alice isn't sure how well that will go over, but she's willing to go along with this idea.
She appends the new item to her Python list, too.

{% highlight python %}
>>> our_box.append('pokeball')
{% endhighlight %}

Now, this item should be in the box...

![This box is my life now.](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/39bf3201d1cbb4b8ffab254f864c3464b292e2f2/assets/our_box.png)

...and Alice's list.

{% highlight python %}
>>> our_box
['d20', 'pencil', 'character sheet', 'game rule book', 'robe', 'wizard hat', 'pokeball']
{% endhighlight %}

There it is! The shared box has Barb's Pokemon stuff, and our heroines are ready to go
fight some dragons. Or capture Dragonairs. Maybe both.

But remember, `our_box` and `my_box` are still looking at the same place in memory, just
like Alice and Barb are looking at the same box! The original binding never went away, 
meaning this picture is also correct:

![But this is also true.](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/39bf3201d1cbb4b8ffab254f864c3464b292e2f2/assets/g4147.png)

After all, `our_box` is still Alice's box. You can confirm this in the interpreter
as follows:

{% highlight python %}
>>> my_box
['d20', 'pencil', 'character sheet', 'game rule book', 'robe', 'wizard hat', 'pokeball']
>>> our_box is my_box
True
{% endhighlight %}

And that's how Alice and Barb ended up playing a high-fantasy/Pokemon cross-over
pen-and-paper RPG campaign. Sharing memory, like sharing fun memories, is caring!

(Yes, I hate myself a little for that last line.)