param(
    [int]$python_version
)

# Define base directory and paths
$base_dir = "$env:LOCALAPPDATA\Programs\Python"
$python_dir = "Python$python_version"
$python_path = Join-Path -Path $base_dir -ChildPath $python_dir
$scripts_path = Join-Path -Path $python_path -ChildPath "Scripts"

try {
    # Check if both directories exist
    if ((Test-Path -Path $python_path -PathType Container) -and (Test-Path -Path $scripts_path -PathType Container)) {
        # Temporarily add paths to PATH for this session
        $env:PATH = "$scripts_path;$python_path;$env:PATH"

        Write-Host "Found and added to PATH:"
        Write-Host $scripts_path
        Write-Host $python_path
    } else {
        throw "One or both directories not found."
    }
} catch {
    Write-Host "No Python installation found for version '$python_version' in '$base_dir'."
}
