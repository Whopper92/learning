elem'' :: (Eq a) => a -> [a] -> Bool
elem'' y ys = foldl (\acc x -> if x == y then True else acc) False ys

sum'' :: (Num a) => [a] -> a
sum'' xs = foldl (\acc x -> acc + x) 0 xs

largestDiv :: (Integral a) => a
largestDiv = head (filter p [100000,99999..])
  where p x = x `mod` 3892 == 0

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x        = x : filter p xs
    | otherwise  = filter p xs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map f xs

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

sumRec :: (Num a) => [a] -> a
sumRec []     = 0
sumRec (x:xs) = x + sumRec xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted  = quicksort [a | a <- xs, a > x]
    in  smallerSorted ++ [x] ++ biggerSorted

elem' :: (Eq a) => a -> [a] -> Bool
elem'_ [] = False
elem' a (x:xs)
    | a == x    = True
    | otherwise = a `elem'` xs

zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

repeat' :: a -> [a]
repeat' x = x:repeat' x

reverse' :: [a] -> [a]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0   = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise = x:replicate' (n-1) x

maxMax :: (Ord a) => [a] -> a
maxMax [] = error "Empty list!"
maxMax [x] = x
maxMax (x:xs) = max x (maxMax xs)

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "Empty list!"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w,h) <- xs]
  where bmi weight height = (weight / height ^ 2) * 703

initials :: String -> String -> String
initials first last = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = first
        (l:_) = last

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b = a
    | otherwise = b

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "Underweight"
    | bmi <= normal = "Normal"
    | bmi <= fat    = "Fat"
    | otherwise = "Obese"
    where bmi = (weight / height ^ 2) * 703
          skinny = 18.5
          normal = 25.0
          fat    = 30.0

capital :: String -> String
capital "" = "Empty string"
capital all@(x:xs) = "First letter of " ++ all ++ " is " ++ [x]


sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (h:t) = h + sum t

length' :: (Num b) =>  [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

head' :: [a] -> a
head' [] = error "Empty list!"
head' (x:_) = x

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "UNLUCKY!"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

doubleMe x = x + x
-- doubleUs x y = (x*2) + (y*2)

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x * 2

defDerp = "Herp some Derp!"
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x, x /= 13]
-- length' xs = sum [ 1 | _ <- xs]

removeNonUppercase :: String -> String
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
removeOdd xxs = [ [x | x <- xs, even x ] | xs <- xxs ]
