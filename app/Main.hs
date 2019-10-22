{-# LANGUAGE TypeApplications #-}

module Main where

import Compiler
import Data.Text.IO (putStrLn)
import Expr
import System.Environment (getArgs)
import Prelude hiding (putStrLn)

main :: IO ()
main = do
  n <- read @Int . head <$> getArgs
  putStrLn $ compile (EInt n)
