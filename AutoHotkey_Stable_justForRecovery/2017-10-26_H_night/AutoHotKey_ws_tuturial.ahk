; empty AutoHotkey Script file start with this defaults: 
{----------------------------------------------------------------------------------------------

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
}_______________________________________________________________________________________________


SetTitleMatchMode, 2 ; This let's any window that partially matches the given name get activated
{----------------------------------------------------------------------------------------------
; important before using (for example): 
									#ifWinActive, Task Switching"
; it will determine the behaviour of it

1: A window's title must start with the specified WinTitle to be a match.
2: A window's title can contain WinTitle anywhere inside it to be a match. 
3: A window's title must exactly match WinTitle to be a match.

; there is also slow and fast. defualt is fast maybe. see Internet if needed
}_______________________________________________________________________________________________


MsgBox You are currently using gvim

; see spy on Start menu for title names
{
; this one doesnt work: because if you see 
; in Alt-tab also the name and above explorer no name
#IfWinActive, explorer
F1::MsgBox This is explorer


}

; spaces seems to be ignored (at least in many cases..):
{
; for example, all this lines down do the same, 
; which is like pressing Winkey+d at F5 press

F5::       send,     #{d}		; Go to Desktop
F5::send,#{d}
      F5::    send,     #{d}
}_______________________________________________________________________________________________




F5::send, #{d}		; Go to Desktop (or restore from Desktop...)

; Hold both keys together, like F1 & g
{

F1 & v::WinActivate, Visual Studio
F1 & g::WinActivate, GVIM
#g::WinActivate, GVIM                 ; works the same as above
#c::WinActivate, Google Chrome

; Can we assign for F1 seperatly? it seems yes. if you hold it down it will wait. just like winkey
; and like alt and ctrl then you can press it as Ctrl and Alt do
}


How to combine keys:
{
send {LWIN}{l}{l}{l}    and    send {LWIN}lll    ; seems the same which is first winkey then the keys lll
F3:: send {LWIN}d         ; one after the other
F4:: send {LWIN}{d}       ; one after the other


#IfWinActive, GVIM	 	;>
F5:: WinActivate, Desktop	; BAD: doesnt go to Desktop..., I guess because the title name is not Desktop...
F5:: send {LWIN}{d}
				; first it do win and then d. but.. depending on the machine and it's speed there can be different behaviours: 
				; it might open Start menu and write d
				; or before Start menu activated it will do d key in the previous window
F5:: send llli              ; will press one after the other

on Thinkpad all this just do winkey:
F1:: send {LWIN}{d}{e}{v}	; 
F2:: send {LWIN}dev			; 


F5:: send, #{d};				do them together, does the job of going to desktop
F5:: send LWIN{d}; 			I gues dangerous... does weird combo of L then W etc maybe
}


; multiple commands with return:
F2::   ; {this line should be empty or else I see that only first command is being executed
	send, {LWIN}
	sleep, 100  ; not working good without the sleep cause stays still in the previous and not in what winkey opened
	send, dev	; first it do win and then d
	return
	}


Examples:
{
#IfWinActive, GVIM
F2:: send, {LWIN} sleep,100 send dev	
; different behaviours watched:
; 1 time: went to winkey and wrote ther sleep,100 send dev
; 2 time: winkey did pressed but still we were in Vim so the keys sleep... where activated one after the other...

F2::
	send, {LWIN}
	sleep, 100  ; not working good without the sleep cause stays still in the previous and not in what winkey opened
	send, dev	; first it do win and then d
	return

what the difference? send commands   vs   send, commands   ?
}



Stam or to check later: 
{
  {
!1::	send, !1    ;  should be in next line to enable next keys
	sleep, 200
	send, ^!{Tab}
return



#IfWinActive, Chrome
F1::MsgBox You are currently using Google Chrome
!w::MsgBox Google Chrome
}
	 {
	 ; !`::!{Tab}
; !`::Shift!AltTab
#IfWinActive, Chrome
; !i::Up
!j::Send,{Left}
!k::Send,{Down}
!i::Send,{Up}
!l::Send,{Right}
!,::Send, !{Left}
!.::Send, !{Right}
}
}



; ฎฐกฆงจป
; vim:foldmethod=marker:fmr={,}:tw=0 ts=4 sw=4
