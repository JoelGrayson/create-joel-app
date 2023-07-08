#!/bin/bash

# Usage: npx create-joel-app your-package-name
#     or npx -y create-joel-app@latest your-package-name

read -rp "Would you like to include jredirects (easy redirect management)? (y/n) " include_redirects
[[ $include_redirects == "y" || $include_redirects == "yes" || $include_redirects == "" ]] && echo "Including jredirects" || echo "Not including jredirects"

### Installing Next ###
npx -y create-next-app@13 --typescript --use-npm --eslint --import-alias '@/*' "$1"
cd "$1"
npm i @jcomponents/header @jcomponents/nav @jcomponents/button
mkdir src/components
mkdir public/images


### JRedirects ###
if [[ $include_redirects == "y" || $include_redirects == "yes" || $include_redirects == "" ]]; then
    echo "Downloading jredirects.tgz from joelgrayson.com/software/create-joel-app/jredirects.tgz"
    curl -L https://joelgrayson.com/software/create-joel-app/jredirects.tgz -o jredirects.tgz
    tar -xf jredirects.tgz
    rm jredirects.tgz

    mv jredirects/next.config.js .

    # Make `npm run jredirects` script
    jq ".scripts.jredirects=\"cd jredirects && ./build.sh\"" package.json > tmp; cat tmp > package.json; rm tmp;

    # Initial creation of jredirects folder
    npm run jredirects
fi


### Files-to-transfer ###
curl -L https://joelgrayson.com/software/create-joel-app/files-to-transfer.tgz -o files-to-transfer.tgz
tar -xf files-to-transfer.tgz
rm files-to-transfer.tgz

mv files-to-transfer/fonts         src/styles
mv files-to-transfer/globals.css   src/styles/globals.css
mv files-to-transfer/Page.tsx      src/components
mv files-to-transfer/index.tsx     src/pages/index.tsx
mv files-to-transfer/logo.png      public/images/logo.png
mv files-to-transfer/tsconfig.json .


### Tailwind ###
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
mv files-to-transfer/tailwind.config.js .


### Clear Files ###
rm -rf files-to-transfer
echo "# $1" > README.md
rm src/styles/Home.module.css


### Starting Up ###
( sleep 2 && open http://localhost:3000 ) & #open after giving npm run dev time to start up
npm run dev
