' Create a WScript Shell object
Set objShell = CreateObject("WScript.Shell")

' Specify the path to your batch file
batchFilePath = "intellij_default_browser.bat"

' Get the command line arguments passed to the VBScript
args = ""
For Each arg In WScript.Arguments
    args = args & " " & Chr(34) & arg & Chr(34)
Next

' Construct the command to execute the batch file with arguments
command = """" & batchFilePath & """" & args

' Execute the batch file with arguments, without opening a terminal window or waiting for it to finish
objShell.Run command, 0, False

' Clean up
Set objShell = Nothing