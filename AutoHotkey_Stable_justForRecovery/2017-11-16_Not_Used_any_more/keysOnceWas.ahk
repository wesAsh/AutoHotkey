#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
; ----------------------------

SetTitleMatchMode, 2 ; any window that partially matches..


F1:: send, F1
F3::WinActivate, Chrome
F1 & v::WinActivate, hrome
F1 & g::WinActivate, GVIM
<#g::
	MsgBox, boooooooo
	sleep, 100
	WinActivate, GVIM
	; sleep, 100
	return


; Hold both keys together
; better not to assign for F1...
; then you can press it as Ct rl and Alt do
F1 & v::WinActivate, Visual Studio
F1 & g::WinActivate, GVIM

#ifWinActive, Start menu

; vim:foldmethod=marker:fmr={•,•}:tw=0 ts=4 sw=4

