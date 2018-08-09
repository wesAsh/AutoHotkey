
; » commented out:
; WinmergeMod := 1

; was not working well but now it is

; ahk_class WinMergeWindowClassW
; ahk_exe WinMergeU.exe

; #if WinActive("ahk_exe WinMergeU.exe")and WinmergeMod != 2
;»	
	; o::NumpadEnter
	; <!j::  SendInput, !{left}
	; <!l::  SendInput, !{right}
	; h:: SendInput, !{Right}
;§	
; §

#if WinActive("ahk_exe WinMergeU.exe")
Space & j::
Space & h::
		if (WinmergeMod == 0)
			WinmergeMod := 1
		else if(WinmergeMod == 1)
			WinmergeMod := 0
		else if(WinmergeMod == 2)
			WinmergeMod := 1
		
		ModeDisplayToolTip(WinmergeMod)
		return


#if WinActive("ahk_exe WinMergeU.exe") and WinmergeMod = 1
;»	
	j::    SendInput, ^!{left}
	l::    SendInput, ^!{right}
	k::     SendInput, !{down}
	i::     SendInput, !{up}
	
	w::         Send, {Enter}^{s}^{w}!{down}
	s::         Send, {Enter}^{s}^{w}!{down}
	
	o::NumpadEnter
	<!j::  SendInput, !{left}
	<!l::  SendInput, !{right}
	
	v::
		WinmergeMod := 2
		msgbox, 32, hotkeys wesley, VISUAL, 0.4
		return
	; Capslock::
	; Space & h::
		; WinmergeMod := 0
		; MsgBox, 16, HOTKEYS WESLEY, INSERT, 0.4
		; return
	
	left::      SendInput, ^!{left}
	right::     SendInput, ^!{right}
	down::      SendInput, !{down}
	up::        SendInput, !{up}
;§	

#if WinActive("ahk_class WinMergeWindowClassW") and WinmergeMod = 0
;»	
	<!j::sendInput, {Left}
	<!l::sendInput, {Right}
	<!i::sendInput, {Up}
	<!k::sendInput, {Down}
	; j::left
	; l::right
	; k::down
	; i::up
	
	; Esc::
	; Capslock::
	; Space & h::
		; WinmergeMod := 1
		; MsgBox, 64, HOTKEYS WESLEY, Speed Speed Speed, 0.5
		; return
;§	

#if WinActive("ahk_exe WinMergeU.exe") and WinmergeMod = 2  ; Visual mode
;»	 
	; char
	.::SendInput, +{Right}
	,::SendInput, +{Left}
	
	; word
	j::SendInput, ^+{Left}
	l::SendInput, +^{Right}
	
	; line
	i::SendInput, +{Left}{sleep 30}+{Home}
	k::SendInput, +{Right}{sleep 30}+{End}
	
	<!j::SendInput, ^+{Left}
	<!l::SendInput, +^{Right}
	s::SendInput, ^+{Left}
	f::SendInput, +^{Right}
	
	; Esc::
	; Space & h::
		; WinmergeMod := 1
		; msgbox, 64, hotkeys wesley, Vim NORMAL, 0.5
		; return
;§	








; Purpose: Compare 2 files or directories with one key stroke, using WinMerge
; Usage:   Open 2 window explorers and select the directories to compare, 
;          then just hit key
;
; How it is done: 
;            when hitting alt there is possibility to select compare of WinMerge
; Notice: it seems to work without a sleep between the keys. just one sleep 
;         when changing a window
#IfWinActive, ahk_class CabinetWClass
F3::
	Send, {Alt}{Down}cc{Enter}   ; in mobile tornado I need cc because first c is to commit...
	; Send, {Alt}{Down}c{Enter}, ahk_class CabinetWClass
	GroupActivate, explorer_Group
	sleep, 100
	Send, {Alt}{Down}cc{Enter}
return
!F3::
	ControlSend, ,{Alt}{Down}c{Enter}, ahk_class CabinetWClass
	GroupActivate, explorer_Group
	sleep, 100
	ControlSend, ,{Alt}{Down}c{Enter}
return


; #IfWinActive, ahk_exe gvim.exe
; RButton & g:: sendInput, {down}{down}{down}
; LButton & g:: sendInput, {Up}{Up}{Up}
; RButton:: sendInput, {RButton}
; LButton:: sendInput, {LButton}

#ifWinActive, ahk_exe gvim.exe
; »
	+F2::
	^F3:: 
		IfWinNotExist ahk_exe mintty.exe
			return
		Send, ^{c}{c}
		ControlSend, ahk_parent, +{Ins}{Space}&{Enter}
	return
; §


; vim:foldmethod=marker:fmr=»,§
