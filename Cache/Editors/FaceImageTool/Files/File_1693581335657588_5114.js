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
// @input SceneObject editorObject 
checkUndefined("editorObject", undefined, true);
// @input SceneObject defaultTextObject 
checkUndefined("defaultTextObject", undefined, true);
// @input Component.ScreenTransform screenTransform 
checkUndefined("screenTransform", undefined, true);
// @input Component.InteractionComponent interactionComponent 
checkUndefined("interactionComponent", undefined, true);
// @input SceneObject effects 
checkUndefined("effects", undefined, true);
// @input Component.Camera camera 
checkUndefined("camera", undefined, true);
// @input Asset.Texture deviceCameraTexture 
checkUndefined("deviceCameraTexture", undefined, true);
var RequireModule = require("RequireModule");
if (false) {
	 require("Src/Editor/EffectEditor");
}
var Module = RequireModule.requireModule("Src/Editor/EffectEditor");
script.instance = new Module.module.EffectEditor();
script.instance.main = script.main
script.instance.editorObject = script.editorObject
script.instance.defaultTextObject = script.defaultTextObject
script.instance.screenTransform = script.screenTransform
script.instance.interactionComponent = script.interactionComponent
script.instance.effects = script.effects
script.instance.camera = script.camera
script.instance.deviceCameraTexture = script.deviceCameraTexture
script.instance.script = script;
script.instance.run();
