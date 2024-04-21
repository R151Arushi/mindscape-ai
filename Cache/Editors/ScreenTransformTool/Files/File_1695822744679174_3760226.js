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
// @input SceneObject pivot 
checkUndefined("pivot", undefined, undefined);
// @input SceneObject[] sidePointsSceneObjects 
checkUndefined("sidePointsSceneObjects", undefined, undefined);
// @input SceneObject[] rotationPointsSceneObjects 
checkUndefined("rotationPointsSceneObjects", undefined, undefined);
// @input SceneObject[] frameSidesSceneObjects 
checkUndefined("frameSidesSceneObjects", undefined, undefined);
// @input SceneObject[] anchorPointsSceneObjects 
checkUndefined("anchorPointsSceneObjects", undefined, undefined);
// @input SceneObject[] anchorFrameSidesSceneObjects 
checkUndefined("anchorFrameSidesSceneObjects", undefined, undefined);
// @input SceneObject anchorsRootSceneObject 
checkUndefined("anchorsRootSceneObject", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../../Modules/Src/Editor/Gizmo/Gizmo");
}
var Module = RequireModule.requireModule("../../../../../Modules/Src/Editor/Gizmo/Gizmo");
script.instance = new Module.module.Gizmo();
script.instance.pivot = script.pivot
script.instance.sidePointsSceneObjects = script.sidePointsSceneObjects
script.instance.rotationPointsSceneObjects = script.rotationPointsSceneObjects
script.instance.frameSidesSceneObjects = script.frameSidesSceneObjects
script.instance.anchorPointsSceneObjects = script.anchorPointsSceneObjects
script.instance.anchorFrameSidesSceneObjects = script.anchorFrameSidesSceneObjects
script.instance.anchorsRootSceneObject = script.anchorsRootSceneObject
script.instance.script = script;
Object.defineProperty(script, 'pivot', { get: function() { return script.instance.pivot; }, set: function(x) { script.instance.pivot = x }});
Object.defineProperty(script, 'sidePointsSceneObjects', { get: function() { return script.instance.sidePointsSceneObjects; }, set: function(x) { script.instance.sidePointsSceneObjects = x }});
Object.defineProperty(script, 'rotationPointsSceneObjects', { get: function() { return script.instance.rotationPointsSceneObjects; }, set: function(x) { script.instance.rotationPointsSceneObjects = x }});
Object.defineProperty(script, 'frameSidesSceneObjects', { get: function() { return script.instance.frameSidesSceneObjects; }, set: function(x) { script.instance.frameSidesSceneObjects = x }});
Object.defineProperty(script, 'anchorPointsSceneObjects', { get: function() { return script.instance.anchorPointsSceneObjects; }, set: function(x) { script.instance.anchorPointsSceneObjects = x }});
Object.defineProperty(script, 'anchorFrameSidesSceneObjects', { get: function() { return script.instance.anchorFrameSidesSceneObjects; }, set: function(x) { script.instance.anchorFrameSidesSceneObjects = x }});
Object.defineProperty(script, 'anchorsRootSceneObject', { get: function() { return script.instance.anchorsRootSceneObject; }, set: function(x) { script.instance.anchorsRootSceneObject = x }});
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'onAwake', { get: function() { return script.instance.onAwake; }, set: function(x) { script.instance.onAwake = x }});
script.init = function() {
	return script.instance.init();
};
script.resetEditable = function() {
	return script.instance.resetEditable();
};
script.updatePivot = function() {
	return script.instance.updatePivot();
};
script.hide = function() {
	return script.instance.hide();
};
script.show = function() {
	return script.instance.show();
};
script.isVisible = function() {
	return script.instance.isVisible();
};
script.setEditable = function(sceneObject) {
	return script.instance.setEditable(sceneObject);
};
script.setFijiScreenTransform = function(screenTransform) {
	return script.instance.setFijiScreenTransform(screenTransform);
};
script.forceUpdate = function() {
	return script.instance.forceUpdate();
};
script.setInteractionCamera = function(camera) {
	return script.instance.setInteractionCamera(camera);
};
script.setLayer = function(layer) {
	return script.instance.setLayer(layer);
};
script.addOnUpdateCallback = function(cb) {
	return script.instance.addOnUpdateCallback(cb);
};
script.addAlignmentFunction = function(alignmentFunction) {
	return script.instance.addAlignmentFunction(alignmentFunction);
};
script.getEditableScreenTransform = function() {
	return script.instance.getEditableScreenTransform();
};
script.containsWorldPoint = function(point) {
	return script.instance.containsWorldPoint(point);
};
script.setVisualZoom = function(zoom) {
	return script.instance.setVisualZoom(zoom);
};
script.setVisualScale = function(scale) {
	return script.instance.setVisualScale(scale);
};
script.updateAnchorsFrame = function() {
	return script.instance.updateAnchorsFrame();
};
script.setAdvancedMode = function(isAdvanced) {
	return script.instance.setAdvancedMode(isAdvanced);
};
script.isValid = function() {
	return script.instance.isValid();
};
script.instance.onAwake();
