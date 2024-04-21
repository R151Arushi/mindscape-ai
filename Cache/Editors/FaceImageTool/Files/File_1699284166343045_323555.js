"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.TextureResolutionController = void 0;
var TextureResolutionController = /** @class */ (function () {
    function TextureResolutionController() {
    }
    TextureResolutionController.prototype.run = function () {
        var _this = this;
        var texResolution = new vec2(this.baseTexture.getWidth(), this.baseTexture.getHeight());
        this.textures.forEach(function (texture) {
            var provider = texture.control;
            provider.inputTexture = _this.baseTexture;
            provider.useScreenResolution = false;
            provider.resolution = texResolution;
        });
    };
    return TextureResolutionController;
}());
exports.TextureResolutionController = TextureResolutionController;
