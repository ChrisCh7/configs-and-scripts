# Define the target folder path
$targetFolder = "$HOME\Aliases"

# Create the Aliases folder if it doesn't exist
if (!(Test-Path -Path $targetFolder -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $targetFolder
    Write-Host "Aliases folder created at $targetFolder"
} else {
    Write-Host "Aliases folder already exists at $targetFolder"
}

# Get the name of the currently running script
$currentScriptName = $MyInvocation.MyCommand.Name

# Copy all files except the currently running script to the Aliases folder
Get-ChildItem -Path . -File | Where-Object { $_.Name -ne $currentScriptName } | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $targetFolder -Force
}

Write-Host "Files copied to $targetFolder (excluding '$currentScriptName')."

# Add the Aliases folder to the user's PATH environment variable
$oldPath = (Get-Item "HKCU:\Environment").GetValue("Path", $null, 'DoNotExpandEnvironmentNames')
if ($oldPath -eq $null) {
    $newPath = "$HOME\Aliases"
} else {
    $newPath = $oldPath + ";$HOME\Aliases"
}

# Check if the old path already contains the Aliases folder to avoid duplicates
$paths = $oldPath.Split(";")
if ($paths -notcontains "$HOME\Aliases") {
    Set-ItemProperty -Path "HKCU:\Environment" -Name Path -Value $newPath
    Write-Host "Aliases folder added to the PATH environment variable."
} else {
    Write-Host "Aliases folder is already in the PATH environment variable."
}

# Prompt to restart PowerShell or system for changes to take effect
Write-Host "Please restart PowerShell or your system for the PATH changes to take effect."
