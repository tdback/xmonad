{-# LANGUAGE ScopedTypeVariables #-}

module Defaults where

import XMonad

myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "firefox"

myModMask :: KeyMask
myModMask = mod4Mask

altMask :: KeyMask
altMask = mod1Mask

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myWorkspaces :: [String]
myWorkspaces = map show ([1 .. 9] :: [Integer])

myBorderWidth :: Dimension
myBorderWidth = 2

myNormalBorderColor :: String
myNormalBorderColor = "#16191F"

myFocusedBorderColor :: String
myFocusedBorderColor = "#485264"
