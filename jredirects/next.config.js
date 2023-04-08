/** @type {import('next').NextConfig} */

const jredirects=require('./jredirects/dist');

module.exports={
    reactStrictMode: true,
    swcMinify: true,
    redirects: jredirects
};
