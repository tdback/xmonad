module EventHook where

import XMonad
import XMonad.Hooks.FloatConfigureReq (fixSteamFlicker)
import XMonad.Hooks.ManageHelpers

import Data.Monoid

myEventHook :: Event -> X All
myEventHook = mempty <> fixSteamFlicker
