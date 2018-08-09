; Internet explorer on google translate... for easy translating

; » Now I include this from the _keys.ahk, so no need for the delay etc "Header"

	; #NoEnv
	; SetWorkingDir %A_ScriptDir%
	; SetKeyDelay, 50

; §


; #ifWinActive, ahk_exe iexplore.exe
#if WinActive("Google Translate - Google Chrome") || WinActive("ahk_exe iexplore.exe")
; Space & h: ; be carful with this. might overrides all Space & key mappings
<!h::
	send, !{Shift}+{Tab}+{Tab}+{Tab}+{Tab}+{Tab}+{Tab}{Enter}
	return
	
	; » before was:
		sendInput, !{Shift}
		; putting the above in the end didnt work well
		sleep, 50
		send, +{Tab}
		sleep, 50
		send, +{Tab}
		sleep, 50
		send, +{Tab}
		sleep, 50
		send, +{Tab}
		sleep, 50
		send, +{Tab}
		sleep, 50
		send, +{Tab}
		sleep, 50
		send, {Enter}
		sleep, 100
		return
	; §

<!j:: sendInput, !{Shift}

; what is this???
<!+::
	send, !+{Tab}
	return


#if (!WinActive("Google Translate - Google Chrome") && !WinActive("ahk_exe iexplore.exe") && !WinActive("ahk_exe gvim.exe") && !WinActive("ahk_exe devenv.exe"))
; #ifWinNotActive, ahk_exe gvim.exe

<!h::
	If !GetKeyState("Shift","p") {
		PostMessage, 0x50, 0, 0x4090409,, A
	} else {
		PostMessage, 0x50, 0, 0x40d040d,, A ; changes to hebrew
	}
	return

; 8:: PostMessage, 0x50, 0, 0x4090409,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST.
; 7:: PostMessage, 0x50, 0, 0x40d040d,, A ; changes to hebrew

#.:: PostMessage, 0x50, 0, 0x4090409,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST.
#,:: PostMessage, 0x50, 0, 0x40d040d,, A ; changes to hebrew

LWin & .:: PostMessage, 0x50, 0, 0x4090409,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST.
LWin & ,:: PostMessage, 0x50, 0, 0x40d040d,, A ; changes to hebrew


; vim:foldmethod=marker:fmr=»,§
