#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

;======= ACTUALLY IT WAS MOVED TO KEYS.AHK =========


SetTitleMatchMode, 2

; assigning two keys to do the same:
; r::
; t:: send, jjj

; not working this way:
; {r} | {t}:: send, jjjj

; Dont put here:   	Space & q:: send, {Space}q	ˆ
; Problem it makes: when this is here it stucks Space use. 
;					but when I put it in keys.ahk then it is okay...
; Reason I guess:	Space::send Space must come after it?...
;¨


;ˆ the first one seems to work better.
;  it identifies more clearly the targeted window and doesnt do weird shit in unrelated windows
;¨
#if WinActive("ahk_class CabinetWClass") ; #ifWinActive, ahk_class CabinetWClass
;ˆ
-:: send, !{Up}     ; backward up in directories
=:: send, !{Down}    ; forward again in directories

!r::			; goto aRoot directory.  ˆ
!e::			; forif I miss the button..
	send, !d
	sleep, 100
	send, C:\aRoot {Enter}
	; Adding space aftre aRoot helped 
	; for the case when we already in aRoot (it was going out of focus).
	sleep, 100
	send, {Down}{Up}
	return
;¨
!s::		; goto favorites in the left. ˆ
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
;¨


#if WinActive("Google Chrome")
0:: send, ^{Tab}
9:: send, ^+{Tab}
; the problem with that is when you want to write 0 and 9

;
; vim:foldmethod=marker:fmr=ˆ,¨:tw=0 ts=4 sw=4
