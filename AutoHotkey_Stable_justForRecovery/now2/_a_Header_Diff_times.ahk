; included from main program

; First: set Mode, Delay ... 
; »
	#NoEnv
	; #Warn
	; SendMode Input        I will do SendInput when needed instead..
	SetWorkingDir %A_ScriptDir%
	SetKeyDelay, 50
	; the delay is working good with send, instead many lines with sleep
	; other wise I will do sendInput which is what happening for send on SendMode Input
	
	
	; »
	;    PUT AHEAD!! see my tuturial
	;    2: any window that partially matches..
	;    3: exactly match
	; §
	SetTitleMatchMode, 3  ; was 3 all the time then 2
; §								


; vim:foldmethod=marker:fmr=»,§:filetype=autohotkey.txtfmt
