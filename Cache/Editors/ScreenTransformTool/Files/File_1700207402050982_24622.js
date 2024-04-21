"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Recalculate = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Tools/Button");
}
const _Button = RequireModule.requireModule("@src/Editor/Tools/Button");
if (false) {
    require("@src/Editor/Config");
}
const _Config = RequireModule.requireModule("@src/Editor/Config");
class Recalculate {
    constructor() {
        this.onAwake = () => {
            this.sceneObject = this.script.getSceneObject();
            this.material = this.sceneObject.getComponent("Image").mainMaterial;
            this.setupButton();
        };
    }
    setupButton() {
        this.recalculateDisabledObj.enabled = false;
        this.recalculateEnabledObj.enabled = false;
        this.button = new _Button.module.Button(this.sceneObject, this.camera, this.recalculateDisabledObj, true, () => {
            _Config.module.Config.isRecalculateEnabled.value = !_Config.module.Config.isRecalculateEnabled.value;
            this.material.mainPass.Active = _Config.module.Config.isRecalculateEnabled.value;
            if (_Config.module.Config.isRecalculateEnabled.value) {
                this.recalculateDisabledObj.enabled = false;
                this.button.setNewHintObject(this.recalculateEnabledObj);
            }
            else {
                this.recalculateEnabledObj.enabled = false;
                this.button.setNewHintObject(this.recalculateDisabledObj);
            }
        });
    }
}
exports.Recalculate = Recalculate;
