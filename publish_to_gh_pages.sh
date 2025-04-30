#!/usr/bin/env bash
set -euo pipefail

# publish_to_gh_pages.sh - Build and publish Hugo site to GitHub Pages (user page)
# Usage: ./publish_to_gh_pages.sh
# Requires: hugo installed, git configured with push access.

# Configuration: your GitHub Pages repo URL
REPO_URL="https://github.com/CarsonFisher/CarsonFisher.github.io.git"
BRANCH="main"
SOURCE_DIR="landing/site"

# Create temporary directories for build and deploy
BUILD_DIR=$(mktemp -d)
DEPLOY_DIR=$(mktemp -d)

echo "Building Hugo site from ${SOURCE_DIR} to ${BUILD_DIR}" 
hugo --source "${SOURCE_DIR}" --destination "${BUILD_DIR}" --gc --minify

echo "Cloning ${BRANCH} branch from ${REPO_URL} into ${DEPLOY_DIR}" 
git clone --branch "${BRANCH}" "${REPO_URL}" "${DEPLOY_DIR}"

echo "Syncing built files into ${DEPLOY_DIR}" 
rsync -av --delete "${BUILD_DIR}/" "${DEPLOY_DIR}/" --exclude='.git'

cd "${DEPLOY_DIR}"

echo "Ensuring .nojekyll to bypass Jekyll" 
touch .nojekyll

if [ -n "$(git status --porcelain)" ]; then
  echo "Changes detected, committing and pushing to ${BRANCH}" 
  git add -A
  git commit -m "chore: publish Hugo site to GitHub Pages"
  git push origin "${BRANCH}"
else
  echo "No changes to publish"
fi

echo "Cleaning up..." 
rm -rf "${BUILD_DIR}" "${DEPLOY_DIR}" 
echo "Done."