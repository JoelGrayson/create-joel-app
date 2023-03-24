#!/bin/bash

# Usage: npx create-joel-app@latest luxpremierllc.com

npx create-next-app@latest --typescript --use-npm "$1"
npm i @jcomponents/header @jcomponents/nav @jcomponents/button

### Tailwind ###
cd "$1"
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
mkdir components


### Files-to-transfer ###
curl https://joelgrayson.com/software/create-joel-app/files-to-transfer.tgz -o files-to-transfer.tgz
tar -xf files-to-transfer.tgz
rm files-to-transfer.tgz

mv files-to-transfer/fonts       src/styles
cp files-to-transfer/globals.css src/styles/globals.css
cp files-to-transfer/Page.tsx    components
cp files-to-transfer/index.tsx   pages/index.tsx
sed -i "s/NAME_INSERTED_HERE/$1/g" pages/index.tsx
cp files-to-transfer/tsconfig.json .


### Clear Files ###
rm -rf files-to-transfer
echo "# $1" > README.md
rm src/styles/Home.module.css

