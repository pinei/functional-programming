## Introduction

### What is Haskell?

- It's a purelly functional programming language. It's a descriptive language, in contrast to imperative ones.
- In funtional languages, you don't tell the computer what to do. You tell it "what stuff is".
- You can't change the state of something already assigned.
- Everything is a function.
- Functions have no side effects. The only thing a function can do is calculate something and return the result.
- Haskell is lazy. Because of the "referential transparency", Haskell can keep (given an input) the result of a function as long as
  possible.
- Haskell is statically typed. Its type system has "type inference", which means that it can infer types when assigning.

## Chapter 1: Starting out

- Everything is function
- Inline functions: operators, which sandwich between numbers. They have precedence among other types of functions
- Prefix functions: common functions, which has a name (of the function), a space, then its parameters (separated by spaces)
- prefix function example:
  - doubleMe x = x + x
- Very similar to other langs, JS for instance:

  - const doubleMe = (x) => x + x

- conditionals: else in Haskell is mandatory
- conditions in Haskell are functions, not statements like in imperative languages

- functions that take no arguments are called "definition" or "name". You can use "let" to define a name. Example:
  - let jack'sName = "Jack"

LISTS:

- Lists in Haskell are homogeneous data structures, meaning that elements must be at the same type.
- To append items in an existing list, we use ++ operator: [1,2,3] ++ [4,5,6]
- Be careful using ++ operator in huge lists, because it reads the entire lists, element by element, and it can be painful
- Use cons (:) operator for just appending instantaneously: 1:[2,3,4,5,6] is equal to [1,2,3,4,5,6]
- cons operators must be declare on the left side, never after the target list, and only single element: 1:2:3:[4,5,6]
- ++ operator is just a syntax sugar for const operator: [1,2,3] is equal to 1:2:3:[]
- To access a particular element from a list, we use || $index: $ "Jack" || 3
- Lists can be compared if their elements are somehow comparable. They are compared element by element at the same index.
- When using infinite lists, and because Haskell is lazy, it never evaluates this infinite list before waiting for what we really
  need. For example: $ take 5 [1,2..] == [1,2,3,4,5]. So it waits and discovers that we just need the first 5 elements in that
  infinite list. Thank God.
- Infinite strategies: cycle, repeat, [x,x..]
- List Comprehensions: a way to filter, transform and combine lists, that is, given a list, do things on it, and return a new list
  Example Structure: [x*2 | x <- [1..10]]
  WHERE [1..10] will be the list
  AND x (after the pipe) will be each element from the previous list
  AND x*2 (before the pipe) will be the transformation of each element on the list and its output that will result in a new list
  IN OTHER WORDS: here we double each element on that list and create a new list with that result
  OTHER WAYS TO DO IT:
  - map: [1..10].map(e -> e\*2) -- pseudo-code
  - take fn + infinite lists: take 10 [2,4..]
    Example Structure with Filter (predicate): [x*2 | x <- [1..10], x*2 >= 10]
    List Comprehension with multiple lists: means that each element will be combined in all possible ways to output a new list

TUPLES:

- can store elements of any different types;
- have a fixed size (you need to know how many elements you'll be storing ahead of time);
- they are surrounded by parentheses and separated by commas;
- the reason why tuples are so rigid about its fixed size is because its size is treated as part of its type;
- zip is a function that produces a list of pairs. It takes two lists, then "zips" them together into one list by joining the
  matching elements into pais.

## Believe the Type

- In Haskell, every expression's type is known at compile time, which leads to safer code (fail fast).
- Haskell has type inference (if it looks like a number, it is a number, no need to declare that type)
- Explicit types are always denoted with the first letter in uppercase;
- Polymorphic Functions: Functions that use type variables
- Type variables can have names that are longer than one character, however we usually use names like a, b, c..

### Type Classes:

- everything is function (==, +, \* and so on);
- Eq classes are type classes that support equality testing;
- Type classes are not the same as classes in OOP languages;
- Ord type classes are classes that compare like (>, <) operator (greater than, lesser than, etc);
- One type class may have many types as instances. For example, tha Char type is an instance of many type classes, two of them
  being Eq and Ord, because we can check if two chars are equal as well as compare them in alphabetical order;
- some types must be an instance of one type class before being an instance of another type class. For example, to be an instance
  of Ord, a type must be first an instance of Eq, because if you can compare two things for ordering, you should be able to tell if
  those things are equal.

## Syntax in Functions

- Pattern Matching: like a map, we create a function that, given an input will return an output, avoiding if/else blocks. If we
  declare the most generic input before the specific ones, the latter won't have a chance to be evaluated.
- Pattern matchings always need to have a catchall pattern at the end so our program doesn't crash;
- We cannot use ++ operator (to join two lists into one) in pattern matchers;
- Patterns are used to check is the values passed to our functions are constructed in a certain way (like a contract);
- We use "Guards" when we want our function to check if some property of those passes values is true or false (like a if
  expression). They are more readable than if expressions and play nicely with patterns;

## Hello Recursion

- Recursion is a way of defining functions in which a function is applied inside its own definition. In other words: the function
  calls itself;
- Quick Sort: point to the first element, then put all the other elements that are less than or equal to the first elem on its left
  side. Then you take the ones that are greater than the first element one and put them on its right side. The chosen element is
  called "pivot". Any element could be the pivot. Now, we recursively sort all the elements that are on the left and right sides
  of the pivot by calling the same function that we used in the first place. That's it.

## High-Order Functions

- Curried Functions is a function that, instead of taking several parameters, always takes exactly one, then when it's called with
  that parameter, it returns a function that takes the next parameter, and so one. For example, the function "max" receives two
  parameters? actually it receives the first one, executes that, and returns another function that receives the second parameter!
- The benefits of that approach (curried functions) is that, with too few parameters, we get back a partially applied function.
