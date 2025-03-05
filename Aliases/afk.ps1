Add-Type -AssemblyName "System.Windows.Forms"

while ($true) {
    [System.Windows.Forms.SendKeys]::SendWait("+")  # Send Shift key press
    Start-Sleep -Seconds 30
}
