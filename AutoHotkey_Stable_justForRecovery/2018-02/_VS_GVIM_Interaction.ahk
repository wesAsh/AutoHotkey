
; ============================ INSIDE GVIM ================================
#IfWinActive, ahk_exe gvim.exe
; »
	F12::
	; »     ; find selected word in vim on Visual Studio
		; Explanation:
		; select something (like class name or whatever) and press <F12>
		; 1. copy it to clipboard and
		; 2. go to main Visual Studio Window
		; 3. go to search and paste it
		send, ^{c}
		; sleep, 100
		WinActivate, ahk_exe devenv.exe         ; Visual Studio
		send, {sleep 50}{Esc}^{f}
		; sleep, 100
		send, class ^{v}{Enter}
	return
	; §
	F11::
		; send, ^{c}
		WinActivate, ahk_exe devenv.exe                         ; Visual Studio
		send, {sleep 50}{Esc}^{f}^{v}{Enter}
		; send, {sleep 50}{Esc}^{f}^{v}{Enter}{sleep 200}{Esc}{left}{left}   ; I changed sleep 200 to nothing
		; send, ^{f}^{v}{Enter}{Esc}{left}{left}
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





; ============================ INSIDE VS ================================
#IfWinActive, ahk_exe devenv.exe
; »
; 	Open file you are at on Visual Studio in Vim (but only in main window of VS)
; 	It's not openning the same file!! it opens the files I work on in directory
	
; 	Example: if I am in this file on Visual Studio:
; 			C:\Source\iprsd\branches\4.3.0.45\Alpha\Lib\common\protocol\version.h
; 	then in vim this will open:
; 			C:\aRoot\4.3.0.45___WS\Alpha\Lib\common\protocol\version.h
	^o::
		send cp
		sleep, 100
		WinActivate, ahk_exe gvim.exe
		send {F8} 
		sleep 100
		sendInput e ^{v}{sleep 100}{Home}{Right 26}{Backspace 21}aRoot{Right 9}___WS
	return
	; F2::
	; return
		; send cp
		; sleep, 100
		; send W
		; sleep, 100
		; WinActivate, GVIM
		; send ^{v}{Enter}
		; sleep 100
	; return

!g::
	send vwc
	WinActivate, ahk_exe gvim.exe
	sendInput :e C:/aRoot/1tor/Mebers/hasBase.txt{Enter}
	send gt/\<^{v}\>{Enter}
	return
; §

; vim:foldmethod=marker:fmr=»,§
