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
// @input Asset.Material linesMat 
checkUndefined("linesMat", undefined, undefined);
// @input Asset.Texture startPoint 
checkUndefined("startPoint", undefined, undefined);
// @input Asset.Texture endPoint 
checkUndefined("endPoint", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../Modules/Src/Editor/LineRenderer");
}
var Module = RequireModule.requireModule("../../../../Modules/Src/Editor/LineRenderer");
script.instance = new Module.module.LineRenderer();
script.instance.linesMat = script.linesMat
script.instance.startPoint = script.startPoint
script.instance.endPoint = script.endPoint
script.instance.script = script;
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'linesMat', { get: function() { return script.instance.linesMat; }, set: function(x) { script.instance.linesMat = x }});
Object.defineProperty(script, 'startPoint', { get: function() { return script.instance.startPoint; }, set: function(x) { script.instance.startPoint = x }});
Object.defineProperty(script, 'endPoint', { get: function() { return script.instance.endPoint; }, set: function(x) { script.instance.endPoint = x }});
Object.defineProperty(script, 'onAwake', { get: function() { return script.instance.onAwake; }, set: function(x) { script.instance.onAwake = x }});
script.addLine = function(from, to) {
	return script.instance.addLine(from, to);
};
script.reset = function() {
	return script.instance.reset();
};
script.update = function() {
	return script.instance.update();
};
script.instance.onAwake();
