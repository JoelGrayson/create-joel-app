"use strict";
exports.__esModule = true;
var REDIRECTS_1 = require("./REDIRECTS");
var processRedirects_1 = require("./_internals/processRedirects");
function Redirects() {
    var arr1 = (0, processRedirects_1["default"])(REDIRECTS_1.permanent, true);
    var arr2 = (0, processRedirects_1["default"])(REDIRECTS_1.temporary, false);
    return arr1.concat(arr2); //return merged permanent & temporary arrays
}
exports["default"] = Redirects;
