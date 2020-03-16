module FizzBuzzSpec (main, spec) where

import Test.Hspec

import FizzBuzz

-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "FizzBuzz should generate" $ do
    it "empty range when an empty range is provided" $
      generateFizzBuzz [] `shouldBe` []
    it "the associated word when a range from 1 to 2 is provided" $
      generateFizzBuzz [1 .. 1] `shouldBe` ["1"]
    it "fizz when 3 is provided" $
      generateFizzBuzz [3 .. 3] `shouldBe` ["fizz"]
    it "fizz when 6 is provided" $
      generateFizzBuzz [6 .. 6] `shouldBe` ["fizz"]
    it "fizz when 5 is provided" $
      generateFizzBuzz [5 .. 5] `shouldBe` ["buzz"]
    it "fizz when 6 is provided" $
      generateFizzBuzz [10 .. 10] `shouldBe` ["buzz"]
    it "fizz when 15 is provided" $
      generateFizzBuzz [15 .. 15] `shouldBe` ["fizzbuzz"]
    it "fizz when 30 is provided" $
      generateFizzBuzz [45 .. 45] `shouldBe` ["fizzbuzz"]
    it "fizzbuzz when a range 1 to 20 is provided" $
      generateFizzBuzz [1 .. 20] `shouldBe` ["1", "2", "fizz", "4", "buzz", "fizz", "7", "8", "fizz", "buzz", "11", "fizz", "13", "14", "fizzbuzz", "16", "17", "fizz", "19", "buzz"]
  describe "report FizzBuzz when" $ do
    it "empty report when an empty" $
      createFizzBuzzReport [] `shouldBe` []
    it "fizz is provided" $
      createFizzBuzzReport ["fizz"] `shouldBe` [("fizz", 1)]
    it "buzz is provided" $
      createFizzBuzzReport ["buzz"] `shouldBe` [("buzz", 1)]
    it "1 is provided" $
      createFizzBuzzReport ["1"] `shouldBe` [("others", 1)]
    it "1 is provided" $
      createFizzBuzzReport ["1", "2"] `shouldBe` [("others", 2)]
    it "[[fizz, buzz, 11, fizz, 13, 14, fizzbuzz] is provided" $
      createFizzBuzzReport ["fizz", "buzz", "11", "fizz", "13", "14", "fizzbuzz"] `shouldBe` [("others", 3), ("buzz", 1), ("fizz", 2), ("fizzbuzz", 1)]
