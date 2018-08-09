#include _a_Header_Diff_times.ahk

; » Names from Window Spy 
  ; | ahk_exe OUTLOOK.EXE |  |
  ; | Google Translate - Internet Explorer     |  |
  ; |                     |  |
; §

; » variables:
VSvimMod := 0
WinmergeMod := 1
InternetVimMod := 0
MPC_Mode := 1
WinSCP_Mod := 1
TortoiseMod := 1
; §

; » Alt + jkli  movement Group
	
	;   Arrows Replacement ~Vim Alt+jkli  Movements Group
	;   this one too must come before mappings to be relevant..
	
	GroupAdd AltJKLI_Group, ahk_exe explorer.exe     ; Start menu, Task Switching, windows explorer
	; GroupAdd AltJKLI_Group, ahk_exe devenv.exe       ; Visual Studio
	GroupAdd AltJKLI_Group, ahk_exe chrome.exe
	GroupAdd AltJKLI_Group, ahk_exe firefox.exe     ;ahk_class MozillaWindowClass
	GroupAdd AltJKLI_Group, ahk_exe opera.exe
	; GroupAdd AltJKLI_Group, ahk_exe WinMergeU.exe
	GroupAdd AltJKLI_Group, ahk_exe WINWORD.exe
	GroupAdd AltJKLI_Group, ahk_exe iexplore.exe    ; Internet Explorer
	GroupAdd AltJKLI_Group, ahk_exe WinSCP.exe
	GroupAdd AltJKLI_Group, ahk_group Terminals   ; although I did it in .profile in each of them maybe...
; §

; » Internet Group
	
	GroupAdd InternetGroup, ahk_exe chrome.exe
	GroupAdd InternetGroup, ahk_exe firefox.exe
	GroupAdd InternetGroup, ahk_exe opera.exe
	; GroupAdd InternetGroup, ahk_exe iexplore.exe
; §

