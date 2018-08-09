; Internet explorer on google translate... for easy translating


; » Now I include this from the _keys.ahk, so no need for the delay etc "Header"

	; #NoEnv
	; SetWorkingDir %A_ScriptDir%
	; SetKeyDelay, 50

; §


#ifWinActive, ahk_exe iexplore.exe
; Space & h:: 	 	 	 	; be carful with this. might overrides all Space & key mappings
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








; vim:foldmethod=marker:fmr=»,§
