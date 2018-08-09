#if WinActive("ahk_group Terminals")

^v::SendInput, +{Insert}
>!v::SendInput, ^{v}    ; seems to also work the same
