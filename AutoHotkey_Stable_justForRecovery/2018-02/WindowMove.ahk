; C:/aRoot/AutoHotkey/now/WindowMove.ahk 

#i::    ; Move Window Up (#i - 10 pixels, Shift-#i - 1 pixel)
; »
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	If !GetKeyState("Shift","p") {
		WinMove, ahk_id %active_id%,  , X, Y-10
	} else {
		WinMove, ahk_id %active_id%,  , X, Y-1
	}
	return
; §							

#k::    ; Move Window Down (#k - 10 pixels, Shift-#k - 1 pixel)
; »
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	If !GetKeyState("Shift","p") {
		WinMove, ahk_id %active_id%, , X, Y+10
	} else {
		WinMove, ahk_id %active_id%, , X, Y+1
	}
	return
; §							

#u::    ; Increase Window Size ()
; »
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	WinMOve, ahk_id %active_id%,, X, Y, ,Height+1
	return
; §							

#j::    ; Decrease Window Size ()
; »
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	WinMOve, ahk_id %active_id%,, X, Y,  , Height-1
	return
; §							

;=======================================================================
WindowMod := 1

#if WindowMod
	^!F12::
	#F12::
		WindowMod := 0
		WinMaximize, A  ; Assign a hotkey to maximize the active window.
		return
	
	; ^Down::WinRestore, A

#if !WindowMod
	^!F12::
	#F12::
		WindowMod := 1
		WinRestore, A
		return


; vim:foldmethod=marker:fmr=»,§:filetype=autohotkey.txtfmt
