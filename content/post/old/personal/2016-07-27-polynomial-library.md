---
layout: post
title: "Multivariable Polynomial ring using java's BigInteger library"
description: "Implementing a Multivariable Polynomial ring using java's BigInteger library"
date: 2016-07-27 23:16:11 -0600
categories: personal
---
After disappointing and certainty a long fail journey trying to learn [NTL](http://www.shoup.net/ntl/) (Number Theory package written in C++), I decided to write my own Ring implementation. In short, it was a difficult talk but I learned a lot.

Let's discuss the details. I needed a two classes: Monomial and Ring plus enum class to handle operations. Now, the key design choice is how to store the relationships between Monomials and operations. For example, [this](http://ring.perisic.com/) library written in java as well, uses String to store the relationship. The last thing a programmer wants is being confused by String manipulations. Therefore, I used Array of Objects to store the relationships.

After successfully implementing Monomial, Ring and operations (enum) classes, it was a time to tackle the most challenging part. Handling evaluation and making sure order of operations is preserved. To handle that, I needed to loop through the Array 4 times (add, multiply, divide, subtract). Thereafter, for every two Monomial in Array (first pass is for multiplication, second for division and so on), evaluate them and replace them with the evaluated result back in the Array. In the end, result Array should contain only one element it should be a BigInteger value.

As of now, code supports String parsing a complex Polynomial Ring including nested Rings. The followings are just some examples that code is able evaluate correctly thanks to the specified order of operations for each operation.

<script src="https://gist.github.com/amir734jj/a2f7440e4ed5163fce11231dae019b1d.js"></script>


- [GitHub link](https://github.com/amir734jj/BigIntegerRing)
- [java docs](https://amir734jj.github.io/BigIntegerRing/) (Hosted by GitHub).