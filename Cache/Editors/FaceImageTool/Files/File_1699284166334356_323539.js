"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ZoomButton = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Main");
}
var _Main = RequireModule.requireModule("@src/Main");
if (false) {
    require("./Button");
}
var _Button = RequireModule.requireModule("./Button");
if (false) {
    require("../Shared/SharedContent");
}
var _SharedContent = RequireModule.requireModule("../Shared/SharedContent");
var ZoomButton = /** @class */ (function () {
    function ZoomButton() {
    }
    ZoomButton.prototype.run = function () {
        this.setupButton();
    };
    ZoomButton.prototype.setupButton = function () {
        var _this = this;
        this.button = new _Button.module.Button(this.so, _SharedContent.module.SharedContent.getInstance().overlayCamera, this.hintObj, true, function () {
            _this.main.instance.getLensRegion().resetScale();
        });
    };
    return ZoomButton;
}());
exports.ZoomButton = ZoomButton;
