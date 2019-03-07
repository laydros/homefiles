#!/bin/bash

if [ "${1}" = "" ]; then
	echo "Please specify project name"
	exit 1
fi

GIT_REPO_DIR=$(pwd)

#if [ ! "${GIT_REPO_DIR}" = "/var/git/repo" ]; then
#	GIT_REPO_DIR="/var/git/repo"
#	cd ${GIT_REPO_DIR}
#fi

PROJECT_NAME=${1}

echo "Creating base project git repository"
mkdir "${PROJECT_NAME}.git"
cd "${PROJECT_NAME}.git"
git init --bare

echo "Setting permissions"
cd ..
chown -R root:developers "${PROJECT_NAME}.git"
chmod -R ug+rwx "${PROJECT_NAME}.git"

echo "${PROJECT_NAME} git repository ready in \"${PROJECT_NAME}.git\""
echo "To start working with this repository please run the following from the developer machine:"
echo "git clone <USER>@${HOSTNAME}:${GIT_REPO_DIR}/${PROJECT_NAME}.git"


