
What is better?:
»
if WinActive("ahk_exe explorer")
{
-:: send, <!{Left}
=:: send, <!{Right}
}

#ifWinActive, ahk_exe explorer.exe
-:: send, <!{Left}
=:: send, <!{Right}
¶¬


What is better? 
»
GroupAdd AltJKLI_Group, ahk_exe explorer.exe ; Start menu, Task Switching, windows explorer
GroupAdd AltJKLI_Group, ahk_exe devenv.exe	; Visual Studio
GroupAdd AltJKLI_Group, ahk_exe chrome.exe
#If WinActive("ahk_group AltJKLI_Group")
...

#if WinActive("Start menu") or WinActive("Google Chrome") or WinActive("ahk_class CabinetWClass")
...

#if WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe WinMergeU.exe") or WinActive("ahk_exe explorer.exe")
...
¬

Another way of writing. is it good?

#if WinActive("ahk_class" . CabinetWClass)


is this possible?
Activate zTryFast.ahk

; vim:foldmethod=marker:fmr=»,¬:tw=0 ts=4 sw=4
