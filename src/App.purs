module App where

import Prelude
import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP

data Query a      = Query a
data ChildQuery a = ChildQuery a
type ChildSlot    = Void
type Input        = Unit
type Output       = Void
type State        = Unit

app :: forall m. H.Component HH.HTML Query Input Output m
app = H.parentComponent
  { initialState: const unit
  , render
  , eval
  , receiver: const Nothing
  }

  where

  render :: State -> H.ParentHTML Query ChildQuery ChildSlot m
  render state = HH.text "Hello World"

  eval :: Query ~> H.ParentDSL State Query ChildQuery ChildSlot Output m
  eval (Query next) = pure next
