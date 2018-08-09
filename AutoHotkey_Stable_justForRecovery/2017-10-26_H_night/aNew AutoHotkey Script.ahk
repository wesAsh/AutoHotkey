#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 2


; Dont put here:   	Space & q:: send, {Space}q	
; Problem it makes: when this is here it stucks Space use. 
;					but when I put it in keys.ahk then it is okay...
; Reason I guess:	Space::send Space must come after it?...
;¨


; the first one seems to work better. 
; it identifies more clearly the targeted window and doesnt do weird shit in unrelated windows¯
;¨
#if WinActive("ahk_class CabinetWClass") ; #ifWinActive, ahk_class CabinetWClass

; Go to directory /aRoot.   Go to favorites in the left
!r:: 
	send, !d
	sleep, 100
	send, C:\aRoot{Enter}
	sleep, 100
	send, {Down}
	return
!s::
 	send, !d
	sleep, 100
	send, {Tab}
	sleep, 100
	send, {Tab}
	sleep, 100
	send, {Tab}
	sleep, 100
	send, {Home}{Down}
	return
^s::
 	send, !d
	sleep, 100
	send, {Tab}
	sleep, 100
	send, {Tab}
	sleep, 100
	send, {Tab}
	sleep, 100
	send, {Home}{Down}
	return
;¨

#if WinActive("Google Chrome")
0:: send, ^{Tab}
9:: send, ^+{Tab}

;
; vim:foldmethod=marker:fmr=,¨:tw=0 ts=4 sw=4
