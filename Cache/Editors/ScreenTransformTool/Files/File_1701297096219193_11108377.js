"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.InactiveFrame = void 0;
class InactiveFrame {
    constructor() {
        this.onHoverCallback = null;
    }
    onAwake() {
        this.sceneObject = this.script.getSceneObject();
        this.material = this.materialRef.clone();
        this.sides.forEach((side) => {
            side.mainMaterial = this.material;
        });
        this.setHoveEvent();
        this.hide();
    }
    setInteractionCamera(camera) {
        return;
        this.interactionComponent.setCamera(camera);
    }
    setOnHover(cb) {
        this.onHoverCallback = cb;
    }
    setInactive() {
        this.material.mainPass.baseColor = InactiveFrame.INACTIVE_COLOR;
    }
    getLayerSet() {
        return this.sceneObject.layer;
    }
    setLayerSet(layerSet) {
        this.sceneObject.layer = layerSet;
    }
    hide() {
        this.sides.forEach(side => side.enabled = false);
    }
    show() {
        this.sides.forEach(side => side.enabled = true);
    }
    copy() {
        const parent = this.sceneObject.getParent();
        const copyObject = parent.copyWholeHierarchy(this.sceneObject);
        return copyObject.getComponent("ScriptComponent");
    }
    setParent(parent) {
        this.sceneObject.setParent(parent);
    }
    setLayer(layer) {
        if (this.sceneObject.hasParent()) {
            const parent = this.sceneObject.getParent();
            parent.layer = parent.layer.union(layer);
        }
        this.sides.forEach(sideImage => sideImage.getSceneObject().layer = layer);
    }
    destroy() {
        if (isNull(this.sceneObject)) {
            return;
        }
        this.sceneObject.destroy();
    }
    setHoveEvent() {
        var _a;
        return;
        (_a = this.interactionComponent.onHover) === null || _a === void 0 ? void 0 : _a.add(() => {
            this.material.mainPass.baseColor = InactiveFrame.ACTIVE_COLOR;
            this.onHoverCallback && this.onHoverCallback();
        });
    }
}
exports.InactiveFrame = InactiveFrame;
InactiveFrame.INACTIVE_COLOR = new vec4(162 / 255, 162 / 255, 162 / 255, 67 / 255);
InactiveFrame.ACTIVE_COLOR = new vec4(38 / 255, 146 / 255, 215 / 255, 67 / 255);
