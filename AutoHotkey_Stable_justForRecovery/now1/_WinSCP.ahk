#if WinActive("ahk_exe WinSCP.exe") and WinSCP_Mod= 1
	j::    SendInput, !{up}
	l::    NumpadEnter
	k::    down
	i::    up
	o::NumpadEnter
	
	Capslock::
	Space & h::
		WinSCP_Mod:= 0
		MsgBox, 16, HOTKEYS WESLEY, Regular Regular Regular, 0.8
		return

; ahk_exe WinMergeU.exe
#if WinActive("ahk_exe WinSCP.exe") and WinSCP_Mod= 0
	Capslock::
	Space & h::
		WinSCP_Mod:= 1
		MsgBox, 64, HOTKEYS WESLEY, Speed Speed Speed, 0.5
		return

; vim:foldmethod=marker:fmr=»,§

