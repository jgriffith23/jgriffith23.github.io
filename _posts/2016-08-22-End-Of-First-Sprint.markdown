---
layout: post
title:  "Halfway Through My First Project Sprint"
date:   2016-08-22
categories: hackbright
---

At Hackbright, we're halfway through our first sprint of project time. We've all spent the last two weeks working like crazy to get a minimum viable project off the ground, and as part of our homework this past weekend, we were asked to take some time to reflect.

Several of the reflection prompts we received to write on were very much in line with thoughts I wanted to share here, so I figured I'd just share some of those now.

# What inspired you to do this project?

I'm building a personal craft supply inventory tool, where users can log their supplies, monitor their inventory, and see how many supplies they need to build a project. I was inspired to build this app after asking myself two questions:

1. What problems do I have on a regular basis that I could solve by writing a program?
2. Is there a program out there that solves a similar problem that I could look to as a model?

I love arts and crafts, so my answer to Question 1 came pretty quickly. I have a giant box and a big old shelf of craft supplies that are semi-organized, but I honestly have no idea what supplies I actually own. I'd love to be able to just go through them once, catalog them, and create an inventory.

I also tend to just rebuy craft supplies when I want to do a new project, only to discover later that I didn't need to buy them at all. If I had a program that could look at my inventory and tell me how many supplies I need to build something, I could avoid that issue.

Once I knew I wanted to build a personal supply inventory, I realized I already use a personal inventory tool called Deckbox to catalog a very different hobby item--my Magic cards. Deckbox has a lot of features similar to what I wanted for my craft inventory, so I got a lot of inspiration from there. The ability to search and filter your inventory on multiple columns is very much inspired by Deckbox.

# What part of the technology interested you?

From the start, I wanted to create an application where most of the business logic happens on the server and the front end mostly has to worry about submitting data, asking for data, and displaying it, not making big decisions. I really like Python, so I wanted to write a lot of it.

The first time we touched databases at Hackbright, I knew my app was going to revolve around them, too. Databases are fascinating! I was very interested in creating a data model (I'm very proud of mine), designing my system, and being able to display my data in a variety of ways.

I also wanted to get out of my comfort zone and make sure some of my features relied on JavaScript. We didn't get as much time with JavaScript in the regular curriculum, but I wanted some features (like inventory filtering) to be able to change the page appearance without reloading the entire page. As such, I made sure to try using jQuery and AJAX, and I'm glad I did! I think JavaScript and I have reached a truce.

# What are the different elements of your project, and how did you structure your project?

My project revolves around tracking two types of information:

1. The supplies a user owns
2. The supplies needed for a project a user wants to build

My ultimate goal for the first sprint was to be able to tell a user exactly what supplies they own and how many supplies they would need to buy to build a project in the app's database. (Of course, that relies on the user giving accurate data; how well a user wants to keep their inventory up-to-date isn't for me or my app to decide, however.)

To that end, here's how I've structured my project so far, in terms of data and page connections.

## The Data Model

My database has five tables, which work together to represent all supplies my app's users own, all supplies in projects my users want to build, and the details about those supplies.

![](CraftersClosetPlanning/CraftersClosetDataModel.svg)

This data model shows the following relationships:

1. A user can have many projects, but each project is owned by only one user.
2. A user can have many items in their inventory, and each item has a particular set of details attached to it.
3. The set of details that embodies a particular supply can apply to many items owned by users.
4. A project can have many supplies associated with it.
5. The set of details that embodies a particular supply can apply to many supplies required by projects.

Determining exactly what the relationships between users, projects, and inventories should be was a really fun and interesting problem to solve. Thanks to some top-notch advising (Lavinia, you're the best!), I realized that it would make sense to separate the "idea" of a supply from the information specific to users and projects. From there, we determined that projects and supplies actually have a similar relationship to the one between users and supplies.

## Site Pages and Connections
When a user first arrives at my homepage, they see a landing page where they can search for projects other users have created, register, or authenticate. On registration, a user is authenticated automatically.

I'll take you on a little tour of the application so far, but try to ignore the actual data. Some of it is...creative. I blame the debugging process.

### The Dashboard
On authentication, a user is taken to the dashboard.

![](https://github.com/jgriffith23/jgriffith23.github.io/blob/master/assets/CC-early-screens/Dashboard.png?raw=true)

From the dashboard, a user can filter their inventory view...

![](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/master/assets/CC-early-screens/InventoryFilter.PNG)

Or search their inventory.

![](https://github.com/jgriffith23/jgriffith23.github.io/blob/master/assets/CC-early-screens/SearchInventory.PNG?raw=true)

Users can also add supplies to their inventory from their dashboard by clicking "Add a Supply!" and submitting the form in the modal window that appears on click.

![](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/master/assets/CC-early-screens/AddSupply.PNG)

As the full dashboard screenshot below shows, users can also view a list of their projects from the dashboard.

![](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/master/assets/CC-early-screens/FullDashboard.PNG)

### Project Pages

From the dashboard, a user can choose to create a new project. Clicking "Create a New Project" takes the user to a new page.

![](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/master/assets/CC-early-screens/ProjectCreationPage.PNG)

This page lets users give a title, description, and a link to a tutorial. The "Add a Supply to This Project" button generates a form with the same fields as the "Add Supply" form when pressed. A user just has to enter the supply details in the forms they generate to specify the supplies associated with the project.

Once a user presses "Create Project," the project is added to the database and the user is taken to the project's landing page.

![](https://raw.githubusercontent.com/jgriffith23/jgriffith23.github.io/master/assets/CC-early-screens/NewProjectPage.PNG)

Project pages tell authenticated users how much of a required supply they need to buy to make a project. In this example, the authenticated user (not necessarily jhacks, the demo project creator) doesn't own either of the supplies required for this project, so they have to buy the full amount.

### Okay, so where's the JavaScript?

In terms of fetching and processing data for all these pages, Python does the heavy lifting. But JavaScript was key to getting the project search, inventory search, and inventory filter features working according to my vision. I wanted to only change those tables when the user requested a new view, rather than rerender the whole page. That process looks something like this:

* AJAX sends a request to the server containing the search/filter parameters.
* The appropriate Flask route calls a helper function to fetch the appropriate data and process it accordingly.
* Flask renders the HTML to be replaced.
* Flask passes the HTML back to JavaScript, via AJAX.
* JavaScript plops the new HTML onto the page in a conveniently placed `<div>` element.

Perhaps in my second sprint, I'll try letting JavaScript do more work, but for now these features are functional. If it ain't broke...

# Closing Thoughts
That's my app so far! It's still rough around the edges, but it's mine, and I'm enjoying the work. I'll have a couple more blog posts coming up where I discuss challenges and look ahead to the rest of our second sprint.