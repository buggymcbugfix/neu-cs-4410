module Compiler
    ( compile
    ) where

import Data.Text (Text)
import qualified Data.Text as Text

compile :: Int -> Text
compile n = Text.unlines
  [ "section .text"
  , "global our_code_starts_here"
  , "our_code_starts_here:"
  , "  mov eax, " <> txt n
  , "  ret"
  , ""
  ]

txt :: Show a => a -> Text
txt = Text.pack . show
