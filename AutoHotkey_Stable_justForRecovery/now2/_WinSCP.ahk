
#if WinActive("ahk_exe WinSCP.exe")
	Space & h::
		ModeDisplayToolTipChange(WinSCP_Mod)
		return
		if (WinSCP_Mod == 0)
			WinSCP_Mod:= 1
		else if (WinSCP_Mod == 1)
			WinSCP_Mod:= 0
		ModeDisplayToolTip(WinSCP_Mod)
		return
	!0:: send, send, ^{Tab}         ; ^{PgDn}
	!9:: send, send, ^+{Tab}        ; ^{PgUp}

#if WinActive("ahk_exe WinSCP.exe") and WinSCP_Mod= 1
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
	
	
	; Capslock::
	; Space & h::
		; WinSCP_Mod:= 0
		; MsgBox, 16, HOTKEYS WESLEY, Regular Regular Regular, 0.8
		; return

; ahk_exe WinMergeU.exe
; #if WinActive("ahk_exe WinSCP.exe") and WinSCP_Mod= 0
	; Capslock::
	; Space & h::
		; WinSCP_Mod:= 1
		; MsgBox, 64, HOTKEYS WESLEY, Speed Speed Speed, 0.5
		; return

; vim:foldmethod=marker:fmr=»,§

