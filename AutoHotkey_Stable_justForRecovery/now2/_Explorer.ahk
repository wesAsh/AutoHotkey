; #ifWinActive, ahk_class CabinetWClass
#if WinActive("ahk_class CabinetWClass")

Space & h::
	; ToolTip                         ; remove previous ToolTip
	if (WinmergeMod == 0) {
		WinmergeMod := 1
		; ToolTip, NORMAL , 0, 0
	}
	else if (WinmergeMod == 1) {
		WinmergeMod := 0
		; ToolTip, Insert, 0, 0
	}
	; Gosub, Func_explorer_Group
	ModeDisplayToolTip(WinmergeMod)
	return
		
#if WinActive("ahk_class CabinetWClass") and WinmergeMod = 0
;▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬»
	;»  Backward/forward in dirctories, Enter
		
		; sendInput, !{Up}      ; backward up in directories
		; sendInput, <!{Up}     ; also works but An annoying beeping sound Is added
		; sendInput, !{Down}    ; forward again in directories
		
		^j::        sendInput, !{Up}
		<!b::       sendInput, !{Up}
		Space & b:: sendInput, !{Up}
		
		^l:: sendInput, !{Down}    ; forward
		
		<!o:: SendInput, {Enter}{sleep 80}{Down}
	;§
	
	!r::                ; goto aRoot directory.»
		send, !d
		sendInput, C:\aRoot {Enter}{sleep 100}
		send, {Down}{Up}
		return
		
		
		; first go to where the path is, lucky we have this in explorer (at least)
		sendInput, !d
		;
		; write your path.. 
		; Adding space after aRoot helped for the case when we already in aRoot (it was going out of focus)
		; typing can be fast. so can do sendInput. send is a little bit slow here (but works of course)
		sendInput, C:\aRoot {Enter}
		 ; Enter recursively activate Enter down up? no.
		sendInput, {sleep 200}{Down}{Up}
		return
	!e::    			; if I miss the button.., and slight different to see performance
		send, !d
		sendInput, C:\aRoot {Enter}{sleep 100}{Down}{Up}
		return
	;§
	!s::    send, !d{Tab}{Tab}{Tab}{Home}{Down}    ; goto favorites in the left.
	<!f::    send, !d{Tab}{Tab}{Tab}{Tab}{Down}{Up}; focus on the files
		;or: !d+{Tab}+{Tab} 
	
	Capslock::
	
	; MsgBox, 64, HOTKEYS WESLEY, SPEED, 0.5
		; return
	
;▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬§
#if WinActive("ahk_class CabinetWClass") and WinmergeMod = 1
;»	
	b:: sendInput, !{Up}    ; backward up in directories
	j:: sendInput, !{Up}    ; backward up in directories
	i::Up
	+i:: SendInput, I       ; fix I to do what it suppose, because otherwise it does +{up} I guess
	k::Down
	+k:: SendInput, K
	; l:: sendInput, !{Down}       ; forward again in directories, Send didnt work
	l:: Send, {Enter}{Down}{Up}
	o::NumpadEnter          ; was: SendInput, {Enter}{sleep 80}{Down}
	r::    ; goto aRoot directory.
	e::    ; if I miss the button.., and slight different to see performance
		sendInput, !{d}{sleep 80}C:\aRoot {Enter}{sleep 80}{Down}
		return
	s::    send, !d{Tab}{Tab}{Tab}{Home}{Down}    ; goto favorites in the left.
	f::    send, !d+{Tab}+{Tab}                   ; focus on the files
		;or: !d{Tab}{Tab}{Tab}{Tab}{Down}{Up}
	
	
	;Capslock::
	; Space & h::
		; WinmergeMod := 0
		; MsgBox, 16, HOTKEYS WESLEY, INSERT, 0.4
		; return
	F2::
		WinmergeMod := 0
		MsgBox, 16, HOTKEYS WESLEY, INSERT, 0.4
		SendInput, {F2}
		return
;§	


#if WinActive("ahk_exe TortoiseProc.exe") and TortoiseMod = 1
;»	 
	i::Up
	k::Down
	l::NumpadEnter
	
	Capslock::
	Space & h::
		TortoiseMod := 0
		MsgBox, 16, HOTKEYS WESLEY, INSERT, 0.4
		return
;§	
#if WinActive("ahk_exe TortoiseProc.exe") and TortoiseMod = 0
;»	
	Capslock::
	Space & h::
		TortoiseMod := 1
		MsgBox, 16, HOTKEYS WESLEY, SPEED, 0.4
		return
;§	



; vim:foldmethod=marker:fmr=»,§
