---
layout: post
title:  "Local-date C# library"
description: "C# DateTime alternatives"
date:   2018-06-09 23:16:11 -0600
categories: programming-blog
---
After learning the hard truth that C# does not come with a date only type and `DateTime` contains both
the date and time, I started the journey to find the best library that fills the gap. I experimented with
NodaTime library's `LocalDate` class but I found it difficult to use for very basic stuff like `ToString`
formatting and parsing given string and an optional pattern. Hence I decided to write my own
([repo url with nuget package too][repo-url]).

Of course to represent a date, we only need three integers (`year`, `month` and `day`), but I wanted more
than that. Hence I created a class called `LocalDate` that extends `LocalDateStruct` (it's not actually a struct
because structs in C# are actually sealed classed!). I added Julian day number hence code can handle:

- `AddDays(int days)`
- `AddMonth(int months)`
- `AddYear(int year)`
- `SubtractDays(int days)`
- `SubtractMonth(int months)`
- `SubtractYear(int year)`
- `ToString(string formatter)`
- `ParseLocalDate(string str)`

The repo README contain a lot more examples. But the last thing I really to mention was the JSON.NET and Mongo
driver bson custom serializer and bson serializers. I used `ToString` to serialize and `ParseLocalDate` for 
deserialize. The reason I treated this `LocalDate` as a value type rather than POCO or model. I wanted this
library to be more similar to C# `DateTime` which is in fact a `struct` rather than a "library".

As always, I appreciate any feedback or contribution.

[repo-url]: https://github.com/amir734jj/LocalDate