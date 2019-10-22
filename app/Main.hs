module Main where

import Prelude hiding (putStrLn)

import System.Environment (getArgs)
import Data.Text.IO (putStrLn)

import Compiler
import Expr

main :: IO ()
main = do
  n <- read @Int . head <$> getArgs
  putStrLn $ compile (EInt n)
