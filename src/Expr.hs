module Expr where

import MyPrelude

data Expr a where
  EInt :: Int -> Expr Int
  EAdd1 :: Expr Int -> Expr Int
  ESub1 :: Expr Int -> Expr Int

instance Pretty (Expr a) where
  pretty = \case
      EInt i -> pretty i
      EAdd1 e -> sex ["++", pretty e]
      ESub1 e -> sex ["--", pretty e]
    where
      sex = parens . hsep
