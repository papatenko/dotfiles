for (; ; ) {
	rclone sync ~/scripts/ onedrive:scripts/
	rclone sync ~/projects/randomWebsites onedrive:projects/compSci/current/randomWebsites --create-empty-src-dirs
	rclone sync ~/Music onedrive:Music/

	Start-Sleep 600 #Pauses for 10 minutes
}
