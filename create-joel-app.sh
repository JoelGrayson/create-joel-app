#!/bin/bash

# Usage: npx create-joel-app luxpremierllc.com

npx create-next-app --typescript --use-npm "$1"


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
''' > ./tailwind.config.js

### Styles ###
cp -r fonts styles
cat <<EOF > styles/global.css
/* <Tailwind> */
@tailwind base;
@tailwind components;
@tailwind utilities;
# </> */
/* <Tailwind */
@tailwind base;
@tailwind components;
@tailwind utilities;
/* > */

@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap'); /* Roboto of many weights */

/**|| <Font (sorted by boldness) */
@font-face {
    font-family: Avenir;
    src: url('./fonts/Avenir\ Book.ttf');
}
@font-face {
    font-family: AvenirMedium;
    src: url('./fonts/Avenir\ Medium.ttf');
}
@font-face {
    font-family: Myriad;
    src: url('./fonts/Myriad\ Pro\ Bold.ttf');
}
/* > */

/**|| <Globals */
html, body {
    padding: 0;  
    margin: 0;
    font-family: Avenir, AvenirMedium, Myriad Segoe UI, Roboto, Helvetica Neue, sans-serif;
}
*::selection { /* yellow highlight color */
    background-color: #f9c44d;
}
main p, main div, main button, main li { /* vertical padding in page */
    padding: 10px 0;
}
input[type='submit'] {
    cursor: pointer;
}
/* > */


/* <Tailwind */
@tailwind base;
@tailwind components;
@tailwind utilities;
/* > */

@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap'); /* Roboto of many weights */

/* <Map */
.map-container {
    background: white;
    height: 100%;
    width: 100%;
}
.map-container>div {
    height: 100%;
}
/* > */

/**|| <Font (sorted by boldness) */
@font-face {
    font-family: Avenir;
    src: url('./fonts/Avenir\ Book.ttf');
}
@font-face {
    font-family: AvenirMedium;
    src: url('./fonts/Avenir\ Medium.ttf');
}
@font-face {
    font-family: Myriad;
    src: url('./fonts/Myriad\ Pro\ Bold.ttf');
}
/* > */

/* <Globals> */
html, body {
    padding: 0;  
    margin: 0;
    font-family: Avenir, AvenirMedium, Myriad Segoe UI, Roboto, Helvetica Neue, sans-serif;
}
*::selection { /* yellow highlight color */
    background-color: #f9c44d;
}
/* main p, main div, main li { /* padding in page /
    padding: 10px;
} */
input[type='submit'] {
    cursor: pointer;
}
/* </> */


/* <DOMElements> */
/* Headers */
h1, h2, h3, h4, h5 {
    font-family: AvenirMedium;
    line-height: 1.8;
}
h1 { font-size: 3.4rem; font-family: Myriad; }
h2 { font-size: 2.1rem; }
h3 { font-size: 1.6rem; }
h4 { font-size: 1.3rem; }
h5 { font-size: 1.2rem; }
h6 { font-size: 1.1rem; }
small {
    font-size: 65%;
}
img.no-drag {
    -webkit-user-drag: none;
    user-select: none;
}
b {
    font-family: AvenirMedium;
}

/* Links */
a, .anchor {
    cursor: pointer;
}
a:not(.unstyled), .anchor:not(.unstyled) {
    color: #0000e1;
    text-decoration: underline;
}
a:not(.unstyled):hover, .anchor:not(.unstyled):hover
.gradient-text,
.gradient-text * { /* gradient text onHover */
    color: #fa00f2; /* backup for browsers not supporting text gradient */
    background: -webkit-linear-gradient(45deg, #fa00f2 0%, #000acd 60%, #00299d 100%); /* blue/purple gradient text */
    font-family: AvenirMedium;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-decoration: underline; /* does not work because of -webkit-background-clip */
}
a.no-underline, .anchor.no-underline {
    text-decoration: none;
}
a>.btn-red:hover,
.anchor>.btn-red:hover { /* .btn-red hover color is white */
    background-clip: unset;
    -webkit-text-fill-color: white;
    color: white;
    font-family: Avenir;
}
/* </> */

/**|| Custom Class Elements */
.j_container {
    /* @apply w-[100%] mx-auto leading-7 py-10; */
    width: 100%;
    margin: 0 auto;
    line-height: 1.75rem;
    padding: 0 2.5rem;
}
.j_ul {
    list-style-type: disc;
    list-style-position: inside;
}

/* Buttons */
.btn-red {
    background-color: #E21C21; /* red */
    color: white;

    /*border*/
    border: 2px solid #ED3A1E; /* slightly lighter */
    border-radius: 14px;
    font-size: 16px;
    padding: 8px 17px;
}
.btn-red:hover {
    background-color: #f9c44d;
    border-color: #ffd779;
}
.btn-red:active {
    background-color: #ffd064;
}

.j_max-w { /* page width */
    max-width: 800px;
}
/* </> */


/* <Modifying other CSS libraries */
.ant-segmented-item-selected {
    background-color: #ffd981 !important;
}
.MathJax>svg { display: inline; }
/* </> */
EOF

