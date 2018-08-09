
; ============================ INSIDE GVIM ================================
#IfWinActive, ahk_exe gvim.exe
; » 
	F12::
	; »	; find selected word in vim on Visual Studio
		; Explanation:
		; select something (like class name or whatever) and press <F12> 
		; 1. copy it to clipboard and 
		; 2. go to main Visual Studio Window
		; 3. go to search and paste it 
		send, ^{c}
		sleep, 100
		WinActivate, ahk_exe devenv.exe		; Visual Studio
		send, {sleep 50}^{f}
		sleep, 100
		send, class ^{v}{Enter}
	return
	; §
	F11::
		send, ^{c}
		WinActivate, ahk_exe devenv.exe		; Visual Studio
		send, ^{f}^{v}{Enter}{sleep 200}{Esc}{left}{left}
		; send, {F12}
	return
		send, ^{c}
		sleep, 100
		WinActivate, ahk_exe devenv.exe		; Visual Studio
		send, ^{f}
		sleep, 100
		send, ^{v}{Enter}
		sleep, 300
		send, {Esc}
		sleep, 100
		send, {left}{left}
		sleep, 100
		send, {F12}
	return
; §





; ============================ INSIDE GVIM ================================
#IfWinActive, ahk_exe devenv.exe
; »
; 	Open file you are at on Visual Studio in Vim (but only in main window of VS)
	^o::
		send cp
		sleep, 100
		WinActivate, ahk_exe gvim.exe
		send {F8} 
		sleep 100
		sendInput e ^{v}{sleep 100}{Home}{Right 26}{Backspace 21}aRoot{Right 9}___WS
	return
	F2::
	return
		send cp
		sleep, 100
		send W
		sleep, 100
		WinActivate, GVIM
		send ^{v}{Enter}
		sleep 100
	return

; §

; vim:foldmethod=marker:fmr=»,§
