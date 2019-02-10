# B3

Unit tests: [![CircleCI](https://circleci.com/gh/dannykopping/b3/tree/master.svg?style=svg)](https://circleci.com/gh/dannykopping/b3/tree/master)

## Purpose

This project's goal is to parse the famously impenetrable `strace` output into JSON.

## Getting Started

TODO

### Um, why?

Well, that's up to you. I figured that this output is so information-dense that it has to be useful in a structured format.

I love this utility and use it all the time, and wanted to learn more about it.

...plus it was a fun, terrifying, frustrating and illuminating excursion into parsing grammars (but oy very what a schlep!).

### Why not do this in C?

  1. I don't know C
  2. I invite you to examine the [glorious mess](https://github.com/strace/strace/search?q=printf&unscoped_q=printf) that is this nearly 30-year old edifice
  3. Many people have tried and failed/given up, and I'm neither smarter nor more persistent than them