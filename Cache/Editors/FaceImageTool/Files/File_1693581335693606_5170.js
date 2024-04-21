"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AspectControl = void 0;
var AspectControl = /** @class */ (function () {
    function AspectControl(script, windowResolution, lensResolution, screenTransform) {
        var _this = this;
        this.center = vec2.zero();
        this.lastResolution = [0, 0];
        this.doOnUpdate = [];
        this.windowResolution = windowResolution;
        this.lensResolution = lensResolution;
        this.screenTransform = screenTransform;
        this.script = script;
        this.updateEvent = this.script.createEvent("UpdateEvent");
        this.updateEvent.bind(function () {
            if (_this.lastResolution[0] !== _this.windowResolution.getWidth() ||
                _this.lastResolution[1] !== _this.windowResolution.getHeight()) {
                _this.onUpdate();
            }
        });
    }
    AspectControl.prototype.updateLensResolution = function (texture) {
        this.lensResolution = texture;
        this.onUpdate();
    };
    AspectControl.prototype.addOnUpdateCallback = function (cb) {
        this.doOnUpdate.push(cb);
    };
    AspectControl.prototype.getAspect = function () {
        return this.lensResolution.control.getAspect();
    };
    AspectControl.prototype.onUpdate = function () {
        this.lastResolution = [this.windowResolution.getWidth(), this.windowResolution.getHeight()];
        this.updateLensRegion();
        this.setZoomScale(0.8);
        this.processCallbacks();
    };
    AspectControl.prototype.processCallbacks = function () {
        this.doOnUpdate.forEach(function (cb) {
            cb && cb();
        });
    };
    AspectControl.prototype.updateLensRegion = function () {
        var bWidth = this.windowResolution.getWidth();
        var bHeight = this.windowResolution.getHeight();
        this.center = this.screenTransform.anchors.getCenter();
        this.screenTransform.anchors.left = -1;
        this.screenTransform.anchors.right = 1;
        this.screenTransform.anchors.top = 1;
        this.screenTransform.anchors.bottom = -1;
        if (this.windowResolution.control.getAspect() < this.lensResolution.control.getAspect()) {
            var k = bWidth / this.lensResolution.control.getAspect() / bHeight;
            this.screenTransform.anchors.bottom = -k;
            this.screenTransform.anchors.top = k;
        }
        else {
            var k = bHeight * this.lensResolution.control.getAspect() / bWidth;
            this.screenTransform.anchors.left = -k;
            this.screenTransform.anchors.right = k;
        }
        this.anchors = Rect.create(this.screenTransform.anchors.left, this.screenTransform.anchors.right, this.screenTransform.anchors.bottom, this.screenTransform.anchors.top);
        this.anchors.setCenter(this.center);
    };
    AspectControl.prototype.setZoomScale = function (value) {
        this.screenTransform.anchors.left = this.anchors.left * value;
        this.screenTransform.anchors.right = this.anchors.right * value;
        this.screenTransform.anchors.top = this.anchors.top * value;
        this.screenTransform.anchors.bottom = this.anchors.bottom * value;
        this.screenTransform.anchors.setCenter(this.anchors.getCenter());
    };
    return AspectControl;
}());
exports.AspectControl = AspectControl;
