#!/bin/bash

#Perevirka parametriv

if ["$#" -ne 2]; then
	echo "Pomilka: neobxidno vkazatu dva parametri."
	echo "Vikoristannya: $0 <shlyax_katalog> <shlyax_repo>"
	exit 1
fi

#Priyom parametriv

LOCAL_DIR = $1
REMOTE_REPO = $2


#Perexid y vkazaniy katalog

cd "$LOCAL_DIR" || {echo "Pomylka: Ne vdalosya pereyti v katalog $LOCAL_DIR "


#init repo

git init

#Dodavannya viddalenogo repository

git remote add origin "https://$GITHUB_USER:$GITHUB_TOKEN@github.com/REMOTE_REPO.git"

#dodavannya vsix files in repo

git add .

git commit -m "Initial commit"

git push -u origin main

echo "Code yspishno zavantazheno y repository"

