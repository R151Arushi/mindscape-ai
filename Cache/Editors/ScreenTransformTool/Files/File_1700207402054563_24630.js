"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Home = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Tools/Button");
}
const _Button = RequireModule.requireModule("@src/Editor/Tools/Button");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
class Home {
    constructor() {
        this.onAwake = () => {
            this.sceneObject = this.script.getSceneObject();
            this.setupButton();
        };
    }
    setupButton() {
        this.button = new _Button.module.Button(this.sceneObject, this.camera, this.hintObj, true, () => {
            this.lensRegion.instance.getPanControl().resetPosition();
        });
    }
}
exports.Home = Home;
