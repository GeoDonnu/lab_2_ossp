
#!/bin/bash

#Zapyt shlyaxy do katalogy

read -p "Vvedit' shlyax do local katalogy: " LOCAL_DIR

#Zapyt do repository

read -p "Vvedit URL reposytory: "

#Perexid y katalog

cd "$LOCAL_DIR" || {echo "Error: ne vdalosya pereyti y katalog $LOCAL_DIR"

#Init local repo

git init

#dodavanya repo (yaksho nemae)

git remote add origin "$REMOTE_REPO"

git add .

git commit -m "Initial commit"

git push -u origin main

echo "File bylo dodano"
