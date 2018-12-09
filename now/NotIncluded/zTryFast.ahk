#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
; --------------------------

SetTitleMatchMode, 2 ; any window that partially matches

; {Space}q:: WinActivate, ahk_class CabinetWClass     ; window explorer
; {Space}{m}:: MsgBox blablabla
#if GetKeyState("m", "m")
AppsKey & /::MsgBox Hotkey activated.

#if GetKeyState("3") && GetKeyState("3")
\::MsgBox asdfasdf

#ifWinActive, Task Switching
; {Alt down} & j:: send, {Alt down} & {Right}
!j:: send, l

; #ifWinActive, Task Switching
; {! down}l:: Send, {! down} & Right
; {<! down}:: Send, r

	; Return
; Alt & l::Send {<! down}Right
; Send {TAB down}{TAB up}
; Send {Up down}  ; Press down the up-arrow key.
; Sleep 1000  ; Keep it down for one second.
; Send {Up up}  ; Release the up-arrow key

; <!l::send, <! & {Right}
; Alt & j::send, Alt & {Left}	not work
; $<!l::send, !{Right}
; Alt & j::send, !{Left}
; <!l::send, <! & Right
; Alt & i::send, {Up}
; Alt & k::send, !{Down}
