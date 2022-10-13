{--
  Multiple choice
  1. The Eq class
  a) includes all types in Haskell.
  b) is the same as the Ord class.
  c) makes equality tests possible. <---
  d) only includes numeric types.

  2. The type class Ord
  a) allows any two values to be compared. <---
  b) is a subclass of Eq. <---
  c) is a superclass of Eq.
  d) has no instance for Bool.

  3. Suppose the type class Ord has an operator >. What is the type
  of >?
  a) Ord a => a -> a -> Bool <---
  b) Ord a => Int -> Bool
  c) Ord a => a -> Char
  d) Ord a => Char -> [Char]

  4. In x = divMod 16 12
  a) the type of x is Integer.
  b) the value of x is undecidable.
  c) the type of x is a tuple. <---
  d) x is equal to 12 / 16.

  5. The type class Integral includes
  a) Int and Integer numbers. <---
  b) integral, real, and fractional numbers.
  c) Schrodinger’s cat.
  d) only positive numbers.
-}

{--

  Does it type check?
  For this section of exercises, you’ll be practicing looking for type and
  type class errors.
  For example, printIt will not work, because functions like x have
  no instance of Show, the type class that lets you convert things to String
  (usually for printing):
    x :: Int -> Int
    x blah = blah + 20
    printIt :: IO ()
    printIt = putStrLn (show x)

-}

-- 1. This should not type check because Person doesn't implement show
-- 2. No because Mood doesn't implement Eq
-- 3. a) Any Mood value would be acceptable (Blah or Woot)
--    b) This will error out since 9 is not a Mood and we cannot use the Eq comparison with Woot
--    c) This will error out since Mood does not derive/implement Ord so we cannot make this comparison
-- 4. Yes this will type check but s1 will not be able to be printed until the Object part of the sentence is applied

{--
  Given a datatype declaration, what can we do?
  Given the following datatype definitions:



  Which of the following will type check? For the ones that don’t
  type check, why don’t they?
-}

data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)

-- 1. phew = Papu (Rocks "chases") (Yeah True)
-- This will not type check because for the second and third arguments of the Papu constructor
-- need to call their respective constructors: (Rocks "chases") (Yeah True)

-- 2. phew = Papu (Rocks "chomskydoz") (Yeah True)
-- This will work!

-- 3. equalityForall :: Papu -> Papu -> Bool
--    equalityForall p p' = p == p'
-- This will also work!

-- 4. comparePapus :: Papu -> Papu -> Bool
--    comparePapus p p' = p > p'
-- This will not work because Papu does not derive Ord or have instances of the comparison operator functions

{--

  Match the types
  We’re going to give you two types and their implementations. Then
  we’re going to ask you if you can substitute the second type for the
  first. You can test this by typing the first declaration and its type
  into a file and editing in the new one, loading to see if it fails. Don’t
  guess—test all your answers!

-}

-- 1. i :: Num a => a vs i :: a
-- This would not work if i = 1 because Num is the most polymorphic this value could be.

-- 2. f :: Float vs f :: Num a => a
-- This would not work if f = 1.0 because f must be at least a Fractional

-- 3. f :: Float vs f :: Fractional a => a
-- This would work if f = 1.0 because f's most polymorphic type is Fractional

-- 4. f :: Float vs f :: RealFrac a => a
-- This would work if f = 1.0 because any RealFrac value is constrained by Fractional

-- 5. freud :: a -> a vs freud :: Ord a => a -> a
-- This would work if freud x = x because we are just making the type more specific

-- 6. freud :: a -> a vs freud :: Int -> Int
-- This would work if freud x = x because we are just making the type more specific

-- 7. sigmund :: Int -> Int vs sigmund :: a -> a
-- This would not work because we are trying to make our type more generic than possible since we constrained myX to Int

-- 8. sigmund :: Int -> Int vs sigmund :: Num a => a -> a
-- This would not work because we are trying to make our type more generic than possible since we constrained myX to Int

-- 9. jung :: Ord a => [a] -> a vs jung :: [Int] -> Int
-- This would work because we are just getting more specific with out type and Int has an instance of Ord

-- 10. young :: [Char] -> Char vs young :: Ord a => [a] -> a
-- Sort requires a type with an Ord instance and head requires a list so this would work

-- 11. signifier :: [Char] -> Char vs signifier :: Ord a => [a] -> a
-- This will not work since mySort requires a Char list and we cannot get more generic than this

{-
  Type-Kwon-Do Two: Electric typealoo
  Round two! Same rules apply—you’re trying to fill in terms (code)
  which will fit the types. The idea with these exercises is that you’ll derive the implementations from the type information. You’ll probably
  need to use stuff from Prelude:
-}

-- 1.
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk myFunc a b = b == (myFunc a)

-- 2.
arith :: Num b
  => (a -> b)
  -> Integer
  -> a
  -> b
arith myFunc myInt myA = (myFunc myA) + (fromInteger myInt)