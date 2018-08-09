#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%


SetTitleMatchMode, 2 ; any window that partially matches..


Capslock::Esc
; Esc::Capslock
RAlt::Ctrl
             
#if GetKeyState("Space")
; Switch to specific window (using it's title name)						{•
g:: WinActivate, GVIM
c:: WinActivate, Google Chrome
; 																		•}

