module KeyBindings where

import Defaults
import Graphics.X11.ExtraTypes.XF86
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.FindEmptyWorkspace
import XMonad.Layout.Gaps
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Util.Paste
import XMonad.Util.Run

import qualified Data.Map as M
import qualified WindowState as WS
import qualified XMonad.StackSet as W

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig{XMonad.modMask = modm}) =
  M.fromList $
    [ ((modm .|. shiftMask, xK_Return),  safeSpawn (XMonad.terminal conf) [])
    , ((modm, xK_b),                     safeSpawn myBrowser [])
    , ((modm .|. shiftMask, xK_c),       kill)
    , ((modm, xK_n),                     refresh)
    , ((modm, xK_q),                     spawn "xmonad --recompile; xmonad --restart")
    , ((modm, xK_f),                     sendMessage $ Toggle FULL)
    , ((modm .|. shiftMask, xK_f),       withFocused WS.toggleFloat)
    , ((modm, xK_space),                 sendMessage NextLayout)
    , ((modm, xK_Tab),                   windows W.focusDown)
    , ((modm, xK_j),                     windows W.focusDown)
    , ((modm, xK_k),                     windows W.focusUp)
    , ((modm, xK_m),                     windows W.focusMaster)
    , ((modm .|. shiftMask, xK_j),       windows W.swapDown)
    , ((modm .|. shiftMask, xK_k),       windows W.swapUp)
    , ((modm, xK_Return),                windows W.swapMaster)
    , ((modm, xK_h),                     sendMessage Expand)
    , ((modm, xK_l),                     sendMessage Shrink)
    , ((modm, xK_Tab),                   toggleWS)
    , ((modm, xK_e),                     viewEmptyWorkspace)
    , ((modm .|. shiftMask, xK_e),       tagToEmptyWorkspace)
    , ((modm, xK_t),                     withFocused $ windows . W.sink)
    , ((modm, xK_r),                     spawn "rofi -show drun")
    , ((altMask, xK_Tab),                spawn "rofi -show window")
    , ((modm, xK_p),                     spawn "snapshot -f")
    , ((modm .|. shiftMask, xK_p),       spawn "snapshot")
    , ((0, xF86XK_AudioPrev),            spawn "mpc prev")
    , ((0, xF86XK_AudioNext),            spawn "mpc next")
    , ((0, xF86XK_AudioPlay),            spawn "mpc toggle")
    , ((0, xF86XK_AudioRaiseVolume),     spawn "pamixer -i 5")
    , ((0, xF86XK_AudioLowerVolume),     spawn "pamixer -d 5")
    , ((0, xF86XK_AudioMute),            spawn "pamixer -t")
    ]
    ++
    [ ((m .|. modm, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]
