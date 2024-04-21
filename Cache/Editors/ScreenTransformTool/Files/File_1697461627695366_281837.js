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
// @input Component.Camera camera 
checkUndefined("camera", undefined, undefined);
// @input SceneObject recalculateEnabledObj 
checkUndefined("recalculateEnabledObj", undefined, undefined);
// @input SceneObject recalculateDisabledObj 
checkUndefined("recalculateDisabledObj", undefined, undefined);
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../../Modules/Src/Editor/Tools/Recalculate");
}
var Module = RequireModule.requireModule("../../../../../Modules/Src/Editor/Tools/Recalculate");
script.instance = new Module.module.Recalculate();
script.instance.camera = script.camera
script.instance.recalculateEnabledObj = script.recalculateEnabledObj
script.instance.recalculateDisabledObj = script.recalculateDisabledObj
script.instance.script = script;
Object.defineProperty(script, 'camera', { get: function() { return script.instance.camera; }, set: function(x) { script.instance.camera = x }});
Object.defineProperty(script, 'recalculateEnabledObj', { get: function() { return script.instance.recalculateEnabledObj; }, set: function(x) { script.instance.recalculateEnabledObj = x }});
Object.defineProperty(script, 'recalculateDisabledObj', { get: function() { return script.instance.recalculateDisabledObj; }, set: function(x) { script.instance.recalculateDisabledObj = x }});
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
Object.defineProperty(script, 'onAwake', { get: function() { return script.instance.onAwake; }, set: function(x) { script.instance.onAwake = x }});
script.instance.onAwake();
