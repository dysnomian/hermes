[![Build
Status](https://travis-ci.org/dysnomian/hermes.svg)](https://travis-ci.org/dysnomian/hermes)

# Hermes

## Installation

Install it with:

```
git clone git@github.com:dysnomian/hermes.git
cd hermes
gem install pkg/pkg/hermes-0.1.0.gem
```

## Usage

Hermes takes an input file as an argument. An example of a valid input file is
in the `spec/fixtures` directory. Execute the file with:

```
hermes input.txt
```

It will output the final balances to the command line.

## Rationale

I originally tackled this problem in 2014 and considered it a challenge to build
a clean and well tested OO project. I didn't do terribly, IMO, but I had been
working primarily in Rails and almost exclusively in Ruby at the time. I'd read
enough POODR and heard enough about design patterns to put together something
that I could still reason about 9 months later. Not bad for a project that I
threw together as quickly as possible.

Earlier this summer (June 2015) I trashed this project and started from scratch.
There were a few weak places where my reasoning fell apart, and things devolved
into the OO soup that I'd become so familiar with in the legacy Rails systems
I'd been working in. The tests got weak and overly specific, and that made it
harder to tell that I had been doing it. Maybe it wasn't bad, but I wanted more
practice with absolutely expunging poor design decisions. I wanted it to be
conceptually _perfect._

Well.

I rewrote Hermes from the ground up with a reasonable design that avoided the
of the OO soup I cooked up the first time. I succeeded! It was mostly clean, and
I found that the ways of thinking I had brought in from my recent foray into
Clojure helped me significantly. (In fact, to clarify my thought process, I
fired up a quick [Clojure version of this
project.](https://github.com/dysnomian/artha) That was where I came up with a
register, which was a tremendous improvement over my original.)

And it turned out pretty well. I showed it to my mentor
[Coraline](https://github.com/CoralineAda), and she gave me some good feedback
about making it more object oriented. I had left a Rubyized version of my
overall concept in the `Hermes.run` method, so that it looked something like:

```
print(register(transactions(input_lines(parser(filename)))))
```

Not great Ruby, I know, but it amused me that I was almost literally translating
my Clojure and getting something I could reason about.

So Coraline helped me fix a few places in my code that needed work. Pushing
those bubbles out broke a few things, and it seemed to be okay, but then I
realized that I couldn't figure out the data flow anymore, and I had just
written the damn thing! And I had thought it was pretty decent, too!

Part of the problem was that I'd had two nights in a row where my kiddo had
woken me up, and maybe I wasn't at the top of my game. It happens. But that's
the problem, right? I can't find a magic coffee that keeps me from ever being
anything but perfectly rested. And even if I could (_would I tell you?_) my
coworkers wouldn't have it, and they'd be the ones changing the code.

I could do better.

So I started in on it again, and in the process of getting my code passing, I
realized how much I had to keep in my head about the structure of my project.
It's not that it was so bad, but those are the things that I had to have tricks
for in every Ruby project that I had, but somehow found a lot easier with
Clojure. Maybe that Rubyized Clojure I wrote wasn't completely off the mark.

My friend [Wuest](https://gitlab.com/u/wuest) quipped that Ruby is her favorite
Lisp. It's a good notion. Ruby is certainly flexible enough to allow you to
involve a good amount of functional programming concepts. When she showed my
the pattern matching methods in her [funtools](https://gitlab.com/wuest/funtools)
library, it occured to me that was just the thing I wanted to simplify some
confusing (but rigorously OO!) conditionals I had wandered into. I rewrote
Hermes with that plugged right into the middle of the `TransactionFactory` logic
and was very happy with the results.

## License

This code is available under the GPL v3.
