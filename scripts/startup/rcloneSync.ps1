# Infinite loop that loops every 10 minutes
while($true)
{
	rclone sync ~/comp-sci/ onedrive:my-projects/comp-sci/ --create-empty-src-dirs
	rclone sync ~/dotfiles/ onedrive:my-backups/dotfiles/ --create-empty-src-dirs
	
	Start-Sleep 600 
}
