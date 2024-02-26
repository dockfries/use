#SingleInstance

if not A_IsAdmin
{
    Run("*RunAs `"" A_ScriptFullPath "`"")
    ExitApp()
}

ProcessSetPriority("H")

SetCapsLockState("AlwaysOff")
SetStoreCapsLockMode(false)

toggleCapsLock()
{ 
    Send("{CapsLock}")
    Return
}

Capslock::
    {
        KeyWait("CapsLock")
        If (A_TimeSinceThisHotkey > 300)
            SetTimer(toggleCapsLock,-1)
        Else
            Send("^{Space}")
        Return
    }

Alt::Return

$^q::
    {
        Send("{Alt Down}{F4}{Alt Up}")
        Return
    } 

$^Backspace::
    {
        Send("+{Home}{Delete}")
        Return
    } 

$!Backspace::
    {
        Send("^+{Left}{Delete}")
        Return
    }

$!Left::
    { 
        Send("^{Left}")
        Return
    } 
$!Right::
    {
        Send("^{Right}")
        Return
    } 

$!+Left::
    {
        Send("^+{Left}")
        Return
    }

$!+Right::
    {
        Send("^+{Right}")
        Return
    } 
$^Left::
    {
        Send("{Home}")
        Return
    } 
$^Right::
    {
        Send("{End}")
        Return
    } 
$^+Left::
    {
        Send("+{Home}")
        Return
    } 
$^+Right::
    {
        Send("+{End}")
        Return
    }

    LCtrl & Tab:: AltTab

#c::
    { 
        Send("^{c}")
        Return
    }

#g::
    { 
        Send("^{g}")
        Return
    }

    #HotIf WinActive("ahk_class CabinetWClass")
    {
        ^[::
            {
                Send("!{Left}")
                Return
            }

        ^]::
            {
                Send("!{Right}")
                Return
            }
        Return
    }

    #HotIf WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe chrome.exe")
    {
        ^[::
            {
                Send("^+{Tab}")
                Return
            }

        ^]::
            {
                Send("^{Tab}")
                Return
            }

        ^!i::
            {
                Send("{F12}")
                Return
            }

        ^y::
            {
                Send("^{h}")
                Return
            }
        Return
    }

    #HotIf

