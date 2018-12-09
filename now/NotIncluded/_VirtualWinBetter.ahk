; include this from main Script


; Navigate Between virtual Desktops
; [>
Space & 1::
!1::
	send, !1		; it is the hot key in virwin to go to
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
Space & 2::
!2::
	send, !2
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
Space & 3::
!3::
	send, !3
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
Space & 4::
!4::
	send, !4
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
Space & 5::
!5::
	send, !5
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
Space & 6::
!6::
	send, !6
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
Space & 7::
!7::
	send, !7
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
Space & 8::
!8::
	send, !8
	sleep, 200
	send, ^!{Tab}
	sleep, 100
	send, {left}
return
; <]







; vim:foldmethod=marker:fmr=[>,<]:tw=0 ts=4 sw=4
