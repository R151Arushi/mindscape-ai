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
// @input Component.Camera camera 
checkUndefined("camera", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../../Modules/Src/Editor/Tools/GuideButton");
}
var Module = RequireModule.requireModule("../../../../../Modules/Src/Editor/Tools/GuideButton");
script.instance = new Module.module.GuideButton();
script.instance.camera = script.camera
script.instance.script = script;
Object.defineProperty(script, 'camera', { get: function() { return script.instance.camera; }, set: function(x) { script.instance.camera = x }});
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'onAwake', { get: function() { return script.instance.onAwake; }, set: function(x) { script.instance.onAwake = x }});
script.instance.onAwake();
