#if WinActive("ahk_exe mpc-hc64.exe")

Esc::
0::
9::
8::
	send, {space}
	WinActivate, ahk_exe WINWORD.exe
	return
#if WinActive("ahk_exe mpc-hc64.exe") and MPC_Mode = 1

	j:: SendInput, !{left}
	l:: SendInput, !{right}
	k::down
	i::up
	o::NumpadEnter
	
	q:: SendInput, ^{q}{sleep 100}+{Tab}{sleep 100}+{Tab}{sleep 100}{down}{sleep 100}{up}

; !j::  SendInput, !{left}
; !l::  SendInput, !{right}


Space & j::
Capslock::
Space & h::
	MPC_Mode := 0
	MsgBox, 16, HOTKEYS WESLEY, Regular Regular Regular, 0.8
	return



; vim:foldmethod=marker:fmr=»,§
