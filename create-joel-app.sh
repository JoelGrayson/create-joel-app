#!/bin/bash

# Usage: npx create-joel-app your-package-name

npx create-next-app@13 --typescript --use-npm --eslint "$1"
cd "$1"
npm i @jcomponents/header @jcomponents/nav @jcomponents/button
mkdir src/components
mkdir public/images

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
open http://localhost:3000
npm run dev
