$cwd = pwd

cd "$env:USERPROFILE\IdeaProjects\bruno-collections"

Write-Host "Adding changes to git..."
git add -A

Write-Host "Committing changes..."
git commit -m "Changes"

Write-Host "Pushing to remote repository..."
git push

cd $cwd

Write-Host "Done."
