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
// @input Component.Camera orthoCamera 
checkUndefined("orthoCamera", undefined, true);
// @input Component.Camera overlayCamera 
checkUndefined("overlayCamera", undefined, true);
var RequireModule = require("RequireModule");
if (false) {
	 require("Src/Shared/SharedContent");
}
var Module = RequireModule.requireModule("Src/Shared/SharedContent");
script.instance = new Module.module.SharedContent();
script.instance.orthoCamera = script.orthoCamera
script.instance.overlayCamera = script.overlayCamera
script.instance.script = script;
script.instance.run();
