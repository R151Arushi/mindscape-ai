"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GuideButton = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Tools/Button");
}
const _Button = RequireModule.requireModule("@src/Editor/Tools/Button");
if (false) {
    require("@src/Editor/Config");
}
const _Config = RequireModule.requireModule("@src/Editor/Config");
class GuideButton {
    constructor() {
        this.onAwake = () => {
            this.sceneObject = this.script.getSceneObject();
            this.material = this.sceneObject.getComponent("Image").mainMaterial;
            this.setupButton();
        };
    }
    setupButton() {
        this.button = new _Button.module.Button(this.sceneObject, this.camera, null, false, () => {
            _Config.module.Config.isGuideEnabled.value = !_Config.module.Config.isGuideEnabled.value;
            this.material.mainPass.Active = _Config.module.Config.isGuideEnabled.value;
        });
    }
}
exports.GuideButton = GuideButton;
