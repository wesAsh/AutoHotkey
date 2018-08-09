; include this from main Script

; VimMod := 1
VimModWord := 1

; #if VimModWord


#If WinActive("ahk_exe WINWORD.exe") and !VimModWord
Space & Esc::
Capslock::
	VimModWord := 1
	MsgBox, 64, HOTKEYS WESLEY, Vim NORMAL!!!!, 0.5
	return


#If WinActive("ahk_exe WINWORD.exe") and VimModWord = 1
Space & Esc::
Capslock::
	VimModWord := 0
	MsgBox, 16, HOTKEYS WESLEY, Vim INSERT!!, 0.5
	return
j::Left
l::Right
i::Up
k::Down
v::
	VimModWord := 2
	msgbox, 32, hotkeys wesley, Vim VISUAL!!!!, 0.5
	return

,::SendInput, ^{Left}
.::SendInput, ^{Right}
^w::
	SendInput, ^{Left}{sleep 30}
	SendInput, +^{Right}+{Left}
	VimModWord := 2
	return

;:: 
	VimModWord := 0
	return
;________________________________________________________________________________
#If WinActive("ahk_exe WINWORD.exe") and VimModWord = 2
j::SendInput, +{Left}
l::SendInput, +{Right}
; i::SendInput, +{Up}
; k::SendInput, +{Down}
i::SendInput, +{Left}{sleep 30}+{Home}
k::SendInput, +{Right}{sleep 30}+{End}

<!j::SendInput, ^+{Left}
<!l::SendInput, +^{Right}
s::SendInput, ^+{Left}
f::SendInput, +^{Right}

Esc::
	VimModWord := 1
	msgbox, 64, hotkeys wesley, Vim NORMAL!!!!, 0.5
	return

