"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ZoomText = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
class ZoomText {
    constructor() {
        this.onAwake = () => {
            this.lensRegion.instance.getPinchControl().addOnUpdateCallback(() => {
                this.updateZoomText();
            });
        };
    }
    updateZoomText() {
        this.zoomText.text = "Zoom: " + Math.floor(this.lensRegion.instance.getPinchControl().getScale() * 100) + "%";
    }
}
exports.ZoomText = ZoomText;
