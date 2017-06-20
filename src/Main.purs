module Main where

import Prelude
import Control.Monad.Error.Class (throwError)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (error)
import Data.Maybe (Maybe(..))
import DOM (DOM)
import DOM.Node.ParentNode (QuerySelector(..))
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)

import App as App

main :: Boolean -> Eff (HA.HalogenEffects (dom :: DOM)) Unit
main wait = HA.runHalogenAff do
  when wait HA.awaitLoad
  mAppDiv <- HA.selectElement (QuerySelector "#app")
  case mAppDiv of
    Nothing -> throwError <<< error $ "Unable to find app element"
    Just e  -> runUI App.app unit e
