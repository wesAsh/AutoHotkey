#NoEnv
; SendMode Input		I will do SendInput when needed instead.. 
SetWorkingDir %A_ScriptDir%
SetKeyDelay, 50

SetTitleMatchMode, 3

#ifWinActive, ahk_exe WINWORD.EXE
F1::
^d::
	Send, {Alt}{1}{m}
	Send, {Right}{Tab}{Tab}{Tab}{Tab}
	return
l:: Right
k:: Down

w:: <!w

