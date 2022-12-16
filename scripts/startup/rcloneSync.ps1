# Infinite loop that loops every 10 minutes
while($true)
{
	rclone sync ~/comp-sci-projects/ onedrive:my-projects/comp-sci-projects/ --create-empty-src-dirs
	rclone sync ~/Music onedrive:Music/
	
	Start-Sleep 600 
}
