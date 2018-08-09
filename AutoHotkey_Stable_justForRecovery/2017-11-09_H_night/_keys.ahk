#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
							
							
SetTitleMatchMode, 3
;´
;    PUT AHEAD!! see my tuturial
;    2: any window that partially matches.. 
;    3: exactly match
;________________________________________________________________________________¸

;´  Arrows Replacement ~Vim Alt+jkli  Movements Group
;   this one too must come before mappings to be relevant..
;
GroupAdd AltJKLI_Group, ahk_exe explorer.exe	; Start menu, Task Switching, windows explorer
; GroupAdd AltJKLI_Group, ahk_exe devenv.exe		; Visual Studio
GroupAdd AltJKLI_Group, ahk_exe chrome.exe		; chrome google
GroupAdd AltJKLI_Group, ahk_exe WinMergeU.exe	; WinMerge
GroupAdd AltJKLI_Group, ahk_exe WINWORD.exe		; Word
;________________________________________________________________________________¸


GroupAdd  gVim_Group,          ahk_exe gvim.exe
GroupAdd  Visual_Studio_Group, ahk_exe devenv.exe
GroupAdd  chrome_Group,        ahk_exe chrome.exe
GroupAdd  explorer_Group,      ahk_class CabinetWClass	;ahk_exe explorer.exe

#include _VirtualWinBetter.ahk


;´  Better way to Move to Window? (Toggle between same App instances)
; but unfortonato makes a bit problems, seems to open also from other Virtual Windows...
; gVim seems working fine though
;

; GroupActivate works great with gVim, but when I go to other window, it doesnt return to the last active gVim. 
; here is fix example... 
Space & g:: 
	ifWinActive, ahk_exe gvim.exe
		GroupActivate, gVim_Group
	else
		WinActivate, ahk_exe gvim.exe
	return
	
Space & v:: WinActivate, ahk_exe devenv.exe
; Space & v:: GroupActivate, Visual_Studio_Group	; Not working well, I dont know why
Space & c:: WinActivate, ahk_exe chrome.exe
; Space & e:: WinActivate, ahk_exe explorer.exe		; not working good?..
Space & e:: GroupActivate, explorer_Group		; the problem is that it finds windows from other virtual windows... so close them when not needed. easy to open them...
; Space & e:: WinActivate, ahk_class CabinetWClass	; window explorer
Space & d:: send, #d								; Desktop


Space & t:: WinActivate, ahk_exe mintty.exe			; bash

; for gvim to not delay due to the space use here:
Space & f:: send, {Space}f
Space & q:: send, {Space}q
Space & s:: send, {Space}s
Space & w:: send, {Space}w

Space & .:: send, {Space}.
Space & ,:: send, {Space},


; fix problems:...
>!Space:: sendInput, !{Space}
<!Space:: sendInput, !{Space}
>^Space:: sendInput, ^{Space}
<^Space:: sendInput, ^{Space}

;________________________________________________________________________________¸


;´  Alt-Tab freeze.  Vim jkli Style: 
;   first, freez the Task Switching with Ctrl+Alt+Tab:
;
; <!Capslock::send, ^!{Tab}
<!Esc::send, ^!{Tab}
Space & l:: send, ^!{Tab}
Space & o:: send, ^!{Tab}
Space & j:: send, ^!{Tab}
Space:: sendInput, {Space}    ; now it is faster with sendInput. to not make delays 
								; F1::send, ^!{Tab}
								; <!Tab::send, ^!{Tab}
								; <!Tab::send, <!^{Tab}
;________________________________________________________________________________¸


;´  #jki works but #l doesnt work well (forces log off...)
<#k:: sendInput, #{Down}
<#j:: sendInput, #{Left}
<#i:: sendInput, #{Up}
<#l:: sendInput, #{Right}

; #if GetKeyState("LWin")
; l:: sendInput, #{Right}

; <# & k:: sendInput, #{Down}
; <# & j:: sendInput, #{Left}
; <# & i:: sendInput, #{Up}
; <# & l:: sendInput, #{Right}
;________________________________________________________________________________¸


#ifWinActive, ahk_class TaskSwitcherWnd		; was: Task Switching
;´  Vim jkli move
j::send, {Left}
l::send, {Right}
i::send, {Up}
k::send, {Down}
; Space::Enter
o::Enter
;::Esc
;________________________________________________________________________________¸



; Task Switching: tried to Vim-jkli with alt pressed on, not working yet
;´
; Alt & j:: 
	; send, !{Left}, 100
	; return
; Alt & j::send, !{Left}
; !l::send, !{Right}
; Alt & i::send, {Up}
; Alt & k::send, !{Down}
;¸
; #if GetKeyState("Alt")
;´
; j::send, !{Left}
; l::send, !{Right}
; i::send, {Up}
; k::send, {Down}
;¸
 


#If WinActive("ahk_group AltJKLI_Group")
; navigate without Arrow keys in Start menu:
;´
<!j::send, {Left}
<!l::send, {Right}
<!i::send, {Up}
<!k::send, {Down}
;________________________________________________________________________________¸



#IfWinActive, ahk_exe gvim.exe
;´
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
;________________________________________________________________________________¸


#ifWinActive, ahk_exe explorer.exe
;´
; -:: send, <!{Left}
; =:: send, <!{Right}
^j:: send, !{Up}     ; backward up in directories
^l:: send, !{Down}    ; forward again in directories
;________________________________________________________________________________¸

; actually not suitable for ahk winmerge
; #If WinActive("ahk_class CabinetWClass") || WinActive("ahk_exe WinMergeU.exe")
#ifWinActive, ahk_class CabinetWClass
;´

!r::			; goto aRoot directory.´
!e::			; if I miss the button..
	send, !d
	sleep, 100
	send, C:\aRoot {Enter}
	; Adding space aftre aRoot helped 
	; for the case when we already in aRoot (it was going out of focus).
	sleep, 100
	send, {Down}{Up}
	return
;¸
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
;
!f::			; focus on the files´
	send, !d
	sleep, 100
	send, {Tab}{Tab}{Tab}{Tab}
	send, {Down}{Up}
	return
;¸

<!b:: 
Space & b:: sendInput, !{Up}
								; sendInput, <!{Up}   also works but An annoying beeping sound Is added
; ________________________________________________________________________________¸ 


; not working well
#ifWinActive, ahk_exe WinMergeU.exe
;´

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
;________________________________________________________________________________¸ 


#if WinActive("ahk_exe chrome.exe")
;´
<!.::
Space & .::
0:: send, ^{Tab}
Space & ,::
<!,::
9:: send, ^+{Tab}
Space & b::
-:: send, !{Left}     ; backward
=:: send, !{Right}    ; forward again in directories
; the problem with that is when you want to write 0 and 9
;¸


; Internet explorer on google translate... for easy translating
#ifWinActive, ahk_exe iexplore.exe
<!+::
 	send, !+{Tab}

#include _VimMod.ahk
#include _VS_GVIM_Interaction.ahk



; vim:foldmethod=marker:fmr=´,¸
