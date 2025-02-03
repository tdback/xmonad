module Layout (myLayoutHook) where

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.Reflect
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns

myLayoutHook =
  gaps [(L, 0), (R, 0), (U, 0), (D, 0)] $
    spacingRaw True (Border 0 0 0 0) True (Border 0 0 0 0) True $
      smartBorders myLayout
  where
    myLayout =
      smartBorders $
        mkToggle (NOBORDERS ?? FULL ?? EOT) $
          avoidStruts
            ( reflectHoriz tiled
                ||| Mirror tiled
                ||| Full
                ||| ThreeColMid 1 (3 / 100) (3 / 7)
            )

    -- Default tiling algorithm.
    tiled = Tall nmaster delta ratio
    -- Default number of windows in the master pane.
    nmaster = 1
    -- Default proportion of screen occupied by master pane.
    ratio = 1 / 2
    -- Percent of screen to increment by when resizing panes.
    delta = 3 / 100
