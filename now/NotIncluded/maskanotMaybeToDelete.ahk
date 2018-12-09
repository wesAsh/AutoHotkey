; =================== Example 1 ======================¸
^Capslock:: send, jjj
Capslock::Esc
RAlt::Ctrl
^Esc:: send, jjj

Behaviour 1:
regular ^Capslock and ^Esc  works. 
RAlt+Capslock and RAlt+Esc  does somewhat same wierd~~
´


; =================== Example 2 ======================¸
^Capslock:: send, jjj
Capslock::Esc
RAlt::Ctrl
^Esc:: send, jjj	; Work: Ctrl+Esc  Not: RAlt+Esc.  why the second dont work?...  also Not:RAt+Capslock
<!Esc:: send, eee	; RAlt+Esc dont. because RAlt changed before?
´


; =================== Example 3 ======================¸
Capslock::Esc			
; Esc::Capslock			
RAlt::Ctrl			
^Esc:: send, jjj	; Not: RAlt+Capslock 
			; Not:: RAlt+Esc
<!Esc:: send, eee		Nothing works (no RAlt no more?)
^Capslock:: send, jjj		only Ctrl+Capslock
´


; =================== Example 4 ======================¸
Capslock::Esc			
RAlt::Ctrl			
^ & Esc:: send, jjj		letter 6 and ^ which is Shift+6 stopped working
<!Esc:: send, eee
^Capslock:: send, jjj
´


; =================== Example 5 ======================¸
^r:: send, fff			; Works: RAlt+r  , even that RAlt::Ctrl come afterwards *
Capslock::Esc			
RAlt::Ctrl			

^f:: send, fff			; Works: RAlt+f *

* even that in gvim there are other mappings for <C-r> and <C-f>  it is overridden to fff... 
* but if I will do for example: nnoremap fff j       then it will do j on <C-r> and <C-f>
´


; =================== Example 6 : Ctrl & F1 is not like ^f etc..  F1 etc are also special?? ======================¸
Capslock::Esc
RAlt::Ctrl			
Ctrl & F1:: send, fff	; Not: RAlt+F1		Works: Ctrl+F1			F1 alone still available
^f:: send, fff			; Works: RAlt+f

; maskana: seems like those keys are also special. not like the regular a,b,c
; I also did in gvim: inoremap <F1> a
; holding down F1 generates aaaaaaaaa...
´


; =================== Example 7 ======================¸
Capslock::Esc			
RAlt::Ctrl			

F1 & Ctrl:: send, fff

; F1 alone is dissabled
; F1+ctrl works
; F1+RAlt  Not
´


; =================== Example 8 ======================¸
Capslock::Esc			
RAlt::Ctrl			

F1:: send, {F1}				; F1 without {} when on the right side is F then 1
F1 & Ctrl:: send, fff

; let say in gvim: inoremap <F1> a
; F1 down: nothing will happen until you unpress and then it is a.		i.e, it is like 1 press 
; that because it waits to F1 & somthing.

; F1 down and then Ctrl - fff
; F1 down and then RAlt - nothing happens.

; F1:: send, {F1}  above s
´

; =================== Example 0 ======================¸
Space & a:: send, a

; Space alone unavailabe
´ 


; =================== Example 0 ======================¸
Space & a:: send, a
Space::send, {Space}

Space alone availabe. but cant press down for many spaces
´

; =================== Example Order of execution of scripts ============¸
script1.ahk
Space::send, {Space}
Space & a:: send, a     baa 

script2.ahk
Space & b:: send, b

; if scripts2 executed after script1:  Space alone doesn't work.
; if scripts1 executed after script2:  Space alone works.
´


; =================== Example Resolve conflicts ======================¸
Space::send, {Space}
Space & a:: send, a

; but what about vim mappings that include Space then key? like
; nnoremap <Space>f  doSomething
; well it will still work, but when Space is still down and you hit f too quiclly then problematic

; simple solution: just add
Space & f:: send, {Space}f
´


; =================== Example 0 ======================¸

´
; =================== Example 0 ======================¸

´
; =================== Example 0 ======================¸

´
; =================== Example 0 ======================¸

´
; =================== Example 0 ======================¸

´
; =================== Example 0 ======================¸

´
; =================== Example 0 ======================¸

´
vnoremap F <Esc>o´<C-O>gvo<Esc>¸<Esc>

; vim:foldmethod=marker:fmr=¸,´:tw=0 ts=4 sw=4
