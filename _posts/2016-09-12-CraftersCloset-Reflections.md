---
layout: post
title:  "Crafter's Closet Version 0"
date:   2016-09-12
categories: hackbright
---

My Hackbright project is done! Mind if I just gush for a minute?

## New Features and Spiffiness

Last time I posted, I was halfway through the month-long process of building a
capstone project to demonstrate the skills I've learned at Hackbright. The next
couple of weeks were kind of a whirlwind of adding features, testing, and prettification.
Here's where my little inventory tool landed in the end:

![Landing Page](https://github.com/jgriffith23/crafters-closet/raw/master/static/assets/Screenshots/Homepage.png)

![Dashboard Top](https://github.com/jgriffith23/crafters-closet/raw/master/static/assets/Screenshots/DashboardChart.png)

![Inventory](https://github.com/jgriffith23/crafters-closet/raw/master/static/assets/Screenshots/Inventory.png)

![Adding a Supply](https://github.com/jgriffith23/crafters-closet/raw/master/static/assets/Screenshots/Add-Supply.png)

I'm still using the same calming color palette that [paigebernier](https://github.com/paigebernier) and I discovered
during one of our early Hackbright labs, but there's a bit more going on now than there was in the last Crafter's
Closet post. For a look at the actual code, and the final tech stack, you can check out the project's 
[GitHub page](https://github.com/jgriffith23/crafters-closet), but I'll talk a little about what's new here.

### Inventory Chart

The dashboard now has a colorful doughnut chart, powered by [Chart.js](http://www.chartjs.org/).
It's meant to be a visual representation of how much of the space in your craft box each type of supply in
your inventory occupies. Admittedly, the actual calculation needs some work (a plan for v1.0), but the
idea is that 20 yards of yarn should get a bigger slice of the doughnut than 20 LEDs.

### Updating Stock

Earlier screenshots of Crafter's Closet showed a bunch of Update buttons on the inventory table. Until the
second sprint of my project, those buttons didn't actually *do* anything. Now, when you click one, a callback
function in an event listener attached to that button toggles a hidden text field into view. When you type
a number into that text box and click the Done button, the new stock value gets sent to the server via
an AJAX POST request, and that inventory item is updated in the database. (The inventory table does also get
updated.) 

You can also now use this feature to delete items from your inventory completely! All you'd have to do
is type 0 into the text box.

### Autocompleting Fields

Throughout this project, one of my goals was to keep the data in my database clean and streamlined. If I
ever deploy, I do want to allow users to add completely new supply details to my database, but where possible,
I want to do as much as I can to avoid misspelled duplicates. 

To that end, I added autocomplete functionality to the Color field when users add new supplies to their 
inventory. Selecting a supply type causes the Brands dropdown to populate with only brands associated with
that supply type. Once you choose a brand, the JQuery UI Autocomplete widget receives all colors associated 
with that brand in the database so that when you type, you'll see existing colors that match your string.

I also added autocomplete to the search box where you can filter your inventory. That field's autocomplete
tags will only ever include strings that match items in your inventory.

### Password Hashing

No user will ever see this feature in action, but it was still very important to me because if I ever deploy,
I want to try to be security conscious. Instead of storing passwords in plaintext in the database, I'm now
using Bcrypt to create hashes to store and check against.

### More Supply Data

This is another new bit that users can't really see, but I had a lot of fun making it happen. Over time,
I want to keep adding new supplies to my database so users can document all the brands they add to their
inventory. For now, to beef up my dataset, I downloaded some product catalogs and took them apart.

Yarn and paint catalogs tend to just have brands, colors, and pictures in them, so I used the `pdftotext`
command to extract just the text from some catalog PDFs. From there, I cracked the text files open in Vim 
and put some handy regexes to work to clean up superfluous text. Finally, I ran the text files through a 
Python script I wrote to generate a CSV that had all the information my *seed.py* program needs to make
new database records.

Massaging all that data into the exact format I wanted was surprisingly satisfying. I could easily see
myself spending an afternoon just fetching a bunch of data for funsies. Maybe after that, I can 
create an API for my app, so other people can get giant lists of craft supplies!

### Pretty Stuff

I'm not fond of the prettification process, but I'm pretty pleased with how my project ended up
looking. I made the app generally more responsive (apparently just puting the body section in
a `container-fluid` div makes everything stack nicely on shrinking if you're using bootstrap),
added a spiffy background, picked some fonts, and applied my "brand" color (#80dfff) more
consistently. 

## Challenges

Ultimately, I ended up with an app that works. It's not perfect, but it does what I created it
to do. I feel pretty good about all that, but I did run into some challenges along the way.

### Getting Comfortable with AJAX

I think my biggest challenge was getting along with JavaScript. I was really nervous about trying out JQuery 
and AJAX requests because I was more comfortable with Python, and the first place I took the plunge was 
with filtering my inventory table.

Major shoutout to Tim, one of my three amazing mentors, for helping me plan the whole thing out. 
I've never been so glad I forced myself to take over whiteboarding the solution to a problem! I had
the "aha" moment I'd been waiting for, and I've felt a lot more comfortable making AJAX requests
since. In fact, I daresay I enjoy it.

We discussed which piece of my page would make the most sense to break into its own template, 
walked through the JQuery code and AJAX calls I'd need to make to get the new table data, and planned 
which Flask routes I'd need to add to get the data from the database. By having someone else ask me 
questions about my app's architecture, I developed a better understanding of it myself. From there, 
it was just a matter of coding carefully and making the right database queries.

I developed a little system for myself for writing AJAX requests for data:

1. Write an event listener and handler for the element that the user should click to start this process. Have the event handler print something amusing to the browser console, so you know you got inside the function. (And to make yourself laugh. Just delete the debug code when you're done.)
2. Write a Flask route that returns the arguments it got from JavaScript. Print that to the browser console, too. (This step is where I learned that I needed to URL-encode my search parameters so spaces, ampersands, and so on, would make it through to the server intact.)
3. Write any Python code needed to get the actual data out. Return that data to JavaScript from the Flask route. Plop it straight where you want the updated HTML to go.
4. When you can see your data reach the front end, you're ready to actually make HTML, whether the server crafts and passes that HTML forward or JavaScript handles placing it.

My server renders new HTML for the inventory table and sends it to the front end because that was the 
easiest way for me to get my head around the process at first. In v1.0, I want to try passing a JSON object forward instead, 
so I can let JavaScript handle placement.

### Knowing When to Pivot to Different Technology

The autocomplete feature took me a couple of days, which was a solid day and a half longer than I was expecting
to spend on it. The main reason for the delay was stubborn determination to get the [Typeahead](https://twitter.github.io/typeahead.js/examples/) 
library working.

At first, I couldn't get my autocomplete tags to populate at all without hard-coding a list into the
JavaScript code for the feature. Turns out Typeahead actually caches your tags, so if the list isn't
there when the code runs, the list gets cached as empty. 

I managed to turn off caching, and I started prefetching and processing a list
of tags from the server. That let me at least populate the list once without hard coding it, but unfortunately,
I couldn't seem to get my tag fetching code to work inside a callback function.

After beating my head against this problem for a day, I nearly gave up on autocomplete. Before giving up, however,
I decided to give JQuery UI's autocomplete widget a shot. After discovering a rogue extra JQuery import statement
in my HTML templates (apparently I was overwriting the JQuery UI code with that second import), the widget worked 
brilliantly, and I got the feature up and running quickly.

I haven't had a good chance to try Typeahead again since deleting the extra import statement, but in the coming weeks,
I want to check whether the problem was purely ebkac or not. My research indicates the library just doesn't support
events, but we'll see.

In any case, I did learn that if you're beating your head against a wall, pivoting to something new
can help you break through that blocker.

## Next Steps

Eventually, I plan to deploy Crafter's Closet to the Web (many of the folks in my class want to try
deploying, I think). But first, I have a few more goals to achieve, along with the refactors I mentioned above.

* Add more form validation.
* Add more craft supplies to the database!
* Implement a feature for photo uploads.
* Allow users to write longer project descriptions.
* Allow users to update project pages, including the supplies required.
* Add public-facing user profile pages.
* Implement a "favorite" feature, so users can bookmark projects
* Implement a feature where users can mark projects as completed and their inventory updates accordingly.

Some of these might be v2.0 ideas, but I do plan to keep adding to this project over time. I'd also
like to run some pentesting tools like Burp on my app to see where the glaring holes that
I know must exist are hanging out and try to patch as many as I can. 

First, though, I think I need a few days to rest. Hackbright is amazing, but it's also exhausting!

