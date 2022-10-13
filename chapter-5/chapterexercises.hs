
{-
    Multiple choice

    1. A value of type [a] is:
    c) a list of elements that are all of some type a

    2. A function of type [[a]] -> [a] could:
    a) take a list of strings as an argument

    3. A function of type [a] -> Int -> a:
    b) returns one element of type a from a list

    4. A function of type (a, b) -> a:
    c) takes a tuple argument and returns the first value
    d) requires that a and b have different types
-}

--------------------------------------

{-
    Determine the type

    For the following functions, determine the type of the specified value.
    We suggest you type them into a file, and load the contents of the file
    in GHCi. In all likelihood, it initially will not have the polymorphic
    types you might expect due to the monomorphism restriction. That
    means that top-level declarations by default will have a concrete type
    if any can be determined. You can fix this by setting up your file like
    so:
-}

-- 1.
-- a = (* 9) 6 -- Num a => a
-- b = head [(0,"doge"),(1,"kitteh")] -- Num a => (a, [Char])
-- c = head [(0 :: Integer ,"doge"),(1,"kitteh")] -- Num a => ([Char], a)
-- d = if False then True else False -- Bool
-- e = length [1, 2, 3, 4, 5] -- Integer
-- f = (length [1, 2, 3, 4]) > (length "TACOCAT") -- Bool

-- 2. Given:
{-
     x = 5
     y = x + 5
     w = y * 10
-}
-- What is the type of w?
-- Num a but ghci will infer Integer

-- 3. Given:
{-
     x = 5
     y = x + 5
     z y = y * 10
-}

-- What is the type of z?
-- Num a => a -> a

-- 4. Given:
{-
    x = 5
    y = x + 5
    g = 4 / y
-}
-- What is the type of g?
-- Fractional a but ghci will infer Double

-- 5. Given:
{-
    x = "Julie"
    y = " <3 "
    z = "Haskell"
    f = x ++ y ++ z
-}
-- What is the type of f?
-- The type of f is [Char]

--------------------------------------

{-
    Does it compile?

    For each set of expressions, figure out which expression, if any, causes
    the compiler to squawk at you and why. Fix them if you can:
-}

-- 1. No
{-
    bigNum = (^) 5 $ 10
    wahoo = bigNum $ 10

    bigNum = (^) 5 $ 10
    wahoo = bigNum + 10
-}

-- 2. Yes
{-
    x = print
    y = print "woohoo!"
    z = x "hello world"
-}

-- 3. No
{-
    a = (+)
    b = 5
    c = b 10
    d = a c 200

    a = (+)
    b = 5
    c = b `a` 10
    d = c `a` 200
-}


-- 4. No
{-
    a = 12 + b
    b = 10000 * c
-}

--------------------------------------

{-
    Type variable or specific type constructor?

    You will be shown a type declaration, and you should categorize
    each type. The choices are: a fully polymorphic type variable,
    a constrained polymorphic type variable, or a concrete type
    constructor.
-}

-- 1.
-- f :: zed -> Zed -> Blah
--      [1]    [2]    [3]
-- [1] fully polymorphic
-- [2] [3] concrete type

-- 2.
-- f :: Enum b => a -> b -> C
--               [1]  [2]  [3]
-- [1] fully polymorphic
-- [2] constrained polymorphic
-- [3] concrete type

-- 3.
-- f :: f -> g -> C
--     [1]  [2]  [3]
-- [1] [2] fully polymorphic
-- [3] concrete type

--------------------------------------

{-
    Write a type signature

    For the following expressions, please add a type signature. You should
    be able to rely on GHCi type inference to check your work, although
    you might not have precisely the same answer as GHCi gives (due to
    polymorphism, etc).
-}

-- 1.
-- functionH :: [a] -> a

-- 2.
-- functionC :: Ord a => a -> a -> Bool

-- 3.
-- functionS :: (a, b) -> b

--------------------------------------

{-
    Given a type, write the function

    You will be shown a type and a function that needs to be written. Use
    the information the type provides to determine what the function
    should do. We’ll also tell you how many ways there are to write the
    function. Syntactically different but semantically equivalent implementations are not counted as being different. For example, writing
    a function one way and then rewriting the semantically identical
    function but using anonymous lambda syntax does not count as two
    implementations.
-}

-- 1.
-- i :: a -> a
-- i a = a

-- 2.
-- c :: a -> b -> a
-- c a b = a

-- 3. I am not really sure if this is equivalent or not
-- c'' :: b -> a -> b
-- c'' a b = b

-- 4. 
-- c' :: a -> b -> b
-- c' a b = b 

-- 5.
-- r :: [a] -> [a]
-- r a = reverse a

-- 6.
-- co :: (b -> c) -> (a -> b) -> a -> c
-- co x y z = x (y z)

-- 7.
-- a :: (a -> c) -> a -> a
-- a x y = y

-- 7.
-- a' :: (a -> b) -> a -> b
-- a' x y = x y 

--------------------------------------

{-
    Type-Kwon-Do

    The name is courtesy of Phillip Wright. Thank you for the idea!
    The focus here is on manipulating terms in order to get the types
    to fit. This sort of exercise is something you’ll encounter in writing
    real Haskell code, so practicing will make it easier to deal with when
    you get there. Training in the subtle art of type-kwon-do will make
    you better at writing ordinary code, as well.
    We provide the types and bottomed out (declared as undefined)
    terms. Bottom and undefined will be explained in more detail later.
    The contents of the terms are irrelevant here. You’ll use only the
    declarations provided and what the Prelude provides by default unless
    otherwise specified. Your goal is to make the ???’d declaration pass
    the type checker by modifying it and it alone.
-}

-- 1.
-- f :: Int -> String
-- f = undefined
-- g :: String -> Char
-- g = undefined
-- h :: Int -> Char

-- h a = g (f a) 

-- 2.
-- data A
-- data B
-- data C
-- q :: A -> B
-- q = undefined
-- w :: B -> C
-- w = undefined
-- e :: A -> C

-- e a = w (q a)

-- 3.
-- data X
-- data Y
-- data Z
-- xz :: X -> Z
-- xz = undefined
-- yz :: Y -> Z
-- yz = undefined
-- xform :: (X, Y) -> (Z, Z)

-- xform (x, y) = (xz x, yz y) 

-- 4.
munge :: (x -> y)
    -> (y -> (w, z)) 
    -> x
    -> w
munge a b c = fst (b (a c))