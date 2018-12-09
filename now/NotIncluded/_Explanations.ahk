About MsgBox:
| Function               | Decimal | Hex   |
|                        | Value   | Value |
|------------------------+---------+-------|
| Icon Hand (stop/error) | 16      | 0x10  |
| Icon Question          | 32      | 0x20  |
| Icon Exclamation       | 48      | 0x30  |
| Icon Asterisk (info)   | 64      | 0x40  |
|------------------------+---------+-------|

MsgBox, 16, HOTKEYS WESLEY, Vim INSERT!!, 0.5
msgbox, 32, hotkeys wesley, Vim VISUAL!!!!, 0.5
MsgBox, 64, HOTKEYS WESLEY, Vim NORMAL!!!!, 0.5


#ifWinActive, ahk_exe chrome.exe
#if WinActive("ahk_exe chrome.exe") ; also work well
#if WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe")


j::SendInput, {SC027}   ; this is how you send semicolon ';' @learn

; Positions:
; learn: Top-left = 0,0. Top-right = W,0. Bottom-right = W,H. Bottom-left = 0,H
