; » Explanation (from Internet): 
	; Source: https://autohotkey.com/boards/viewtopic.php?f=6&t=12380
	; The guy who wrote Explanation: » 
	; I'm used to have several Chrome windows open, 
	; each window contains tabs on a specific research topic (or just thematically similar pages). 
	; That's why I created this simple script: 
	; now i see what Chrome window contains what by looking to TaskBar, 
	; so I don't need to search for specific window by clicking Chrome windows one by one.
	; On win+F2 it shows dialog, asking for new window's title. 
	; Then it keeps the title persistent (per script/window lifetime).
	; Titles must be unique. There is no way to cancel title change (tho, one can give same name to other window and previous will be left alone).
	
	; I've just made it and it's actually first script, so some things may be suboptimal or not pretty nuff. 
	; §
; §

#SingleInstance force
SetWorkingDir %A_ScriptDir% 


global Title 
global winDict := {0: 0}
winDict.Delete(0)
global hwnd
global refreshRate = 222    ; original: 222


Gui, Add, Text,, Title here
Gui, Add, Edit, vTitle
Gui, Add, Button, default, OK
GuiClose:
GuiEscape:    
	Gui, Hide
	return
ButtonOK:             
	Gui, Submit 
	if(Title)
	{
		WinSetTitle, ahk_id %hwnd%,, %Title%  
		winDict[hwnd] := Title
		Gui, Hide
		SetTimer, CheckWindowActive, %refreshRate%
	}
	return
  
#F2::
	SetTimer, CheckWindowActive, Off
	GuiControl, Text, Title,    
	hwnd := WinExist("A")  
	Gui, Show,, New window title  
	return


CheckWindowActive:
	for key, value in winDict
	{       
		If(key)
		IfWinActive, ahk_id %key%
		{
			SetTimer, CheckWindowActive, Off
			WinWaitNotActive, ahk_id %key%           
			if(value)                          
			WinSetTitle, ahk_id %key%,, %value%                                                
			SetTimer, CheckWindowActive, %refreshRate%
		}     
	}
	return

; vim:foldmethod=marker:fmr=»,§
