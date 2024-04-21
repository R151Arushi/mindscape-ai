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
// @input SceneObject topBar 
checkUndefined("topBar", undefined, undefined);
// @input SceneObject leftBar 
checkUndefined("leftBar", undefined, undefined);
// @input Component.ScriptComponent horizontalGuideRef 
checkUndefined("horizontalGuideRef", undefined, undefined);
// @input Component.ScriptComponent verticalGuideRef 
checkUndefined("verticalGuideRef", undefined, undefined);
// @input Component.ScriptComponent guideLines 
checkUndefined("guideLines", undefined, undefined);
// @input Component.ScriptComponent lensRegion 
checkUndefined("lensRegion", undefined, undefined);
// @input Component.ScriptComponent mouseHint 
checkUndefined("mouseHint", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../../Modules/Src/Editor/RulersAndGuides/GuideBars");
}
var Module = RequireModule.requireModule("../../../../../Modules/Src/Editor/RulersAndGuides/GuideBars");
script.instance = new Module.module.GuideBars();
script.instance.topBar = script.topBar
script.instance.leftBar = script.leftBar
script.instance.horizontalGuideRef = script.horizontalGuideRef
script.instance.verticalGuideRef = script.verticalGuideRef
script.instance.guideLines = script.guideLines
script.instance.lensRegion = script.lensRegion
script.instance.mouseHint = script.mouseHint
script.instance.script = script;
Object.defineProperty(script, 'topBar', { get: function() { return script.instance.topBar; }, set: function(x) { script.instance.topBar = x }});
Object.defineProperty(script, 'leftBar', { get: function() { return script.instance.leftBar; }, set: function(x) { script.instance.leftBar = x }});
Object.defineProperty(script, 'horizontalGuideRef', { get: function() { return script.instance.horizontalGuideRef; }, set: function(x) { script.instance.horizontalGuideRef = x }});
Object.defineProperty(script, 'verticalGuideRef', { get: function() { return script.instance.verticalGuideRef; }, set: function(x) { script.instance.verticalGuideRef = x }});
Object.defineProperty(script, 'guideLines', { get: function() { return script.instance.guideLines; }, set: function(x) { script.instance.guideLines = x }});
Object.defineProperty(script, 'lensRegion', { get: function() { return script.instance.lensRegion; }, set: function(x) { script.instance.lensRegion = x }});
Object.defineProperty(script, 'mouseHint', { get: function() { return script.instance.mouseHint; }, set: function(x) { script.instance.mouseHint = x }});
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
script.onAwake = function() {
	return script.instance.onAwake();
};
script.getScreenPoints = function() {
	return script.instance.getScreenPoints();
};
script.instance.onAwake();
