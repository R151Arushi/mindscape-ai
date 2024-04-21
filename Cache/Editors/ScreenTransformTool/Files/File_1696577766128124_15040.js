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
// @input Asset.Texture windowResolution 
checkUndefined("windowResolution", undefined, undefined);
// @input Asset.Texture lensResolution 
checkUndefined("lensResolution", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../LensRegion");
}
var Module = RequireModule.requireModule("../LensRegion");
script.instance = new Module.module.LensRegion();
script.instance.windowResolution = script.windowResolution
script.instance.lensResolution = script.lensResolution
script.instance.script = script;
Object.defineProperty(script, 'windowResolution', { get: function() { return script.instance.windowResolution; }, set: function(x) { script.instance.windowResolution = x }});
Object.defineProperty(script, 'lensResolution', { get: function() { return script.instance.lensResolution; }, set: function(x) { script.instance.lensResolution = x }});
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'onAwake', { get: function() { return script.instance.onAwake; }, set: function(x) { script.instance.onAwake = x }});
script.addOnLensRegionUpdate = function(cb) {
	return script.instance.addOnLensRegionUpdate(cb);
};
script.updateBackgroundResolution = function(texture) {
	return script.instance.updateBackgroundResolution(texture);
};
script.getAspectControl = function() {
	return script.instance.getAspectControl();
};
script.getPanControl = function() {
	return script.instance.getPanControl();
};
script.getPinchControl = function() {
	return script.instance.getPinchControl();
};
script.getWindowTexture = function() {
	return script.instance.getWindowTexture();
};
script.reset = function() {
	return script.instance.reset();
};
script.instance.onAwake();
