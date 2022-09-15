for (; ; ) {
	rclone sync ~/scripts/ onedrive:projects/compSci/current/scripts/
	rclone sync ~/projects/other onedrive:projects/compSci/current/other/
	rclone sync ~/projects/randomWebsites onedrive:projects/compSci/current/randomWebsites --create-empty-src-dirs
	rclone sync ~/Music onedrive:Music/

	Start-Sleep 600 #Pauses for 10 minutes
}
