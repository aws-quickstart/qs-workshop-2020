#!/usr/bin/env bash

CURRENTDIR=$(pwd)

echo $CURRENTDIR


# step 1: name of the remote repo you created under "https://github.com/aws-quickstart". Enter a SINGLE WORD ..or...separate with hyphens
echo "Name Repo for Workshop (I.E> Repo name from step #1 in README):"
read REPO_NAME


# step 2:  the local project folder path
echo "What is the absolute path to your local project directory?"
read PROJECT_PATH

#NOt USED - echo "What is your github username?"
#read USERNAME

# step 3 : create empty repo
cd ${PROJECT_PATH}
git init ${REPO_NAME}

LCLREPO=${PROJECT_PATH}/${REPO_NAME}

# step 4: goto local repo and copy in files, add and commit
cd $LCLREPO
mkdir -p docs/content
cp $CURRENTDIR/docs/content/README.adoc $LCLREPO/README.adoc
cp $CURRENTDIR/docs/content/*.yaml $LCLREPO/docs/content/
cp $CURRENTDIR/docs/content/.taskcat.yaml $LCLREPO/docs/content/
cp $CURRENTDIR/docs/code_snippets.txt $LCLREPO/docs/
cp $CURRENTDIR/docs/*.pptx $LCLREPO/docs/
git add .
git commit -m 'initial commit -setup with .sh script'


# NOT USED - step 5 use github API to log the user in
#curl -u ${USERNAME} https://api.github.com/user/repos -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}"

#  step 6 add the remote github repo to local repo and push
git remote add origin https://github.com/aws-quickstart/${REPO_NAME}.git
git push --set-upstream origin master

# step 7 change to your project's root directory.
cd $LCLREPO

echo "Done. Go to https://github.com/aws-quickstart/$REPO_NAME to see."
echo " *** You're now in your project root. ***"
echo "Make Sure to update Repo README with workshop date and PSA name for Presenter"