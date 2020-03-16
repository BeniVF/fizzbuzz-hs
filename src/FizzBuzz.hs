module FizzBuzz (generateFizzBuzz, createFizzBuzzReport)  where

import Data.Maybe
import Data.Foldable
import Data.List
import Data.Char

generateFizzBuzz :: [Int] -> [String]
generateFizzBuzz = fmap fizzBuzzRules

createFizzBuzzReport :: [String] -> [(String, Int)]
createFizzBuzzReport xs = othersTotal <> wordsTotal
  where 
    (others, words) = partition (all isDigit) xs
    othersTotal = [("others", length others) | not (null others)]
    wordsTotal = (\xs -> (head xs, length xs)) <$> (group . sort) words

fizzBuzzRules :: Int -> String
fizzBuzzRules x = fromMaybe (show x) (fold rules x)
  where 
    rules = [fizz, buzz]

fizz :: Int -> Maybe String
fizz x = toMaybe (x `mod` 3 ==0) "fizz" 

buzz :: Int -> Maybe String
buzz x = toMaybe (x `mod` 5 ==0) "buzz"

toMaybe :: Bool -> b -> Maybe b
toMaybe b x | b = Just x
            | otherwise = Nothing

