; include this from main Script

VimMod := 1

#if VimMod
Space & Esc::
Capslock::
	VimMod := 0
	MsgBox, 16, HOTKEYS WESLEY, Out of VimMod, 0.5
	return

#if !VimMod
Space & Esc::
Capslock::
	VimMod := 1
	MsgBox, 64, HOTKEYS WESLEY, VimMod!!!!, 0.5
	return


#If WinActive("ahk_group AltJKLI_Group") and VimMod
;´  Vim jkli move
j::send, {Left}
l::send, {Right}
i::send, {Up}
k::send, {Down}
o::Enter
; Space::Enter
	; ::
	; MsgBox, , HOTKEYS WESLEY, Out, 1
	; VimMod := 0
	; return
;________________________________________________________________________________¸


#If WinActive("ahk_exe devenv.exe") and VimMod
;´  Vim jkli move
j::send, {Left}
l::send, {Right}
i::send, {Up}
k::send, {Down}
o::Enter
; Space::Enter
	; ::
	; MsgBox, , HOTKEYS WESLEY, Out, 1
	; VimMod := 0
	; return
;________________________________________________________________________________¸




