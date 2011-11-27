Exercise 1
---

Write a program that processes the string

    (defparameter *s* (format nil "Welcome to the forum.~%Here you can
    learn Ruby.~%Along with other members.~%"))

one line at a time, using all that we have learned so far. The expected output is:

Line 1: Welcome to the forum.
Line 2: Here you can learn Lisp.
Line 3: Along with other members.

Exercise 2
---



Exercise 3
---

Write a function `leap-year-p`. It should accept a year value from the
user, check whether it's a leap year, and then return true or false. 

With the help of this function calculate and display the number of
minutes in a leap year (2000 and 2004) and the number of minutes in a
non-leap year (1900 and 2005). 

*Note:* Every year divisible by four without a remainder is a leap
year, except the full centuries, which, to be leap years, must be
divisible by 400 without a remainder (e.g. 1600 is a leap year, while
1700 is not).
