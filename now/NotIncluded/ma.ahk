#if 1
{ ;»
	#NoEnv
	SetKeyDelay, 2000	; 1000 is 1sec
	SetWorkingDir %A_ScriptDir%

	SetTitleMatchMode, 2 ; any window that partially matches
	
	

	; t:: Send, ll
	; y:: SendInput, l
	; Differences: 
		; hitting t will imediattly do l but then all the script waits for Delay time (including other keys - but only from the script here, that means y will wait to but not other keys)
		; y is like l. even if you hold eat pressed.
		
		; Bottom line: Delay is after the key.
	
	; if I do another script with the same key mapped, it seems the one executed 
		; last will be the one working
	F13:: SendInput, {F13}
	F13 & f:: SendInput, {F13}s
	; F13 & d:: Send, l


	; Abou  Delay:
	; t:: Send, lll

	; when you push firsl l is righl laway. l
} ;§


; vim:foldmethod=marker:fmr=»,§
