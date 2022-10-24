: ' 
What this version is for:
- Downloading anime thats listed in a array
Status
- Functional
'

animeList=(

	)

numLines=$(wc -l < $animeList) #Number of lines present in animeList file
((numLines++))

i=1 #Starting index

while [[ $i -le $numLines ]]; do
    	animeName="$(head -$i $processes | tail +$i)"
	animdl download --download-dir ~/Videos/anime/ --index 1 "$animeName"
	((i++))
done
