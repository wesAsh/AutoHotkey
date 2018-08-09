#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 2 ; any window that partially matches

; Navigate Between virtual Desktops
; [>
!1::
	send, !1		; it is the hot key in virwin to go to
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
!2::
	send, !2
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
!3::
	send, !3
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
!4::
	send, !4
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
!5::
	send, !5
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
!6::
	send, !6
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
!7::
	send, !7
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
!8::
	send, !8
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
; <]







; vim:foldmethod=marker:fmr=[>,<]:tw=0 ts=4 sw=4
