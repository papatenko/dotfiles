: ' 
What this version is for:
- Downloading anime thats listed array
Status
- Functional
'

animeList=(
	"Blue Lock"
	"Spy X Family Part 2"
	"Chainsaw Man"
	"Boku no Hero Academia 6th Season"
	"Mob Psycho 100 III"
	)

for animeName in "${animeList[@]}"; do
	echo $animeName
	animdl download --download-dir ~/Videos/anime/ --index 1 "$animeName"
done
