#include _a_Header_Diff_times.ahk

WinmergeMod := 1

; » Alt + jkli  movement Groups
			
	;   Arrows Replacement ~Vim Alt+jkli  Movements Group
	;   this one too must come before mappings to be relevant..

	  GroupAdd AltJKLI_Group, ahk_exe explorer.exe     ; Start menu, Task Switching, windows explorer
	; GroupAdd AltJKLI_Group, ahk_exe devenv.exe       ; Visual Studio
  	  GroupAdd AltJKLI_Group, ahk_exe chrome.exe
  	  GroupAdd AltJKLI_Group, ahk_exe WinMergeU.exe
            ; GroupAdd AltJKLI_Group, ahk_exe WINWORD.exe
; §


; » Groups of Same Apps to toggle between them

	GroupAdd  gVim_Group,          ahk_exe gvim.exe
	GroupAdd  Visual_Studio_Group, ahk_exe devenv.exe
	; GroupAdd  Visual_Studio_Group, Server - Microsoft Visual Studio (Administrator)
	; GroupAdd  Visual_Studio_Group, Server (Running) - Microsoft Visual Studio (Administrator
	; GroupAdd  Visual_Studio_Group, Server (Debugging) - Microsoft Visual Studio (Administrator)
	GroupAdd  Visual_Studio_Group2, ahk_class HwndWrapper[DefaultDomain;;c7722442-799b-41d4-b81f-874cd5b6c13e]
	GroupAdd  Visual_Studio_Group2, ahk_class HwndWrapper[DefaultDomain;;57565d4a-be8d-4323-91a7-683b4bf99916]
	GroupAdd  chrome_Group,        ahk_exe chrome.exe
	GroupAdd  explorer_Group,      ahk_class CabinetWClass  ;ahk_exe explorer.exe
	GroupAdd  iprsRun,  	 	ahk_exe IPRS_Server.exe ;the console running server
	GroupAdd  iprsRun,  	 	ahk_exe iprs.exe ;the iprs apps
	GroupAdd  WireShark,  		ahk_exe Wireshark.exe
	GroupAdd  Terminals,  ahk_exe mintty.exe
	GroupAdd  Terminals,  ahk_exe cmd.exe
	GroupAdd  WordWindows, ahk_exe WINWORD.EXE
; §


; #include _VirtualWinBetter.ahk


; »  Moving to windows (Space pressed..)
	
	Space & g:: GroupActivate, gVim_Group, R        ; toggle between group members, last seen first
	Space & c::
		If !GetKeyState("Shift","p") {
		 	GroupActivate, chrome_Group, R
		} else {
			WinGet Count, List, ahk_exe chrome.exe  ;ahk_class metapad
			Loop %Count%
				GroupActivate, chrome_Group
		}
		return
	Space & e:: GroupActivate, explorer_Group, R
	Space & v:: GroupActivate, Visual_Studio_Group, R
		; WinActivate, Server - Microsoft Visual Studio (Administrator) ;ahk_exe devenv.exe
		; WinActivate, Server (Running) - Microsoft Visual Studio (Administrator)
		; WinActivate, Server (Debugging) - Microsoft Visual Studio (Administrator)
		; return
	; Space & 1:: GroupActivate, Visual_Studio_Group2, R
	Space & x::
		; a way to map {Space & x} and {Space & X} - with and whithout the shift key
		If !GetKeyState("Shift","p") {
		 	GroupActivate, iprsRun, R
		} else {
			GroupActivate, iprsRun, R
			GroupActivate, iprsRun, R
			GroupActivate, iprsRun, R
		}
		return
	Space & F14::
		GroupActivate, iprsRun, R
		GroupActivate, iprsRun, R
		GroupActivate, iprsRun, R
		return
	; Space & 2:: GroupActivate, WireShark, R
	Space & 4:: GroupActivate, WordWindows, R
	Space & t:: GroupActivate, Terminals, R
			;WinActivate, ahk_exe mintty.exe	; bash
	Space & d:: sendInput, #d			; Desktop
	Space & h:: WinActivate, ahk_class IEFrame		; internet explorer, for google translate
								; or: Google Translate - Internet Explorer
								; ahk_class IEFrame
								; ahk_exe iexplore.exe
	
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
	;Space & h:: sendInput, {Space}h
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
	Space & 0:: sendInput, {Space}0
	Space & 1:: sendInput, {Space}1
	Space & 2:: sendInput, {Space}2
	Space & 3:: sendInput, {Space}3
	; Space & 4:: sendInput, {Space}4
	Space & 5:: sendInput, {Space}5
	Space & 6:: sendInput, {Space}6
	Space & 7:: sendInput, {Space}7
	Space & 8:: sendInput, {Space}8
	Space & 9:: sendInput, {Space}9

    ; fix problems with going to gVim command line:...

	>!Space:: sendInput, !{Space}
	<!Space:: sendInput, !{Space}
	>^Space:: sendInput, ^{Space}
	<^Space:: sendInput, ^{Space}

;________________________________________________________________________________§


;»  Resizing Window with Window key and jkli

	; # + jki works but #l doesnt work well (forces log off...)
	
	; <#k:: sendInput, #{Down}
	; <#j:: sendInput, #{Left}
	; <#i:: sendInput, #{Up}
	; <#l:: sendInput, #{Right}

	; #if GetKeyState("LWin",p)  fix this
	; l:: sendInput, #{Right}
;§


;»  gVim to work with Esc as alt, ctrl etc (Space as well)

	Esc & m:: sendInput, {Esc}m
	Esc & t:: sendInput, {Esc}t
	Esc & l:: sendInput, {Esc}l
	Esc & j:: sendInput, {Esc}j
	Esc & k:: sendInput, {Esc}k
	Esc & i:: sendInput, {Esc}i
	Esc & f:: sendInput, {Esc}f
	; Esc & {;}:: sendInput, {Esc}{;}
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

#ifWinActive, ahk_class TaskSwitcherWnd
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
		send, !d
		sendInput, C:\aRoot {Enter}{sleep 100}
		send, {Down}{Up}
		return
		
		
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



; was not working well but now it is

; ahk_class WinMergeWindowClassW
; ahk_exe WinMergeU.exe
#If WinActive("ahk_exe WinMergeU.exe") and WinmergeMod = 1
left::      SendInput, ^!{left}
right::     SendInput, ^!{right}
down::      SendInput, !{down}
up::        SendInput, !{up}
w::         Send, {Enter}^{s}^{w}
Capslock::
	WinmergeMod := 0
	MsgBox, 16, HOTKEYS WESLEY, Regular Regular Regular, 1.5
	return

; ahk_exe WinMergeU.exe
#If WinActive("ahk_class WinMergeWindowClassW") and WinmergeMod = 0
Capslock::
	WinmergeMod := 1
	MsgBox, 16, HOTKEYS WESLEY, Speed Speed Speed, 1.5
	return
;»


;»

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
#include google_translate_explorer.ahk
#include _Internet_Copy_CompareFiles.ahk
#include WindowMove.ahk

; Internet explorer on google translate... for easy translating
#ifWinActive, ahk_exe iexplore.exe
<!+::
	send, !+{Tab}
	return


; once was marker=´,¸
; vim:foldmethod=marker:fmr=»,§
