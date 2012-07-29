/*
jQWidgets v2.3.0 (2012-July-13)
Copyright (c) 2011-2012 jQWidgets.
License: http://jqwidgets.com/license/
*/

(function(a){a.jqx.jqxWidget("jqxTooltip","",{});a.extend(a.jqx._jqxTooltip.prototype,{defineInstance:function(){this.header="Header";this.content="jqxTooltip";if(this.width==undefined){this.width=null}if(this.height==undefined){this.height=null}this.location="bottom-right",this.horizontalOffset=0;this.verticalOffset=0;this.enableAnimation=true;this.animationShowDuration=450,this.animationHideDuration=250,this.animationHideDelay=4000,this.animationShowDelay=100,this.showHtml=false;this.staysOpen=false;this.isOpen=false;this.disabled=false;this.events=["shown","closed"]},createInstance:function(b){if(this.width!=null&&this.width.toString().indexOf("px")!=-1){this.host.width(this.width)}else{if(this.width!=undefined&&!isNaN(this.width)){this.host.width(this.width)}}if(this.height!=null&&this.height.toString().indexOf("px")!=-1){this.host.height(this.height)}else{if(this.height!=undefined&&!isNaN(this.height)){this.host.height(this.height)}}this.elements=new Array();this.index=0},destroy:function(){this.host.removeClass("jqx-tooltip jqx-rc-all")},_raiseEvent:function(f,c){if(c==undefined){c={owner:null}}var d=this.events[f];args=c;args.owner=this;if(f==0){this.isOpen=true}if(f==1){this.isOpen=false}var e=new jQuery.Event(d);e.owner=this;var b=this.host.trigger(e);return b},close:function(c){var b=this;if(c==undefined||c==null){a.each(this.elements,function(){var e=a.data(this.element[0],"Tooltip");if(e==undefined){e=a.data(b,"Tooltip")}if(e!=null){if(b.enableAnimation){e.stop().fadeOut(this.animationHideDuration,function(){a(this).remove()})}else{e.remove()}b._raiseEvent(1);a.data(this,"Tooltip",null)}})}else{var d=a.data(c,"Tooltip");if(d==undefined){d=a.data(this,"Tooltip")}if(d==undefined&&c!=null){d=a(document.body).find("#Tooltip"+c.id)}if(d!=null){if(this.enableAnimation){d.stop().fadeOut(this.animationHideDuration,function(){a(this).remove()})}else{d.remove()}this._raiseEvent(1);a.data(c,"Tooltip",null)}}},open:function(){var d=Array.prototype.slice.call(arguments,0);var c=null;if(d.length>0){c=a(d[0])}else{return}var o="Tooltip";if(d.length>1){o=d[1]}var k=0;var f=0;if(d.length>2){k=d[2]}if(d.length>3){f=d[3]}var j=false;for(loopIndex=0;loopIndex<this.elements.length;loopIndex++){if(this.elements[loopIndex].element[0]==c[0]){j=true;break}}var e={element:c,header:"",content:o};var g=a.data(c[0],"Tooltip");if(!g){g=a("<div><table><tr><td/></tr></table></div>");a(g.find("table")[0]).addClass(this.toThemeProperty("jqx-tooltip-table"));a(g.find("td")[0]).addClass(this.toThemeProperty("jqx-tooltip-content"));a(g.find("td")[0]).addClass(this.toThemeProperty("jqx-fill-state-normal"));g.css({position:"absolute",zIndex:100000});g[0].id="Tooltip"+c[0].id;a.data(c[0],"Tooltip",g);a.data(document.body,"jqxOpenedTooltip",g)}g.remove().css({top:0,left:0,visibility:"hidden",display:"block"}).appendTo(document.body);g.find("."+this.toThemeProperty("jqx-tooltip-content",true))[this.showHtml?"html":"text"](o);var i=c.offset();var b=a(window).scrollTop();var p=a(window).scrollLeft();var s=a.jqx.mobile.isSafariMobileBrowser();if(s){i={left:i.left-p,top:i.top-b}}var q=parseInt(g[0].offsetWidth);var n=parseInt(g[0].offsetHeight);var r=parseInt(c[0].offsetWidth);var l=parseInt(c[0].offsetHeight);var h={position:i,width:q,heigth:n,elementWidth:r,elementHeight:l};a.data(c[0],"TooltipBounds",h);switch(this.location){case"bottom-right":g.css({top:i.top+l,left:i.left+r});break;case"bottom":g.css({top:i.top+l,left:i.left+r/2-q/2});break;case"top":g.css({top:i.top-n,left:i.left+r/2-q/2});break;case"bottom-left":g.css({top:i.top+l,left:i.left-q});break;case"top-left":g.css({top:i.top-n,left:i.left-q});break;case"top-right":g.css({top:i.top-n,left:i.left+r});break;case"right":g.css({top:i.top+l/2-n/2,left:i.left+r});break;case"left":g.css({top:i.top+l/2-n/2,left:i.left-q});break;case"absolute":g.css({top:parseInt(this.verticalOffset),left:parseInt(this.horizontalOffset)});break;case"relative":g.css({top:parseInt(this.verticalOffset)+parseInt(i.top),left:parseInt(this.horizontalOffset)+parseInt(i.left)});break}if(this.enableAnimation){g.css({opacity:0,display:"block",visibility:"visible"}).animate({opacity:1},this.animationShowDuration)}else{g.css({visibility:"visible"})}var m=this;setTimeout(function(){if(t==undefined||t==null){var t=a.data(c[0],"Tooltip");if(t==undefined){t=a.data(document.body,"jqxOpenedTooltip")}}if(t!=undefined&&!m.staysOpen){if(m.enableAnimation){t.stop().fadeOut(m.animationHideDuration,function(){a(this).remove()})}else{t.remove()}m._raiseEvent(1)}else{m.close()}},m.animationHideDelay);this._raiseEvent(0)},add:function(c,d,g){if(c==null||c==undefined){return}var b=this;if(c[0]==undefined){c=a(c)}var e=false;if(c[0]!=null){a.each(this.elements,function(){if(this.element[0]==c[0]){e=true;return false}})}if(e){return}var f={element:c,header:g,content:d,canDisplay:true,index:this.index,timer:null};this.elements[this.index]=f;this.timer=null;var c=this.elements[this.index];this.index++;this.isTouchDevice=a.jqx.mobile.isTouchDevice();if(this.isTouchDevice){a(c.element).bind("click",function(){var h=a.data(c.element[0],"Tooltip");if(h!=undefined){b.close(c.element[0])}else{b._open(b,c)}});return}a(c.element).bind("mouseleave",function(){b._close(b,c)});a(c.element).bind("mouseenter",function(h){b._open(b,c)})},_close:function(b,c){if(c.timer!=null){window.clearTimeout(c.timer)}var d=a.data(c.element[0],"Tooltip");if(d!=undefined&&!b.staysOpen){c.canDisplay=false;if(this.enableAnimation){d.stop().fadeOut(this.animationHideDuration,function(){a(this).remove()})}else{d.remove()}c.canDisplay=true;a(c.element).stop(true,true);b._raiseEvent(1)}},_open:function(b,c){if(c.timer!=null){window.clearTimeout(c.timer)}c.timer=window.setTimeout(function(){var l=c.header!=undefined&&c.content!=undefined&&c.header!=null&&c.content!=null&&c.header.length>0&&c.content.length>0;var i=this;var o=a.data(c.element[0],"Tooltip");if(b.disabled){return false}if(!c.canDisplay){return false}if(o!=null&&b.staysOpen){return false}if(!o){if(l){o=a("<div><table><tr><td/></tr><tr><td/></tr></table></div>")}else{o=a("<div><table><tr><td/></tr></table></div>")}if(o.find("td").length>1){a(o.find("td")[0]).addClass(b.toThemeProperty("jqx-tooltip-header"));a(o.find("td")[1]).addClass(b.toThemeProperty("jqx-tooltip-content"));a(o.find("td")[0]).addClass(b.toThemeProperty("jqx-fill-state-normal"));a(o.find("td")[1]).addClass(b.toThemeProperty("jqx-fill-state-normal"))}else{if(o.find("td").length>0){a(o.find("td")[0]).addClass(b.toThemeProperty("jqx-tooltip-content"));a(o.find("td")[0]).addClass(b.toThemeProperty("jqx-fill-state-normal"))}}a(o.find("table")[0]).addClass(b.toThemeProperty("jqx-tooltip-table"));a(o.find("table")[0]).addClass(b.toThemeProperty("jqx-rc-all"));a(o.find("table")[0]).addClass(b.toThemeProperty("jqx-widget"));o.css({position:"absolute",zIndex:100000});a.data(c.element[0],"Tooltip",o)}o.remove().css({top:0,left:0,visibility:"hidden",display:"block"}).appendTo(document.body);if(l){o.find("."+b.toThemeProperty("jqx-tooltip-header",true))[b.showHtml?"html":"text"](c.header)}o.find("."+b.toThemeProperty("jqx-tooltip-content",true))[b.showHtml?"html":"text"](c.content);var e=c.element.offset();var d=a(window).scrollTop();var f=a(window).scrollLeft();var j=a.jqx.mobile.isSafariMobileBrowser();if(j){e={left:e.left-f,top:e.top-d}}var g=parseInt(o[0].offsetWidth);var n=parseInt(o[0].offsetHeight);var k=parseInt(c.element[0].offsetWidth);var h=parseInt(c.element[0].offsetHeight);var m={position:e,width:g,heigth:n,elementWidth:k,elementHeight:h};a.data(c.element[0],"TooltipBounds",m);switch(b.location){case"bottom-right":o.css({top:e.top+h,left:e.left+k});break;case"bottom":o.css({top:e.top+h,left:e.left+k/2-g/2});break;case"top":o.css({top:e.top-n,left:e.left+k/2-g/2});break;case"bottom-left":o.css({top:e.top+h,left:e.left-g});break;case"top-left":o.css({top:e.top-n,left:e.left-g});break;case"top-right":o.css({top:e.top-n,left:e.left+k});break;case"right":o.css({top:e.top+h/2-n/2,left:e.left+k});break;case"left":o.css({top:e.top+h/2-n/2,left:e.left-g});break;case"absolute":o.css({top:parseInt(b.verticalOffset),left:parseInt(b.horizontalOffset)});break;case"relative":o.css({top:parseInt(b.verticalOffset)+parseInt(e.top),left:parseInt(b.horizontalOffset)+parseInt(e.left)});break}a.each(b.elements,function(){if(this.element[0]!=c.element[0]){var p=a.data(this.element[0],"Tooltip");if(p!=null){p.remove()}}});if(b.enableAnimation){o.css({opacity:0,display:"block",visibility:"visible"}).animate({opacity:1},b.animationShowDuration)}else{o.css({visibility:"visible"})}setTimeout(function(){var p=a.data(c.element[0],"Tooltip");if(p!=undefined&&!b.staysOpen){if(b.enableAnimation){p.stop().fadeOut(b.animationHideDuration,function(){a(this).remove()})}else{p.remove()}b._raiseEvent(1)}},b.animationHideDelay);b._raiseEvent(0)},b.animationShowDelay)},hasTooltip:function(b){var c=false;a.each(this.elements,function(){var d=this;if(d.element[0]==b[0]){c=true;return false}});return c},remove:function(d){if(d==undefined||d==null){return}if(d[0]==undefined){d=a(d)}this.close();var b=this;var c=0;var f=false;a.each(this.elements,function(){var g=this;if(g.element[0]==d[0]){a.data(g.element[0],"Tooltip",null);f=true;return false}c++});if(f){this.elements.splice(c,1);this.index--}if(d.element!=null){if(d.element[0]!=null){var e=a.data(d.element[0],"Tooltip")}a(d.element).unbind("mouseenter");a(d.element).unbind("mouseleave")}else{d.unbind("mouseenter");d.unbind("mouseleave")}},propertyChangedHandler:function(b,c,e,d){if(this.isInitialized==undefined||this.isInitialized==false){return}}})})(jQuery);