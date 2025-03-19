#!/bin/bash

#perevirka nayavnosti dvox parametriv

if [ "$#" -ne 2]; then
	echo "Error: neobxidno vkazati dva parametra"
	echo "Vikorystannya: $0 <katalog> <repository>"
	exit 1
fi

#Parametri
LOCAL_DIR=$1
REMOTE_REPO=$2

#PEREXID Y KATALOG

cd "$LOCAL_DIR" || {echo "Error: ne vdalosya pereyti do katalogy $LOCAL_DIR"

#Init git
git init

#Dodavannya repo

git remote add origin "$REMOTE_REPO"

git add .

git commit -m "Initial commit"

git push -u origin main

echo "Code yspishno dodano do repository"
