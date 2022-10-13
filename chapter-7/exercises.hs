{--
  Exercises: Grab bag
  Note that the following exercises are from source code files, not
  written for use directly in the REPL. Of course, you can change them
  to test directly in the REPL, if you prefer.
-}

-- 1. Which (two or more) of the following are equivalent?
-- mTh x y z = x * y * z
-- mTh x y = \z -> x * y * z
-- mTh x = \y -> \z -> x * y * z
-- mTh = \x -> \y -> \z -> x * y * z
-- They are all equivalent!

-- 2. The type of mTh (above) is Num a => a -> a -> a -> a.
-- Which is the type of mTh 3?
-- a) Integer -> Integer -> Integer
-- b) Num a => a -> a -> a -> a
-- c) Num a => a -> a
-- d) Num a => a -> a -> a <----- mTh 3 would be this type

-- 3. Next, we’ll practice writing anonymous lambda syntax.

-- addOneIfOdd n = case odd n of
--   True -> f n
--   False -> n
--   where f n = n + 1
addOneIfOdd n = case odd n of
  True -> (\x -> x + 1) n
  False -> n

-- addFive x y = (if x > y then y else x) + 5
addFive = \x -> \y -> (if x > y then y else x) + 5

-- mflip f = \x -> \y -> f y x
mflip f x y = f y x

{-
  Exercises: Variety pack
  1. Given the following declarations:
-}

k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)

-- a) What is the type of k?
-- k :: (a, b) -> a

-- b) What is the type of k2? Is it the same type as k1 or k3?
-- k2 :: String, no it is not the same since the first element in the k1/k3 tuples will be Num

-- c) Of k1, k2, k3, which will return the number 3 as the result?
-- k1 and k2 will both return 3

-- 2. Fill in the definition of the following function:
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))

{--
    Exercises: Artful dodgy
    Given the following definitions, tell us what value results from further
    applications. When you’ve written down at least some of the answers
    and think you know what’s what, type the definitions into a file, and
    load them in GHCi to test your answers:
-}

dodgy x y = x + y * 10
oneIsOne = dodgy 1
oneIsTwo = (flip dodgy) 2

-- 2. dodgy 1 1
--    = 1 + 1 * 10
--    = 1 + 10
--    = 11

-- 3. dodgy 2 2
--    = 2 + 2 * 10
--    = 2 + 20
--    = 22

-- 4. dodgy 1 2
--    = 1 + 2 * 10
--    = 1 + 20
--    = 21

-- 5. dodgy 2 1
--    = 2 + 1 * 10
--    = 2 + 10
--    = 12

-- 6. oneIsOne 1
--    = dodgy 1 1
--    = 1 + 1 * 10
--    = 1 + 10
--    = 11

-- 7. oneIsOne 2
--    = dodgy 2 1
--    = 2 + 1 * 10
--    = 2 + 10
--    = 12

-- 8. oneIsTwo 1
--    = dodgy 1 2
--    = 1 + 2 * 10
--    = 1 + 20
--    = 21

-- 9. oneIsTwo 2
--    = dodgy 2 2
--    = 2 + 2 * 10
--    = 2 + 20
--    = 22

-- 10. oneIsOne 3
--    = dodgy 1 3
--    = 1 + 3 * 10
--    = 1 + 30
--    = 31

-- 11. oneIsTwo 3
--    = dodgy 3 2
--    = 3 + 2 * 10
--    = 3 + 20
--    = 23

{--
    Exercises: Guard duty

    1. It is probably clear to you why you wouldn’t put an otherwise in
    your top-most guard, but try it with avgGrade anyway, and see
    what happens. It’ll be clearer if you rewrite it as an otherwise
    match: | otherwise = 'F'. What happens now if you pass 90 as
    an argument? 75? 60?
    -- If we put the otherwise at the top of the guard, it will always match to that condition
       and in this case any avgGrade will always be an 'F'

    2. What happens if you take avgGrade as it is written and reorder
    the guards? Does it still type check and work the same way? Try
    moving | y >= 0.7 = 'C' and passing it the argument 90, which
    should be an 'A'. Does it return 'A'?
    -- The guard will return the first condition it evaluates to true, so if y >= 0.7 = 'C' is higher than y >= 0.9 = 'A'
       it will always return 'C' instead of 'A' if the value is greater than 70 
-}

-- 3. What does the following function return?
pal xs
    | xs == reverse xs = True
    | otherwise = False
-- b) True when xs is a palindrome.

-- 4. What types of arguments can pal take?
-- pal can take one argument that is a list of one type

-- 5. What is the type of the function pal?
-- pal :: Eq a => [a] -> Bool

-- 6. What does the following function return?
numbers x
    | x < 0 = -1
    | x == 0 = 0
    | x > 0 = 1
-- c) An indication of whether its argument is a positive or negative number or 0.

-- 7. What types of arguments can numbers take?
-- numbers can take one Num argument that has an instance of Ord

-- 8. What is the type of the function numbers?
-- numbers :: (Num a, Num b) => a -> b

-- Here is another example of a short point-free function and its
-- result. It involves a new use of filter that uses the Bool operator, ==.
-- Look at it carefully and, on paper or in your head, walk through the
-- evaluation process involved:
-- f = length . filter (== 'a')

-- f "abracadabra"
-- = (length . filter (== 'a')) "abracadabra"
-- = length (filter (== 'a') "abracadabra")
-- = length ("aaaaa")
-- = 5

-- 7.11 Chapter exercises
-- 1. A polymorphic function:
-- d) May resolve to values of different types, depending on inputs.

-- 2. Two functions named f and g have types Char -> String and
--    String -> [String], respectively. The composed function g . f
--    has the type:
-- b) Char -> String -> [String]

-- 3. A function f has the type Ord a => a -> a -> Bool, and we apply
--    it to one numeric value. What is the type now?
-- d) (Ord a, Num a) => a -> Bool

-- 4. A function with the type (a -> b) -> c:
-- b) Is a higher-order function

-- 5. Given the following definition of f, what is the type of f True?
-- a) f True :: Bool

tensDigit :: Integral a => a -> a
tensDigit x = snd (fst (x `divMod` 10) `divMod` 10)
-- This will have the same type as the original

hunsD :: Integral a => a -> a
hunsD x = snd (fst (x `divMod` 100) `divMod` 10)

foldBool :: a -> a -> Bool -> a
foldBool x y z = case z of
                 True -> y
                 False -> x

foldBoolG :: a -> a -> Bool -> a
foldBoolG x y z
    | z == True = y
    | z == False = x

g :: (a -> b) -> (a, c) -> (b, c)
-- g myFunc tup = (b, c)
--     where b = myFunc (fst tup)
--           c = snd tup
g myFunc (a, c) = (myFunc a, c)

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

roundTripPF :: (Show a, Read a) => a -> a
roundTripPF = read . show

roundTripConcrete :: (Show a, Read b) => a -> b
roundTripConcrete = read . show
-- print ((roundTripConcrete 4) :: Int)