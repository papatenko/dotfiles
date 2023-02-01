: ' 
What this version is for:
- Downloading anime thats listed array
Status
- Functional
'

animeList=(
	"Boku no Hero Academia Season 6"
    "Tokyo Revengers: Seiya Kessen-hen"
	)

for animeName in "${animeList[@]}"; do
	animdl download --download-dir ~/Plex/Shows/ --index 1 "$animeName"
done
