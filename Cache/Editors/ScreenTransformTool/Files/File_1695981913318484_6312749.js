"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LensRegion = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("./AspectControl");
}
const _AspectControl = RequireModule.requireModule("./AspectControl");
if (false) {
    require("./PanControl");
}
const _PanControl = RequireModule.requireModule("./PanControl");
if (false) {
    require("./PinchControl");
}
const _PinchControl = RequireModule.requireModule("./PinchControl");
class LensRegion {
    constructor() {
        this.onAwake = () => {
            this.screenTransform = this.script.getSceneObject().getComponent("ScreenTransform");
            this.aspectControl = new _AspectControl.module.AspectControl(this.script, this.windowResolution, this.lensResolution, this.screenTransform);
            this.panControl = new _PanControl.module.PanControl(this.script, this.screenTransform);
            this.pinchControl = new _PinchControl.module.PinchControl(this.script, this.screenTransform);
        };
    }
    addOnLensRegionUpdate(cb) {
        this.aspectControl.addOnUpdateCallback(cb);
        this.panControl.addOnUpdateCallback(cb);
        this.pinchControl.addOnUpdateCallback(cb);
    }
    updateBackgroundResolution(texture) {
        this.aspectControl.updateLensResolution(texture);
    }
    getAspectControl() {
        return this.aspectControl;
    }
    getPanControl() {
        return this.panControl;
    }
    getPinchControl() {
        return this.pinchControl;
    }
    getWindowTexture() {
        return this.windowResolution;
    }
    reset() {
        this.panControl.resetPosition();
        this.pinchControl.resetScale();
    }
}
exports.LensRegion = LensRegion;
LensRegion.isBusy = false;
