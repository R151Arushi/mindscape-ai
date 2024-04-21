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
// @input Component.ScriptComponent main 
checkUndefined("main", undefined, true);
// @input Component.Text zoomText 
checkUndefined("zoomText", undefined, true);
var RequireModule = require("RequireModule");
if (false) {
	 require("Src/Editor/TextController");
}
var Module = RequireModule.requireModule("Src/Editor/TextController");
script.instance = new Module.module.TextController();
script.instance.main = script.main
script.instance.zoomText = script.zoomText
script.instance.script = script;
script.instance.run();
