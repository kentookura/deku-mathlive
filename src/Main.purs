module Main
  ( MathLive_(..)
  , main
  ) where

import Prelude

import Effect (Effect)
import Deku.Attribute (class Attr, AttributeValue(..), unsafeAttribute, (!:=))
import Deku.DOM (unsafeCustomElement)
import Deku.DOM as D
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))
import Web.DOM (Element)

main :: Effect Unit
main = runInBody
  (D.div [] [ try2 ] :: Nut)

foreign import renderMathInElement_ :: Element -> Effect Unit

try1 :: Nut
try1 = D.div
  [ D.Self !:= \e -> do
      renderMathInElement_ e
  ]
  [ text_ "a = b" ]

data MathLive_

instance Attr MathLive_ D.Value String where
  attr _ s = unsafeAttribute
    { key: "value", value: Prop' s }

try2 :: Nut
try2 = unsafeCustomElement "math-field" (Proxy :: _ MathLive_)
  [ D.Value !:= "\\frac{1}{2}"
  ]
  []