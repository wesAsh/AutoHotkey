; #if WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe")
#if WinActive("ahk_group InternetGroup")
; ▼
	; Ctrl+Tab and Ctrl+Shift+Tab works on most browsers to cycle tabs.. but a little problem with opera...
	; but Ctrl+PageUp and Ctrl+PageDown work on all of them. so I switched
	<!.::
	Space & .::
	!0:: send, ^{PgDn}           ; send, ^{Tab}
	Space & ,::
	<!,::
	!9:: send, ^{PgUp}         ; send, ^+{Tab}
	Space & b::
	!-:: send, !{Left}     ; backward
	!=:: send, !{Right}    ; forward again in directories =
	
	; focus on page content. can be done also by: SendInput, !{d}{F6}{F6}
	<!f:: SendInput, !{d}+{F6}
	
	Space & j::
	Space & h::
		Toggle_Zero_One(InternetVimMod)
		ModeDisplayToolTip(InternetVimMod)
		return
	
; ▲
#If WinActive("ahk_group InternetGroup") and InternetVimMod = 0
; ▼
; Capslock::
; Space & h::
	; InternetVimMod := 1
	; MsgBox, 64, HOTKEYS WESLEY, Vim NORMAL Mode!!, 0.5
	; return
; ▲
#If WinActive("ahk_group InternetGroup") and InternetVimMod = 1
; ▼
; Capslock::
; Space & h::
	; InternetVimMod := 0
	; MsgBox, 16, HOTKEYS WESLEY, Regular, 0.5
	; return
; Space{l}::
0:: send ^{PgDn}       ; send, ^{Tab}
9:: send ^{PgUp}       ; send, ^+{Tab}
b::
-:: send, !{Left}     ; backward
=:: send, !{Right}    ; forward again in directories =

	j::send, {Left}
	l::send, {Right}
	i::send, {Up}
	k::send, {Down}
; ▲


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
<!f:: SendInput, !{d}+{F6}
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

#if WinActive("Tabli") and TabliMod = 1
; ▼
	; ▼
	; | Action            | Key Sequence   | Notes                                                          |  |  |  |
	; |-------------------+----------------+----------------------------------------------------------------+--+--+--|
	; | Open Tabli Popup  | Ctrl-.         | Default keybinding, any browser window                         |  |  |  |
	; | Open Tabli Popout | Ctrl-,         | Default keybinding, any browser window                         |  |  |  |
	; | Activate Selected | Enter          | switch to selected window or tab                               |  |  |  |
	; | Expand / Collapse | ;              | Expand or collapse the window summary                          |  |  |  |
	; | Next Tab          | ↓              |                                                                |  |  |  |
	; | Previous Tab      | ↑              |                                                                |  |  |  |
	; | Next Window       | Ctrl-↓         |                                                                |  |  |  |
	; | Previous Window   | Ctrl-↑         |                                                                |  |  |  |
	; | Dismiss Tabli     | ESC            | Closes popup; returns keyboard focus to Current Browser Window |  |  |  |
	; | Edit Search Term  | all other keys |                                                                |  |  |  |
	; ▲

	j::SendInput, {SC027}   ; this is how you send semicolon ';' @learn
	l::SendInput, {SC027}
	i::SendInput, {Up}
	k::SendInput, {Down}
	o::
	Space::
		SendInput, {Enter}
		sleep, 1000
		ModeDisplayToolTip(InternetVimMod)
		return
	Esc::
		ModeDisplayToolTip(TabliMod)
		return
	/::
		Toggle_Zero_One(TabliMod)
		ModeDisplayToolTip(TabliMod)
		return
	
	^i:: SendInput, ^{Up}
	^k:: SendInput, ^{Down}
	e:: Send, {SC027}^{Up}{SC027}
	d:: Send, {SC027}^{Down}{SC027}

; ▲
#if WinActive("Tabli") and TabliMod = 0
; ▼
	Esc::
		Toggle_Zero_One(TabliMod)
		ModeDisplayToolTip(TabliMod)
		return
; ▲
; vim:fdm=marker:fmr=▼,▲
