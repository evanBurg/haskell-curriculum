module Moodswing where

data Mood = Blah | Woot deriving Show
{-
    Mood Swing Exercise
    
    data Mood = Blah | Woot deriving Show

    1. Mood
    2. an instance of the Blah or Woot types
    3. changeMood should return a Mood type not a Woot type
-}

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    _ = Blah

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

{-
    Chapter Exercises

    1. it takes one argument of type list
    2.  a) 5
        b) 3
        c) 2
        d) 5
    3. second expression errors because / operator is for floating point division, use the `div` function instead
    4. 6 `div` length [1, 2, 3]
    5. Equality comparison, Bool result
    6.  a) Num, 5 
        b) Bool, False
    7.  a) Works, False
        b) Wont work because init list with multiple types
        c) Works, 5
        d) Works, false,
        e) Wont work because you cant use the && operator with a literal, 9 should be a Bool value instead
-}

-- 8.
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

-- 9.
myAbs :: Integer -> Integer
myAbs x = if x >= 0 then x else x * (-1)

-- 10.
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a, b) (c, d) = ((b, d), (a, c))

-- Syntax Exercises
-- 1.
x = (+)
newF xs = x w 1
    where w = length xs

-- 2. (maybe?)
identity j = j

-- 3. 
f2 (a, b) = a

{-
    Matching Exercises

    1. c)
    2. b)
    3. a)
    4. d)
-}