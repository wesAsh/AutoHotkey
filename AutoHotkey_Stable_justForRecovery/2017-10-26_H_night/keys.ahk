#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%


; Weird behaviour Happens if I put SetTitleMatchMode after the remap of	{•
; Capslock and RAlt.
; WinActivate and others stop working...
; 																		•}
SetTitleMatchMode, 2 ; any window that partially matches..


Capslock::Esc
; Esc::Capslock
RAlt::Ctrl


; Switch to specific window (using it's title name)						{•
<#g::WinActivate, GVIM
<#c::WinActivate, Google Chrome
<#t::WinActivate, bash
Space & g:: WinActivate, GVIM
Space & v:: WinActivate, Visual Studio
Space & c:: WinActivate, Google Chrome
Space & e:: WinActivate, ahk_class CabinetWClass     ; window explorer
Space & d:: send, #d                                 ; Desktop
Space & t:: WinActivate, bash
Space & q:: send, {Space}q   ; for gvim to not delay due to the space use here
Space & f:: send, {Space}f
; 																		•}


; Alt-Tab Vim style: freeze												{•
; first, freez the Task Switching with Ctrl+Alt+Tab:
;
<!Capslock::send, ^!{Tab}
Space:: sendInput, {Space}        ; now it is faster with sendInput. to not make delays
Space & l:: send, ^!{Tab}
Space & o:: send, ^!{Tab}
Space & j:: send, ^!{Tab}
								; F1::send, ^!{Tab}
								; <!Tab::send, ^!{Tab}
								; <!Tab::send, <!^{Tab}
; 																		•}

#ifWinActive, Task Switching
; then just navigate like in vim: 										{•
;
j::send, {Left}
l::send, {Right}
i::send, {Up}
k::send, {Down}
Space::Enter
o::Enter
;::Esc
; 																		•}

; Task Switching: tried to Vim-jkli with alt pressed on, not working yet
;																		{•
; Alt & j:: 
	; send, !{Left}, 100
	; return
; Alt & j::send, !{Left}
; !l::send, !{Right}
; Alt & i::send, {Up}
; Alt & k::send, !{Down}
;																		•}
; #if GetKeyState("Alt")
; 						{•
; j::send, !{Left}
; l::send, !{Right}
; i::send, {Up}
; k::send, {Down}
; 																		•}


#if WinActive("Start menu") or WinActive("Google Chrome") or WinActive("ahk_class CabinetWClass")
; navigate without Arrow keys in Start menu:
; {•
<!j::send, {Left}
<!l::send, {Right}
<!i::send, {Up}
<!k::send, {Down}
;•}

; #if WinActive("ahk_class" . CabinetWClass)

; Activate zTryFast.ahk¯												{•
#IfWinActive, GVIM
F1:: 
	send ^s    ;  save script
	sleep, 100
	send, #{d}
	sleep, 100
	send z
	send, {Enter}
	WinActivate, GVIM
	return
; 																		•}



; vim:foldmethod=marker:fmr={•,•}:tw=0 ts=4 sw=4

