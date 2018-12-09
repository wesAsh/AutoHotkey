WriteAndJump(ByRef str, ByRef vimmod)
{
	; @learn
	SendInput, %str%{Enter}
	sleep, 100
	ToolTip
	Sleep, 100
	; ModeDisplayToolTip(InternetVimMod)
	ModeDisplayToolTip(vimmod)
	; Send, !a
	return
}

#if WinActive("Tabli") and TabliMod = 1
; ▼
	; ▼ Tabli keys:
	;
	; | Action            | Key Sequence   | Notes                                                          |  |  |  |
	; |-------------------+----------------+----------------------------------------------------------------+--+--+--|
	; | Open Tabli Popup  | Ctrl-.         | Default keybinding, any browser window                         |  |  |  |
	; | Open Tabli Popout | Ctrl-,         | Default keybinding, any browser window                         |  |  |  |
	; | Activate Selected | Enter          | switch to selected window or tab                               |  |  |  |
	; | Expand / Collapse | ;              | Expand or collapse the window summary                          |  |  |  |
	; | Next Tab          | ↓              |                                                                |  |  |  |
	; | Previous Tab      | ↑              |                                                                |  |  |  |
	; | Next Window       | Ctrl-↓         |                                                                |  |  |  |
	; | Previous Window   | Ctrl-↑         |                                                                |  |  |  |
	; | Dismiss Tabli     | ESC            | Closes popup; returns keyboard focus to Current Browser Window |  |  |  |
	; | Edit Search Term  | all other keys |                                                                |  |  |  |
	;
	; ▲
	
	j::SendInput, {SC027}   ; this is how you send semicolon ';' @learn
	l::SendInput, {SC027}
	i::SendInput, {Up}
	k::SendInput, {Down}
	o::
	Space::
		SendInput, {Enter}
		sleep, 1000
		ModeDisplayToolTip(InternetVimMod)
		return
	Esc::
		ModeDisplayToolTip(TabliMod)
		return
	SC027::
	/::
		Toggle_Zero_One(TabliMod)
		ModeDisplayToolTip(TabliMod)
		return
	
	^i:: SendInput, ^{Up}
	^k:: SendInput, ^{Down}
	e:: Send, {SC027}^{Up}{SC027}
	d:: Send, {SC027}^{Down}{SC027}
	
	g:: WriteAndJump("Vim Awesome", InternetVimMod)
	c:: WriteAndJump("extensions", InternetVimMod)
	p:: WriteAndJump("cplusplus", InternetVimMod)
	,:: WriteAndJump("WebAim", InternetVimMod)
	w:: WriteAndJump("XWiki", InternetVimMod)
	; WriteAndJump("Nutrition Data", InternetVimMod)
	y:: WriteAndJump("ido portal", InternetVimMod)
	b:: WriteAndJump("Bash", InternetVimMod)
	a:: WriteAndJump("AutoHotkey", InternetVimMod)
; ▲
#if WinActive("Tabli") and TabliMod = 0
; ▼
	Esc::
		Toggle_Zero_One(TabliMod)
		ModeDisplayToolTip(TabliMod)
		return
; ▲





#if WinActive("ahk_group InternetGroup") and !WinActive("Tabli")
; ▼
	; #if WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe")
	Esc::
		;{
		SendInput, {Esc}
		InternetVimMod := 1
		ModeDisplayToolTip(InternetVimMod)
		return ;}
	; Ctrl+Tab and Ctrl+Shift+Tab works on most browsers to cycle tabs.. but a little problem with opera...
	; but Ctrl+PageUp and Ctrl+PageDown work on all of them. so I switched
	<!.::
	Space & .::
	!0:: send, ^{PgDn}           ; send, ^{Tab}
	Space & ,::
	<!,::
	!9:: send, ^{PgUp}         ; send, ^+{Tab}
	Space & b::
	!-:: send, !{Left}     ; backward
	!=:: send, !{Right}    ; forward again in directories =
	
	^l:: SendInput, ^{PgDn}
	^j:: SendInput, ^{PgUp}
	
	; focus on page content. can be done also by: SendInput, !{d}{F6}{F6}
	<!f:: SendInput, !{d}+{F6}
	
	Space & j::
	Space & h::
		;{
		Toggle_Zero_One(InternetVimMod)
		ModeDisplayToolTip(InternetVimMod)
		return ;}
	<!b:: 
		;{
		SendInput, !{d}{F6}
		sleep, 50
		Send, {Down}{Down}
		InternetVimMod:= 1
		ModeDisplayToolTip(InternetVimMod)
		return ;}
