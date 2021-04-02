-- function declaration
doubleMe x = x + x
-- usage: doubleMe 10 => 20

-- another function declaration
doubleUs x y = doubleMe x + doubleMe y
-- usage: doubleMe 2 2 => 8

-- another function declaration using if/else expression
doubleSmallNumber x = if x > 100 then x else x*2

-- list concatenation
numbers = [1,2,3] ++ [4,5,6] -- [1,2,3,4,5,6]
fullName = "Jack" ++ " " ++ "Sparrow" -- "Jack Sparrow"

-- getting an element from a list by index
number = numbers !! 5 -- 5
letter = fullName !! 5 -- 'S'

headInList = head [0,1,2] -- 0
tailInList = tail [0,1,2] -- [1,2]
lastInList = last [0,1,2] -- [2]
exceptLastElelemt = init [0,1,2] -- [0,1]

listSize = length [0,1,2] -- 3
isEmpty = null [] -- True
isEmpty2 = null [1] -- False
reversed = reverse [1,2,3] -- [3,2,1]

takesFirst3Elements = take 3 [1,2,3,4,5] -- [1,2,3]
takesFirst100Elements = take 100 [1,2,3,4,5] -- [1,2,3,4,5]
takesNoElements = take 0 [1,2,3,4,5] -- []
dropsFirst3Elements = drop 3 [1,2,3,4,5] -- [4,5]
dropsFirst100Elements = drop 100 [1,2,3,4,5] -- []
dropsNoElements = drop 0 [1,2,3,4,5] -- [1,2,3,4,5]

biggest = maximum [1,5,2,3] -- 5
smallest = minimum [5,2,1,3] -- 1
summatory = sum [1,2,3] -- 6

multiplication = product [2,4] -- 8
multiplication2 = product [2,0, 4] -- 0
isElementInList = 2 `elem` [1,2,3] -- True

range = [1..10] -- [1,2,3,4,5,6,7,8,9,10]
range2 = [10..0] -- [] => because for decreasing numbers we need to specify a step so haskell knows what you want
range3 = ['a'..'z'] -- "abcdefghijklmnopqrstuvwxyz"

rangeWithSteps1 = [2,4..20] -- [2,4,6,8,10,12,14,16,18,20]
rangeWithSteps2 = [3,6..20] -- [3,6,9,12,15,18]
rangeWithSteps3 = [10,9..0] -- [10,9,8,7,6,5,4,3,2,1] => now it works when specifying a step (10,9)

rangeWithSteps4 = [10,20..5*10] -- [10,20,30,40,50] => Five multiples of 10
rangeWithSteps5 = take 5 [10,20..] -- [10,20,30,40,50] => Five multiples of 10 using infinite list

cycles1 = take 10 (cycle [1,2,3]) -- [1,2,3,1,2,3,1,2,3,1] -- repeat it until the taken number of times
cycles2 = take 10 (cycle "haha ") -- "haha haha " -- repeat it until the taken number of times

repeats1 = take 10 (repeat 1) -- [1,1,1,1,1,1,1,1,1,1]
repeats2 = take 10 (repeat 'k') -- "kkkkkkkkkk"
-- equal to
repeats3 = replicate 10 1
repeats4 = replicate 10 'k'

-- list comprehensions:
listComprehension = [x*2 | x <- [1..10]] -- [2,4,6,8,10,12,14,16,18,20]
-- it is equivalent to: take 10 [2,4..]

listComprehensionWithFilter = [x*2 | x <- [1..10], x*2 >= 10] -- [10,12,14,16,18,20]
-- another example: takes odd numbers from a range and outputs one thing or another based on a rule
-- boomBangs = [if x < 10 then "BOOM!" else "BANG" | x <- xs, odd x]
-- boomBangs [7..13] -- ["BOOM!","BOOM!","BANG!","BANG!"]
-- with many predicates:
listComprehensionWithNFilters = [x | x <- [10..20], x /= 13, x /= 15, x /= 19]
-- output: [10,11,12,14,16,17,18,20]
-- with many lists:
listComprehensionWithManyLists = [x+y | x <- [1,2,3], y <- [10,100,1000]]
-- output: [11,101,1001,12,102,1002,13,103,1003]
-- all mixed up:
listComprehensionAllInOne = [x+y | x <- [1,2,3], y <- [10,100,1000], x+y > 100]
-- output: [101,1001,102,1002,103,1003]
-- one more example:
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
-- removeNonUppercase "Hahaha! Ahahaha!" -- "HA"

-- TUPLES
aTuple1 = (1,2) -- (1,2)
aTuple2 = (1,2, "str") -- (1,2,"str")

-- print (1,2) == (1,2) -- True
-- print (1,2) == (1,2,3) -- Type Error
-- print fst ("first",7) -- "first"
-- print snd ("first",7) -- 7
-- print fst (1,2,3) -- Error (fst and snd only operate on pairs, not triples or so)

