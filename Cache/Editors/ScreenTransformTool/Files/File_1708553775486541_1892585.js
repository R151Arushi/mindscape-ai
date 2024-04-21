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
// @input float priority  = 0
checkUndefined("priority", undefined, undefined);
// @input int cursorType {"widget":"combobox", "values":[{"label":"Canvas", "value":0}, {"label":"ClosedHand", "value":1}, {"label":"OpenHand", "value":2}, {"label":"Rotation", "value":3}, {"label":"Scale", "value":4}, {"label":"ZoomIn", "value":5}, {"label":"ZoomOut", "value":6}, {"label":"Default", "value":7}, {"label":"Custom", "value":8}]}
checkUndefined("cursorType", undefined, undefined);
// @input Asset.Texture cursorTexture {"showIf":"cursorType", "showIfValue":8}
checkUndefined("cursorTexture", "cursorType", 8);
// @input int rotationType {"widget":"combobox", "values":[{"label":"Custom", "value":0}, {"label":"Lock To World Rotation", "value":1}]}
checkUndefined("rotationType", undefined, undefined);
// @input float rotation {"showIf":"rotationType", "showIfValue":0} = 0
checkUndefined("rotation", "rotationType", 0);
// @input float rotationOffset {"showIf":"rotationType", "showIfValue":1} = 0
checkUndefined("rotationOffset", "rotationType", 1);
// @input int triggerType {"widget":"combobox", "values":[{"label":"onHover", "value":0}, {"label":"onTouch", "value":1}, {"label":"onPinch", "value":2}, {"label":"onPan", "value":3}]}
checkUndefined("triggerType", undefined, undefined);
// @input Asset.Texture[] macIconTextures 
checkUndefined("macIconTextures", undefined, undefined);
// @input Asset.Texture[] winIconTextures 
checkUndefined("winIconTextures", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../../Modules/Src/Editor/MouseCursor/Cursor");
}
var Module = RequireModule.requireModule("../../../../../Modules/Src/Editor/MouseCursor/Cursor");
script.instance = new Module.module.Cursor();
script.instance.priority = script.priority
script.instance.cursorType = script.cursorType
script.instance.cursorTexture = script.cursorTexture
script.instance.rotationType = script.rotationType
script.instance.rotation = script.rotation
script.instance.rotationOffset = script.rotationOffset
script.instance.triggerType = script.triggerType
script.instance.macIconTextures = script.macIconTextures
script.instance.winIconTextures = script.winIconTextures
script.instance.script = script;
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'onAwake', { get: function() { return script.instance.onAwake; }, set: function(x) { script.instance.onAwake = x }});
script.setRotation = function(angle) {
	return script.instance.setRotation(angle);
};
script.setCursorType = function(cursorType) {
	return script.instance.setCursorType(cursorType);
};
script.instance.onAwake();
