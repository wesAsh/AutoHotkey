#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 2  ; any window that partially matches..

Capslock::Esc			
RAlt::Ctrl			


num := 1

w::
    if (num > 0){
	    MsgBox num is
	    num := 0
    }
    else{
	num := 1
	MsgBox num is vas 0 nov 1
    }
return

; if (num > 0){
  ; r::  MsgBox r is no painyg this
; }
; else{
; r:: MsgBox r is bbbbbbbbbbbbbbbbbbbbb
; }


#if (num = 0)
r::  MsgBox r is no painyg 00000000

#if (num = 1)
r::  MsgBox r is no painyg 111111111


; Esc & h::send, esca and h

; <^g:: send, left ctrl
; >^g:: send, right ctrl
; <!g:: send, left alt
; >!g:: send, right alt
 ; #g:: send, window key maybe
; >!g:: send, right alt

; ^Capslock:: send, jjj

; #if GetKeyState("Space")
; Switch to specific window (using it's title name)
; g:: WinActivate, GVIM
; c:: WinActivate, Google Chrome
; Esc::Capslock			
