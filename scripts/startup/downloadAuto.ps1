<# Purpose, Plan, and Notes to self

This is for automating the file names and destinations within the Downloads folder:
1) Name files that are downloaded by 9convert to not have that tag
2) Have anything download from 9convert transfered to "video editing" folder
3) Organize where all the other files go, like images to images, and videos to videos, etc.
4) Unzips any folder and deletes the zipped one

In order to accomplish that we need to:
1) Make sure all the required folders are there and create them if they aren't
2) Filter out images, videos, and youtube downloaded files from the rest 

-When concatting destination paths within a command, the parameter doesn't require a + symbol, otherwise it's counted as part of the string
#>

# Folder Destination references
$downloads = "$HOME\Downloads"
$documentsFolder = "$HOME\Documents"
$ytvideosFolder = $HOME + "\Videos\Youtube"
$videosFolder = $HOME + "\Videos"
$imagesFolder = $HOME + "\Pictures"
$musicFolder = $HOME + "\Music"

# File Specification references
$9convert = "\9convert.com - *" 
$imageExtensions = @("jpeg", "jpg", "png", "webp", "gif", "jfif")
$videoExtensions = @("mov", "MOV", "MP4", "mp4")
$musicExtensions = @("mp3", "wav")

# Create Folder Destinations if they don't exist
$destinations = @($ytvideosFolder, $videosFolder, $imagesFolder, $otherFolder, $musicFolder)
$documentExtensions = @("pdf", "docx", "txt")

# Create Folder Destinations if they don't exist
$destinations = @($ytvideosFolder, $videosFolder, $imagesFolder, $otherFolder, $musicFolder, $documentsFolder)

# Fills in missing folders
foreach ($dest in $destinations) {
    if (!(Test-Path $dest)) {
        #f is used to force the creation of directories the parent directory doesn't exist as well
        New-Item -Path $dest -ItemType Directory -f
    }
}

# Movies files to the specific destination 
for (; ; ) {
    Move-Item -Path $downloads$9Convert -Destination $ytvideosFolder

    foreach ($extension in $documentExtensions) {
        Move-Item -Path $downloads"\*."$extension -Destination $documentsFolder
    }
    foreach ($extension in $imageExtensions) {
        Move-Item -Path $downloads"\*."$extension -Destination $imagesFolder
    }
    foreach ($extension in $videoExtensions) {
        Move-Item -Path $downloads"\*."$extension -Destination $videosFolder
    }
    foreach ($extension in $musicExtensions) {
        Move-Item -Path $downloads"\*."$extension -Destination $musicFolder
    }

    Start-Sleep 1 # Pauses for 1 second
}
