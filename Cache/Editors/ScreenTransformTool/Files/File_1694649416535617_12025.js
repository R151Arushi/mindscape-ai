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
// @input Component.ScriptComponent pinLineRenderer 
checkUndefined("pinLineRenderer", undefined, undefined);
// @input Component.ScriptComponent offsetLineRenderer 
checkUndefined("offsetLineRenderer", undefined, undefined);
// @input Component.ScriptComponent sceneViewer 
checkUndefined("sceneViewer", undefined, undefined);
// @input Component.ScriptComponent lensRegion 
checkUndefined("lensRegion", undefined, undefined);
// @input SceneObject testObject 
checkUndefined("testObject", undefined, undefined);
// @input Component.ScriptComponent gizmoRef 
checkUndefined("gizmoRef", undefined, undefined);
// @input Component.ScreenTransform[] toolbar 
checkUndefined("toolbar", undefined, undefined);
// @input Component.ScriptComponent guides 
checkUndefined("guides", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../Modules/Src/Editor/EffectEditor");
}
var Module = RequireModule.requireModule("../../../../Modules/Src/Editor/EffectEditor");
script.instance = new Module.module.EffectEditor();
script.instance.pinLineRenderer = script.pinLineRenderer
script.instance.offsetLineRenderer = script.offsetLineRenderer
script.instance.sceneViewer = script.sceneViewer
script.instance.lensRegion = script.lensRegion
script.instance.testObject = script.testObject
script.instance.gizmoRef = script.gizmoRef
script.instance.toolbar = script.toolbar
script.instance.guides = script.guides
script.instance.script = script;
Object.defineProperty(script, 'pinLineRenderer', { get: function() { return script.instance.pinLineRenderer; }, set: function(x) { script.instance.pinLineRenderer = x }});
Object.defineProperty(script, 'offsetLineRenderer', { get: function() { return script.instance.offsetLineRenderer; }, set: function(x) { script.instance.offsetLineRenderer = x }});
Object.defineProperty(script, 'sceneViewer', { get: function() { return script.instance.sceneViewer; }, set: function(x) { script.instance.sceneViewer = x }});
Object.defineProperty(script, 'lensRegion', { get: function() { return script.instance.lensRegion; }, set: function(x) { script.instance.lensRegion = x }});
Object.defineProperty(script, 'testObject', { get: function() { return script.instance.testObject; }, set: function(x) { script.instance.testObject = x }});
Object.defineProperty(script, 'gizmoRef', { get: function() { return script.instance.gizmoRef; }, set: function(x) { script.instance.gizmoRef = x }});
Object.defineProperty(script, 'toolbar', { get: function() { return script.instance.toolbar; }, set: function(x) { script.instance.toolbar = x }});
Object.defineProperty(script, 'guides', { get: function() { return script.instance.guides; }, set: function(x) { script.instance.guides = x }});
Object.defineProperty(script, 'gizmo', { get: function() { return script.instance.gizmo; }, set: function(x) { script.instance.gizmo = x }});
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'onAwake', { get: function() { return script.instance.onAwake; }, set: function(x) { script.instance.onAwake = x }});
script.instance.onAwake();
