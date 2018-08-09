#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 2  ; any window that partially matches..
 
#if WinActive("ahk_class CabinetWClass") 
; #ifWinActive, ahk_class CabinetWClass
;ˆ
; -:: send, !{Up}     ; backward up in directories
; =:: send, !{Down}    ; forward again in directories

!r::
	send, !d
	sleep, 100
	send, C:\aRoot {Enter}
	sleep, 100
	send, {Down}{Up}
	return



