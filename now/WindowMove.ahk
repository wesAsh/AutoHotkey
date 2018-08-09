; C:/aRoot/AutoHotkey/now/WindowMove.ahk 

;  Resizing Window with Window key and jkli (before was - not workd great)
; ▼▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
	; # + jki works but #l doesnt work well (forces log off...)
	
	; <#k:: sendInput, #{Down}
	; <#j:: sendInput, #{Left}
	; <#i:: sendInput, #{Up}
	; <#l:: sendInput, #{Right}

	; #if GetKeyState("LWin",p)  fix this
	; l:: sendInput, #{Right}
;▲


	#i::    ; Move Window Up (#i - 10 pixels, Shift-#i - 1 pixel)
	; ▼
		WinGet, active_id, ID, A
		WinGetPos, X, Y, Width, Height, ahk_id %active_id%
		If !GetKeyState("Shift","p") {
			WinMove, ahk_id %active_id%,  , X, Y-10
		} else {
			WinMove, ahk_id %active_id%,  , X, Y-1
		}
		return
	; ▲

	#k::    ; Move Window Down (#k - 10 pixels, Shift-#k - 1 pixel)
; ▼
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	If !GetKeyState("Shift","p") {
		WinMove, ahk_id %active_id%, , X, Y+10
	} else {
		WinMove, ahk_id %active_id%, , X, Y+1
	}
	return
; ▲							

	#u::    ; Increase Window Size ()
; ▼
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	WinMOve, ahk_id %active_id%,, X, Y, ,Height+1
	return
; ▲

	#j::    ; Decrease Window Size ()
; ▼
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	WinMOve, ahk_id %active_id%,, X, Y,  , Height-1
	return
; ▲


;=======================================================================

#if 1
; the reason I do "if 1" is because this script is included
; and the one above it had "if WinActivate(..)" so I didn't 
; understand why mappings here didn't work...
^F12:: WinMaximize, A
^!F12:: WinRestore, A

; very simply solved... see:
; https://autohotkey.com/board/topic/16755-help-toggle-maximizerestore-with-same-hotkey/
Space & `::
	WinGet MX, MinMax, A
	If (MX)
		WinRestore A
	Else    WinMaximize A
	return

;   so no need for this...
; ▼ ========================
WindowMod := 1

#if WindowMod
	#F12::
	#h::
		WindowMod := 0
		WinMaximize, A  ; Assign a hotkey to maximize the active window.
		return

#if !WindowMod
	#F12::
	#h::
		WindowMod := 1
		WinRestore, A
		return


	#j::
	WinGet, active_id, ID, A
	WinGetPos, X, Y, Width, Height, ahk_id %active_id%
	WinMOve, ahk_id %active_id%,, X, Y,  , Height-1
	return
; ▲ ==================================================================

; vim:foldmethod=marker:fmr=▼,▲:filetype=autohotkey.txtfmt
