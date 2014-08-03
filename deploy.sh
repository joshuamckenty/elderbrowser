#!/bin/bash

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

cd site
# Build the project.
hugo

cd ../public
# Add changes to git.
git add -A .
cd ..

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
git subtree push --prefix=public git@github.com:joshuamckenty/elderbrowser.git gh-pages
