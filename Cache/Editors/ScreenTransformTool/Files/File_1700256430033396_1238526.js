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
// @input Component.ScriptComponent mouseHint 
checkUndefined("mouseHint", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../../Modules/Src/Editor/RulersAndGuides/Guide");
}
var Module = RequireModule.requireModule("../../../../../Modules/Src/Editor/RulersAndGuides/Guide");
script.instance = new Module.module.Guide();
script.instance.mouseHint = script.mouseHint
script.instance.script = script;
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'mouseHint', { get: function() { return script.instance.mouseHint; }, set: function(x) { script.instance.mouseHint = x }});
script.onAwake = function() {
	return script.instance.onAwake();
};
script.addOnUpdate = function(cb) {
	return script.instance.addOnUpdate(cb);
};
script.setType = function(type) {
	return script.instance.setType(type);
};
script.getSingleAxisPosition = function() {
	return script.instance.getSingleAxisPosition();
};
script.getPosition = function() {
	return script.instance.getPosition();
};
script.getScreenPosition = function() {
	return script.instance.getScreenPosition();
};
script.setScreenPosition = function(position) {
	return script.instance.setScreenPosition(position);
};
script.setPosition = function(position) {
	return script.instance.setPosition(position);
};
script.getWorldCenter = function() {
	return script.instance.getWorldCenter();
};
script.getType = function() {
	return script.instance.getType();
};
script.getHint = function() {
	return script.instance.getHint();
};
script.instance.onAwake();
