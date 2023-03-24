#!/bin/bash

# Usage: npx create-joel-app@latest luxpremierllc.com

npx create-next-app@13 --typescript --use-npm "$1"
cd "$1"
npm i @jcomponents/header @jcomponents/nav @jcomponents/button

### Tailwind ###
npm install -D tailwindcss
npx tailwindcss init
echo '''
/** @type {import("tailwindcss").Config} */ 
module.exports = {
    content: [
        "./src/**/*.{js,jsx,ts,tsx}",
    ],
    theme: {
        extend: {},
    },
    plugins: [],
}
''' > tailwind.config.js
mkdir src/components


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


### Clear Files ###
rm -rf files-to-transfer
echo "# $1" > README.md
rm src/styles/Home.module.css

