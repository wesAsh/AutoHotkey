#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
; --------------------------

SetTitleMatchMode, 2 ; any window that partially matches

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
