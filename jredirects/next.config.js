/** @type {import('next').NextConfig} */

const jredirects=require('./jredirects/dist/main').default();

module.exports={
    reactStrictMode: true,
    swcMinify: true,
    redirects: jredirects
};
