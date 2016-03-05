ace.define("ace/ext/static_highlight",["require","exports","module","ace/edit_session","ace/layer/text","ace/config","ace/lib/dom"],function(e,t,i){"use strict";var n=e("../edit_session").EditSession,o=e("../layer/text").Text,s=".ace_static_highlight {font-family: 'Monaco', 'Menlo', 'Ubuntu Mono', 'Consolas', 'source-code-pro', 'Droid Sans Mono', monospace;font-size: 12px;white-space: pre-wrap}.ace_static_highlight .ace_gutter {width: 2em;text-align: right;padding: 0 3px 0 0;margin-right: 3px;}.ace_static_highlight.ace_show_gutter .ace_line {padding-left: 2.6em;}.ace_static_highlight .ace_line { position: relative; }.ace_static_highlight .ace_gutter-cell {-moz-user-select: -moz-none;-khtml-user-select: none;-webkit-user-select: none;user-select: none;top: 0;bottom: 0;left: 0;position: absolute;}.ace_static_highlight .ace_gutter-cell:before {content: counter(ace_line, decimal);counter-increment: ace_line;}.ace_static_highlight {counter-reset: ace_line;}",r=e("../config"),a=e("../lib/dom"),c=function(){this.config={}};c.prototype=o.prototype;var l=function(e,t,i){var n=e.className.match(/lang-(\w+)/),o=t.mode||n&&"ace/mode/"+n[1];if(!o)return!1;var s=t.theme||"ace/theme/textmate",r="",c=[];if(e.firstElementChild)for(var h=0,d=0;d<e.childNodes.length;d++){var g=e.childNodes[d];3==g.nodeType?(h+=g.data.length,r+=g.data):c.push(h,g)}else r=a.getInnerText(e),t.trim&&(r=r.trim());l.render(r,o,s,t.firstLineNumber,!t.showGutter,function(t){a.importCssString(t.css,"ace_highlight"),e.innerHTML=t.html;for(var n=e.firstChild.firstChild,o=0;o<c.length;o+=2){var s=t.session.doc.indexToPosition(c[o]),r=c[o+1],l=n.children[s.row];l&&l.appendChild(r)}i&&i()})};l.render=function(e,t,i,o,s,a){function c(){var n=l.renderSync(e,t,i,o,s);return a?a(n):n}var h=1,d=n.prototype.$modes;"string"==typeof i&&(h++,r.loadModule(["theme",i],function(e){i=e,--h||c()}));var g;return t&&"object"==typeof t&&!t.getTokenizer&&(g=t,t=g.path),"string"==typeof t&&(h++,r.loadModule(["mode",t],function(e){(!d[t]||g)&&(d[t]=new e.Mode(g)),t=d[t],--h||c()})),--h||c()},l.renderSync=function(e,t,i,o,r){o=parseInt(o||1,10);var a=new n("");a.setUseWorker(!1),a.setMode(t);var l=new c;l.setSession(a),a.setValue(e);for(var h=[],d=a.getLength(),g=0;d>g;g++)h.push("<div class='ace_line'>"),r||h.push("<span class='ace_gutter ace_gutter-cell' unselectable='on'></span>"),l.$renderLine(h,g,!0,!1),h.push("\n</div>");var u="<div class='"+i.cssClass+"'><div class='ace_static_highlight"+(r?"":" ace_show_gutter")+"' style='counter-reset:ace_line "+(o-1)+"'>"+h.join("")+"</div></div>";return l.destroy(),{css:s+i.cssText,html:u,session:a}},i.exports=l,i.exports.highlight=l}),function(){ace.require(["ace/ext/static_highlight"],function(){})}();