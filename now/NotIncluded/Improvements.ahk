; »  Moving to windows (Space pressed..)
	
	; this 2 maps seems to be the same. so we will prefer the built in one...
	Space & g:: GroupActivate, gVim_Group, R
	Space & g:: 
		ifWinActive, ahk_exe gvim.exe
			GroupActivate, gVim_Group
		else
			WinActivate, ahk_exe gvim.exe
		return
	
	; » and also for the Others: 
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
	; §
; §


vim:foldmethod=marker:fmr=»,§
