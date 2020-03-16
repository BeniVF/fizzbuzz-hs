module Main where

import FizzBuzz

main :: IO ()
main = interact $ unwords . map show . (createFizzBuzzReport . generateFizzBuzz) . buildRange . map read . words
  where 
    buildRange :: [Int] -> [Int]
    buildRange xs = [head xs .. (head .tail) xs]
