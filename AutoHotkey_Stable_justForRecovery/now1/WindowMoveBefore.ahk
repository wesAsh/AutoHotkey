#NoEnv
; SetKeyDelay, 50               ; 1000 is 1sec
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 3


WindowMod := 1

#if WindowMod

l::
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	WinMOve, ahk_id %active_id%,, X+20, Y
	return
j::
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	WinMOve, ahk_id %active_id%,, X-20, Y
	return







F2::
	WindowMod := 0
	MsgBox, 16, HOTKEYS WESLEY, Out of VimMod, 0.5
	return


; ^t:: WinMove, 0,0

F12:: 
	WinGetPos, X, Y, Width, Height
	MsgBox, The active window  %X% ,%Y%
	WinMOve, X+20,0
	return

F13::
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	WinMOve,ahk_id %active_id%,, X+30, Y
	; MsgBox, The active window  %X% ,%Y%
	
	return
	WinGet, active_id, ID, A
	WinMaximize, ahk_id %active_id%
	MsgBox, The active window's ID is "%active_id%".
	return

#if !WindowMod

F2::
	WindowMod := 1
	MsgBox, 64, HOTKEYS WESLEY, VimMod!!!!, 0.5
	return

; vim:foldmethod=marker:fmr=»,§
