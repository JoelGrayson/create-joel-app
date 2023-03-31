import { permanent, temporary } from './REDIRECTS';
import processRedirects from './_internals/processRedirects';

export default function Redirects() { //returns function to get redirect objects for next.config.js. Only async ∵ next.js documentation requires async functions for redirect value
    const arr1=processRedirects(permanent, true);
    const arr2=processRedirects(temporary, false);

    return arr1.concat(arr2); //return merged permanent & temporary arrays
}
