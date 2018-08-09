; » First

	#NoEnv
	; #Warn
	; SendMode Input		I will do SendInput when needed instead.. 
	SetWorkingDir %A_ScriptDir%
	SetKeyDelay, 50
	; the delay is working good with send, instead many lines with sleep
	; other wise I will do sendInput which is what happening for send on SendMode Input


	; »
	;    PUT AHEAD!! see my tuturial
	;    2: any window that partially matches.. 
	;    3: exactly match
	; §
	SetTitleMatchMode, 3

; §


; » Alt + jkli  movement Groups
	
	;   Arrows Replacement ~Vim Alt+jkli  Movements Group
	;   this one too must come before mappings to be relevant..

  	  GroupAdd AltJKLI_Group, ahk_exe explorer.exe     ; Start menu, Task Switching, windows explorer
	; GroupAdd AltJKLI_Group, ahk_exe devenv.exe       ; Visual Studio
  	  GroupAdd AltJKLI_Group, ahk_exe chrome.exe
  	  GroupAdd AltJKLI_Group, ahk_exe WinMergeU.exe
  	  GroupAdd AltJKLI_Group, ahk_exe WINWORD.exe
; §


; » Groups of Same Apps to toggle between them

	GroupAdd  gVim_Group,          ahk_exe gvim.exe
	GroupAdd  Visual_Studio_Group, ahk_exe devenv.exe
	GroupAdd  chrome_Group,        ahk_exe chrome.exe
	GroupAdd  explorer_Group,      ahk_class CabinetWClass	;ahk_exe explorer.exe
	GroupAdd  iprsRun,  	 	ahk_exe IPRS_Server.exe ;the console running server
	GroupAdd  iprsRun,  	 	ahk_exe iprs.exe ;the iprs apps
; §


; #include _VirtualWinBetter.ahk


; »  Moving to windows (Space pressed..)
	;»
	;   Better way to Move to Window? (Toggle between same App instances)
	;   but unfortonato makes a bit problems with some applications, with others fine.
	;   well:
	;   1. Windows explorer:  the problem is that it finds windows from other virtual windows... 
	;                         what can be done: close them when not needed. easy to open them anyway...
	;   2. gVim seems working fine though. but when I go to other window, it doesnt return to the last active gVim. 
	;            so I did a special fix for it.
	;   3. Visual Studio makes problems...
	;§
	
	Space & g:: GroupActivate, gVim_Group, R	; does the same thing as the lines down
	; Space & g:: 
		; ifWinActive, ahk_exe gvim.exe
			; GroupActivate, gVim_Group
		; else
			; WinActivate, ahk_exe gvim.exe
		; return
	Space & c:: 
		ifWinActive, ahk_exe chrome.exe
			GroupActivate, chrome_Group
		else
			WinActivate, ahk_exe chrome.exe
		return
	Space & e:: 
		ifWinActive, ahk_class CabinetWClass
			GroupActivate, explorer_Group
		else
			WinActivate, ahk_class CabinetWClass
		return
	Space & v:: 
		WinActivate, Server - Microsoft Visual Studio (Administrator)	;ahk_exe devenv.exe
		WinActivate, Server (Running) - Microsoft Visual Studio (Administrator)
		WinActivate, Server (Debugging) - Microsoft Visual Studio (Administrator)
		return
	Space & x:: GroupActivate, iprsRun, R
	Space & t:: WinActivate, ahk_exe mintty.exe	; bash
	Space & d:: sendInput, #d			; Desktop
	; Space & h:: WinActivate, ahk_exe iexplore.exe	; internet explorer, for google translate

	; Others I tried:
	; Space & v:: GroupActivate, Visual_Studio_Group	; Not working well, I dont know why
	; Space & e:: WinActivate, ahk_class CabinetWClass	; window explorer
	; Space & e:: WinActivate, ahk_exe explorer.exe		; not working good?..
; §


