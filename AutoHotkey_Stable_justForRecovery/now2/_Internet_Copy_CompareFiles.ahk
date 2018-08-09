; SetKeyDelay, 100
; !{Space} & g:: Run, C:\Vim\vim80\gvim.exe

; this declaration should be on top before the #if statements
; or else things wont work well of course
GroupAdd  explorer_Group,      ahk_class CabinetWClass



; very convinient: open gVim in split window right so you can see it is passed there, 
; open chrome in split on the left and start copying

; !{d} always go to Address bar which is perfect
; F6 toggles Address bar, Bookmarks and page content
; so to focus on page content...
; #IfWinActive, ahk_exe chrome.exe
#If WinActive("ahk_group InternetGroup")
F3::
	IfWinNotExist ahk_exe gvim.exe
		return
	Send, !{d}^{c}
	; Otherwise, the above has set the "last found" window for use below.
	ControlSend, ahk_parent, ^{v}{Enter}
	return

^F3:: 
	IfWinNotExist ahk_exe gvim.exe
		return
	Send, ^{c}
	; Otherwise, the above has set the "last found" window for use below.
	ControlSend, ahk_parent, ^{v}{Enter}
	return

; F4::
	; send, !{d}^{c}
	; sleep, 100
	; send, ^{c}
	; sleep, 100
	; WinActivate, ahk_exe gvim.exe
	; sleep, 100
	; send, ^{v}
	; sleep, 100
	; send, {Enter}
; return


