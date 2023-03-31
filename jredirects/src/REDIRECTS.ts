import { redirects } from './_internals/types';

export const temporary: redirects={ //302
    // Write your redirects here:
    
    // Examples:
    'https://www.youtube.com/watch?v=dQw4w9WgXcQ': '/rick-roll', // external site
    '/example-destination-regex': /example-source-regex-\d/, // e.g. example-source-regex-3
    '/example-destination-array': ['/example-source-array-a', '/example-source-array-b', '/example-source-array-c'], //include multiple sources that redirect to the same destination
    '/example-destination': '/example-source',
};

export const permanent: redirects={ //301
    // Redirects here will be cached, so changing/deleting them in the future will not reflect immediately
    
    
};
