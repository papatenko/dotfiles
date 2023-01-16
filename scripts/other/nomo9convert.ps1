$downloadsFolder = $HOME + '\Downloads'
for (; ; ) {
    Get-ChildItem $downloadsFolder'9convert.com - *' |
    ForEach-Object {Rename-Item $_ -NewName ($_.name -replace '9convert.com - ', '')}

    Start-Sleep 1 #in seconds
} 
