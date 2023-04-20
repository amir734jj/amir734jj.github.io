---
layout: post
title: "University Portal as part of Intelligent user interface course"
description: "Creating a University Portal as part of Intelligent user interface course"
date: 2016-07-26 23:16:11 -0600
categories: personal
---
As part of Intelligent user interface course, we‌ (students) were asked to come up with a project that demonstrates our understanding on course materials. By materials, I mean research papers that we read every week. To come up with a project idea, I looked for a problem. Something that I can do better.

That thing for me was [UWM website](http://www4.uwm.edu/) (main page). It is inefficient in delivering the content. It is too simply designed that we can question it's existence. Navigating a website is unhelpful. I believe that home page of university website should be customized based on user's classes after user (i.e. student) is logged in. To make the matter worse, UWM students have to go to another website called "[D2L](http://d2l.uwm.edu/)", log-in and then see their class discussions. To see the official class schedule, students have to visit another website called "[PAWS](https://paws.uwm.edu/psp/saprod/?cmd=login)". This is what I call inconvenience. Now, what is not very easy to see in class discussions section of D2L is that Professors/Instructors are also able to see the discussion. Hence, students may feel uncomfortable sharing their thoughts and asking certain questions (e.g. about homework that is due). It is a recipe for failure.

I came up with a portal/website called "UWM Now" that addresses these issue. It provides a prejudice-free environment for students to communicate, discuss and learn together. This portal addresses all the deficiency that I mentioned plus interesting features such as weather (current temperature, forecast hourly and daily), news (Twitter style, 140 words) and a simple tool for evaluating a difficulty of student's schedule.

Now, let's focus on the code that make such a system possible. I used Node.js, Express.js and SQLite. However, this was the time I used a ORM to handle database interactions. The ORM I chose was Sequelize.js which was initially difficult to learn but I quickly got used to it. Learning a promises and resolving a promise was definitely a challenge. But it was worth the time learning a new tool. I will always try to avoid writing a pure SQL queries in String and executing them. It takes too much time.

My portal got a mixed reaction by my Professor. She liked some parts and expected more in other parts. But, the fact is all other teams had active team members. But my team mate was not helpful at all. He did not write a single line of code. I practically did everything by myself and I simply run out of time and patience. However, I hope my code would act as a good starting point for others.

- [GitHub link](https://github.com/amir734jj/UWMNow/)
- [Demo video](https://amir734jj.github.io/UWMNow/demo.mp4) (Hosted by GitHub). 
- [Overview video](https://amir734jj.github.io/UWMNow/overview.mp4) (Hosted by GitHub). 
- [PowerPoint presentation](https://amir734jj.github.io/UWMNow/Final_Presentation.pptx) (Hosted by GitHub). 
- [Project report](https://amir734jj.github.io/UWMNow/Project_Report.pdf) (Hosted by GitHub).