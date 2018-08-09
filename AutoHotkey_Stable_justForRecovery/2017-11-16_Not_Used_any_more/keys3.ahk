#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 2  ; any window that partially matches..

GroupAdd VimGroup, ahk_exe WINWORD.exe ; Word
GroupAdd VimGroup, ahk_exe WinMergeU.exe
GroupAdd VimGroup, ahk_exe explorer.exe

vimMode := 1

; Change mode
F1::
	if (vimMode = 0){
		vimMode := 1
	}
	else{
		MsgBox, 00000000000000000 wil bekkkkkkkkkk
		vimMode := 0
	}
return

; #if (num = 0)
; r::  MsgBox r is no painyg 00000000

#If WInActive("ahk_group VimGroup") and (vimMode = 1)
	i:: send, {Up}
	k:: send, {Down}
	j:: send, {Left}
	l:: send, {Right}
	o:: send, {Enter}


; if (vimMode = 1)
; {
	; i:: send, {Up}
	; k:: send, {Down}
	; j:: send, {Left}
	; l:: send, {Right}
	; o:: send, {Enter}
; }
; else{
	
; }





; if (num > 0){
  ; r::  MsgBox r is no painyg this
; }
; else{
; r:: MsgBox r is bbbbbbbbbbbbbbbbbbbbb
; }
