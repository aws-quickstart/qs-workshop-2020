#!/usr/bin/env bash

CURRENTDIR=${pwd}

# step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
echo "Name Repo for Workshop (I.E> Workshop-<Date>)?"
read REPO_NAME


# step 2:  the local project folder path
echo "What is the absolute path to your local project directory?"
read PROJECT_PATH

#echo "What is your github username?"
#read USERNAME

# step 3 : go to path
cd "$PROJECT_PATH"


# step 4: initialise the repo locally, create blank README, add and commit
git init
cp "$CURRENTDIR"/docs/content/README.adoc "$PROJECT_PATH"/README.adoc
mkdir -p docs/content
cp "$CURRENTDIR"/docs/content/*.yaml "$PROJECT_PATH"/docs/content/
cp "$CURRENTDIR"/docs/content/.taskcat.yaml "$PROJECT_PATH"/docs/content/
cp "$CURRENTDIR"/docs/code_snippets.txt "$PROJECT_PATH"/docs/
cp "$CURRENTDIR"/docs/*.pptx "$PROJECT_PATH"/docs/
git add .
git commit -m 'initial commit -setup with .sh script'


# NOT USED - step 5 use github API to log the user in
#curl -u ${USERNAME} https://api.github.com/user/repos -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}"

#  step 6 add the remote github repo to local repo and push
git remote add origin https://github.com/aws-quickstart/${REPO_NAME}.git
git push --set-upstream origin master

# step 7 change to your project's root directory.
cd "$PROJECT_PATH"

echo "Done. Go to https://github.com/aws-quickstart/$REPO_NAME to see."
echo " *** You're now in your project root. ***"
echo "Make Sure to update Repo README with workshop date and PSA name for Presenter"