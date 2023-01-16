$downloadsFolder = $HOME + '\Downloads'
for (; ; ) {
    Get-ChildItem $downloadsFolder'9convert - *' |
    ForEach-Object {Rename-Item $_ -NewName ($_.name -replace '9convert - ', '')}

    Start-Sleep 1 #in seconds
} 
