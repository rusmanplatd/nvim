module Main where

-- | Main entry point
main :: IO ()
main = do
  putStrLn "Hello from Haskell!"
  
-- | A simple factorial function
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- | Fibonacci sequence
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)
