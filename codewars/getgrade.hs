module GradeBook (getGrade) where

getGrade :: Double -> Double -> Double -> Char
getGrade x y z = do
    let numberGrade = (x + y + z) / 3
    if numberGrade >= 90 then 'A'
    else if numberGrade >= 80 then 'B'
    else if numberGrade >= 70 then 'C'
    else if numberGrade >= 60 then 'D'
    else 'F'