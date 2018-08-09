; include this from main Script

VimMod := 1

#if VimMod
Capslock::
	MsgBox, , HOTKEYS WESLEY, Out of VimMod, 1
	VimMod := 0
	return

#If WinActive("ahk_group AltJKLI_Group") and VimMod
;´  Vim jkli move
j::send, {Left}
l::send, {Right}
i::send, {Up}
k::send, {Down}
; Space::Enter
o::Enter
;::Esc
;________________________________________________________________________________¸


#if !VimMod
Capslock::
	MsgBox, , HOTKEYS WESLEY, VimMod!!!!, 1
	VimMod := 1
	return




