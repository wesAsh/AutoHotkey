#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
; --------------------------
SetTitleMatchMode, 2 ; any window that partially matches

;>	Go to Desktop and press Enter to activate hotKey file, 
;	then return to GVIM.  works fine.
;	without the sleep there are problems.
;	the script doesnt wait to message that appears and return to GVIM
;<
F1::			;>
	send, #{d}
	sleep, 100
	send, {Enter}
	WinActivate, GVIM
return
;<

F4:: send ^{c}^{c}
F2::
send ^{c}
send !{Tab}
send ls{Enter}
; send ^{v}
; send {Up}
return
F3::
; send ^{c} ^{c} !{Tab} +{Insert}
send ^{c}
sleep, 600
send ^{c}
sleep, 600
send {.}
sleep 500
WinActivate, /STAM; 	trick to go to cygwin window, but can also activate vim
; send !{Tab}   makes problems
sleep, 100
send +{Insert} >> ls shellOutput.txt{Enter}
; send !{Tab}

; send ls{Enter}
; send ^{v}
; send {Up}
return
;<

#IfWinActive, Chrome	;>
F1::
MsgBox You are currently using Google Chrome
WinActivate, /home/; 	trick to go to cygwin window. but others have it too
				so I changes something in PS1
				now I can set my own title with: > settitle MY CYGWIN title
return
!w::MsgBox Google Chrome
; !i::Up
!j::Send,{Left}
!k::Send,{Down}
!i::Send,{Up}
!l::Send,{Right}
!,::Send, !{Left}
!.::Send, !{Right}
;<


; this one doesnt work:
#IfWinActive, Desktop
F1::MsgBox This is Desktop
!i::up
!l::right

; this one doesnt work: because if you see 
; in Alt-tab also the name and above explorer no name
#IfWinActive, explorer
F1::MsgBox This is explorer

; vim:foldmethod=marker:fmr=;>,;<:tw=0 ts=4 sw=4
