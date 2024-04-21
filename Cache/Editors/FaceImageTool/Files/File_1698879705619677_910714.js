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
// @input Asset.Texture baseTexture 
checkUndefined("baseTexture", undefined, true);
// @input Asset.Texture[] textures 
checkUndefined("textures", undefined, true);
var RequireModule = require("RequireModule");
if (false) {
	 require("Src/Editor/TextureResolutionController");
}
var Module = RequireModule.requireModule("Src/Editor/TextureResolutionController");
script.instance = new Module.module.TextureResolutionController();
script.instance.baseTexture = script.baseTexture
script.instance.textures = script.textures
script.instance.script = script;
script.instance.run();
