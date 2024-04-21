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
var RequireModule = require("RequireModule");
if (false) {
	 require("../../../../Modules/Src/Editor/MouseHint");
}
var Module = RequireModule.requireModule("../../../../Modules/Src/Editor/MouseHint");
script.instance = new Module.module.MouseHint();
script.instance.script = script;
Object.defineProperty(script, 'script', { get: function() { return script.instance.script; }, set: function(x) { script.instance.script = x }});
script.onAwake = function() {
	return script.instance.onAwake();
};
script.setText = function(msg) {
	return script.instance.setText(msg);
};
script.show = function() {
	return script.instance.show();
};
script.hide = function() {
	return script.instance.hide();
};
script.updateFromMousePosition = function(mouseScreenPosition, updateOffsets) {
	return script.instance.updateFromMousePosition(mouseScreenPosition, updateOffsets);
};
script.instance.onAwake();
