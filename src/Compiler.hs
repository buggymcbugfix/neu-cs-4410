module Compiler
  ( compile
  ) where

import MyPrelude

import Data.Text (Text)
-- import qualified Data.Text as Text
import Data.Text.Prettyprint.Doc
  ( (<+>),
    LayoutOptions (LayoutOptions),
    Pretty (pretty, prettyList),
    PageWidth (Unbounded),
    layoutPageWidth,
    layoutPretty,
    indent,
    vsep,
  )
import Data.Text.Prettyprint.Doc.Render.Text (renderStrict)

type Expr = Int

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

  prettyList = vsep . map pretty

compile :: Expr -> Text
compile n = renderStrict . layoutPretty opts . vsep $
    [ "section .text"
    , "global our_code_starts_here"
    , "our_code_starts_here:"
    , pp n
    , "  ret"
    ]
  where
    pp = indent 2 . prettyList . compileExpr
    opts = LayoutOptions{ layoutPageWidth = Unbounded }

compileExpr :: Expr -> List Instruction
compileExpr n = [Mov RAX (Imm n)]
