<# Purpose:
- This is for automating the file names and destinations within the Downloads folder:

1) Name files that are downloaded by 9convert to not have that tag
2) Have anything download from 9convert transfered to 'video editing' folder
3) Organize where all the other files go, like images to images, and videos to videos, etc.
4) Unzips any folder and deletes the zipped one

Plan:
1) Make sure all the required folders are there and create them if they aren't
2) Filter out images, videos, and youtube downloaded files from the rest 

Notes to Self
-When concatting destination paths within a command, the parameter doesn't require a + symbol, otherwise it's counted as part of the string
#>

# Folder Destination references
$downloadsFolder = $HOME + '\Downloads'
$documentsFolder = $HOME + '\Documents'
$ytVideosFolder = $HOME + '\Videos\Youtube'
$videosFolder = $HOME + '\Videos'
$imagesFolder = $HOME + '\Pictures'
$musicFolder = $HOME + '\Music'

$destinations = @($ytVideosFolder, $videosFolder, $imagesFolder, $otherFolder, $musicFolder, $documentsFolder)

# File Specification references
$9convert = '\9convert.com - *' 
$imageExtensions = @('jpeg', 'jpg', 'png', 'webp', 'gif', 'jfif')
$videoExtensions = @('mov', 'MOV', 'MP4', 'mp4', 'avi')
$musicExtensions = @('mp3', 'wav', 'WAV')
$documentExtensions = @('pdf', 'docx', 'txt', 'pptx', 'html')

# Fills in missing folders/destinations
foreach ($destination in $destinations) {
    if (!(Test-Path $destination)) {
        New-Item -Path $destination -ItemType Directory -f
    }
}

# Movies files to the specific folder 
for (; ; ) {
    Move-Item -Path $downloadsFolder$9Convert -Destination $ytVideosFolder

    Get-ChildItem $ytVideosFolder'\9convert.com - *' |
    ForEach-Object {Rename-Item $_ -NewName ($_.name -replace '9convert.com - ', '')}

    foreach ($extension in $documentExtensions) {
        Move-Item -Path $downloadsFolder'\*.'$extension -Destination $documentsFolder
    }
    foreach ($extension in $imageExtensions) {
        Move-Item -Path $downloadsFolder'\*.'$extension -Destination $imagesFolder
    }
    foreach ($extension in $videoExtensions) {
        Move-Item -Path $downloadsFolder'\*.'$extension -Destination $videosFolder
    }
    foreach ($extension in $musicExtensions) {
        Move-Item -Path $downloadsFolder'\*.'$extension -Destination $musicFolder
    }

    Start-Sleep 1 #in seconds
} 
