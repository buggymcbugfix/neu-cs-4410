module Compiler
  ( compile,
  )
where

import Expr
import MyPrelude

data Register
  = RAX

instance Pretty Register where
  pretty = \case
    RAX -> "rax"

data Arg
  = Imm Int
  | Reg Register

instance Pretty Arg where
  pretty = \case
    Imm n -> pretty n
    Reg r -> pretty r

data Instruction
  = Mov Register Arg

instance Pretty Instruction where
  pretty = \case
    Mov r a -> "mov" <+> pretty r <> "," <+> pretty a

compile :: Expr Int -> Text
compile n =
  renderStrict . layoutPretty opts . vsep $
    [ "section .text",
      "global our_code_starts_here",
      "our_code_starts_here:",
      pp n,
      "\tret"
    ]
  where
    pp = vsep . map (("\t" <>) . pretty) . compileExpr
    opts = LayoutOptions {layoutPageWidth = Unbounded}

compileExpr :: Expr Int -> List Instruction
compileExpr (EInt n) = [Mov RAX (Imm n)]
