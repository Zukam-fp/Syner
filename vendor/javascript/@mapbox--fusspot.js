import r from"is-plain-obj";import e from"xtend";var n={};var t=r;var a=e;var i="value";var u="\n  ";var o={};o.assert=function(r,e){e=e||{};return function(n){var t=validate(r,n);if(t){var a=processMessage(t,e);e.apiName&&(a=e.apiName+": "+a);throw new Error(a)}}};o.shape=function shape(r){var e=objectEntries(r);return function shapeValidator(r){var n=validate(o.plainObject,r);if(n)return n;var t,a;var f=[];for(var l=0;l<e.length;l++){t=e[l].key;a=e[l].value;n=validate(a,r[t]);n&&f.push([t].concat(n))}return f.length<2?f[0]:function(r){f=f.map((function(e){var n=e[0];var t=processMessage(e,r).split("\n").join(u);return"- "+n+": "+t}));var e=r.path.join(".");var n=e===i?"":" of "+e;return"The following properties"+n+" have invalid values:"+u+f.join(u)}}};o.strictShape=function strictShape(r){var e=o.shape(r);return function strictShapeValidator(n){var t=e(n);if(t)return t;var a=Object.keys(n).reduce((function(e,n){void 0===r[n]&&e.push(n);return e}),[]);return 0!==a.length?function(){return"The following keys are invalid: "+a.join(", ")}:void 0}};o.arrayOf=function arrayOf(r){return createArrayValidator(r)};o.tuple=function tuple(){var r=Array.isArray(arguments[0])?arguments[0]:Array.prototype.slice.call(arguments);return createArrayValidator(r)};function createArrayValidator(r){var e=Array.isArray(r);var getValidator=function(n){return e?r[n]:r};return function arrayValidator(n){var t=validate(o.plainArray,n);if(t)return t;if(e&&n.length!==r.length)return"an array with "+r.length+" items";for(var a=0;a<n.length;a++){t=validate(getValidator(a),n[a]);if(t)return[a].concat(t)}}}o.required=function required(r){function requiredValidator(e){return null==e?function(r){return formatErrorMessage(r,isArrayCulprit(r.path)?"cannot be undefined/null.":"is required.")}:r.apply(this,arguments)}requiredValidator.__required=true;return requiredValidator};o.oneOfType=function oneOfType(){var r=Array.isArray(arguments[0])?arguments[0]:Array.prototype.slice.call(arguments);return function oneOfTypeValidator(e){var n=r.map((function(r){return validate(r,e)})).filter(Boolean);if(n.length===r.length)return n.every((function(r){return 1===r.length&&"string"===typeof r[0]}))?orList(n.map((function(r){return r[0]}))):n.reduce((function(r,e){return e.length>r.length?e:r}))}};o.equal=function equal(r){return function equalValidator(e){if(e!==r)return JSON.stringify(r)}};o.oneOf=function oneOf(){var r=Array.isArray(arguments[0])?arguments[0]:Array.prototype.slice.call(arguments);var e=r.map((function(r){return o.equal(r)}));return o.oneOfType.apply(this,e)};o.range=function range(r){var e=r[0];var n=r[1];return function rangeValidator(r){var t=validate(o.number,r);if(t||r<e||r>n)return"number between "+e+" & "+n+" (inclusive)"}};o.any=function any(){};o.boolean=function boolean(r){if("boolean"!==typeof r)return"boolean"};o.number=function number(r){if("number"!==typeof r)return"number"};o.plainArray=function plainArray(r){if(!Array.isArray(r))return"array"};o.plainObject=function plainObject(r){if(!t(r))return"object"};o.string=function string(r){if("string"!==typeof r)return"string"};o.func=function func(r){if("function"!==typeof r)return"function"};function validate(r,e){if(null!=e||r.hasOwnProperty("__required")){var n=r(e);return n?Array.isArray(n)?n:[n]:void 0}}function processMessage(r,e){var n=r.length;var t=r[n-1];var u=r.slice(0,n-1);0===u.length&&(u=[i]);e=a(e,{path:u});return"function"===typeof t?t(e):formatErrorMessage(e,prettifyResult(t))}function orList(r){return r.length<2?r[0]:2===r.length?r.join(" or "):r.slice(0,-1).join(", ")+", or "+r.slice(-1)}function prettifyResult(r){return"must be "+addArticle(r)+"."}function addArticle(r){return/^an? /.test(r)?r:/^[aeiou]/i.test(r)?"an "+r:/^[a-z]/i.test(r)?"a "+r:r}function formatErrorMessage(r,e){var n=isArrayCulprit(r.path);var t=r.path.join(".")+" "+e;var a=n?"Item at position ":"";return a+t}function isArrayCulprit(r){return"number"==typeof r[r.length-1]||"number"==typeof r[0]}function objectEntries(r){return Object.keys(r||{}).map((function(e){return{key:e,value:r[e]}}))}o.validate=validate;o.processMessage=processMessage;n=o;var f=n;export default f;

