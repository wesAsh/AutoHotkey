SetKeyDelay, 50

	#IfWinActive, ahk_exe gvim.exe
; » 
	
	; » Once was...:	
		; select something (like class name or whatever) and press <F12> 
		; 1. copy it to clipboard and 
		; 2. go to main Visual Studio Window
		; 3. go to search and paste it
	; F11::
		; send, ^{c}
		; sleep, 100
		; send, ^{c}
		; sleep, 100
		; WinActivate, ahk_exe mintty.exe	; Terminal
		; sleep, 100
		; send, grep -HrnI "
		; sleep, 100
		; send, +{Ins}
		; sleep, 100
		; send, " ./ &>> ../terminalOut
		; sleep, 100
		; send, {Return}
		; sleep, 200
		; WinActivate, ahk_exe gvim.exe
	; return
	; §

	; » Usage and caution:	
	
		; Just write the search in one line (at the end of file is better for you)
		; press <F12> 
		; 1. first it checks if there is cygwin at all. and put it ahead.
		; 2. cygwin should be open in the library you want to search recursively
		; 3. the file shello.h itself better not be in the same directory! (one directory up for example)
		
		; Remember to always save the file shello.h ...  so I did it here for you
	F10::
		IfWinNotExist ahk_exe mintty.exe
			return
		sendInput, ^{s}{sleep 100}^{c}{sleep 100}c
		Send, {Enter}
		ControlSend, ahk_parent, grep -HrnI "+{Ins}{sleep 50}
		ControlSend, ahk_parent, " ./ >> ../shello.h{Enter}
		sendInput, {F8}{sleep 50}edit{sleep 30000}{Enter}
	return
	; §

; §
; vim:foldmethod=marker:fmr=»,§
