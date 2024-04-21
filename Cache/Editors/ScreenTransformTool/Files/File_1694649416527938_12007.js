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
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../Modules/Src/Main");
}
var Module = RequireModule.requireModule("../../../Modules/Src/Main");
script.instance = new Module.module.Main();
script.instance.lensRegion = script.lensRegion
script.instance.script = script;
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'lensRegion', { get: function() { return script.instance.lensRegion; }, set: function(x) { script.instance.lensRegion = x }});
Object.defineProperty(script, 'updateEvent', { get: function() { return script.instance.updateEvent; }, set: function(x) { script.instance.updateEvent = x }});
Object.defineProperty(script, 'panControl', { get: function() { return script.instance.panControl; }, set: function(x) { script.instance.panControl = x }});
script.onAwake = function() {
	return script.instance.onAwake();
};
script.callUpdate = function() {
	return script.instance.callUpdate();
};
script.getLensRegion = function() {
	return script.instance.getLensRegion();
};
script.resetLensRegionPosition = function() {
	return script.instance.resetLensRegionPosition();
};
script.instance.onAwake();
