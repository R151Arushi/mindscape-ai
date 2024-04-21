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
// @input Asset.Material materialRef 
checkUndefined("materialRef", undefined, undefined);
// @input Component.Image[] sides 
checkUndefined("sides", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../Modules/Src/Editor/InactiveFrame");
}
var Module = RequireModule.requireModule("../../../../Modules/Src/Editor/InactiveFrame");
script.instance = new Module.module.InactiveFrame();
script.instance.materialRef = script.materialRef
script.instance.sides = script.sides
script.instance.script = script;
Object.defineProperty(script, 'materialRef', { get: function() { return script.instance.materialRef; }, set: function(x) { script.instance.materialRef = x }});
Object.defineProperty(script, 'sides', { get: function() { return script.instance.sides; }, set: function(x) { script.instance.sides = x }});
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
script.onAwake = function() {
	return script.instance.onAwake();
};
script.setInteractionCamera = function(camera) {
	return script.instance.setInteractionCamera(camera);
};
script.setOnHover = function(cb) {
	return script.instance.setOnHover(cb);
};
script.setInactive = function() {
	return script.instance.setInactive();
};
script.getLayerSet = function() {
	return script.instance.getLayerSet();
};
script.setLayerSet = function(layerSet) {
	return script.instance.setLayerSet(layerSet);
};
script.hide = function() {
	return script.instance.hide();
};
script.show = function() {
	return script.instance.show();
};
script.copy = function() {
	return script.instance.copy();
};
script.setParent = function(parent) {
	return script.instance.setParent(parent);
};
script.setLayer = function(layer) {
	return script.instance.setLayer(layer);
};
script.destroy = function() {
	return script.instance.destroy();
};
script.instance.onAwake();
