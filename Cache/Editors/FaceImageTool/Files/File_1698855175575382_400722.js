"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PinchControl = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
var _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
var PinchControl = /** @class */ (function () {
    function PinchControl(script, screenTransform) {
        this.doOnUpdate = [];
        this.resetThreshold = 0.3;
        this.minScale = 0.2;
        this.maxScale = 5;
        this.script = script;
        this.screenTransform = screenTransform;
        this.cameraObject = this.getCameraObject(this.screenTransform.getSceneObject());
        this.cameraTransform = this.cameraObject.getTransform();
        this.initScale = screenTransform.scale;
        this.startScale = screenTransform.scale;
        this.minScaleVec = this.initScale.uniformScale(this.minScale);
        this.maxScaleVec = this.initScale.uniformScale(this.maxScale);
        this.setupEvents();
    }
    PinchControl.prototype.addOnUpdateCallback = function (cb) {
        this.doOnUpdate.push(cb);
    };
    PinchControl.prototype.resetScale = function () {
        this.screenTransform.scale = this.initScale;
        this.startScale = this.screenTransform.scale;
        this.processCallbacks();
    };
    PinchControl.prototype.processCallbacks = function () {
        this.doOnUpdate.forEach(function (cb) {
            cb && cb();
        });
    };
    PinchControl.prototype.getCameraObject = function (object) {
        if (object.getComponent("Component.Camera")) {
            return object;
        }
        if (object.hasParent()) {
            return this.getCameraObject(object.getParent());
        }
        return null;
    };
    PinchControl.prototype.resetPinchScale = function () {
        this.startScale = this.screenTransform.scale;
    };
    PinchControl.prototype.sign = function (x) {
        if (x === 0) {
            return 0;
        }
        if (x < 0) {
            return -1;
        }
        return 1;
    };
    PinchControl.prototype.setupEvents = function () {
        var _this = this;
        var lastScale = 1;
        var lastScaleDirection = 0;
        var handleScale = function (scale) {
            var currentDirection = _this.sign(scale - lastScale);
            if (currentDirection != lastScaleDirection && Math.abs(scale - lastScale) > _this.resetThreshold) {
                _this.resetPinchScale();
            }
            lastScale = scale;
            lastScaleDirection = currentDirection;
            _this.screenTransform.scale = _this.clampVec3(_this.startScale.uniformScale(scale));
            _this.processCallbacks();
        };
        var onPinchStartEvent = function (eventData) {
            _LensRegion.module.LensRegion.isBusy = true;
            lastScale = 1;
            handleScale(eventData.getScale());
        };
        var onPinchMoveEvent = function (eventData) {
            handleScale(eventData.getScale());
        };
        var onPinchEndEvent = function (eventData) {
            handleScale(eventData.getScale());
            _this.startScale = _this.screenTransform.scale;
            _LensRegion.module.LensRegion.isBusy = false;
        };
        this.script.createEvent("PinchGestureStartEvent").bind(onPinchStartEvent);
        this.script.createEvent("PinchGestureMoveEvent").bind(onPinchMoveEvent);
        this.script.createEvent("PinchGestureEndEvent").bind(onPinchEndEvent);
    };
    PinchControl.prototype.clampVec3 = function (curVec) {
        curVec.x = this.clamp(curVec.x, this.minScaleVec.x, this.maxScaleVec.x);
        curVec.y = this.clamp(curVec.y, this.minScaleVec.y, this.maxScaleVec.y);
        curVec.z = this.clamp(curVec.z, this.minScaleVec.z, this.maxScaleVec.z);
        return curVec;
    };
    PinchControl.prototype.clamp = function (val, min, max) {
        return Math.min(Math.max(val, min), max);
    };
    PinchControl.prototype.getScale = function () {
        return this.screenTransform.scale.x / this.initScale.x;
    };
    return PinchControl;
}());
exports.PinchControl = PinchControl;
