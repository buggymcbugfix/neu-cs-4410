module MyPrelude (module MyPrelude) where

import Data.Text as MyPrelude (Text)
import Data.Text.Prettyprint.Doc as MyPrelude
import Data.Text.Prettyprint.Doc.Render.Text as MyPrelude (renderStrict)

-- ( (<+>),
--   LayoutOptions (LayoutOptions),
--   Pretty (pretty),
--   PageWidth (Unbounded),
--   layoutPageWidth,
--   layoutPretty,
--   vsep,
--   hsep, parens,
-- )

type List = []
