# Define paths
$source = "$env:USERPROFILE\Documents\BrunoCollections"
$destination = "$env:USERPROFILE\IdeaProjects\bruno-collections"

# Copy all content from source to destination, overwriting existing files
Write-Host "Copying files from $source to $destination..."
Copy-Item -Path "$source\*" -Destination $destination -Recurse -Force

# Change to destination directory
Set-Location $destination

# Run Git commands
Write-Host "Adding changes to git..."
git add -A

Write-Host "Committing changes..."
git commit -m "Changes"

Write-Host "Pushing to remote repository..."
git push

Write-Host "Done."