; » Groups of Same Apps to toggle between them
	
	GroupAdd  gVim_Group,          ahk_exe gvim.exe
	
	GroupAdd  Visual_Studio_Group, ahk_exe devenv.exe
	; GroupAdd  Visual_Studio_Group, Server - Microsoft Visual Studio (Administrator)
	; GroupAdd  Visual_Studio_Group, Server (Running) - Microsoft Visual Studio (Administrator
	; GroupAdd  Visual_Studio_Group, Server (Debugging) - Microsoft Visual Studio (Administrator)
	GroupAdd  Visual_Studio_Group2, ahk_class HwndWrapper[DefaultDomain;;c7722442-799b-41d4-b81f-874cd5b6c13e]
	GroupAdd  Visual_Studio_Group2, ahk_class HwndWrapper[DefaultDomain;;57565d4a-be8d-4323-91a7-683b4bf99916]
	
	; GroupAdd  chrome_Group,        Others_Chrome
	; GroupAdd  chrome_Group,        Tabli
	GroupAdd  chrome_Group,        ahk_exe chrome.exe
	
	GroupAdd  mozilaFirefox,       ahk_exe firefox.exe
	GroupAdd  operaBrowser,        ahk_exe opera.exe
	
	GroupAdd  explorer_Group,      ahk_class CabinetWClass  ;ahk_exe explorer.exe
	; GroupAdd  explorer_Group,      ahk_class WinMergeWindowClassW
	
	GroupAdd  iprsRun,              ahk_exe IPRS_Server.exe ;the console running server
	GroupAdd  iprsRun,              ahk_exe iprs.exe ;the iprs apps
	GroupAdd  iprsRun,              ahk_exe MDC2000.exe
	GroupAdd  WireShark,            ahk_exe Wireshark.exe
	
	GroupAdd  WordWindows, ahk_exe WINWORD.EXE
	
	GroupAdd  Terminals,  ahk_exe mintty.exe
	GroupAdd  Terminals,  ahk_exe cmd.exe
	GroupAdd  Terminals,  ahk_exe putty.exe
	GroupAdd  Terminals2,  ahk_exe WinSCP.exe
; §

; » Groups of Same Title name (that I can give with other script) - but there is a problem unfortonato 
;   and now it can be any browser, and any other app. great
;   just remember to give this title names to windows you want. and make them uniqe.
;   great problem: some sites changes by themselves the title. so you no longer can use them.. blat
;   but when I changed the frequency it reloads... maybe OK. I hope. 
;   problem with youtube: it constantly frequentlly I guess changes it again and again (not when paused but 
;    when something is playing than...)
	GroupAdd  Cplusplus_Group, ahk_exe firefox.exe
	GroupAdd  Cplusplus_Group, CplusplusBrowse
	GroupAdd  gVimAHK_Group,   ahk_exe opera.exe
	GroupAdd  gVimAHK_Group,   gVim_AutoHotKey_ETC
	GroupAdd  Jira_ITO_mail,   Jira_ITO_mail
	GroupAdd  Jira_ITO_mail,   ahk_class IEFrame
	GroupAdd  Others_Chrome,   Others_Chrome
; §


ModeDisplayToolTipChange(ByRef val1)
{
	if (val1 == 0)
			val1:= 1
	else if (val1 == 1)
			val1:= 0
	
	ModeDisplayToolTip(val1)
	return
}

ModeDisplayToolTip(ByRef val1)
{
	; ToolTip
	if (val1 == 0)
		ToolTip, Insert, 0, 0
	else if (val1 == 1)
		ToolTip, NORMAL, 0, 0
	else if (val1 == 2)
		ToolTip, VISUAL, 0, 0
	return
}
; » before it was:
Func_explorer_Group:
	; ToolTip
	if (WinmergeMod == 0)
		ToolTip, Insert, 0, 0
	else if (WinmergeMod == 1)
		ToolTip, NORMAL, 0, 0
	return
Func_InternetGroup:
	if (InternetVimMod == 0)
		ToolTip, Insert, 0, 0
	else if (InternetVimMod == 1)
		ToolTip, NORMAL, 0, 0
	return
	; §


; »  Moving to windows (Space & key
; ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
	Space & g::     ; »
		ToolTip
		GroupActivate, gVim_Group, R        ; toggle between group members, last seen first
		return  ;§
	Space & c::     ; » chrome, All chrome
		Sleep 100
		If GetKeyState("Space","p") {
			If !GetKeyState("Shift","p") {
				if WinActive("ahk_group chrome_Group") {
					GroupActivate, chrome_Group, R
					while (WinActive("Tabli")) {
						GroupActivate, chrome_Group, R
					}
						
					; Gosub, Func_InternetGroup
					ModeDisplayToolTip(InternetVimMod)
				} else {
					WinActivate, Tabli
					}
			} else {
				WinGet Count, List, ahk_exe chrome.exe  ;ahk_class metapad
				Loop %Count%
					GroupActivate, chrome_Group
			}
		}
		else{
			sendInput, {Space}c
			}
		return  ;§
	Space & z::     ; » operaBrowser
		GroupActivate, gVimAHK_Group, R
		ModeDisplayToolTip(InternetVimMod)
		return  ;§
	Space & m:: GroupActivate, gVimAHK_Group, R
	Space & p::     ; »    mozilaFirefox
		GroupActivate, Cplusplus_Group, R
		ModeDisplayToolTip(InternetVimMod)
		return  ;§
	; Space & i ; » once
	; Space & i:: GroupActivate, Jira_ITO_mail, R
	; Space & i::
		; » Jira_ITO_mail
		; Sleep 100
		; If GetKeyState("Space","p") {
			
			; WinActivate, wesley.shabso@gmail.com - Gmail - Google Chrome
			; ;GroupActivate, Jira_ITO_mail, R
		; }
		; else{
			; sendInput, {Space}i
			; }
		; return 
		; §
		; §
	; Space & `:: GroupActivate, Others_Chrome, R
	Space & NUMPAD4:: WinActivate, ahk_exe OUTLOOK.EXE ; WinActivate, Mail - wesley.shabso@mobiletornado.com - Internet Explorer
	; Space & h::
	Space & 8::
	Space & NUMPAD5:: WinActivate, ahk_class IEFrame   ; »
					; WinActivate, Google Translate - Internet Explorer
					; » Or:
						; Google Translate      ; also chrome
						; ahk_class IEFrame     ; internet explorer, for google translate
						; Google Translate - Internet Explorer
						; ahk_exe iexplore.exe
					; §
					; §
	Space & e:: ; » explorer, and if in gVim and Space&E then open it in explorer
		If !GetKeyState("Shift","p") {
			; ToolTip
			GroupActivate, explorer_Group, R
			; Gosub, Func_explorer_Group
			ModeDisplayToolTip(WinmergeMod)
		}
		else{
			if WinActive("ahk_exe gvim.exe")
			{
				sendInput, cP
				sleep, 50
				GroupActivate, explorer_Group, R
				Gosub, Func_explorer_Group
				sendInput, !{d}{sleep 80}^{v}{sleep 80}{Enter}
			}
		}
		return
		; §
	Space & v:: GroupActivate, Visual_Studio_Group, R ; » see also:
		; WinActivate, Server - Microsoft Visual Studio (Administrator) ;ahk_exe devenv.exe
		; WinActivate, Server (Running) - Microsoft Visual Studio (Administrator)
		; WinActivate, Server (Debugging) - Microsoft Visual Studio (Administrator)
		; return
		; §
	; Space & 1:: GroupActivate, Visual_Studio_Group2, R
	Space & x:: ; »
		; a way to map {Space & x} and {Space & X} - with and whithout the shift key
		If !GetKeyState("Shift","p") {
			GroupActivate, iprsRun, R
		} else {
			GroupActivate, iprsRun, R
			GroupActivate, iprsRun, R
			GroupActivate, iprsRun, R
			GroupActivate, iprsRun, R
		}
		return
		; §
	; Space & 2:: GroupActivate, WireShark, R
	Space & 4:: ; »
		if WinActive("ahk_exe gvim.exe") {
			sendInput, {Space}4
		}
		else {
			GroupActivate, WordWindows, R
		}
		return
		; §
	Space & t:: ; » Terminals
		If !GetKeyState("Shift","p") {
			GroupActivate, Terminals, R
		} else {
			GroupActivate, Terminals2, R
			ModeDisplayToolTip(WinSCP_Mod)
		}
		return
		; §
	Space & y:: ; » WinSCP
		Sleep 50
		If GetKeyState("Space","p") {
			GroupActivate, Terminals2, R
			ModeDisplayToolTip(WinSCP_Mod)
		} else {
			sendInput, {Space}y
		}
		return ; §
	; Space & d:: sendInput, #d                 ; Desktop
	
; §■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■


;»  Fix Space isues
; ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
	; first of all, for Space to work alone.... just:
	;
		Space:: sendInput, {Space}
	
	; for gVim to work better (and work always!) for <Space><key> (one after the other) mapping:
	;
	; Space & a:: sendInput, {Space}a       see gVim Extend
	Space & b:: sendInput, {Space}b
	; Space & c:: sendInput, {Space}c
	Space & d:: sendInput, {Space}d
	; Space & e:: sendInput, {Space}e
	Space & f:: sendInput, {Space}f
	; Space & g:: sendInput, {Space}g
	;Space & h:: sendInput, {Space}h
	Space & i:: sendInput, {Space}i
	Space & j:: sendInput, {Space}j
	Space & k:: sendInput, {Space}k
	Space & l:: sendInput, {Space}l
	; Space & m:: sendInput, {Space}m
	Space & n:: sendInput, {Space}n
	; Space & o:: sendInput, {Space}o
	; Space & p:: sendInput, {Space}p
	Space & q:: sendInput, {Space}q
	Space & r:: sendInput, {Space}r
	Space & s:: sendInput, {Space}s
	; Space & t:: sendInput, {Space}t
	Space & u:: sendInput, {Space}u
	; Space & v:: sendInput, {Space}v
	Space & w:: sendInput, {Space}w
	; Space & x:: sendInput, {Space}x
	; Space & y:: sendInput, {Space}y
	; Space & z:: sendInput, {Space}z
	
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
	; Space & 8:: sendInput, {Space}8
	Space & 9:: sendInput, {Space}9
	; Space & `:: sendInput, {Space}`

    ; fix problems with going to gVim command line:...

	>!Space:: sendInput, !{Space}
	<!Space:: sendInput, !{Space}
	>^Space:: sendInput, ^{Space}
	<^Space:: sendInput, ^{Space}

;________________________________________________________________________________§


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

; window key seems stronger than ahk?? no... it is done with LWin...
; I want to dissable the language changing with Alt+shift. but it dissables combinations like Alt+shift+key... basa
; <#:: return
; Space & LWin:: sendInput, {LWin}
; LWin:: return
; <!+:: 
; <!Shift::return
; Space & LWin:: sendInput, !{Shift}
; !+]:: msgbox test

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


; #if WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe")
#if WinActive("ahk_group InternetGroup")
;»
	; Ctrl+Tab and Ctrl+Shift+Tab works on most browsers to cycle tabs.. but a little problem with opera...
	; but Ctrl+PageUp and Ctrl+PageDown work on all of them. so I switched
	<!.::
	Space & .::
	!0:: send, ^{PgDn}           ; send, ^{Tab}
	Space & ,::
	<!,::
	!9:: send, ^{PgUp}         ; send, ^+{Tab}
	Space & b::
	!-:: send, !{Left}     ; backward
	!=:: send, !{Right}    ; forward again in directories =
	
	; focus on page content. can be done also by: SendInput, !{d}{F6}{F6}
	<!f:: SendInput, !{d}+{F6}
	
	Space & h::
		if (InternetVimMod == 0) {
			InternetVimMod := 1
		}
		else if (InternetVimMod == 1) {
			InternetVimMod := 0
		}
		; Gosub, Func_InternetGroup
		ModeDisplayToolTip(InternetVimMod)
		return


#If WinActive("ahk_group InternetGroup") and InternetVimMod = 0
; Capslock::
; Space & h::
	; InternetVimMod := 1
	; MsgBox, 64, HOTKEYS WESLEY, Vim NORMAL Mode!!, 0.5
	; return


#If WinActive("ahk_group InternetGroup") and InternetVimMod = 1
; Capslock::
; Space & h::
	; InternetVimMod := 0
	; MsgBox, 16, HOTKEYS WESLEY, Regular, 0.5
	; return
; Space{l}::
0:: send ^{PgDn}       ; send, ^{Tab}
9:: send ^{PgUp}       ; send, ^+{Tab}
b::
-:: send, !{Left}     ; backward
=:: send, !{Right}    ; forward again in directories =

	j::send, {Left}
	l::send, {Right}
	i::send, {Up}
	k::send, {Down}
;§

#ifWinActive ahk_class IEFrame ; iexplore.exe    ; Internet Explorer
;»
; only Ctrl+Tab and Ctrl+Shift+Tab works on this browser to cycle tabs..
; Ctrl+PageUp and Ctrl+PageDown work on most but not this.
<!.::
Space & .::
!0:: send, ^{Tab}           ; send, ^{PgDn}
Space & ,::
<!,::
!9:: send, ^+{Tab}         ; send, ^{PgUp}
Space & b::
!-:: send, !{Left}     ; backward
!=:: send, !{Right}    ; forward again in directories =

; focus on page content. can be done also by: SendInput, !{d}{F6}{F6}
<!f:: SendInput, !{d}+{F6}


#If WinActive("ahk_class IEFrame") and InternetVimMod = 0
Capslock::
Space & h::
	InternetVimMod := 1
	MsgBox, 64, HOTKEYS WESLEY, Vim NORMAL Mode!!, 0.5
	return


#If WinActive("ahk_class IEFrame") and InternetVimMod = 1
Capslock::
Space & h::
	InternetVimMod := 0
	MsgBox, 16, HOTKEYS WESLEY, Regular, 0.5
	return
; Space{l}::
0:: send ^{Tab}       ; send, ^{PgDn}
9:: send ^+{Tab}       ; send, ^{PgUp}
b::
-:: send, !{Left}     ; backward
=:: send, !{Right}    ; forward again in directories =

	j::send, {Left}
	l::send, {Right}
	i::send, {Up}
	k::send, {Down}
;§


; » includes
#include _WordVimMod.ahk
#include _VS_GVIM_Interaction.ahk
#include _gVim_Extend_Keys.ahk
#include google_translate_explorer.ahk
#include _Internet_Copy_CompareFiles.ahk
#include WindowMove.ahk
#include _WinMergeU.ahk
#include _MPC.ahk
#include _WinSCP.ahk
#include _Explorer.ahk
#include _Terminals.ahk
; §

; Tabs Outliner (chrome.exe extension to mange tabs)


;» Stam Folding

;________________________________________________________________________________§



; once was marker=´,¸   »,§
; vim:foldmethod=expr:foldexpr=FoldAHK():tabstop=4:shiftwidth=4
