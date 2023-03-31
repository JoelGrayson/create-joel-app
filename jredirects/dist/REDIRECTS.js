"use strict";
exports.__esModule = true;
exports.permanent = exports.temporary = void 0;
exports.temporary = {
    // Write your redirects here:
    // Examples:
    'https://www.youtube.com/watch?v=dQw4w9WgXcQ': '/rick-roll',
    '/example-destination-regex': /example-source-regex-\d/,
    '/example-destination-array': ['/example-source-array-a', '/example-source-array-b', '/example-source-array-c'],
    '/example-destination': '/example-source'
};
exports.permanent = { //301
// Redirects here will be cached, so changing/deleting them in the future will not reflect immediately
};
