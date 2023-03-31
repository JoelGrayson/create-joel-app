/** @type {import('next').NextConfig} */

const jredirects=require('./redirect/main');

module.exports={
    reactStrictMode: true,
    swcMinify: true,
    redirects: jredirects
};
