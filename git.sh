#!/bin/sh

# Author : Sarfaraz

# Color
green=$'\e[1;32m'
white=$'\e[0m'

# Script Goes Here....
echo $'\n'
echo $white"What do you like ? [new/pull/push/prod]"$white
read INPUT

if [[ $INPUT == "pull" || $INPUT == "Pull" || $INPUT == "PULL" ]]; 
then

    git pull origin main

    echo $'\n'
    echo $green"# Pull origin main success."$green

elif [[ $INPUT == "new" || $INPUT == "New" || $INPUT == "NEW" ]]; 
then

    echo $'\n'
    echo $white"# Please provide the git repo url. "$white

    read REPO_URL

    git init
    git add --all
    git commit -m "initial commit"
    git branch -M main
    git remote add origin ${REPO_URL}
    git push -u origin main

    echo $'\n'
    echo $green"# Successfully pushed to the main branch. "$green

elif [[ $INPUT == "push" || $INPUT == "Push" || $INPUT == "PUSH" ]]; 
then

    echo $'\n'
    echo $green"# Enter Your Commit:"$white

    read COMMIT

    git add --all

    git commit -m ${COMMIT}

    echo $'\n'
    echo $green"# Enter Your Branch Name:" $white

    read BRANCH

    echo $'\n'
    git checkout -b ${BRANCH}

    echo $'\n'
    echo $green"# Branch created successfully." $white

    echo $'\n'
    git push origin ${BRANCH}

    echo $'\n'
    echo  $green"# Successfully pushed to branch [ ${BRANCH} ]" $white

    echo $'\n'
    echo  $white"# Now please open a new pull request and uddhar koro amk" $white
elif [[ $INPUT == "prod" || $INPUT == "Prod" || $INPUT == "PROD" ]]; 
then

    DATE=$(date)
    PRODUCTION="prod"
    PRODUCTION_COMMIT="production at [ ~ ${DATE} ] "

    echo $'\n'
    echo $white"# Is branch [ ${PRODUCTION} ] exist:"$white

    read IS_EXIST

    echo $'\n'
    echo $green"# Going for production,wish me luck!"$white

    if [[ $IS_EXIST=="yes" || $IS_EXIST=="Yes" || $IS_EXIST=="YES" ]];
    then
        echo "Creating new [ ${PRODUCTION} ] branch."
        git add --all
        git commit -m "${PRODUCTION_COMMIT}"
        git checkout ${PRODUCTION}
        git push origin ${PRODUCTION}
    else
        echo "Pushing to [ ${PRODUCTION} ] branch."
        git add --all
        git commit -m "${PRODUCTION_COMMIT}"
        git checkout   ${PRODUCTION}
        git push origin ${PRODUCTION}
    fi
        
    echo $'\n'
    echo $green"# Successfully deployed production branch at [ ~ ${DATE} ] "$green
    echo $'\n'
    echo $green"# I have made,now github action will take care rest of it! "$green

else
     echo $'\n'
     echo $white"You have entered an invalid input. $INPUT" $white
fi