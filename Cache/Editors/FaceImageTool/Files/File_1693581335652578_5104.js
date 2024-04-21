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
// @input Asset.Texture backgroundRes 
checkUndefined("backgroundRes", undefined, true);
// @input Asset.Texture lensRes 
checkUndefined("lensRes", undefined, true);
// @input Component.ScreenTransform screenTransform 
checkUndefined("screenTransform", undefined, true);
var RequireModule = require("RequireModule");
if (false) {
	 require("Src/Main");
}
var Module = RequireModule.requireModule("Src/Main");
script.instance = new Module.module.Main();
script.instance.backgroundRes = script.backgroundRes
script.instance.lensRes = script.lensRes
script.instance.screenTransform = script.screenTransform
script.instance.script = script;
script.instance.run();