; ▲

#If WinActive("ahk_group InternetGroup") and InternetVimMod = 0
; ▼ nothing ; ▲

#If WinActive("ahk_group InternetGroup") and InternetVimMod = 1 and !WinActive("Tabli")
; ▼
	SC027::
		;{
		InternetVimMod := 0
		ModeDisplayToolTip(InternetVimMod)
		return ;}
	j::send, {Left}
	l::send, {Right}
	i::send, {Up}
	k::send, {Down}
	
	0:: send ^{PgDn}       ; send, ^{Tab}
	9:: send ^{PgUp}       ; send, ^+{Tab}
	d:: send {PgDn}
	e:: send {PgUp}
	
	f:: send !d{F6}{F6}
	h:: 
		ControlFocus , Chrome_RenderWidgetHostHWND1, A
		ControlMove ,Chrome_RenderWidgetHostHWND1, A
		return
	
	
	b::
	-:: send, !{Left}     ; backward
	+b::
	=:: send, !{Right}    ; forward again in directories =
	
; ▲

#If WinActive("ahk_group InternetGroup") and InternetVimMod = 3
; ▼ Not Used for now
	b::
	-:: send, !{Left}     ; backward
	=:: send, !{Right}    ; forward again in directories =
	
	
	j::send, {Esc}
	l::send, {Right}
	i::send, {Up}
	k::send, {Down}
	Space::
	o::
	Enter::
		;{
		send, {Enter}
		InternetVimMod:= 1
		ModeDisplayToolTip(InternetVimMod)
		return ;}
	Esc::
		;{
		send, !{d}{sleep 50}{Enter}
		InternetVimMod:= 1
		ModeDisplayToolTip(InternetVimMod)
		return ;}
; ▲




; ▼ youtube shortcuts to consider

; | Action                                             | Shortcut                               |
; |----------------------------------------------------+----------------------------------------|
; | Toggle play/pause the video                        | k or Spacebar                          |
; | Go back 5 seconds                                  | Left arrow                             |
; | Go back 10 seconds                                 | j                                      |
; | Go forward 5 seconds                               | Right arrow                            |
; | Go forward 10 seconds                              | l                                      |
; | Skip to a particular section of the video          | Numbers 1-9 (not the keypad numbers)   |
; | (e.g., 5 goes to the video midpoint)               |                                        |
; | Restart video                                      | 0 (not the keypad number)              |
; | Go to Full Screen mode                             | f                                      |
; | Exit Full Screen mode                              | Escape                                 |
; | Go to beginning of video                           | Home                                   |
; | Go to end of video                                 | End                                    |
; | Increase volume 5%                                 | Up arrow                               |
; | Decrease volume 5%                                 | Down arrow                             |
; | Increase speed                                     | Shift+> (may not work in all browsers) |
; |                                                    | or Shift+. (period)                    |
; | Decrease speed                                     | Shift+< (may not work in all browsers) |
; |                                                    | or Shift+, (comma)                     |
; | Move forward 1 frame when video is paused          | . (period)                             |
; | Move backward 1 frame when video is paused         | , (comma)                              |
; | Mute/unmute video                                  | m                                      |
; | Turn captions on/off                               | c                                      |
; | Cycle through options for caption background color | b                                      |
; | Move to the previous video in a playlist           | Shift+p                                |
; | Move to the next video in a playlist               | Shift+n                                |

; ▲





; vim:fdm=expr:foldexpr=FoldAHK()
