"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PinchControl = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
class PinchControl {
    constructor(script, screenTransform) {
        this.doOnUpdate = [];
        this.resetThreshold = 0.3;
        this.minScale = 0.2;
        this.maxScale = 5;
        this.defaultStartScale = 1;
        this.script = script;
        this.screenTransform = screenTransform;
        this.cameraObject = this.getCameraObject(this.screenTransform.getSceneObject());
        this.cameraTransform = this.cameraObject.getTransform();
        this.initScale = screenTransform.scale;
        this.startScale = screenTransform.scale;
        this.minScaleVec = this.initScale.uniformScale(this.minScale);
        this.maxScaleVec = this.initScale.uniformScale(this.maxScale);
        this.setupEvents();
        this.setScale(this.defaultStartScale);
    }
    addOnUpdateCallback(cb) {
        this.doOnUpdate.push(cb);
    }
    resetScale() {
        this.screenTransform.scale = this.initScale;
        this.startScale = this.screenTransform.scale;
        this.setScale(this.defaultStartScale);
        this.processCallbacks();
    }
    processCallbacks() {
        this.doOnUpdate.forEach((cb) => {
            cb && cb();
        });
    }
    getCameraObject(object) {
        if (object.getComponent("Component.Camera")) {
            return object;
        }
        if (object.hasParent()) {
            return this.getCameraObject(object.getParent());
        }
        return null;
    }
    resetPinchScale() {
        this.startScale = this.screenTransform.scale;
    }
    sign(x) {
        if (x === 0) {
            return 0;
        }
        if (x < 0) {
            return -1;
        }
        return 1;
    }
    setScale(scale) {
        this.screenTransform.scale = this.clampVec3(this.startScale.uniformScale(scale));
        this.processCallbacks();
    }
    setupEvents() {
        let lastScale = 1;
        let lastScaleDirection = 0;
        const handleScale = (scale) => {
            const currentDirection = this.sign(scale - lastScale);
            if (currentDirection != lastScaleDirection && Math.abs(scale - lastScale) > this.resetThreshold) {
                this.resetPinchScale();
            }
            lastScale = scale;
            lastScaleDirection = currentDirection;
            this.setScale(scale);
        };
        const onPinchStartEvent = (eventData) => {
            _LensRegion.module.LensRegion.isBusy = true;
            lastScale = 1;
            handleScale(eventData.getScale());
        };
        const onPinchMoveEvent = (eventData) => {
            handleScale(eventData.getScale());
        };
        const onPinchEndEvent = (eventData) => {
            handleScale(eventData.getScale());
            this.startScale = this.screenTransform.scale;
            _LensRegion.module.LensRegion.isBusy = false;
        };
        this.script.createEvent("PinchGestureStartEvent").bind(onPinchStartEvent);
        this.script.createEvent("PinchGestureMoveEvent").bind(onPinchMoveEvent);
        this.script.createEvent("PinchGestureEndEvent").bind(onPinchEndEvent);
    }
    clampVec3(curVec) {
        curVec.x = this.clamp(curVec.x, this.minScaleVec.x, this.maxScaleVec.x);
        curVec.y = this.clamp(curVec.y, this.minScaleVec.y, this.maxScaleVec.y);
        curVec.z = this.clamp(curVec.z, this.minScaleVec.z, this.maxScaleVec.z);
        return curVec;
    }
    clamp(val, min, max) {
        return Math.min(Math.max(val, min), max);
    }
    getScale() {
        return this.screenTransform.scale.x / this.initScale.x;
    }
}
exports.PinchControl = PinchControl;
