{-
    pg 142
    Exercises: Parametricity

    1. Given the type a -> a, which is the type for id, attempt to make
    a function that terminates successfully but that does something
    other than return the same value. This is impossible, but you
    should try it anyway.
-}

newId :: a -> a
newId a = 