;»  Fix Space isues

    ; first of all, for Space to work alone.... just:

	Space:: sendInput, {Space}

    ; for gVim to work better (and work always!) for <Space><key> (one after the other) mapping:

	Space & a:: sendInput, {Space}a
	Space & b:: sendInput, {Space}b
	; Space & c:: sendInput, {Space}c
	; Space & d:: sendInput, {Space}d
	; Space & e:: sendInput, {Space}e
	Space & f:: sendInput, {Space}f
	; Space & g:: sendInput, {Space}g
	Space & h:: sendInput, {Space}h
	Space & i:: sendInput, {Space}i
	Space & j:: sendInput, {Space}j
	Space & k:: sendInput, {Space}k
	Space & l:: sendInput, {Space}l
	Space & m:: sendInput, {Space}m
	Space & n:: sendInput, {Space}n
	; Space & o:: sendInput, {Space}o
	Space & p:: sendInput, {Space}p
	Space & q:: sendInput, {Space}q
	Space & r:: sendInput, {Space}r
	Space & s:: sendInput, {Space}s
	; Space & t:: sendInput, {Space}t
	Space & u:: sendInput, {Space}u
	; Space & v:: sendInput, {Space}v
	Space & w:: sendInput, {Space}w
	; Space & x:: sendInput, {Space}x
	Space & y:: sendInput, {Space}y
	Space & z:: sendInput, {Space}z 

	Space & .:: sendInput, {Space}.
	Space & ,:: sendInput, {Space},
	Space & 9:: sendInput, {Space}9
	Space & 0:: sendInput, {Space}0

    ; fix problems with going to gVim command line:...

	>!Space:: sendInput, !{Space}
	<!Space:: sendInput, !{Space}
	>^Space:: sendInput, ^{Space}
	<^Space:: sendInput, ^{Space}

;________________________________________________________________________________§


;»  Resizing Window with Window key and jkli

	; # + jki works but #l doesnt work well (forces log off...)
	
	<#k:: sendInput, #{Down}
	<#j:: sendInput, #{Left}
	<#i:: sendInput, #{Up}
	<#l:: sendInput, #{Right}

	; #if GetKeyState("LWin",p)  fix this
	; l:: sendInput, #{Right}
;§


;»  gVim to work with Esc as alt, ctrl etc (Space as well)
Esc & m:: sendInput, {Esc}m
Esc & t:: sendInput, {Esc}t
Esc & l:: sendInput, {Esc}l
Esc:: sendInput, {Esc}

;_______________________________________________________________________________§


;»  Task Switching
	;   Alt-Tab freeze.  Vim jkli Style: 
	;   first, freez the Task Switching with Ctrl+Alt+Tab:
	;
	; <!Capslock::sendInput, ^!{Tab}
	<!Esc::sendInput, ^!{Tab}
	; Space & l:: sendInput, ^!{Tab}
	Space & o:: sendInput, ^!{Tab}
 	; Space & j:: send, ^!{Tab}{Left}
								; F1::send, ^!{Tab}
								; <!Tab::send, ^!{Tab}
								; <!Tab::send, <!^{Tab}
;________________________________________________________________________________§


#ifWinActive, ahk_class TaskSwitcherWnd		; was: Task Switching
;» Vim jkli move

	j::send, {Left}
	l::send, {Right}
	i::send, {Up}
	k::send, {Down}
	; Space::Enter
	o::Enter
	;::Esc
;________________________________________________________________________________§


;»  Sader here, not used (all comment)

; Task Switching: tried to Vim-jkli with alt pressed on, not working yet

	; Alt & j:: 
		; send, !{Left}, 100
		; return
	; Alt & j::send, !{Left}
	; !l::send, !{Right}
	; Alt & i::send, {Up}
	; Alt & k::send, !{Down}
	;
	; #if GetKeyState("Alt")
	;
	; j::send, !{Left}
	; l::send, !{Right}
	; i::send, {Up}
	; k::send, {Down}

