; #Persistent
; #if WinActive("ahk_exe WinSCP.exe")
; SetTimer, ClickOnMyTitle, 20
; return

; ClickOnMyTitle:
	; if WinActive("ahk_exe WinSCP.exe")
	; {
		; MsgBox, 64, HOTKEYS WESLEY, Vim NORMAL Mode!!, 0.5
		; SetTimer, ClickOnMyTitle, Off
		; WinWaitNotActive, ahk_exe WinSCP.exe
		; SetTimer, ClickOnMyTitle, On
	; }
	; return

#if WinActive("ahk_exe WinSCP.exe")
; ▼
	Space & j::
	Space & h::
		Toggle_Zero_One(WinSCP_Mod)
		ModeDisplayToolTip(WinSCP_Mod)
		return
	!0:: send, send, ^{Tab}         ; ^{PgDn}
	!9:: send, send, ^+{Tab}        ; ^{PgUp}
; ▲

#if WinActive("ahk_exe WinSCP.exe") and WinSCP_Mod= 1
; ▼
	j::    SendInput, !{up}
	l::NumpadEnter
	o::NumpadEnter
	k::down
	i::Up
	
	+i:: SendInput, I
	+k:: SendInput, K
	+o:: SendInput, O
	+l:: SendInput, L
	
	0:: send, ^{Tab}                ; ^{PgDn}
	9:: send, send, ^+{Tab}         ; ^{PgUp}
	
	F2::
		WinmergeMod := 0
		MsgBox, 16, HOTKEYS WESLEY, INSERT, 0.4
		SendInput, {F2}
		return
; ▲

; #if WinActive("ahk_exe WinSCP.exe") and WinSCP_Mod= 0
; ▼
	
; ▲

; vim:fdm=marker:fmr=▼,▲
