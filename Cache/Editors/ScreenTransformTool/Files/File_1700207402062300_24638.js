"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Snapping = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Tools/Button");
}
const _Button = RequireModule.requireModule("@src/Editor/Tools/Button");
if (false) {
    require("@src/Editor/Config");
}
const _Config = RequireModule.requireModule("@src/Editor/Config");
class Snapping {
    constructor() {
        this.onAwake = () => {
            this.sceneObject = this.script.getSceneObject();
            this.material = this.sceneObject.getComponent("Image").mainMaterial;
            this.setupButton();
        };
    }
    setupButton() {
        this.disableSnappingObj.enabled = false;
        this.button = new _Button.module.Button(this.sceneObject, this.camera, this.hintObj, true, () => {
            _Config.module.Config.isSnappingEnabled.value = !_Config.module.Config.isSnappingEnabled.value;
            this.material.mainPass.Active = _Config.module.Config.isSnappingEnabled.value;
            this.enableSnappingObj.enabled = !_Config.module.Config.isSnappingEnabled.value;
            this.disableSnappingObj.enabled = _Config.module.Config.isSnappingEnabled.value;
        });
    }
}
exports.Snapping = Snapping;
