"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LensRegion = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("./AspectControl");
}
var _AspectControl = RequireModule.requireModule("./AspectControl");
if (false) {
    require("./PanControl");
}
var _PanControl = RequireModule.requireModule("./PanControl");
if (false) {
    require("./PinchControl");
}
var _PinchControl = RequireModule.requireModule("./PinchControl");
var LensRegion = /** @class */ (function () {
    function LensRegion(script, screenTransform, lensResolution, windowResolution) {
        this.script = script;
        this.aspectControl = new _AspectControl.module.AspectControl(this.script, windowResolution, lensResolution, screenTransform);
        this.panControl = new _PanControl.module.PanControl(this.script, screenTransform);
        this.pinchControl = new _PinchControl.module.PinchControl(this.script, screenTransform);
    }
    LensRegion.prototype.addOnLensRegionUpdate = function (cb) {
        this.aspectControl.addOnUpdateCallback(cb);
        this.panControl.addOnUpdateCallback(cb);
        this.pinchControl.addOnUpdateCallback(cb);
    };
    LensRegion.prototype.updateBackgroundResolution = function (texture) {
        this.aspectControl.updateLensResolution(texture);
    };
    LensRegion.prototype.getAspect = function () {
        return this.aspectControl.getAspect();
    };
    LensRegion.prototype.getPanControl = function () {
        return this.panControl;
    };
    LensRegion.prototype.getPinchControl = function () {
        return this.pinchControl;
    };
    LensRegion.prototype.resetPosition = function () {
        this.panControl.resetPosition();
    };
    LensRegion.prototype.resetScale = function () {
        this.pinchControl.resetScale();
    };
    LensRegion.isBusy = false;
    return LensRegion;
}());
exports.LensRegion = LensRegion;
