module Main where

import FizzBuzz

main :: IO ()
main = print $ (createFizzBuzzReport .generateFizzBuzz ) [0 .. 20]

