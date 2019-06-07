#!/bin/bash
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Push Hugo content 
echo -e "\033[0;32m Push codes to knightwupz-hugo...\033[0m"
git add -A
git commit -m "$msg"
git push origin master

# Build the project.
hugo --theme=jane # if using another theme, replace by `hugo -t <yourtheme>`

echo -e "\033[0;32m  Build blog websites in public file ...\033[0m"
# Go To Public folder
cd public
# Add changes to git.
echo -e "\033[0;32m Push blogs to knightwupz.github.io...\033[0m"
git add -A
git commit -m "$msg"
# Push source and build repos.
git push origin master

echo -e "\033[0;32m Return to knightwupz-hugo...\033[0m"

# Come Back
cd ..