-- zip (not working when importing to ghci)
-- print(zip [1,2,3,4,5] [5,4,3,2,1]) -- [(1,5),(2,4),(3,3),(4,2),(5,1)]
-- print(zip [1..5] ["one", "two", "three", "four", "five"]) -- [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]

-- when the lenghts of the lists don't match, the exceeding elements are ignored:
-- print(zip [1,2,3,4,5] ["one","two","three"]) -- [(1,"one"),(2,"two"),(3,"three")]
-- print(zip [1,2,3] ["one","two","three","four","five"]) -- [(1,"one"),(2,"two"),(3,"three")]

-- because of the lazy evaluation, we can zip infinite lists:
-- print( zip [1..] ["apple","banana","cherry","mango"] ) -- [(1,"apple", 2,"banana"),(3,"cherry"),(4,"mango")]

-- TYPES
-- ghci> :t 'a' -- 'a' :: Char
-- ghci> :t True -- True :: Bool
-- ghci> :t "hello" -- "hello" :: [Char]
-- the :: operator is read as "has type of"
removeNonUppercase2 :: [Char] -> [Char] -- function declaration with explicit type
removeNonUppercase2 st = [c | c <- st, c `elem` ['A'..'Z']]

-- ghci> :t (==) -- (==) :: (Eq a) => a -> a -> Bool
-- everything before => above, is a "class constant"

name :: [Char]
name = "Whatever"

boomBangs :: [Int] -> [String]
boomBangs xs = [if x < 10 then "BOOM!" else "BANG" | x <- xs, odd x]
-- boomBangs [7..13] -- ["BOOM!","BOOM!","BANG!","BANG!"]

-- factorial :: Integer -> Integer
-- factorial n = product [1..n]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

anything :: a -> [a]
anything a = [a]

-- pattern matching
lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN"
lucky x = "SORRY BRO" -- this generic input must be at the end, so the specific ones have a chance to be evaluated
-- execution: lucky 10 / lucky 9 / lucky 7, etc

-- pattern matching to define a default output (1) when having a specific input (0)
-- otherwise, we call the recursive factorial function
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
-- taking two vectors in 2d space (as pairs) and adds them together (without pattern matching)
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
-- addVectors a b = (fst a + fst b, snd a + snd b)
-- taking two vectors in 2d space (as pairs) and adds them together (with pattern matching)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
-- making our own version of "triples" to get the third element (natively, we can only get the first and the second)
first :: (a,b,c) -> a
first (x,_,_) = x
second :: (a,b,c) -> b
second (_,y,_) = y
third :: (a,b,c) -> c
third (_,_,z) = z
-- "reimplementing" head function with a custom error message for empty lists
head' :: [a] -> a
head' [] = error "can't call head on an empty list, dummy!"
head' (x:_) = x
-- more examples just for fun
tell :: (Show a) => [a] -> String
tell [] = "the list is empty"
tell (x:[]) = "the list has one element: " ++ show x
tell (x:y:[]) = "the list has two elements: " ++ show x ++ " and " ++ show y
-- tell (x:y:_) = "the list is long, the first two elements are: " ++ show x ++ " and " ++ show y
tell (x:_:z) = "the list is long, the first element is " ++ show x ++ " and the last one is " ++ show(last z)

-- As-patterns
firstLetter :: String -> String
firstLetter "" = "Empty string!" -- pattern matching
firstLetter all@(x:xs) = "the first letter of " ++ all ++ " is " ++ [x]

-- Guards (like a switch case)
bmiTell :: Double -> Double -> String
bmiTell weight height
  | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
  | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
  | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
-- more guards
max' :: (Ord a) => a -> a -> a
max' a b
  | a <= b    = b
  | otherwise = a
-- our own compare function using guards (3 `myCompare` 2 => GT):
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a == b    = EQ
  | a <= b    = LT
  | otherwise = GT

-- where function to provide aliases to calculations, to avoid recalculate things over and over
-- also to improve readability
bmiTell' :: Double -> Double -> String
bmiTell' weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0
        -- there where variables MUST be aligned at the same column so haskell don't get confused

-- where in constants
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname

-- functions in where blocks
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
  where bmi weight height = weight / height ^ 2

-- fibonacci :: Double -> [Double]
fibonacci :: Int -> Int
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = error "numer not found"
-- fibonacci n = fibonacci (n-1) + fibonacci (n-2)

-- RECURSION

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empy list!"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
-- maximum' [2,5,1] = max 2 (maximum' [5,1] = max 5 (maximum' [1] = 1))

shit :: [a] -> a
shit [] = error "empty"
shit (x:xs) = head xs

replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate' (n-1) x

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x:repeat' x

zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys


value :: String
value = "teste"
