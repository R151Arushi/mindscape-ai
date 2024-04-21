"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PanControl = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
var _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
var PanControl = /** @class */ (function () {
    function PanControl(script, screenTransform) {
        this.doOnUpdate = [];
        this.script = script;
        this.screenTransform = screenTransform;
        this.cameraObject = this.getCameraObject(this.screenTransform.getSceneObject());
        this.cameraTransform = this.cameraObject.getTransform();
        this.initPosition = screenTransform.anchors.getCenter();
        this.startPosition = screenTransform.anchors.getCenter();
        this.setupEvents();
    }
    PanControl.prototype.addOnUpdateCallback = function (cb) {
        this.doOnUpdate.push(cb);
    };
    PanControl.prototype.resetPosition = function () {
        this.screenTransform.anchors.setCenter(this.initPosition);
        this.computeCameraPosition();
        this.startPosition = this.screenTransform.anchors.getCenter();
        this.cameraStartPosition = this.cameraTransform.getWorldPosition();
        this.processCallbacks();
    };
    PanControl.prototype.processCallbacks = function () {
        this.doOnUpdate.forEach(function (cb) {
            cb && cb();
        });
    };
    PanControl.prototype.getCameraObject = function (object) {
        if (object.getComponent("Component.Camera")) {
            return object;
        }
        if (object.hasParent()) {
            return this.getCameraObject(object.getParent());
        }
        return null;
    };
    PanControl.prototype.computeCameraPosition = function () {
        var screenCenter = this.screenTransform.screenPointToLocalPoint(new vec2(0.5, 0.5));
        var diff = this.screenTransform.localPointToWorldPoint(vec2.zero())
            .sub(this.screenTransform.localPointToWorldPoint(screenCenter)).uniformScale(-1);
        this.cameraTransform.setWorldPosition(diff);
    };
    PanControl.prototype.setupEvents = function () {
        var _this = this;
        var handlePanTranslation = function (translation) {
            translation.y = -translation.y;
            _this.screenTransform.anchors.setCenter(_this.startPosition.add(translation.uniformScale(2)));
            _this.computeCameraPosition();
            _this.processCallbacks();
        };
        var onPanStartEvent = function (eventData) {
            _LensRegion.module.LensRegion.isBusy = true;
            handlePanTranslation(eventData.getTranslation());
        };
        var onPanMoveEvent = function (eventData) {
            handlePanTranslation(eventData.getTranslation());
        };
        var onPanEndEvent = function (eventData) {
            handlePanTranslation(eventData.getTranslation());
            _this.startPosition = _this.screenTransform.anchors.getCenter();
            _this.cameraStartPosition = _this.cameraTransform.getWorldPosition();
            _LensRegion.module.LensRegion.isBusy = false;
        };
        this.script.createEvent("PanGestureStartEvent").bind(onPanStartEvent);
        this.script.createEvent("PanGestureMoveEvent").bind(onPanMoveEvent);
        this.script.createEvent("PanGestureEndEvent").bind(onPanEndEvent);
    };
    return PanControl;
}());
exports.PanControl = PanControl;
