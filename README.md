# haskell

Homework 1:

Question 1:
a. Write a function that maps an Integer to a String. The function result should be "positive", "negative", or "zero", depending on the value of the integer.

b. Write an explicitly recursive function that applies your function from a to each element of a list of integers.

c. Use map to write a function that does the same thing as the function in b.

Now, write a function called times which calculates the product of the elements of a Integer list. Do this three ways:
d. Using backward recursion.
e. Using forward recursion.
f. Using the higher-order function foldr.


Homework 2:

Question 1:
a. Write a function to return a list of all the even positive integers.

b. Write a function which takes an Int list as an argument and which returns the doubles of the postitive elements of the list, with order preserved.

c. Given number n and a guess, x, of its square root, a better approximation to the square root can be found by calculating (x+n/x)/2. Write a function to take a number and an initial guess and return the infinite list of approximations given by using the formula above.

d. Write a function that takes a list and a number x and searches the list to find two consecutive list elements that differ by no more than x. The function should return the second of the numbers.

e. Write a function that is given a number x and a difference t and returns the first estimate to the square root of x that is within t of the previous estimate, where the estimates are generated as in c. The list should start with x/2 as the first approximation.

f. Write a function to take two lists, one of functions (:: b -> a) and one of list of b. The result should be the list obtained by applying the first function to the first element of the second list, the second function to the second element, etc.

g. Write a function to take a value and a list of functions and return the list of the results obtained by applying each of the functions to the value.

h. Write a function that removes all the occurrences of the first argument from the list argument.

i. Using h, write a function which takes two lists and removes all the occurrences of the elements in the first list from the second list.

j. Using a fold, write a function to return a list of all the prefixes of a given list.

k. The powerset of a set is the set of all subsets of the set. Write a function to calculate the powerset of a given set/list.


Question 2: Write a function to sort a list (insertion sort).

Question 3: Write a function to calculate an inverted index. The nth element of the input list is the set of words that appear on the nth page of a book. For each word in the book, the inverted index gives a list of pages on which it appeared.

Question 4: The Sieve of Eratosthenes is a way of finding prime numbers based on the following procedure: start with a list of the positive integers beginning with 2; the first number on the list is prime, now remove all the multiples of this number; the next number that hasn't been removed is prime, now remove all the multiples of that number, etc. Write a program to generate a list of primes using the Sieve.

Question 5: Do something interesting with a module (StackModule.hs defines a stack data structure and StackTest.hs uses it).
