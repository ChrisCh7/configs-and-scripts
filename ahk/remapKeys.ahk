; CapsLock minimizes the active window
CapsLock::
    WinMinimize, A
    return

; Launch_Media toggles CapsLock
Launch_Media::
    SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
    return

; Win + Q closes the active window
#q::
    WinClose, A
    return
