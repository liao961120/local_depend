//     keymaster.js
//     (c) 2011-2013 Thomas Fuchs
//     keymaster.js may be freely distributed under the MIT license.
!function(n){var f,c={},u={16:!1,18:!1,17:!1,91:!1},t="all",
// modifier keys
a={"⇧":16,shift:16,"⌥":18,alt:18,option:18,"⌃":17,ctrl:17,control:17,"⌘":91,command:91},
// special keys
o={backspace:8,tab:9,clear:12,enter:13,return:13,esc:27,escape:27,space:32,left:37,up:38,right:39,down:40,del:46,delete:46,home:36,end:35,pageup:33,pagedown:34,",":188,".":190,"/":191,"`":192,"-":189,"=":187,";":186,"'":222,"[":219,"]":221,"\\":220},s=function(e){return o[e]||e.toUpperCase().charCodeAt(0)},d=[];for(f=1;f<20;f++)o["f"+f]=111+f;
// IE doesn't support Array#indexOf, so have a simple replacement
function p(e,n){for(var t=e.length;t--;)if(e[t]===n)return t;return-1}
// for comparing mods before unassignment
function h(e,n){if(e.length!=n.length)return!1;for(var t=0;t<e.length;t++)if(e[t]!==n[t])return!1;return!0}var g={16:"shiftKey",18:"altKey",17:"ctrlKey",91:"metaKey"};
// handle keydown event
function r(e){var n,t,o,r,i,l;// right command on webkit, command on Gecko
if(n=e.keyCode,-1==p(d,n)&&d.push(n),
// if a modifier key, set the key.<modifierkeyname> property to true and return
93!=n&&224!=n||(n=91),n in u)
// 'assignKey' from inside this closure is exported to window.key
for(o in u[n]=!0,a)a[o]==n&&(v[o]=!0);else
// see if we need to ignore the keypress (filter() can can be overridden)
// by default ignore key presses if a select, textarea, or input is focused
if(function(e){for(f in u)u[f]=e[g[f]]}(e),v.filter.call(this,e)&&n in c)
// for each potential shortcut
for(l=y(),r=0;r<c[n].length;r++)
// see if it's in the current scope
if((t=c[n][r]).scope==l||"all"==t.scope){for(o in
// check if modifiers match if any
i=0<t.mods.length,u)(!u[o]&&-1<p(t.mods,+o)||u[o]&&-1==p(t.mods,+o))&&(i=!1);
// call the handler and stop the event if neccessary
(0!=t.mods.length||u[16]||u[18]||u[17]||u[91])&&!i||!1===t.method(e,t)&&(e.preventDefault?e.preventDefault():e.returnValue=!1,e.stopPropagation&&e.stopPropagation(),e.cancelBubble&&(e.cancelBubble=!0))}
// abort if no potentially matching shortcuts found
}
// parse and assign shortcut
function v(e,n,t){var o,r;o=k(e),void 0===t&&(t=n,n="all");
// for each shortcut
for(var i=0;i<o.length;i++)
// set modifier keys if any
r=[],1<(e=o[i].split("+")).length&&(r=m(e),e=[e[e.length-1]]),
// convert to keycode and...
e=e[0],
// ...store handler
(e=s(e))in c||(c[e]=[]),c[e].push({shortcut:o[i],scope:n,method:t,key:o[i],mods:r})}
// initialize key.<modifier> to false
for(f in a)v[f]=!1;
// set current scope (default 'all')
function y(){return t||"all"}
// abstract key logic for assign and unassign
function k(e){var n;return""==(n=(e=e.replace(/\s/g,"")).split(","))[n.length-1]&&(n[n.length-2]+=","),n}
// abstract mods logic for assign and unassign
function m(e){for(var n=e.slice(0,e.length-1),t=0;t<n.length;t++)n[t]=a[n[t]];return n}
// cross-browser events
function e(e,n,t){e.addEventListener?e.addEventListener(n,t,!1):e.attachEvent&&e.attachEvent("on"+n,function(){t(window.event)})}
// set the handlers globally on document
e(document,"keydown",function(e){r(e)}),// Passing _scope to a callback to ensure it remains the same by execution. Fixes #48
e(document,"keyup",
// unset modifier keys on keyup
function(e){var n,t=e.keyCode,o=p(d,t);
// remove key from _downKeys
if(0<=o&&d.splice(o,1),93!=t&&224!=t||(t=91),t in u)for(n in u[t]=!1,a)a[n]==t&&(v[n]=!1)}),
// reset modifiers to false whenever the window is (re)focused.
e(window,"focus",function(){for(f in u)u[f]=!1;for(f in a)v[f]=!1});
// store previously defined key
var i=n.key;
// restore previously defined key and return reference to our key object
// set window.key and window.key.set/get/deleteScope, and the default filter
n.key=v,n.key.setScope=function(e){t=e||"all"},n.key.getScope=y,n.key.deleteScope=
// delete all handlers for a given scope
function(e){var n,t,o;for(n in c)for(t=c[n],o=0;o<t.length;)t[o].scope===e?t.splice(o,1):o++},n.key.filter=function(e){var n=(e.target||e.srcElement).tagName;
// ignore keypressed in any elements that support keyboard data input
return!("INPUT"==n||"SELECT"==n||"TEXTAREA"==n)},n.key.isPressed=
// Returns true if the key with code 'keyCode' is currently down
// Converts strings into key codes.
function(e){return"string"==typeof e&&(e=s(e)),-1!=p(d,e)},n.key.getPressedKeyCodes=function(){return d.slice(0)},n.key.noConflict=function(){var e=n.key;return n.key=i,e},n.key.unbind=
// unbind all handlers for given key in current scope
function(e,n){var t,o,r,i,l,f=[];for(t=k(e),i=0;i<t.length;i++){if(1<(o=t[i].split("+")).length&&(f=m(o),e=o[o.length-1]),e=s(e),void 0===n&&(n=y()),!c[e])return;for(r=0;r<c[e].length;r++)
// only clear handlers if correct scope and mods match
(l=c[e][r]).scope===n&&h(l.mods,f)&&(c[e][r]={})}},"undefined"!=typeof module&&(module.exports=v)}(this);