#if WinActive("ahk_class CabinetWClass") and WinmergeMod = 0

	; in this way, just the last works:
	^j::            ; not working
	<!b::           ; not working (most of the time at least...)
	Space & b::     ; fine
		sendInput, !{Up}
		return
	
	; in this way they all work:
	^j::       sendInput, !{Up}
	<!b::      sendInput, !{Up}
	Space & b::sendInput, !{Up}
	
	
	; I think the first is better
	<!o:: SendInput, {Enter}{sleep 80}{Down}
	<!o:: 			; SendInput and Send also is too fast seems to combine all
			sleep, 200
			Send, {Enter}
			sleep, 100
			Send, {Down}{Up}    
			return
