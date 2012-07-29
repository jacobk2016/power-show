/*
jQWidgets v2.3.0 (2012-July-13)
Copyright (c) 2011-2012 jQWidgets.
License: http://jqwidgets.com/license/
*/

(function(a){a.jqx.jqxWidget("jqxDocking","",{});a.extend(a.jqx._jqxDocking.prototype,{defineInstance:function(){this.orientation="horizontal";this.mode="default";this.floatingWindowOpacity=0.3;this.panelsRoundedCorners=true;this.disabled=false;this.width="auto";this.height="auto";this.windowsMode=null;this.cookies=false;this.cookieOptions={};this.windowsOffset=5;this._windowOptions={};this._draggedFired=false;this._dragging=false;this._draggingItem=null;this._panels=[];this._windows=[];this._indicator=null;this._events=["dragEnd","dragStart"]},createInstance:function(){this._refresh(true);if(this.disabled){this.disabled=false;this.disable()}},refresh:function(b){if(!b){this._performLayout()}},_refresh:function(b){this._render();this._removeClasses();this._addClasses();this._setWindowsOptions(true);this._performLayout();this._cookieHandler();this._cookieExporter();this._removeEventListeners();this._addEventListeners()},_addClasses:function(){this.host.addClass("jqx-docking");for(var b=0;b<this._panels.length;b+=1){this._panels[b].addClass(this.toThemeProperty("jqx-docking-panel"));if(this.panelsRoundedCorners){this._panels[b].addClass(this.toThemeProperty("jqx-rc-all"))}}for(var b=0;b<this._windows.length;b+=1){this._windows[b].addClass(this.toThemeProperty("jqx-docking-window"))}},_removeClasses:function(){this.host.removeClass("jqx-docking");for(var b=0;b<this._panels.length;b+=1){this._panels[b].removeClass(this.toThemeProperty("jqx-docking-panel"));this._panels[b].removeClass(this.toThemeProperty("jqx-rc-all"))}for(var b=0;b<this._windows.length;b+=1){this._windows[b].removeClass(this.toThemeProperty("jqx-docking-window"))}},_render:function(){var b=this.host.children("div"),d;for(var c=0;c<b.length;c+=1){this._panels.push(a(b[c]));this._renderWindows(a(b[c]))}},_renderWindows:function(b){var d=b.children("div");for(var c=0;c<d.length;c+=1){this._windows.push(a(d[c]));a(d[c]).jqxWindow({theme:this.theme,enableResize:false,width:a(d[c]).css("width"),maxWidth:Number.MAX_VALUE});a(d[c]).detach();b.append(a(d[c]))}b.append('<div class="spacer" style="clear: both;"></div>')},_performLayout:function(){this.host.css("width",this.width);this.host.css("height",this.height);this._performWindowsLayout();this._performPanelsLayout();this._performWindowsLayout()},_performPanelsLayout:function(){var b,e=this.host.width(),c=0;for(var d=0;d<this._panels.length;d+=1){b=this._panels[d];b.css("height","auto");if(this.orientation==="vertical"){b.css("width","auto");b.css("float","none")}else{c+=this._handleHorizontalSize(b,c,e);if(d>0){b.css("margin-left",-this.windowsOffset)}}b.css("min-width",b.width())}if(this.orientation==="horizontal"){if(c<e){this._fillContainer(e,c)}}},_handleHorizontalSize:function(b,c,g){var e=g/this._panels.length,d,f=(b.outerWidth()-b.width());b.css("float","left");if(b.css("width")==="auto"||parseInt(b.css("width"),10)===0){b.width(e-f)}if(c+b.outerWidth()>=g){if(c+e<g){d=e-f;b.css("min-width",d);b.width(d)}else{d=b.width()-((c+b.outerWidth())-g);b.css("min-width",d);b.width(d)}}return b.outerWidth()},_fillContainer:function(f,b){var d=this._panels.length,e=this._panels[d-1],c=f-b+e.width();if(a.browser.msie&&a.browser.version<9){c-=this._panels.length}e.width(c)},_performWindowsLayout:function(){var b;for(var c=0;c<this._windows.length;c+=1){b=this._getWindowOptions(this._windows[c]);this._windows[c].css("margin",this.windowsOffset);if(b){if(b.mode!=="floating"){this._windows[c].css("position","static")}}else{if(this.mode!=="floating"){this._windows[c].css("position","static")}}this._setWindowSize(this._windows[c])}},_setWindowSize:function(b){if(this.orientation==="vertical"){if(b.css("width")==="auto"||b.width()>b.parent().width()){b.jqxWindow("width",b.parent().width()-(b.outerWidth()-b.width())-2*this.windowsOffset)}}else{b.jqxWindow("width",b.parent().width()-(b.outerWidth()-b.width())-2*this.windowsOffset)}this._setWindowOption(b,"size",{width:b.width(),height:b.height()})},_setWindowsOptions:function(b){for(var f=0;f<this._windows.length;f+=1){var g,c=this._windows[f].attr("id"),d=this._getWindowOptions(c);if(!b){var e="TEDX"}g=null;if(this.windowsMode&&this.windowsMode.hasOwnProperty(c)){g=this.windowsMode[c];this._setWindowOption(this._windows[f],"mode",g)}else{if(typeof d!=="undefined"&&typeof d.mode==="undefined"){g=this.mode;this._setWindowOption(this._windows[f],"mode",g)}}if(b){this._setWindowOption(this._windows[f],"resizable",true);if(g=="floating"){this._windows[f].jqxWindow({enableResize:true})}else{this._windows[f].jqxWindow({enableResize:false})}this._setWindowOption(this._windows[f],"size",{height:this._windows[f].height(),width:this._windows[f].width()})}}},_removeEventListeners:function(){for(var b=0;b<this._windows.length;b+=1){this.removeHandler(this._windows[b],"moving",this._itemDragging);this.removeHandler(this._windows[b],"moved",this._itemDrop);this.removeHandler(this._windows[b],"resized",this._itemResized);this.removeHandler(this._windows[b],"collapse",this._collapsed);this.removeHandler(this._windows[b],"expand",this._expanded)}},_addEventListeners:function(){for(var b=0;b<this._windows.length;b+=1){this._addEventListenersTo(this._windows[b])}},_addEventListenersTo:function(b){this.addHandler(b,"moving",this._itemDragging,{self:this});this.addHandler(b,"moved",this._itemDrop,{self:this});this.addHandler(b,"resized",this._itemResized,{self:this});this.addHandler(b,"collapse",this._collapsed,{self:this});this.addHandler(b,"expand",this._expanded,{self:this})},_itemDragging:function(g){var d=g.data.self,f=a(g.target),e=d._getWindowOptions(f);f.removeClass(d.toThemeProperty("jqx-docking-window"));f.css("margin","0px");if(!d._dragging){d._prepareForDragging(f)}if(e.mode==="floating"){return}var b={x:g.args.pageX,y:g.args.pageY},c=d._getMouseOverPanel(b);if(c){d._mouseOverPanel(c,b)}else{d._mouseLeavePanel()}if(!d._draggedFired){d._raiseEvent(1,{window:a(f).attr("id")});d._draggedFired=true}return g.preventDefault()},_prepareForDragging:function(c){this._dragging=true;var b={parent:c.parent(),next:c.next(),prev:c.prev()};this._setWindowOption(c,"lastPosition",b);c.detach();a(document.body).append(c);this._setDraggingStyles(c);this._draggingItem=c},_setDraggingStyles:function(b){b.css({position:"absolute",left:b.offset().left,top:b.offset().top});b.fadeTo(0,this.floatingWindowOpacity)},_getMouseOverPanel:function(c){var e,b,g,f;for(var d=0;d<this._panels.length;d+=1){if(this._isMouseOverItem(this._panels[d],c,false)){return this._panels[d]}}return null},_mouseOverPanel:function(c,b){if(this._dragging){var e=c.children("div"),d=this._getHoverWindow(b,e);if(d==="indicator"){return}var f=this._centerOffset(d,b);this._handleIndicator(c,d,f)}},_getHoverWindow:function(c,f){var e,b,h,g;if(this._isMouseOverItem(this._indicator,c,true)){return"indicator"}for(var d=0;d<f.length;d+=1){if(this._isMouseOverItem(a(f[d]),c,true)){return a(f[d])}}return null},_centerOffset:function(f,b){if(f){var e={x:f.offset().left,y:f.offset().top},g=f.height(),d=f.width(),c;c=e.y+g/2;if(b.y>c){return"next"}return"prev"}return"all"},_handleIndicator:function(c,d,e){var b=this._getIndicator(d);if(e==="all"){if(this.orientation==="vertical"){b.insertBefore(c.children(".spacer"))}else{c.append(b)}}else{if(e==="prev"){b.insertBefore(d)}else{b.insertAfter(d)}}this._resizeIndicator(b,c)},_getIndicator:function(){var b=this._indicator;if(!b){b=a('<div class="'+this.toThemeProperty("jqx-docking-drop-indicator")+'"></div>')}this._indicator=b;this._indicator.css("margin",this.windowsOffset);if(this.orientation==="vertical"){this._indicator.css("float","left")}return b},_resizeIndicator:function(c,b){if(this.orientation==="horizontal"){c.width(b.width()-(c.outerWidth(true)-c.width()));c.height(this._draggingItem.height())}else{c.width(this._draggingItem.width());c.height(this._draggingItem.height())}},_mouseLeavePanel:function(b){if(this._indicator){this._indicator.remove();this._indicator=null}},_itemDrop:function(d){var b=d.data.self,c=a(d.currentTarget);b._dragging=false;if(b._indicator){c.detach();c.insertAfter(b._indicator);b._indicator.remove();b._dropFixer(c)}else{b._dropHandler(c)}c.fadeTo(0,1);b._indicator=null;b._cookieExporter();b._draggedFired=false;b._raiseEvent(0,{window:c.attr("id")})},_dropFixer:function(b){b.css("position","static");b.addClass(this.toThemeProperty("jqx-docking-window"));b.css("margin",this.windowsOffset);b.jqxWindow("enableResize",false);if(this.orientation==="horizontal"){this._fixWindowSize(b)}},_dropHandler:function(c){var b=this._getWindowOptions(c);if(b.mode==="docked"){this._dropDocked(c)}else{this._dropFloating(c)}},_dropDocked:function(d){var c=this._getWindowOptions(d),b=c.lastPosition;d.detach();if(b.next[0]){d.insertBefore(b.next)}else{if(b.prev[0]){d.insertAfter(b.prev)}else{b.parent.append(d)}}this._dropFixer(d)},_fixWindowSize:function(b){a(b).jqxWindow({width:b.parent().width()-(b.outerWidth()-b.width())-2*parseInt(this.windowsOffset,10)})},_itemResized:function(d){var b=d.data.self,c=a(d.currentTarget);b._setWindowOption(c,"size",{width:d.args.width,height:d.args.height});b._cookieExporter()},_dropFloating:function(c){var b;if(!a(c).jqxWindow("collapsed")){b=this._getWindowOptions(c);a(c).jqxWindow("enableResize",b.resizable)}a(document.body).append(c);this._restoreWindowSize(c)},_restoreWindowSize:function(c){var b=this._getWindowOptions(c);a(c).jqxWindow({width:b.size.width})},_isMouseOverItem:function(i,e,d){if(!i){return false}var j=i.outerWidth(true),g=i.outerHeight(true),b=i.width(),h=i.height(),f=i.offset().top,c=i.offset().left;if(d){f-=(g-h)/2;c-=(j-b)/2;b=j;h=g}if((c<=e.x&&c+b>=e.x)&&(f<=e.y&&f+h+2*this._draggingItem.height()/3>=e.y)){return true}return false},_cookieHandler:function(){if(this.cookies){var b=a.jqx.cookie.cookie("jqxDocking"+this.element.id);if(b!==null){this.importLayout(b);layoutImported=true}}},_cookieExporter:function(){if(this.cookies){a.jqx.cookie.cookie("jqxDocking"+this.element.id,this.exportLayout(),this.cookieOptions)}},_indexOf:function(c,d){for(var b=0;b<d.length;b+=1){if(c[0]===d[b][0]){return b}}return -1},_exportFixed:function(){var e=[],g="",b,f;for(var d=0;d<this._panels.length;d+=1){g+='"panel'+d+'": {';b=this._panels[d].children();for(var c=0;c<b.length;c+=1){f=a(b[c]);if(f.attr("id")){e.push(f);g+='"'+f.attr("id")+'":{"collapsed":'+f.jqxWindow("collapsed")+"},"}}if(b.length>1){g=g.substring(0,g.length-1)}g+="},"}g=g.substring(0,g.length-1);return{JSON:g,children:e}},_exportFloating:function(c){var e="",d;e+='"floating":{';for(var b=0;b<this._windows.length;b+=1){d=a(this._windows[b]);if(this._indexOf(d,c)===-1){e+='"'+d.attr("id")+'":{"x":"'+d.css("left")+'","y":"'+d.css("top")+'","width":"'+d.jqxWindow("width")+'","height":"'+d.jqxWindow("height")+'","collapsed":'+d.jqxWindow("collapsed")+"},"}}if(e.substring(e.length-1,e.length)===","){e=e.substring(0,e.length-1)}e+="}";return e},_importFixed:function(b){for(var c in b){if(c!=="orientation"&&c!=="floating"&&b.hasOwnProperty(c)){order=c.substring(c.length-1,c.length);order=parseInt(order,10);children=b[c];for(var c in children){a("#"+c).css("position","static");if(children[c].collapsed){(function(d){setTimeout(function(){a("#"+d).jqxWindow("collapsed",true)},0)}(c))}this._panels[order].append(a("#"+c));if(this.orientation==="horizontal"){this._fixWindowSize(a("#"+c))}}}}},_importFloating:function(d){var f=d.floating,c,b;for(var e in f){if(f.hasOwnProperty(e)){a("#"+e).css("position","absolute");a(document.body).append(a("#"+e));b=this._dragging;a("#"+e).jqxWindow("move",f[e].x,f[e].y);this._dragging=b;a("#"+e).jqxWindow("width",f[e].width);a("#"+e).jqxWindow("height",f[e].height);a("#"+e).jqxWindow("enableResize",true);this._setWindowsOptions(true);(function(g){setTimeout(function(){a("#"+g).jqxWindow("collapsed",f[g].collapsed)},0)}(e));a("#"+e).fadeTo(0,1)}}},_getWindowOptions:function(b){if(typeof b==="object"&&b!==null){if(b.length>0){b=b.attr("id")}else{b=b.id}}return this._windowOptions[b]},_setWindowOption:function(c,b,d){if(typeof c==="object"&&c!==null){if(c.length>0){c=c.attr("id")}else{c=c.id}}if(typeof this._windowOptions[c]==="undefined"){this._windowOptions[c]={}}this._windowOptions[c][b]=d;if(b==="mode"){this.setWindowMode(c,d)}},_expanded:function(c){var b=c.data.self;b._cookieExporter()},_collapsed:function(c){var b=c.data.self;b._cookieExporter()},_raiseEvent:function(b){var c=a.Event(this._events[b]);c.args=arguments[1];return this.host.trigger(c)},_moveWindow:function(e,c,b){var d=c.children();var g=null;var f=0;a.each(d,function(h){if(a(this).css("position")=="static"){if(f==b&&this!=e[0]){g=this}f++}});if(f<=b){e.appendTo(c)}else{if(g!=null){e.insertBefore(g)}}e.css("position","static")},propertyChangedHandler:function(b,c,e,d){switch(c){case"theme":a.each(b._windows,function(){this.jqxWindow({theme:d})});break;case"orientation":case"height":case"width":b._performLayout();b._cookieExporter();break;case"panelsRoundedCorners":b._removeClasses();b._addClasses();break;case"disabled":if(d){b.disabled=false;b.disable()}else{b.disabled=true;b.enable()}break;case"windowsMode":case"mode":b._setWindowsOptions(false);break;case"cookies":b._cookieExporter();break;case"windowsOffset":b._performLayout();break}},destroy:function(){this._removeEventListeners();this.host.remove();this.windowsMode=null;this.cookieOptions=null;this._windowOptions=null;this._panels=null;this._windows=null;this._events=null},disable:function(){if(!this.disabled){this.disabled=true;this._removeEventListeners();for(var b=0;b<this._windows.length;b+=1){a(this._windows[b]).jqxWindow("disable")}}},enable:function(){if(this.disabled){this.disabled=false;this._addEventListeners();for(var b=0;b<this._windows.length;b+=1){a(this._windows[b]).jqxWindow("enable")}}},move:function(f,c,b){var c=this._panels[c];if(!c){return}var e=a(c.children(".spacer")),d;e.detach();f=a("#"+f);d=this._getWindowOptions(f);if(d.mode==="floating"){return}else{this._moveWindow(f,c,b)}c.append(e);this._cookieExporter();this._dropFixer(f)},exportLayout:function(){var c="{",b=this._exportFixed();c+=b.JSON+","+this._exportFloating(b.children)+',"orientation": "'+this.orientation+'"';c+="}";return c},importLayout:function(g){try{var f=a.parseJSON(g),b,c;this.orientation=f.orientation;this._performLayout();this._importFixed(f);this._importFloating(f)}catch(d){alert("Invalid JSON string.")}},setWindowMode:function(c,d){var c=a("#"+c),b=this._getWindowOptions(c);if(d==="floating"){c.css("position","absolute");this._windowOptions[c.attr("id")]["mode"]=d}else{if(b.mode==="floating"&&c.css("position")==="absolute"){if(b.lastPosition){this._dropDocked(c)}else{this._panels[0].append(c);this._dropFixer(c)}}}this._windowOptions[c.attr("id")]["mode"]=d},hideCloseButton:function(b){a("#"+b).jqxWindow("showCloseButton",false)},showCloseButton:function(b){a("#"+b).jqxWindow("showCloseButton",true)},hideCollapseButton:function(b){a("#"+b).jqxWindow("showCollapseButton",false)},showCollapseButton:function(b){a("#"+b).jqxWindow("showCollapseButton",true)},expandWindow:function(b,c){a("#"+b).jqxWindow("expand",c)},collapseWindow:function(b,c){a("#"+b).jqxWindow("collapse",c)},setWindowProperty:function(c,b,d){a("#"+c).jqxWindow(b,d)},getWindowProperty:function(c,b){return a("#"+c).jqxWindow(b)},setWindowPosition:function(d,b,e){var d=a("#"+d),c=this._getWindowOptions(d);if(c.mode==="floating"){d.css("position","absolute");a(d).jqxWindow("move",b,e,null,false)}},hideAllCloseButtons:function(){for(var b=0;b<this._windows.length;b+=1){this._windows[b].jqxWindow("showCloseButton",false)}},hideAllCollapseButtons:function(){for(var b=0;b<this._windows.length;b+=1){this._windows[b].jqxWindow("showCollapseButton",false)}},showAllCloseButtons:function(){for(var b=0;b<this._windows.length;b+=1){this._windows[b].jqxWindow("showCloseButton",true)}},showAllCollapseButtons:function(){for(var b=0;b<this._windows.length;b+=1){this._windows[b].jqxWindow("showCollapseButton",true)}},pinWindow:function(b){a("#"+b).jqxWindow("draggable",false)},unpinWindow:function(b){a("#"+b).jqxWindow("draggable",true)},setDraggingMode:function(c){var b=a("#"+c);this._prepareForDragging(b);b.fadeTo(0,1)},enableWindowResize:function(b){b=a("#"+b);if(b.css("position")==="absolute"){this._setWindowOption(b,"resizable",true);b.jqxWindow("enableResize",true)}},disableWindowResize:function(b){b=a("#"+b);this._setWindowOption(b,"resizable",false);b.jqxWindow("enableResize",false)},addWindow:function(e,f,d,c){var b="#"+e;a(b).jqxWindow({theme:this.theme,enableResize:false,width:a(b).css("width"),maxWidth:Number.MAX_VALUE});this._panels[0].append(a(b));this._windows.push(a(b));if(f){this._setWindowOption(a(b),"mode",f)}else{this._setWindowOption(a(b),"mode",this.mode)}this._setWindowOption(a(b),"size",{width:a(b).width(),height:a(b).height()});this._addEventListenersTo(a(b));if(typeof d!=="undefined"&&typeof c!=="undefined"){this.move(e,d,c)}this._dropFixer(a(b))},closeWindow:function(b){a("#"+b).jqxWindow("closeWindow")}})})(jQuery);