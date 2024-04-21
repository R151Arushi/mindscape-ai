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
// @input Component.Camera orthoCamera 
checkUndefined("orthoCamera", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../Modules/Src/Shared/SharedContent");
}
var Module = RequireModule.requireModule("../../../../Modules/Src/Shared/SharedContent");
script.instance = new Module.module.SharedContent();
script.instance.orthoCamera = script.orthoCamera
script.instance.script = script;
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'orthoCamera', { get: function() { return script.instance.orthoCamera; }, set: function(x) { script.instance.orthoCamera = x }});
script.onAwake = function() {
	return script.instance.onAwake();
};
script.instance.onAwake();
