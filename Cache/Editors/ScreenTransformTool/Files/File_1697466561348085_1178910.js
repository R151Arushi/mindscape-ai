if (script.instance) {
	script.instance.onAwake();
	return;
};
function checkUndefined(property, showIf, showIfValue){
   if (showIf && script[showIf] != showIfValue){
       return;
   }
   if (script[property] == undefined){
       throw new Error('Input ' + property + ' was not provided for the object ' + script.getSceneObject().name);
   }
}
// @input Component.ScriptComponent lensRegion 
checkUndefined("lensRegion", undefined, undefined);
// @input Component.Text zoomText 
checkUndefined("zoomText", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../../Modules/Src/Editor/Tools/ZoomText");
}
var Module = RequireModule.requireModule("../../../../../Modules/Src/Editor/Tools/ZoomText");
script.instance = new Module.module.ZoomText();
script.instance.lensRegion = script.lensRegion
script.instance.zoomText = script.zoomText
script.instance.script = script;
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'lensRegion', { get: function() { return script.instance.lensRegion; }, set: function(x) { script.instance.lensRegion = x }});
Object.defineProperty(script, 'zoomText', { get: function() { return script.instance.zoomText; }, set: function(x) { script.instance.zoomText = x }});
Object.defineProperty(script, 'onAwake', { get: function() { return script.instance.onAwake; }, set: function(x) { script.instance.onAwake = x }});
script.instance.onAwake();
