; Internet explorer on google translate... for easy translating


#ifWinActive ahk_class IEFrame ; iexplore.exe    ; Internet Explorer
; ▼
; only Ctrl+Tab and Ctrl+Shift+Tab works on this browser to cycle tabs..
; Ctrl+PageUp and Ctrl+PageDown work on most but not this.
<!.::
Space & .::
!0:: send, ^{Tab}           ; send, ^{PgDn}
Space & ,::
<!,::
!9:: send, ^+{Tab}         ; send, ^{PgUp}
Space & b::
!-:: send, !{Left}     ; backward
!=:: send, !{Right}    ; forward again in directories =

	; focus on page content. can be done also by: SendInput, !{d}{F6}{F6}
	; <!f:: SendInput, !{d}+{F6}

	; focus on text you write
	8::
	<!f::
		MouseClick, left, 376, 278
		MouseMove, 376, 700
		sleep, 200
		return
	; copy translation:
	^y::MouseClick , left, 1088, 354
	
	; swap languages. the second works better
	; <!h:: Send, +^s
	^s::
	<!h::
		Send, {shift down}{ctrl down}s{shift up}{ctrl up}
		; Send, s
		; Send, {shift up}{ctrl up}
		if (LanguageExplorer = 1) {
			LanguageExplorer := 2
			PostMessage, 0x50, 0, 0x40d040d,, A ; changes to hebrew
		} else {
			LanguageExplorer := 1
			PostMessage, 0x50, 0, 0x4090409,, A ; changes to english
		}
		return
		
		<!::
		LAlt:: ; not disable actually. my problem is that with alt it's imediatly jumpt to menu
			return

; ▲
#If WinActive("ahk_class IEFrame") and InternetVimMod = 0
; ▼
Space & j::
Capslock::
Space & h::
	InternetVimMod := 1
	MsgBox, 64, HOTKEYS WESLEY, Vim NORMAL Mode!!, 0.5
	return
; ▲
#If WinActive("ahk_class IEFrame") and InternetVimMod = 1
; ▼
	Space & j::
	Capslock::
	Space & h::
		InternetVimMod := 0
		MsgBox, 16, HOTKEYS WESLEY, Regular, 0.5
		return
	; Space{l}::
	0:: send ^{Tab}       ; send, ^{PgDn}
	9:: send ^+{Tab}       ; send, ^{PgUp}
	b::
	-:: send, !{Left}     ; backward
	=:: send, !{Right}    ; forward again in directories =
	
	j::send, {Left}
	l::send, {Right}
	i::send, {Up}
	k::send, {Down}
; ▲



; vim:foldmethod=marker:fmr=»,§
