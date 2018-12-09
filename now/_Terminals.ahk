#if WinActive("ahk_group Terminals")
	^v::SendInput, +{Insert}
	>!v::SendInput, ^{v}    ; seems to also work the same
	!0:: SendInput, ^{Tab}
	; !0:: SendInput, {Ctrl down}{Tab}{Ctrl up}
	!9:: SendInput, ^+{Tab}

#if WinActive("ahk_exe puttytm.exe") OR (WinActive("ahk_exe putty.exe") AND PuttyManagerVar == 1)
	^l:: SendInput, ^{Tab}
	^j:: SendInput, ^+{Tab}
	!0:: SendInput, ^{Tab}
	; !0:: SendInput, {Ctrl down}{Tab}{Ctrl up}
	!9:: SendInput, ^+{Tab}
	
	; but watch out, <Alt-n> do something also you may want
	<!n:: SendInput, {Enter}
	
	Space & o::  sendInput, <!{Tab}
		; WinActivate, ahk_exe puttytm.exe
		; sendInput, ^!{Tab}
		; return

#if WinActive("ahk_exe MobaXterm.exe")
	!0:: SendInput, ^{Tab}
	; !0:: SendInput, {Ctrl down}{Tab}{Ctrl up}
	!9:: SendInput, ^+{Tab}




; ahk_exe puttytm.exe - PuTTYTabManager looks simple and nice but..
	; Space & o (task switching) not working in it.
	; Alt-j, Alt-l  for arrows not working...
	
	; so huge disadvanteges



; default text editor: <MobaTextEditor>
