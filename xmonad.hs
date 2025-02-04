import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Fullscreen

import Defaults
import EventHook
import KeyBindings
import Layout
import LogHook

main :: IO ()
main = xmonad . withStatusBars . fullscreenSupport . docks . ewmh $ defaults
  where
    defaults =
      def
        { modMask            = myModMask
        , keys               = myKeys
        , workspaces         = myWorkspaces
        , focusFollowsMouse  = myFocusFollowsMouse
        , clickJustFocuses   = myClickJustFocuses
        , logHook            = myLogHook
        , handleEventHook    = myEventHook
        , terminal           = myTerminal
        , layoutHook         = myLayoutHook
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        }