;§


#If WinActive("ahk_group AltJKLI_Group")
;»  navigate without Arrow keys in Start menu:

<!j::sendInput, {Left}
<!l::sendInput, {Right}
<!i::sendInput, {Up}
<!k::sendInput, {Down}
;________________________________________________________________________________§


#IfWinActive, ahk_exe gvim.exe
;»  Disable Alt
Alt::
	return
+F1:: 
return
	send, ^s    ;  save script
	sleep, 100
	send, #{d}
	sleep, 100
	send, z
	send, {Enter}
	WinActivate, GVIM
	return
;________________________________________________________________________________§


#ifWinActive, ahk_class CabinetWClass
;»

	;»  WinMerge actually not suitable
	;   #If WinActive("ahk_class CabinetWClass") || WinActive("ahk_exe WinMergeU.exe")
	;§

	;»  Backward/forward in dirctories, Enter
	
		^j::     ; not working...
		<!b::    ; fine
		Space & b:: sendInput, !{Up}    ; backward up in directories

		^l:: send, !{Down}    ; forward again in directories

		; sendInput, <!{Up}   also works but An annoying beeping sound Is added

		Enter::
		<!o:: 			; SendInput and Send also is too fast seems to combine all
			sleep, 200
			Send, {Enter}
			sleep, 100
			Send, {Down}{Up}    
			return
	;§

	!r::    ; goto aRoot directory.»
		; first go to where the path is, lucky we have this in explorer (at least)
		sendInput, !d
		;
		; write your path.. 
		; Adding space after aRoot helped for the case when we already in aRoot (it was going out of focus)
		; typing can be fast. so can do sendInput. send is a little bit slow here (but works of course)
		sendInput, C:\aRoot {Enter}
	 	 ; Enter recursively activate Enter down up? no.
		sendInput, {sleep 200}{Down}{Up}
		return
	!e::    			; if I miss the button.., and slight different to see performance
		send, !d
		sendInput, C:\aRoot {Enter}{sleep 100}{Down}{Up}
		return
	;§
	!s::    send, !d{Tab}{Tab}{Tab}{Home}{Down}    ; goto favorites in the left.
	<!f::    send, !d{Tab}{Tab}{Tab}{Tab}{Down}{Up}; focus on the files
 		;or: !d+{Tab}+{Tab} 
;§


; not working well
#ifWinActive, ahk_exe WinMergeU.exe
;»

!r::			; goto aRoot directory.
!e::			; if I miss the button..
	send, !d
	sleep, 100
	send, C:\aRoot {Enter}
	; Adding space aftre aRoot help here??? 
	sleep, 100
	send, {Tab}{Tab}{Tab}
	return
;
!s::		; goto favorites in the left.
; ^s::
 	send, !d
	sleep, 100
	send, {Tab}
	sleep, 100
	send, {Tab}
	sleep, 100
	send, {Tab}
	sleep, 100
	send, {Home}{Down}
	return
	;
;________________________________________________________________________________§ 


; #if WinActive("ahk_exe chrome.exe") also work well
#ifWinActive, ahk_exe chrome.exe
;»
<!.::
Space & .::
!0:: send, ^{Tab}
Space & ,::
<!,::
!9:: send, ^+{Tab}
Space & b::
-:: send, !{Left}     ; backward
=:: send, !{Right}    ; forward again in directories
; the problem with that is when you want to write 0 and 9

; focus on page content. can be done also by: SendInput, !{d}{F6}{F6}
<!f:: SendInput, !{d}+{F6}
;§


#include _VimMod.ahk
#include _VS_GVIM_Interaction.ahk

; Internet explorer on google translate... for easy translating
#ifWinActive, ahk_exe iexplore.exe
<!+::
 	send, !+{Tab}
	return


; once was marker=´,¸
; vim:foldmethod=marker:fmr=»,§
