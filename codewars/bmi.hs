{-
Write function bmi that calculates body mass index (bmi = weight / height2).

if bmi <= 18.5 return "Underweight"

if bmi <= 25.0 return "Normal"

if bmi <= 30.0 return "Overweight"

if bmi > 30 return "Obese"
-}

module BodyMassIndex where

bmiUnderWeight = 18.5    
bmiNormalWeight = 25.0    
bmiOverWeight = 30  

bmi :: Float -> Float -> String  
bmi weight height = do
    let calcBmi = weight / (height ** 2)
    if calcBmi <= bmiUnderWeight then "Underweight"
    else if calcBmi <= bmiNormalWeight then "Normal"
    else if calcBmi <= bmiOverWeight then "Overweight"
    else "Obese"
