#NoEnv
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 50
SetTitleMatchMode, 2  ; was 3 all the time

#ifWinActive, ahk_exe gvim.exe

F13 & q:: 
	send, ^{c}
	WinActivate, ahk_exe devenv.exe                         ; Visual Studio
	send, {Esc}!{q}^{v}{Enter}
	return
F13:: SendInput, {F13}
