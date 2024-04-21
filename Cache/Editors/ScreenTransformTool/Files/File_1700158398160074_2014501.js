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
// @input Component.ScreenTransform frame 
checkUndefined("frame", undefined, undefined);
// @input Component.ScreenTransform horizontal 
checkUndefined("horizontal", undefined, undefined);
// @input Component.ScreenTransform vertical 
checkUndefined("vertical", undefined, undefined);
// @input Asset.Material horizontalMaterial 
checkUndefined("horizontalMaterial", undefined, undefined);
// @input Asset.Material verticalMaterial 
checkUndefined("verticalMaterial", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../../Modules/Src/Editor/RulersAndGuides/Rulers");
}
var Module = RequireModule.requireModule("../../../../../Modules/Src/Editor/RulersAndGuides/Rulers");
script.instance = new Module.module.Rulers();
script.instance.lensRegion = script.lensRegion
script.instance.frame = script.frame
script.instance.horizontal = script.horizontal
script.instance.vertical = script.vertical
script.instance.horizontalMaterial = script.horizontalMaterial
script.instance.verticalMaterial = script.verticalMaterial
script.instance.script = script;
Object.defineProperty(script, 'lensRegion', { get: function() { return script.instance.lensRegion; }, set: function(x) { script.instance.lensRegion = x }});
Object.defineProperty(script, 'frame', { get: function() { return script.instance.frame; }, set: function(x) { script.instance.frame = x }});
Object.defineProperty(script, 'horizontal', { get: function() { return script.instance.horizontal; }, set: function(x) { script.instance.horizontal = x }});
Object.defineProperty(script, 'vertical', { get: function() { return script.instance.vertical; }, set: function(x) { script.instance.vertical = x }});
Object.defineProperty(script, 'horizontalMaterial', { get: function() { return script.instance.horizontalMaterial; }, set: function(x) { script.instance.horizontalMaterial = x }});
Object.defineProperty(script, 'verticalMaterial', { get: function() { return script.instance.verticalMaterial; }, set: function(x) { script.instance.verticalMaterial = x }});
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
script.onAwake = function() {
	return script.instance.onAwake();
};
script.instance.onAwake();
