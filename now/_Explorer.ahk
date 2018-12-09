
#if WinActive("ahk_class CabinetWClass")
;{	
	; #ifWinActive, ahk_class CabinetWClass
	
	!0:: send, ^{PgDn}  ; send, ^{Tab}   if clover.exe is still there...
	!9:: send, ^{PgUp}  ; send, ^+{Tab}
	^l:: SendInput, ^{PgDn}
	^j:: SendInput, ^{PgUp}
	
	Space & j::
	Space & h::
		;{
		; ToolTip                         ; remove previous ToolTip
		Toggle_Zero_One(WinmergeMod)
		ModeDisplayToolTip(WinmergeMod)
		return ;}
	
	!s::    send, !d{Tab}{Tab}{Tab}{Home}{Down}    ; goto favorites in the left.
	<!f::
		;{
		;or: send, !d{Tab}{Tab}{Tab}{Tab}{Down}{Up}; focus on the files
		;or: !d+{Tab}+{Tab} 
		; A is the Active window
		ControlFocus, DirectUIHWND3, A
		SendInput, {Space}
		return ;}
	Esc::
		;{
		WinmergeMod := 1
		ModeDisplayToolTip(WinmergeMod)
		SendInput, {Esc}
		return ;}
	SC027::
		;{
		WinmergeMod := 0
		ModeDisplayToolTip(WinmergeMod)
		return ;}
;}

; #if WinActive("ahk_class CabinetWClass") and WinmergeMod = 0
;{
	;»  Backward/forward in dirctories, Enter
		
		; sendInput, !{Up}      ; backward up in directories
		; sendInput, <!{Up}     ; also works but An annoying beeping sound Is added
		; sendInput, !{Down}    ; forward again in directories
		
		; ^j::        sendInput, !{Up}
		<!b::       sendInput, !{Up}
		Space & b:: sendInput, !{Up}
		
		; ^l:: sendInput, !{Down}    ; forward
		
		<!o:: SendInput, {Enter}{sleep 80}{Down}
	;§
	
	!r::
		;{ goto aRoot directory...
		send, !d
		sendInput, C:\Links {Enter}{sleep 100}
		send, {Down}{Up}
		return
		
		;{ prev tried:
		;
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
		;}
		;}
	!e::
		;{ if I miss the button.., and slight different to see performance
		send, !d
		sendInput, C:\aRoot {Enter}{sleep 100}{Down}{Up}
		return ;}
;}

#if WinActive("ahk_class CabinetWClass") and WinmergeMod = 1
;»	
	0:: send, ^{PgDn}  ; send, ^{Tab}   if clover.exe is still there...
	9:: send, ^{PgUp}  ; send, ^+{Tab}
	
	b:: sendInput, !{Up}    ; backward up in directories
	j:: sendInput, !{Up}    ; backward up in directories
	i::Up
	+i:: SendInput, I       ; fix I to do what it suppose, because otherwise it does +{up} I guess
	k::Down
	+k:: SendInput, K
	; l:: sendInput, !{Down}       ; forward again in directories, Send didnt work
	; l:: Send, {Enter}{Down}{Up}
	l:: SendInput, {Enter}{sleep 80}{Down}{sleep 80}{Up}
	o::NumpadEnter          ; was: SendInput, {Enter}{sleep 80}{Down}
	
	r::    ; goto aRoot directory. (or Links)
		sendInput, !{d}{sleep 80}C:\Links {Enter}{sleep 100}
		Send, {Home}{Down}{Down}{Down}
		return ;
	e::
		sendInput, !{d}{sleep 80}C:\aRoot\__Links{Enter}{sleep 80}{Down}{sleep 80}{Up}
		return ;
	
	s::    send, !d{Tab}{Tab}{Tab}{Home}{Down}    ; goto favorites in the left.
	f::
		;{ focus on the files
		;or: send, !d+{Tab}+{Tab}
		;or: !d{Tab}{Tab}{Tab}{Tab}{Down}{Up}
		ControlFocus, DirectUIHWND3, A
		SendInput, {Space}
		return ;}
	SC027::
		;{
		Toggle_Zero_One(WinmergeMod)
		ModeDisplayToolTip(WinmergeMod)
		return ;}
	F2::
		;{
		WinmergeMod := 0
		MsgBox, 16, HOTKEYS WESLEY, INSERT, 2
		SendInput, {F2}
		return ;}
	^+n::
		; {
		WinmergeMod := 0
		ModeDisplayToolTip(WinmergeMod)
		SendInput, ^+{n}
		return ;}
;§


#if WinActive("ahk_exe TortoiseProc.exe") and TortoiseMod = 1
;»	 
	i::Up
	k::Down
	l::NumpadEnter
	
	Space & j::
	Capslock::
	Space & h:: ;
		TortoiseMod := 0
		MsgBox, 16, HOTKEYS WESLEY, INSERT, 0.4
		return
;§	
#if WinActive("ahk_exe TortoiseProc.exe") and TortoiseMod = 0
;»	
	Space & j::
	Capslock::
	Space & h:: ;
		TortoiseMod := 1
		MsgBox, 16, HOTKEYS WESLEY, SPEED, 0.4
		return
;§	



; vim:fdm=expr:foldexpr=FoldAHK():set wrap
