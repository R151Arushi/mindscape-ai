"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Point = void 0;
class Point {
    constructor(sceneObject) {
        this.sceneObject = sceneObject;
        this.cameraSize = 20;
        this.zoom = 1;
        this.screenTransform = sceneObject.getComponent("ScreenTransform");
        this.offset = this.screenTransform.anchors.getCenter();
        this.scale = this.screenTransform.scale;
        this.rotation = this.screenTransform.rotation;
        this.eventsScript = sceneObject.createComponent("ScriptComponent");
        this.interactionComponent = this.sceneObject.getComponent("InteractionComponent");
        if (!this.interactionComponent) {
            this.interactionComponent = this.sceneObject.createComponent("InteractionComponent");
        }
        this.interactionComponent.isFilteredByDepth = true;
        this.setupInteractions();
    }
    updateInteractionCamera(camera) {
        this.interactionComponent.setCamera(camera);
        const size = this.screenTransform.anchors.getSize().uniformScale(camera.size / this.cameraSize);
        this.screenTransform.anchors.setSize(size);
        this.screenTransform.scale = this.screenTransform.scale.uniformScale(camera.size / this.cameraSize);
        this.cameraSize = camera.size;
        this.interactionCamera = camera;
    }
    updateLayer(layer) {
        this.sceneObject.layer = layer;
    }
    setOnUpdate(callback) {
        this.callback = callback;
    }
    containsWorldPoint(point) {
        return this.screenTransform.containsWorldPoint(point);
    }
    containsScreenPoint(point) {
        return this.screenTransform.containsScreenPoint(point);
    }
    setZoom(zoom) {
        this.zoom = zoom;
        this.screenTransform.scale = this.scale.uniformScale(zoom);
    }
    setScale(scale) {
        this.scale = scale;
        this.setZoom(this.zoom);
    }
    setValidator(callback) {
        this.validator = callback;
    }
    setupInteractions() { }
}
exports.Point = Point;
