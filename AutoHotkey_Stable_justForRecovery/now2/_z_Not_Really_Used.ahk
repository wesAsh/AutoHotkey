<#g::WinActivate, ahk_exe gvim.exe	; also can work: GVIM (only if SetTitleMatchMode, 2)
<#c::WinActivate, ahk_exe chrome.exe
<#t::WinActivate, ahk_exe mintty.exe	; bash


Not working yet...

ToggleAsNeeded(a,b)
{
	ifWinActive, a
		GroupActivate, b
	else
		WinActivate, a
	return
}

