#ifWinActive, ahk_exe gvim.exe
; ============ INSIDE GVIM ================================
Space & j:: sendInput, {Space}j
Space & a:: sendInput, {Space}a
; Space & e     see in keys.ahk maybe
Space & f:: ; »
	If GetKeyState("Shift","p")
	{
		IfWinNotExist ahk_class CabinetWClass
		return
		; in vimrc: nnoremap cP :let @+ = expand("%:p:h")<CR>
		Send, cP
		WinActivate, ahk_class CabinetWClass
		Send, !{d}^{v}{Enter}{Down}{Down}
		
		; ControlSend, ahk_parent, " ./ >> ../shello.h{Enter}
		; sendInput, {F8}{sleep 50}edit{sleep 30000}{Enter}
	}
	else
	{
			sendInput, {Space}f
	}
	return
	; §

; » Ctrl+key and Ctrl+Shift+key problem fixes..
; <C-1> etc doesn't work in vim. a known problem they say.
; a little solution for now:
; now if you type Ctrl-1 in gVim cmd then if there is no mapping for that, you will see <F15>1 is typed etc
^1:: sendInput, {f15}1
^2:: sendInput, {f15}2
^3:: sendInput, {f15}3
^4:: sendInput, {f15}4
^5:: sendInput, {f15}5
^6:: sendInput, {f15}6
^7:: sendInput, {f15}7
^8:: sendInput, {f15}8
^9:: sendInput, {f15}9
^0:: sendInput, {f15}0

^,:: sendInput, {f15},
^.:: sendInput, {f15}.

; annoying thing that <C-i> is like tab in vim... this one is a solution
; also: <C-I> was the same
^i:: sendInput, {f15}i
^+i:: sendInput, {f15}I
; §

^+t:: sendInput, {f15}T

#ifWinNotActive, ahk_exe gvim.exe

Space & a:: Send {Alt down}{tab}{Alt up}
	; CoordMode, ToolTip, Window
	; ToolTip, Multiline`nTooltip, 0, 0
	; return
		; sendInput, !{Tab}		didn't work good




; To have a ToolTip disappear after a certain amount of time
; without having to use Sleep (which stops the current thread):
; #Persistent
; ToolTip, Timed ToolTip`nThis will be displayed for 5 seconds.
; SetTimer, RemoveToolTip, 5000
; return

; RemoveToolTip:
; SetTimer, RemoveToolTip, Off
; ToolTip
; return

; vim:foldmethod=marker:fmr=»,§
