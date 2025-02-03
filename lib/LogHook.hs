module LogHook
    ( myLogHook
    , withStatusBars
    ) where

import Defaults
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

myLogHook :: X ()
myLogHook = return ()

withStatusBars :: (LayoutClass l Window) => XConfig l -> XConfig l
withStatusBars = dynamicSBs barSpawner

barSpawner :: ScreenId -> IO StatusBarConfig
barSpawner = pure . xmobar
  where
    pp :: PP
    pp =
      def
        { ppCurrent = xmobarColor "yellow" "" . wrap "[" "]"
        , ppVisible = xmobarColor "white" "" . wrap "[" "]"
        , ppUrgent = xmobarColor "red" "" . wrap "[" "]"
        , ppOrder = \(ws:_:t:_) -> [ws, t]
        }
    xmobar :: ScreenId -> StatusBarConfig
    xmobar (S screenId) = statusBarProp ("xmobar -x" <> show screenId) $ pure pp
