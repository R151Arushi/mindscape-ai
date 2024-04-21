"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SceneViewer = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/InactiveFrame");
}
const _InactiveFrame = RequireModule.requireModule("@src/Editor/InactiveFrame");
if (false) {
    require("@src/Editor/InactiveFramePool");
}
const _InactiveFramePool = RequireModule.requireModule("@src/Editor/InactiveFramePool");
if (false) {
    require("@src/Editor/Utils");
}
const _Utils = RequireModule.requireModule("@src/Editor/Utils");
if (false) {
    require("@src/Editor/Gizmo/Gizmo");
}
const _Gizmo = RequireModule.requireModule("@src/Editor/Gizmo/Gizmo");
var SceneViewerMode;
(function (SceneViewerMode) {
    SceneViewerMode[SceneViewerMode["Camera"] = 0] = "Camera";
    SceneViewerMode[SceneViewerMode["Canvas"] = 1] = "Canvas";
})(SceneViewerMode || (SceneViewerMode = {}));
class SceneViewer {
    constructor() {
        this.uniqueLayer = LayerSet.makeUnique();
        this.aspect = 1;
        this.frames = [];
        this.startSize = 1;
        this.lastZPosition = 0;
        this.depthOffset = 50000;
        this.trackedObj = {};
        this.systemObj = {};
        this.onAwake = () => {
            this.sceneObject = this.script.getSceneObject();
            this.camera = this.sceneObject.getComponent("Camera");
            this.transform = this.sceneObject.getTransform();
            if (!this.camera) {
                throw Error("SceneViewer can't find a Camera component");
            }
            this.setupInactiveFrame();
        };
    }
    isInitialized() {
        return (!isNull(this.referencedCamera) || !isNull(this.referencedCanvas)) && !isNull(this.referencedObject);
    }
    init(camera) {
        if (!isNull(this.referencedObject)) {
            this.removeLayers(this.referencedObject);
        }
        this.systemObj[_Gizmo.module.Gizmo.uniqueIdentifier] = true;
        this.mode = SceneViewerMode.Camera;
        this.aspect = camera.aspect;
        this.camera.enabled = true;
        this.referencedCamera = camera;
        this.referencedObject = camera.getSceneObject();
        this.referencedTransform = this.referencedObject.getTransform();
        this.copyTransform(this.referencedObject);
        // this.spawnFrames(this.referencedObject);
        this.resetLayers();
        this.copyDeviceProperties(camera);
        this.startSize = this.camera.size;
        this.resetZPosition();
    }
    initFromCanvas(canvas) {
        if (!isNull(this.referencedObject)) {
            this.removeLayers(this.referencedObject);
        }
        this.systemObj[_Gizmo.module.Gizmo.uniqueIdentifier] = true;
        this.mode = SceneViewerMode.Canvas;
        this.aspect = canvas.getSize().x / canvas.getSize().y;
        this.camera.enabled = true;
        this.referencedCanvas = canvas;
        this.referencedObject = canvas.getSceneObject();
        this.referencedTransform = this.referencedObject.getTransform();
        this.copyTransform(this.referencedObject);
        // this.spawnFrames(this.referencedObject);
        this.resetLayers();
        this.copyDevicePropertiesFromCanvas(canvas);
        this.startSize = this.camera.size;
        this.resetZPosition();
    }
    setScale(scale) {
        if (this.mode === SceneViewerMode.Camera) {
            this.camera.size = this.referencedCamera.size * (1 / scale);
        }
        else {
            this.camera.size = this.referencedCanvas.getSize().y * (1 / scale);
        }
    }
    setDelta(delta) {
        const position = this.referencedTransform.getWorldPosition().add(delta);
        position.z = this.lastZPosition;
        this.transform.setWorldPosition(position);
    }
    getSize() {
        return Math.max(this.camera.size, this.camera.size * this.aspect);
    }
    getAspect() {
        return this.aspect;
    }
    getCamera() {
        return this.camera;
    }
    getLayer() {
        return this.uniqueLayer;
    }
    clearView() {
        this.camera.enabled = false;
        if (!isNull(this.referencedObject)) {
            this.removeLayers(this.referencedObject);
            this.destroyFrames();
        }
    }
    resetZPosition() {
        if (isNull(this.referencedObject)) {
            return;
        }
        const newZ = this.referencedTransform.getWorldPosition().z + this.depthOffset;
        if (newZ === this.lastZPosition) {
            return;
        }
        this.lastZPosition = newZ;
        const position = this.transform.getWorldPosition();
        position.z = newZ;
        this.transform.setWorldPosition(position);
    }
    getFrames() {
        return this.frames;
    }
    setupInactiveFrame() {
        this.inactiveFramePool = new _InactiveFramePool.module.InactiveFramePool(this.inactiveFrameRef, 2);
    }
    destroyFrames() {
        this.frames.forEach(frame => frame.instance.destroy());
        this.frames = [];
    }
    spawnFrames(root) {
        _Utils.module.Utils.performOnHierarchy(root, (obj) => {
            if (this.systemObj[obj.uniqueIdentifier]) {
                return false;
            }
            const newFrame = this.inactiveFramePool.getNewInactiveFrame();
            newFrame.instance.setParent(obj);
            newFrame.instance.setLayer(this.uniqueLayer);
            this.frames.push(newFrame);
            this.systemObj[newFrame.getSceneObject().uniqueIdentifier] = true;
            return true;
        });
    }
    setupHoverEvent() {
        if (!_Utils.module.Utils.isEditor()) {
            return;
        }
        this.script.createEvent("HoverEvent").bind((eventData) => {
            const position = eventData.getHoverPosition();
        });
    }
    resetLayers() {
        this.copyTransform(this.referencedObject);
        this.systemObj = {};
        this.trackedObj = {};
        this.frames.forEach(frame => frame.instance.destroy());
        this.frames = [];
        this.camera.renderLayer = this.uniqueLayer;
        this.systemObj[_Gizmo.module.Gizmo.uniqueIdentifier] = true;
        this.updateLayers(this.sceneObject);
        if (this.referencedObject) {
            this.updateLayers(this.referencedObject);
            this.spawnFrames(this.referencedObject);
        }
    }
    copyTransform(src) {
        this.transform.setWorldTransform(src.getTransform().getWorldTransform());
        this.lastZPosition = this.transform.getWorldPosition().z;
    }
    removeLayers(root) {
        root.layer = root.layer.except(this.uniqueLayer);
        this.trackedObj[root.uniqueIdentifier] = false;
        const childrenCount = root.getChildrenCount();
        for (let i = 0; i < childrenCount; i++) {
            this.removeLayers(root.getChild(i));
        }
    }
    updateLayers(root) {
        if (root.layer.contains(_Utils.module.Utils.SYSTEM_LAYER)) {
            return;
        }
        root.layer = root.layer.union(this.uniqueLayer);
        this.trackedObj[root.uniqueIdentifier] = true;
        const childrenCount = root.getChildrenCount();
        for (let i = 0; i < childrenCount; i++) {
            this.updateLayers(root.getChild(i));
        }
    }
    copyDeviceProperties(camera) {
        this.camera.aspect = camera.aspect;
        this.startSize = camera.size;
    }
    copyDevicePropertiesFromCanvas(canvas) {
        const size = canvas.getSize();
        this.camera.size = size.y;
        this.startSize = size.y;
    }
}
exports.SceneViewer = SceneViewer;
