Exercise 1
---

A plain text file has the following contents:

    test test test test test
    test test test test test
    test test test test test
    test test test test test
    test test test test test
    test test word test test
    test test test test test
    test test test test test
    test test test test test
    test test test test test
    test test test test test

Write a Lisp program that creates a new file where `word` is replaced
by `inserted word`.

    test test test test test
    test test test test test
    test test test test test
    test test test test test
    test test test test test
    test test inserted word test test
    test test test test test
    test test test test test
    test test test test test
    test test test test test
    test test test test test

Do not hard-code the file name.

*Hint:* The `with-open-file` macro may come in handy for this
 exercise.

Exercise 2
---

Write a function `range` that accepts a starting value (inclusive), an
end value (non inclusive) and an optional step size and returns the
range as a list. Usage examples:

    CL-USER> (range 1 10)
    (1 2 3 4 5 6 7 8 9)
    CL-USER> (range 1 30 :step 2)
    (1 3 5 7 9 11 13 15 17 19 21 23 25 27 29)

Keep this simple, you don't have to support decreasing ranges and
negative step sizes.

Exercise 3
---

Write a "Deaf Grandma" program. Whatever you say to grandma (whatever
you type in), she should respond to with "HUH?! SPEAK UP, SONNY!", unless
you shout it (type in all capitals). If you shout, she can hear you
(or at least she thinks so) and yells back, "NO, NOT SINCE 1938!". 

To make your program really believable, have grandma shout a different
year each time; maybe any year at random between 1930 and 1950. You
can't stop talking to grandma until you shout "BYE".

Exercise 4
---

Text analyzer?

Exercise 5
---

Write a Lisp program that prints the numbers from 1 to 100, which for
multiples of three prints "Fizz" instead of the number and for
multiples of five prints "Buzz". For numbers which are multiples of
both three and five print "FizzBuzz". 

Discuss this in the FizzBuzz Forum.

Exercise 6
---

Given a string, write a program to reverse the word order (rather than
character order).

Exercise 7
---

Write a Lisp program that, when given the list `'(12, 23, 456, 123,
4579)` prints each number, and tells you whether it is odd or even.

Now turn it into a function that given a list will tell you how many
of the list's element where even.

Exercise 8
---

I have a database of students and want to know how many have failed
the final exam. There is a list of results, where '1' means the
student has passed the exam, whereas '0' indicates failure:

    (defparameter *results* '(1 1 1 0 0 1 0 1 0 0 1 1 1 0 1 0 1 1 0)

Write a function called `exam-summary`, that given a list like the one
above will produce the following output:

*x out of y students passed the exam (xx.yy%).*
