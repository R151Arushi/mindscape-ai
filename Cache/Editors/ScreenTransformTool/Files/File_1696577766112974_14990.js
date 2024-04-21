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
// @input Component.ScriptComponent inactiveFrameRef 
checkUndefined("inactiveFrameRef", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../Modules/Src/Editor/SceneViewer");
}
var Module = RequireModule.requireModule("../../../../Modules/Src/Editor/SceneViewer");
script.instance = new Module.module.SceneViewer();
script.instance.inactiveFrameRef = script.inactiveFrameRef
script.instance.script = script;
Object.defineProperty(script, 'inactiveFrameRef', { get: function() { return script.instance.inactiveFrameRef; }, set: function(x) { script.instance.inactiveFrameRef = x }});
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'onAwake', { get: function() { return script.instance.onAwake; }, set: function(x) { script.instance.onAwake = x }});
script.isInitialized = function() {
	return script.instance.isInitialized();
};
script.init = function(camera) {
	return script.instance.init(camera);
};
script.initFromCanvas = function(canvas) {
	return script.instance.initFromCanvas(canvas);
};
script.setScale = function(scale) {
	return script.instance.setScale(scale);
};
script.setDelta = function(delta) {
	return script.instance.setDelta(delta);
};
script.getSize = function() {
	return script.instance.getSize();
};
script.getAspect = function() {
	return script.instance.getAspect();
};
script.getCamera = function() {
	return script.instance.getCamera();
};
script.getLayer = function() {
	return script.instance.getLayer();
};
script.clearView = function() {
	return script.instance.clearView();
};
script.resetZPosition = function() {
	return script.instance.resetZPosition();
};
script.getFrames = function() {
	return script.instance.getFrames();
};
script.instance.onAwake();
