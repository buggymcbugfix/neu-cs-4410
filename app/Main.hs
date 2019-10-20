module Main where

import Prelude hiding (putStrLn)

import System.Environment (getArgs)
import Data.Text.IO (putStrLn)

import Compiler

main :: IO ()
main = do
  n <- read @Int . head <$> getArgs
  putStrLn $ compile n
