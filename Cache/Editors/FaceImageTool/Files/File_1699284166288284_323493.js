"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Main = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("../../Common/Utilities/LensRegion/LensRegion");
}
var _LensRegion = RequireModule.requireModule("../../Common/Utilities/LensRegion/LensRegion");
if (false) {
    require("../../Common/Utilities/LensRegion/PanControl");
}
var _PanControl = RequireModule.requireModule("../../Common/Utilities/LensRegion/PanControl");
if (false) {
    require("../../Common/Utilities/RenderLayerUtils");
}
var _RenderLayerUtils = RequireModule.requireModule("../../Common/Utilities/RenderLayerUtils");
var Main = /** @class */ (function () {
    function Main() {
    }
    Main.prototype.run = function () {
        _RenderLayerUtils.module.RenderLayerUtils.setUniqueLayersForHierarchy(this.script.getSceneObject().getParent());
        this.lensRegion = new _LensRegion.module.LensRegion(this.script, this.screenTransform, this.lensRes, this.backgroundRes);
        this.panControl = this.lensRegion.getPanControl();
    };
    Main.prototype.getLensRegion = function () {
        return this.lensRegion;
    };
    Main.prototype.addPinchOnUpdateCallback = function (newFunction) {
        this.lensRegion.getPinchControl().addOnUpdateCallback(newFunction);
    };
    return Main;
}());
exports.Main = Main;
