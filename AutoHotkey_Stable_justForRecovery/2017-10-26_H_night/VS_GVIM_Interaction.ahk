#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
; -----------------------------
SetTitleMatchMode, 2


#IfWinActive, GVIM
; Explanation:	
	; select something (like class name or whatever) and press <F12> 
	; 1. copy it to clipboard and 
	; 2. go to main Visual Studio Window
	; 3. go to search and paste it
F12::
	send, ^{c}
	sleep, 100
	WinActivate, Visual Studio
	send, ^{f}
	sleep, 100
	send, ^{v}
return

; Open file you are at on Visual Studio in Vim (but only in main window of VS)
#IfWinActive, Visual Studio
F1::
	send cp
	sleep, 100
	WinActivate, GVIM
	send {F8} 
	sleep 100
	send tabe ^{v}
return
F2::
	send cp
	sleep, 100
	send W
	sleep, 100
	WinActivate, GVIM
	send ^{v}{Enter}
	sleep 100
return
