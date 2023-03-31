#!/bin/bash

# ABOUT: Updates version, builds files-to-transfer, and publishes to the npm registry

tar -czf files-to-transfer.tgz files-to-transfer
tar -czf jredirects.tgz jredirects

# Ask for new version
echo "Current version: $(jq '.version' package.json)"
read -rp "New version: " new_version

# Update to new version
jq ".version=\"$new_version\"" package.json > tmp; cat tmp > package.json; rm tmp

# Deploy
npm publish

