param (
    [string]$JdkVersion
)

if (-not $JdkVersion) {
    Write-Host "Usage: .\$($MyInvocation.MyCommand.Name) [JDK version number]"
    exit 1
}

# Define the base directory to search in
$BaseDir = "C:\Program Files\Eclipse Adoptium"

# Search for a folder starting with "jdk-$JdkVersion"
$MatchingFolder = Get-ChildItem -Path $BaseDir -Directory | Where-Object { $_.Name -like "jdk-$JdkVersion*" } | Select-Object -First 1

if ($MatchingFolder) {
    # Get the path to the "bin" folder
    $BinPath = Join-Path $MatchingFolder.FullName "bin"

    # Temporarily add the "bin" folder to the PATH for the current session
    $env:PATH = "$BinPath;$env:PATH"

    Write-Host "Found and added to PATH: $BinPath"
} else {
    Write-Host "No folder starting with 'jdk-$JdkVersion' was found in '$BaseDir'."
}
