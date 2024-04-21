// @input Component.Camera camera
// @input Asset.Texture texture
//@input Component.Text textComponent

var camera = script.camera;
var skip = 0;
var lastSize = camera.size;
script.createEvent("UpdateEvent").bind(function() {
    if (skip <= 0 && script.texture.getHeight() > 0 && script.texture.getHeight() !== lastSize) {
        camera.size = script.texture.getHeight();   
        lastSize = camera.size;
        script.textComponent.enabled = true;
        skip = 0;
    }
    skip -=1;
})