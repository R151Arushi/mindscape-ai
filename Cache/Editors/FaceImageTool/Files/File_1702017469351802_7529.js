if (script.instance) {
	script.instance.run();
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
// @input SceneObject so 
checkUndefined("so", undefined, true);
// @input SceneObject hintObj 
checkUndefined("hintObj", undefined, true);
// @input Component.ScriptComponent main 
checkUndefined("main", undefined, true);
// @input Component.ScriptComponent effectEditor 
checkUndefined("effectEditor", undefined, true);
var RequireModule = require("RequireModule");
if (false) {
	 require("Src/Editor/AddButton");
}
var Module = RequireModule.requireModule("Src/Editor/AddButton");
script.instance = new Module.module.AddButton();
script.instance.so = script.so
script.instance.hintObj = script.hintObj
script.instance.main = script.main
script.instance.effectEditor = script.effectEditor
script.instance.script = script;
script.instance.run();
