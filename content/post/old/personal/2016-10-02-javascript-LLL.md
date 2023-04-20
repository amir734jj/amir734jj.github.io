---
layout: post
title: "Journey with JavaScript trying to implement LLL"
description: "Journey with JavaScript trying to implement LLL"
date: 2016-10-02 23:16:11 -0600
categories: personal
---
Fresh out of my summer internship at [Northwestern mutual](https://www.northwesternmutual.com) and working extensively with JavaScript and Node.js, I was reading about [LLL](https://en.wikipedia.org/wiki/Lenstra%E2%80%93Lenstra%E2%80%93Lov%C3%A1sz_lattice_basis_reduction_algorithm) and basics of lattice and lattice cryptography. I tried installing NTL on my Windows machine. It was a nightmare. Lack of documentation for such an important library was just astonishing. I did not have any success with Windows. Thereafter, I installed Ubuntu (in fact, I never switched backed to Windows) and had some success with NTL on Ubuntu. But the complication of NTL's type system and again lack of documentation halted my efforts.

I decided to implement LLL myself to see how complicated it would be. My language of choice was JavaScript. Bad idea. Lack of built-in BigInteger was a limitation. Not to mention, concept of Matrix does not exist in JavaScript, I simply used 2 dimensional array instead. Furthermore, I had to implement [Gram-Schmidt process](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process) and [Matrix determinant](https://en.wikipedia.org/wiki/Determinant) for an arbitrarily sized matrix all from scratch. My code worked after all, but slow speed and lack of modular implementation turned this mini project to one of my least favorite and cumbersome projects. Most importantly, it was a rewarding effort. I was able to see the promise of polynomial running time of lattice reduction with respect to delta constant. Shortly after I finished implementing the code, I learned that Sage math has a built-in LLL implementation which I did not know about. After learning about it, I started reading more about Sage math.

[GitHub link](https://github.com/amir734jj/JavaScript_EMC6_linear_algebra_tools)