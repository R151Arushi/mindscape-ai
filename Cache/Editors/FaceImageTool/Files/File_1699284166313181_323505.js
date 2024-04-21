"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.TextController = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("../Main");
}
var _Main = RequireModule.requireModule("../Main");
var TextController = /** @class */ (function () {
    function TextController() {
    }
    TextController.prototype.run = function () {
        var _this = this;
        this.main.instance.addPinchOnUpdateCallback(function () {
            _this.updateZoomText();
        });
    };
    TextController.prototype.updateZoomText = function () {
        this.zoomText.text = "Zoom: " + Math.floor(this.main.instance.getLensRegion().getPinchControl().getScale() * 100) + "%";
    };
    return TextController;
}());
exports.TextController = TextController;
