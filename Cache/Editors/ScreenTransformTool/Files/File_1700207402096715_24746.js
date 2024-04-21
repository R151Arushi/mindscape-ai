"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Gizmo = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Gizmo/Points/SidePoint");
}
const _SidePoint = RequireModule.requireModule("@src/Editor/Gizmo/Points/SidePoint");
if (false) {
    require("@src/Editor/Gizmo/Points/PivotPoint");
}
const _PivotPoint = RequireModule.requireModule("@src/Editor/Gizmo/Points/PivotPoint");
if (false) {
    require("@src/Editor/Gizmo/Points/RotationPoint");
}
const _RotationPoint = RequireModule.requireModule("@src/Editor/Gizmo/Points/RotationPoint");
if (false) {
    require("@src/Editor/Gizmo/GizmoUtils");
}
const _GizmoUtils = RequireModule.requireModule("@src/Editor/Gizmo/GizmoUtils");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
if (false) {
    require("@src/Editor/Gizmo/AlignmentTypes");
}
const _AlignmentTypes = RequireModule.requireModule("@src/Editor/Gizmo/AlignmentTypes");
if (false) {
    require("@src/Editor/Gizmo/FrameSide");
}
const _FrameSide = RequireModule.requireModule("@src/Editor/Gizmo/FrameSide");
if (false) {
    require("@src/Editor/Utils");
}
const _Utils = RequireModule.requireModule("@src/Editor/Utils");
if (false) {
    require("@src/Editor/Gizmo/Points/AnchorPoint");
}
const _AnchorPoint = RequireModule.requireModule("@src/Editor/Gizmo/Points/AnchorPoint");
if (false) {
    require("@src/Editor/Gizmo/AnchorsFrame");
}
const _AnchorsFrame = RequireModule.requireModule("@src/Editor/Gizmo/AnchorsFrame");
var GizmoMode;
(function (GizmoMode) {
    GizmoMode[GizmoMode["Basic"] = 0] = "Basic";
    GizmoMode[GizmoMode["Advanced"] = 1] = "Advanced";
    GizmoMode[GizmoMode["ScreenRegion"] = 2] = "ScreenRegion";
})(GizmoMode || (GizmoMode = {}));
class Gizmo {
    constructor() {
        this.EPS = 1e-3;
        this.isHidden = false;
        this.sidePoints = [];
        this.rotationPoints = [];
        this.anchorPoints = [];
        this.frameSides = [];
        this.doOnUpdate = [];
        this.hasScreenRegion = false;
        this.isAdvancedMode = false;
        this.isEditableDirty = true;
        this.saveAnchors = Rect.create(0, 0, 0, 0);
        this.alignmentFunctions = [];
        this.onAwake = () => {
            Gizmo.uniqueIdentifier = this.script.getSceneObject().uniqueIdentifier;
            this.resetEditable();
            this.gizmoSceneObject = this.script.getSceneObject();
            this.gizmoScreenTransform = this.gizmoSceneObject.getComponent("ScreenTransform");
            this.gizmoInteractionComponent = this.gizmoSceneObject.getComponent("InteractionComponent");
            this.gizmoInteractionComponent.isFilteredByDepth = true;
        };
        this.processAnchorPointUpdate = (eventData) => {
            if (_LensRegion.module.LensRegion.isBusy || this.hasScreenRegion || !this.isValid()) {
                return;
            }
            const parentWidth = _GizmoUtils.module.GizmoUtils.getParentWorldWidth(this.editableScreenTransform);
            const parentHeight = _GizmoUtils.module.GizmoUtils.getParentWorldHeight(this.editableScreenTransform);
            const anchors = this.editableScreenTransform.anchors;
            const offsets = this.editableScreenTransform.offsets;
            const parentPoint = this.editableScreenTransform.worldPointToParentPoint(eventData.worldPosition);
            if (eventData.sidePointOffset.x > this.EPS) { // RIGHT
                parentPoint.x = Math.min(Math.max(anchors.left, parentPoint.x), 1);
                const parentDiff = parentPoint.x - anchors.right;
                anchors.right = parentPoint.x;
                offsets.right = offsets.right - parentDiff * parentWidth / 2;
            }
            if (eventData.sidePointOffset.x < -this.EPS) { // LEFT
                parentPoint.x = Math.max(Math.min(anchors.right, parentPoint.x), -1);
                const parentDiff = parentPoint.x - anchors.left;
                anchors.left = parentPoint.x;
                offsets.left = offsets.left - parentDiff * parentWidth / 2;
            }
            if (eventData.sidePointOffset.y > this.EPS) { // TOP
                parentPoint.y = Math.min(Math.max(anchors.bottom, parentPoint.y), 1);
                const parentDiff = parentPoint.y - anchors.top;
                anchors.top = parentPoint.y;
                offsets.top = offsets.top - parentDiff * parentHeight / 2;
            }
            if (eventData.sidePointOffset.y < -this.EPS) { // BOTTOM
                parentPoint.y = Math.max(Math.min(anchors.top, parentPoint.y, 1), -1);
                const parentDiff = parentPoint.y - anchors.bottom;
                anchors.bottom = parentPoint.y;
                offsets.bottom = offsets.bottom - parentDiff * parentHeight / 2;
            }
            this.doCallbacks();
        };
        this.processRotationPointUpdate = (eventData) => {
            if (_LensRegion.module.LensRegion.isBusy || this.hasScreenRegion || !this.isValid()) {
                return;
            }
            const pivot = this.editableScreenTransform.localPointToWorldPoint(this.editableScreenTransform.pivot);
            eventData.worldPosition.z = pivot.z;
            const worldTouchPosition = eventData.worldPosition;
            const vecToTouchPosition = worldTouchPosition.sub(pivot);
            const vecToTouchPerpendicular = _GizmoUtils.module.GizmoUtils.getPerpendicularVec3(vecToTouchPosition);
            const rotation = this.editableScreenTransform.rotation;
            this.editableScreenTransform.rotation = quat.quatIdentity();
            const corner = this.editableScreenTransform.localPointToWorldPoint(eventData.sidePointOffset);
            const vecToCorner = corner.sub(pivot);
            const editableRotationEuler = rotation.toEulerAngles();
            let angleRad = vecToCorner.angleTo(vecToTouchPosition);
            if (vecToCorner.dot(vecToTouchPerpendicular) > 0) {
                angleRad = 2 * Math.PI - angleRad;
            }
            const roundedAngle = Math.abs(angleRad) > this.EPS ? Math.round(angleRad * 180 / Math.PI) / 180 * Math.PI : 0;
            editableRotationEuler.z = roundedAngle;
            // global.Rotation = quat.fromEulerVec(editableRotationEuler);
            this.editableScreenTransform.rotation = quat.fromEulerVec(editableRotationEuler);
            this.align({ screenTransform: this.editableScreenTransform, interactionType: _AlignmentTypes.module.InteractionType.Rotation });
            this.doCallbacks();
        };
        this.processPivotPointUpdate = (eventData) => {
            if (_LensRegion.module.LensRegion.isBusy || this.hasScreenRegion || !this.isValid()) {
                return;
            }
            const localTouchPosition = this.editableScreenTransform.worldPointToLocalPoint(eventData.worldPosition);
            this.convertOffsetToAnchors(this.editableScreenTransform);
            _GizmoUtils.module.GizmoUtils.setPivotPreservePosition(this.editableScreenTransform, localTouchPosition);
            this.align({ screenTransform: this.editableScreenTransform, interactionType: _AlignmentTypes.module.InteractionType.Pivot });
            this.pivotPoint.setPosition(this.editableScreenTransform.pivot);
            this.convertAnchorsToOffset(this.editableScreenTransform);
            this.doCallbacks();
        };
        this.processSidePointUpdate = (eventData) => {
            if (_LensRegion.module.LensRegion.isBusy || this.hasScreenRegion || !this.isValid()) {
                return;
            }
            const savePivot = this.editableScreenTransform.pivot;
            let worldPivot = this.editableScreenTransform.localPointToWorldPoint(savePivot);
            //Adjust for scale
            let diff = eventData.worldPosition.sub(worldPivot);
            diff = this.editableScreenTransform.rotation.invert().multiplyVec3(diff);
            const scale = this.editableScreenTransform.scale;
            diff.x = diff.x * (Math.abs(scale.x) > this.EPS ? 1 / scale.x : 0);
            diff.y = diff.y * (Math.abs(scale.y) > this.EPS ? 1 / scale.y : 0);
            diff.z = diff.z * (Math.abs(scale.z) > this.EPS ? 1 / scale.z : 0);
            diff = this.editableScreenTransform.rotation.multiplyVec3(diff);
            eventData.worldPosition = worldPivot.add(diff);
            eventData.worldPosition.z = worldPivot.z;
            eventData.worldPosition = _GizmoUtils.module.GizmoUtils.rotateVec3z(eventData.worldPosition.sub(worldPivot), -this.editableScreenTransform.rotation.toEulerAngles().z);
            eventData.worldPosition = eventData.worldPosition.add(worldPivot);
            const parentTouchPosition = this.editableScreenTransform.worldPointToParentPoint(eventData.worldPosition);
            this.convertOffsetToAnchors(this.editableScreenTransform);
            const anchors = this.editableScreenTransform.anchors;
            const topRight = new vec2(this.editableScreenTransform.anchors.top, this.editableScreenTransform.anchors.right);
            const leftBottom = new vec2(this.editableScreenTransform.anchors.left, this.editableScreenTransform.anchors.bottom);
            let delta = vec2.one();
            if (eventData.sidePointOffset.x > this.EPS) {
                topRight.y = parentTouchPosition.x;
                delta.x *= -1;
            }
            else if (eventData.sidePointOffset.x < -this.EPS) {
                leftBottom.x = parentTouchPosition.x;
            }
            if (eventData.sidePointOffset.y > this.EPS) {
                topRight.x = parentTouchPosition.y;
                delta.y *= -1;
            }
            else if (eventData.sidePointOffset.y < -this.EPS) {
                leftBottom.y = parentTouchPosition.y;
            }
            _GizmoUtils.module.GizmoUtils.setPivotPreservePosition(this.editableScreenTransform, eventData.sidePointOffset.uniformScale(-1));
            const oldSize = anchors.getSize();
            const newSize = new vec2(topRight.y - leftBottom.x, topRight.x - leftBottom.y);
            delta = delta.mult(oldSize.sub(newSize));
            anchors.setSize(newSize);
            anchors.setCenter(anchors.getCenter().add(delta.uniformScale(0.5)));
            _GizmoUtils.module.GizmoUtils.setPivotPreservePosition(this.editableScreenTransform, savePivot);
            this.align({ screenTransform: this.editableScreenTransform, interactionType: _AlignmentTypes.module.InteractionType.Scale,
                direction: eventData.sidePointOffset });
            this.convertAnchorsToOffset(this.editableScreenTransform);
            this.doCallbacks();
        };
    }
    init() {
        this.onAwake();
        this.initSidePoints();
        this.initPivotPoint();
        this.initRotationPoints();
        this.initAnchorPoints();
        this.initFrameSides();
        this.initAnchorsFrame();
        this.setupGizmoInteractions();
        if (_Utils.module.Utils.isEditor()) {
            this.setupCursorUpdates();
        }
    }
    resetEditable() {
        var _a;
        this.editable = this.script.getSceneObject().getParent();
        this.editableScreenTransform = this.editable.getComponent("ScreenTransform");
        const region = this.editable.getComponent("ScreenRegionComponent");
        this.hasScreenRegion = region && region.enabled;
        (_a = this.pivotPoint) === null || _a === void 0 ? void 0 : _a.setPosition(this.editableScreenTransform.pivot);
        this.isEditableDirty = true;
        this.setVisualScale(this.editableScreenTransform.scale);
        this.updateVisualMode();
    }
    updatePivot() {
        if (isNull(this.editableScreenTransform)) {
            return;
        }
        this.pivotPoint.setPosition(this.editableScreenTransform.pivot);
    }
    hide() {
        this.isHidden = true;
        this.gizmoScreenTransform.scale = vec3.zero();
    }
    show() {
        this.isHidden = false;
        this.gizmoScreenTransform.scale = vec3.one();
    }
    isVisible() {
        return !this.isHidden;
    }
    setEditable(sceneObject) {
        this.script.getSceneObject().setParent(sceneObject);
        this.resetEditable();
    }
    setFijiScreenTransform(screenTransform) {
        this.fijiScreenTransform = screenTransform;
    }
    forceUpdate() {
        this.doCallbacks();
    }
    setInteractionCamera(camera) {
        this.pivotPoint.updateInteractionCamera(camera);
        this.sidePoints.forEach(point => point.updateInteractionCamera(camera));
        this.rotationPoints.forEach(point => point.updateInteractionCamera(camera));
        this.anchorPoints.forEach(point => point.updateInteractionCamera(camera));
        this.gizmoInteractionComponent.setCamera(camera);
        this.interactionCamera = camera;
    }
    setLayer(layer) {
        if (this.editable.layer.contains(layer) && layer.contains(this.editable.layer)) {
            return;
        }
        this.editable.layer = layer;
        this.gizmoSceneObject.layer = layer;
        this.pivotPoint.updateLayer(layer);
        this.sidePoints.forEach(point => point.updateLayer(layer));
        this.rotationPoints.forEach(point => point.updateLayer(layer));
        this.anchorPoints.forEach(point => point.updateLayer(layer));
        this.frameSides.forEach(frame => frame.updateLayer(layer));
        this.anchorsFrame.updateLayer(layer);
    }
    addOnUpdateCallback(cb) {
        this.doOnUpdate.push(cb);
    }
    addAlignmentFunction(alignmentFunction) {
        this.alignmentFunctions.push(alignmentFunction);
    }
    getEditableScreenTransform() {
        if (isNull(this.editableScreenTransform) || isNull(this.editableScreenTransform.getSceneObject())) {
            return null;
        }
        return this.editableScreenTransform;
    }
    containsWorldPoint(point) {
        for (let i = 0; i < this.rotationPoints.length; i++) {
            if (this.rotationPoints[i].containsWorldPoint(point)) {
                return true;
            }
        }
        for (let i = 0; i < this.sidePoints.length; i++) {
            if (this.sidePoints[i].containsWorldPoint(point)) {
                return true;
            }
        }
        for (let i = 0; i < this.anchorPoints.length; i++) {
            if (this.anchorPoints[i].containsWorldPoint(point)) {
                return true;
            }
        }
        if (this.pivotPoint.containsWorldPoint(point)) {
            return true;
        }
        return this.gizmoScreenTransform.containsWorldPoint(point);
    }
    setVisualZoom(zoom) {
        var _a;
        this.sidePoints.forEach(point => point.setZoom(zoom));
        this.rotationPoints.forEach(point => point.setZoom(zoom));
        this.anchorPoints.forEach(point => point.setZoom(zoom));
        this.pivotPoint.setZoom(zoom);
        this.frameSides.forEach(frame => frame.setVisualZoom(zoom));
        (_a = this.anchorsFrame) === null || _a === void 0 ? void 0 : _a.setVisualZoom(zoom);
    }
    setVisualScale(scale) {
        var _a, _b;
        scale = this.invertScale(scale);
        this.sidePoints.forEach(point => point.setScale(scale));
        this.rotationPoints.forEach(point => point.setScale(scale));
        // this.anchorPoints.forEach(point => point.setScale(scale));
        (_a = this.pivotPoint) === null || _a === void 0 ? void 0 : _a.setScale(scale);
        this.frameSides.forEach(frame => frame.setVisualScale(scale.x, scale.y));
        (_b = this.anchorsFrame) === null || _b === void 0 ? void 0 : _b.setVisualScale(scale);
    }
    updateAnchorsFrame() {
        this.anchorsFrame.updateTransform(this.editableScreenTransform);
    }
    setAdvancedMode(isAdvanced) {
        this.isAdvancedMode = isAdvanced;
        this.updateVisualMode();
    }
    isValid() {
        return !(isNull(this.editableScreenTransform) || isNull(this.editableScreenTransform.getSceneObject())
            || isNull(this.gizmoScreenTransform) || isNull(this.gizmoScreenTransform.getSceneObject()));
    }
    updateVisualMode() {
        if (this.hasScreenRegion) {
            this.setVisualMode(GizmoMode.ScreenRegion);
        }
        else {
            this.setVisualMode(this.isAdvancedMode ? GizmoMode.Advanced : GizmoMode.Basic);
        }
        // this.setVisualMode(GizmoMode.Advanced);
    }
    setVisualMode(mode) {
        switch (mode) {
            case GizmoMode.Basic:
                this.anchorsRootSceneObject.enabled = false;
                this.anchorPointsSceneObjects.forEach(obj => obj.enabled = false);
                this.sidePointsSceneObjects.forEach(obj => obj.enabled = true);
                this.pivot.enabled = true;
                break;
            case GizmoMode.Advanced:
                this.anchorsRootSceneObject.enabled = true;
                this.anchorPointsSceneObjects.forEach(obj => obj.enabled = true);
                this.sidePointsSceneObjects.forEach(obj => obj.enabled = true);
                this.pivot.enabled = true;
                break;
            case GizmoMode.ScreenRegion:
                this.anchorsRootSceneObject.enabled = true;
                this.anchorPointsSceneObjects.forEach(obj => obj.enabled = true);
                this.sidePointsSceneObjects.forEach(obj => obj.enabled = false);
                this.pivot.enabled = false;
                break;
        }
    }
    initSidePoints() {
        this.sidePointsSceneObjects.forEach((sidePointSO) => {
            const newSidePoint = new _SidePoint.module.SidePoint(sidePointSO);
            newSidePoint.setValidator(() => this.isValid());
            newSidePoint.setOnUpdate(this.processSidePointUpdate);
            this.sidePoints.push(newSidePoint);
        });
    }
    initAnchorPoints() {
        this.anchorPointsSceneObjects.forEach((anchorSceneObject) => {
            const newAnchorPoint = new _AnchorPoint.module.AnchorPoint(anchorSceneObject);
            newAnchorPoint.setOnUpdate(this.processAnchorPointUpdate);
            this.anchorPoints.push(newAnchorPoint);
        });
    }
    initPivotPoint() {
        this.pivotPoint = new _PivotPoint.module.PivotPoint(this.pivot);
        this.pivotPoint.setPosition(this.editableScreenTransform.pivot);
        this.pivotPoint.setOnUpdate(this.processPivotPointUpdate);
    }
    initRotationPoints() {
        this.rotationPointsSceneObjects.forEach((rotationPointSO) => {
            const newRotationPoint = new _RotationPoint.module.RotationPoint(rotationPointSO);
            newRotationPoint.setOnUpdate(this.processRotationPointUpdate);
            this.rotationPoints.push(newRotationPoint);
        });
    }
    initFrameSides() {
        this.frameSidesSceneObjects.forEach(obj => this.frameSides.push(new _FrameSide.module.FrameSide(obj)));
    }
    initAnchorsFrame() {
        const anchorFrameSides = [];
        this.anchorFrameSidesSceneObjects.forEach(obj => anchorFrameSides.push(new _FrameSide.module.FrameSide(obj)));
        this.anchorsFrame = new _AnchorsFrame.module.AnchorsFrame(this.anchorsRootSceneObject.getComponent("ScreenTransform"), anchorFrameSides, this.anchorPoints);
        this.addOnUpdateCallback(() => {
            this.anchorsFrame.updateTransform(this.editableScreenTransform);
        });
    }
    align(data) {
        this.alignmentFunctions.forEach(func => func && func(data));
    }
    doCallbacks() {
        this.doOnUpdate.forEach((cb) => {
            cb && cb({ screenTransform: this.editableScreenTransform, fijiScreenTransform: this.fijiScreenTransform });
        });
    }
    invertScale(scale) {
        const res = vec3.zero();
        res.x = scale.x ? 1 / scale.x : 0;
        res.y = scale.y ? 1 / scale.y : 0;
        res.z = scale.z ? 1 / scale.z : 0;
        return res;
    }
    setupCursorUpdates() {
        // print("SET HOVER EVENT");
        // this.script.createEvent("HoverEvent").bind((eventData) => {
        //     const position = eventData.getHoverPosition();
        //     print("HOVER POSITION: " + position);
        //     for (let i = 0; i < this.sidePoints.length; i++) {
        //         if (this.sidePoints[i].containsScreenPoint(position)) {
        //             print("SET CURSOR TO SCALE");
        //             return;
        //         }
        //     }
        //     for (let i = 0; i < this.rotationPoints.length; i++) {
        //         if (this.rotationPoints[i].containsScreenPoint(position)) {
        //             print("SET CURSOR TO ROTATION");
        //             return;
        //         }
        //     }
        // })
    }
    setupGizmoInteractions() {
        let touchMoveEventRegister;
        let touchEndEventRegister;
        let parentTouchStartPosition = vec2.zero();
        let parentStartPosition = vec2.zero();
        let lastTouchPosition;
        const processTouch = (touchPosition) => {
            this.convertOffsetToAnchors(this.editableScreenTransform);
            const parentTouchPosition = this.editableScreenTransform.worldPointToParentPoint(touchPosition);
            const delta = parentTouchPosition.sub(parentTouchStartPosition);
            this.editableScreenTransform.anchors.setCenter(parentStartPosition.add(delta));
            this.align({ screenTransform: this.editableScreenTransform, interactionType: _AlignmentTypes.module.InteractionType.Move });
            this.convertAnchorsToOffset(this.editableScreenTransform);
            this.doCallbacks();
        };
        const translatedTouchPosition = (eventData) => {
            return this.interactionCamera.screenSpaceToWorldSpace(eventData.position, -1);
        };
        const onTouchStart = (eventData) => {
            if (Gizmo.isBusy || _LensRegion.module.LensRegion.isBusy || this.hasScreenRegion || !this.isValid()) {
                return;
            }
            Gizmo.isBusy = true;
            lastTouchPosition = translatedTouchPosition(eventData);
            if (!this.gizmoScreenTransform.containsWorldPoint(lastTouchPosition)) {
                Gizmo.isBusy = false;
                return;
            }
            this.convertOffsetToAnchors(this.editableScreenTransform);
            parentTouchStartPosition = this.editableScreenTransform.worldPointToParentPoint(lastTouchPosition);
            parentStartPosition = this.editableScreenTransform.anchors.getCenter();
            this.convertAnchorsToOffset(this.editableScreenTransform);
            touchMoveEventRegister = this.gizmoInteractionComponent.onTouchMove.add(onTouchMove);
            touchEndEventRegister = this.gizmoInteractionComponent.onTouchEnd.add(onTouchEnd);
            this.isEditableDirty = false;
        };
        const onTouchMove = (eventData) => {
            if (_LensRegion.module.LensRegion.isBusy || this.hasScreenRegion || !this.isValid()) {
                this.gizmoInteractionComponent.onTouchMove.remove(touchMoveEventRegister);
                this.gizmoInteractionComponent.onTouchEnd.remove(touchEndEventRegister);
                Gizmo.isBusy = false;
                return;
            }
            lastTouchPosition = translatedTouchPosition(eventData);
            if (this.isEditableDirty) {
                this.convertOffsetToAnchors(this.editableScreenTransform);
                parentTouchStartPosition = this.editableScreenTransform.worldPointToParentPoint(lastTouchPosition);
                parentStartPosition = this.editableScreenTransform.anchors.getCenter();
                this.convertAnchorsToOffset(this.editableScreenTransform);
                this.isEditableDirty = false;
            }
            processTouch(lastTouchPosition);
        };
        const onTouchEnd = (eventData) => {
            Gizmo.isBusy = false;
            if (_LensRegion.module.LensRegion.isBusy || this.hasScreenRegion) {
                this.gizmoInteractionComponent.onTouchMove.remove(touchMoveEventRegister);
                this.gizmoInteractionComponent.onTouchEnd.remove(touchEndEventRegister);
                return;
            }
            lastTouchPosition = translatedTouchPosition(eventData);
            processTouch(lastTouchPosition);
            this.gizmoInteractionComponent.onTouchMove.remove(touchMoveEventRegister);
            this.gizmoInteractionComponent.onTouchEnd.remove(touchEndEventRegister);
        };
        this.gizmoInteractionComponent.onTouchStart.add(onTouchStart);
    }
    convertOffsetToAnchors(screenTransform) {
        const parentWidth = _GizmoUtils.module.GizmoUtils.getParentWorldWidth(screenTransform);
        const parentHeight = _GizmoUtils.module.GizmoUtils.getParentWorldHeight(screenTransform);
        const offsets = screenTransform.offsets;
        const anchors = screenTransform.anchors;
        this.saveAnchors.setCenter(anchors.getCenter());
        this.saveAnchors.setSize(anchors.getSize());
        anchors.right = anchors.right + offsets.right * 2 / parentWidth;
        anchors.left = anchors.left + offsets.left * 2 / parentWidth;
        anchors.top = anchors.top + offsets.top * 2 / parentHeight;
        anchors.bottom = anchors.bottom + offsets.bottom * 2 / parentHeight;
        offsets.right = 0;
        offsets.left = 0;
        offsets.top = 0;
        offsets.bottom = 0;
    }
    convertAnchorsToOffset(screenTransform) {
        var _a, _b, _c, _d, _e, _f, _g, _h;
        const parentWidth = _GizmoUtils.module.GizmoUtils.getParentWorldWidth(screenTransform);
        const parentHeight = _GizmoUtils.module.GizmoUtils.getParentWorldHeight(screenTransform);
        const offsets = screenTransform.offsets;
        const anchors = screenTransform.anchors;
        if (this.overrideConversion() || ((_a = this.fijiScreenTransform) === null || _a === void 0 ? void 0 : _a.constraints.pinToRight)
            || ((_b = this.fijiScreenTransform) === null || _b === void 0 ? void 0 : _b.constraints.fixedWidth) || this.isAdvancedMode) {
            offsets.right = parentWidth * (anchors.right - this.saveAnchors.right) / 2;
            anchors.right = this.saveAnchors.right;
        }
        if (this.overrideConversion() || ((_c = this.fijiScreenTransform) === null || _c === void 0 ? void 0 : _c.constraints.pinToLeft)
            || ((_d = this.fijiScreenTransform) === null || _d === void 0 ? void 0 : _d.constraints.fixedWidth) || this.isAdvancedMode) {
            offsets.left = parentWidth * (anchors.left - this.saveAnchors.left) / 2;
            anchors.left = this.saveAnchors.left;
        }
        if (this.overrideConversion() || ((_e = this.fijiScreenTransform) === null || _e === void 0 ? void 0 : _e.constraints.pinToTop)
            || ((_f = this.fijiScreenTransform) === null || _f === void 0 ? void 0 : _f.constraints.fixedHeight) || this.isAdvancedMode) {
            offsets.top = parentHeight * (anchors.top - this.saveAnchors.top) / 2;
            anchors.top = this.saveAnchors.top;
        }
        if (this.overrideConversion() || ((_g = this.fijiScreenTransform) === null || _g === void 0 ? void 0 : _g.constraints.pinToBottom)
            || ((_h = this.fijiScreenTransform) === null || _h === void 0 ? void 0 : _h.constraints.fixedHeight) || this.isAdvancedMode) {
            offsets.bottom = parentHeight * (anchors.bottom - this.saveAnchors.bottom) / 2;
            anchors.bottom = this.saveAnchors.bottom;
        }
        if (this.overrideConversion() || !this.isAdvancedMode) {
            const offsetCenterInParentDistance = offsets.getCenter();
            offsetCenterInParentDistance.x = offsetCenterInParentDistance.x / parentWidth * 2;
            offsetCenterInParentDistance.y = offsetCenterInParentDistance.y / parentHeight * 2;
            anchors.setCenter(anchors.getCenter().add(offsetCenterInParentDistance));
            offsets.setCenter(vec2.zero());
        }
    }
    overrideConversion() {
        return !_Utils.module.Utils.isEditor();
    }
}
exports.Gizmo = Gizmo;
Gizmo.uniqueIdentifier = "";
Gizmo.isBusy = false;
