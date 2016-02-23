// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

// https://github.com/zurb/foundation-sites | bower install foundation-sites
//= require foundation

// http://stickyjs.com/ | https://github.com/garand/sticky
//= require jquery.sticky

// ============== ace editor
// https://ace.c9.io/#nav=howto
// https://github.com/ajaxorg/ace-builds
//= require ace
//= require mode-css
//= require mode-html_ruby
//= require mode-html
//= require mode-javascript
//= require theme-monokai
//= require ext-language_tools
// ============== /ace editor

//= require cable

$(function(){ $(document).foundation(); });

// ========= ace editors

$(document).ready(function(){
    ace.config.setDefaultValue("session", "useWorker", false);
    //ace.require("ace/ext/language_tools");

    var ace_editor_js = ace.edit("ace_editor_js");
    ace_editor_js.setTheme("ace/theme/monokai");
    ace_editor_js.getSession().setMode("ace/mode/javascript");
    //ace_editor_js.setReadOnly(true);
    //ace_editor_js.resize();
    ace_editor_js.setOptions({
        enableBasicAutocompletion: true,
        //enableSnippets: true,
        enableLiveAutocompletion: false
    });
    ace_editor_js.$blockScrolling = Infinity; // to disable a deprecation warning

    var ace_editor_css = ace.edit("ace_editor_css");
    ace_editor_css.setTheme("ace/theme/monokai");
    ace_editor_css.getSession().setMode("ace/mode/css");
    //ace_editor_css.setReadOnly(true);
    //ace_editor_css.resize();
    ace_editor_css.setOptions({
        enableBasicAutocompletion: true,
        //enableSnippets: true,
        enableLiveAutocompletion: false
    });
    ace_editor_css.$blockScrolling = Infinity; // to disable a deprecation warning
});

