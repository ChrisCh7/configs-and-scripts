# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
# settings
$env.config.buffer_editor = 'C:\Program Files\Notepad++\notepad++.exe'
$env.config.show_banner = false

# aliases
alias afk = pwsh -Command 'Add-Type -AssemblyName "System.Windows.Forms"; while ($true) { [System.Windows.Forms.SendKeys]::SendWait("+"); Start-Sleep -Seconds 30 }'
alias cmd-run = ^cmd /c
alias ps-run = ^pwsh -Command

# custom commands
def --env use-java [jdk_version: int] {
    let base_dir = "C:/Program Files/Eclipse Adoptium"

    try {
        # Search for a folder starting with "jdk-{jdk_version}"
        let matching_folder = (ls $base_dir | where name =~ $"jdk-($jdk_version).*" | first)

        # Get the path to the "bin" folder
        let bin_path = $"($matching_folder.name)\\bin"

        # Temporarily add the "bin" path to PATH for this session
        $env.PATH = $env.PATH | insert 0 $bin_path

        print $"Found and added to PATH: ($bin_path)"
    } catch {|e|
        print $"No folder starting with 'jdk-($jdk_version)' was found in '($base_dir)'."
    }
}

def --env use-python [python_version: int] {
    let base_dir = $"($env.LOCALAPPDATA)\\Programs\\Python"
    let python_dir = $"Python($python_version)"
    let python_path = $"($base_dir)\\($python_dir)"
    let scripts_path = $"($python_path)\\Scripts"

    try {
        # Check if both directories exist
        if ($python_path | path exists) and ($scripts_path | path exists) {
            # Temporarily add the paths to PATH for this session
            $env.PATH = $env.PATH | insert 0 $python_path
            $env.PATH = $env.PATH | insert 0 $scripts_path

            print "Found and added to PATH:"
            print [$scripts_path, $python_path]
        } else {
            throw "One or both directories not found."
        }
    } catch {|e|
        print $"No Python installation found for version '($python_version)' in '($base_dir)'."
    }
}
