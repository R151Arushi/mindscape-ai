"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SelectionPicker = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/SCTree");
}
const _SCTree = RequireModule.requireModule("@src/Editor/SCTree");
if (false) {
    require("@src/Editor/Gizmo/Gizmo");
}
const _Gizmo = RequireModule.requireModule("@src/Editor/Gizmo/Gizmo");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
if (false) {
    require("@src/Editor/SelectionListener");
}
const _SelectionListener = RequireModule.requireModule("@src/Editor/SelectionListener");
if (false) {
    require("@src/Editor/SceneUtils");
}
const _SceneUtils = RequireModule.requireModule("@src/Editor/SceneUtils");
if (false) {
    require("@src/Editor/Utils");
}
const _Utils = RequireModule.requireModule("@src/Editor/Utils");
class SelectionPicker {
    constructor(script, tree, camera, selectionListener, excludeObjects) {
        this.script = script;
        this.tree = tree;
        this.camera = camera;
        this.selectionListener = selectionListener;
        this.excludeObjects = excludeObjects;
        this.objects = [];
        this.screenTransforms = [];
        this.onObjectPicked = null;
        this.reset();
        this.setupInteractions();
    }
    setGizmo(gizmo) {
        this.gizmo = gizmo;
    }
    setOnObjectPicked(cb) {
        this.onObjectPicked = cb;
    }
    reset() {
        this.objects = this.tree.collectObjects();
        this.screenTransforms = [];
        this.objects.forEach(obj => {
            const component = obj.getComponent("ScreenTransform");
            const region = obj.getComponent("ScreenRegionComponent");
            if (component && !region) {
                this.screenTransforms.push(component);
            }
        });
    }
    setCamera(camera) {
        this.camera = camera;
    }
    updateSelection(sceneObject) {
        if (!_Utils.module.Utils.isEditor()) {
            this.tree.selectObject(sceneObject);
            return;
        }
        if (!sceneObject) {
            Editor.root.project.selection.clear();
            return;
        }
        const fijiSceneObject = this.tree.convertSceneObject(sceneObject);
        if (!fijiSceneObject) {
            _SceneUtils.module.SceneUtils.printHierarchyFromRoot(sceneObject);
        }
        Editor.root.project.selection.set([fijiSceneObject]);
    }
    getTouchedScreenTransform(screenPosition, ignoreGizmo = false) {
        var _a;
        if (isNull(this.gizmo) || isNull(this.gizmo.instance.getEditableScreenTransform())) {
            this.gizmo = null;
        }
        const worldTouchPosition = this.camera.screenSpaceToWorldSpace(screenPosition, -1);
        if (!ignoreGizmo && ((_a = this.gizmo) === null || _a === void 0 ? void 0 : _a.instance.containsWorldPoint(worldTouchPosition))) {
            return this.gizmo.instance.getEditableScreenTransform();
        }
        let closestPosition = 0;
        let closesScreenTransform = null;
        let isChild = false;
        this.screenTransforms.forEach((screenTransform, idx) => {
            var _a, _b;
            if (isNull(screenTransform) || isNull(screenTransform.getSceneObject()) || !screenTransform.containsWorldPoint(worldTouchPosition) ||
                (((_a = this.gizmo) === null || _a === void 0 ? void 0 : _a.instance.isVisible()) &&
                    screenTransform.uniqueIdentifier === ((_b = this.gizmo) === null || _b === void 0 ? void 0 : _b.instance.getEditableScreenTransform().uniqueIdentifier))) {
                return;
            }
            const pos = screenTransform.getTransform().getWorldPosition().z;
            if (!closesScreenTransform || closestPosition > pos || (closestPosition === pos && !isChild)) {
                closestPosition = pos;
                closesScreenTransform = screenTransform;
                if (this.gizmo && !isNull(this.gizmo.instance.getEditableScreenTransform())) {
                    isChild = this.tree.isInHierarchy(this.gizmo.instance.getEditableScreenTransform().getSceneObject(), screenTransform.getSceneObject());
                }
            }
        });
        return closesScreenTransform;
    }
    valid() {
        try {
            for (let i = 0; i < this.screenTransforms.length; i++) {
                if (isNull(this.screenTransforms[i]) || isNull(this.screenTransforms[i].getSceneObject())) {
                    return false;
                }
            }
        }
        catch (e) {
            return false;
        }
        return true;
    }
    setupInteractions() {
        this.script.updatePriority = this.script.updatePriority - 1;
        const touchStartEvent = this.script.createEvent("TouchStartEvent");
        const touchMoveEvent = this.script.createEvent("TouchMoveEvent");
        const touchEndEvent = this.script.createEvent("TouchEndEvent");
        const onTouchStart = (eventData) => {
            if (_LensRegion.module.LensRegion.isBusy || _Gizmo.module.Gizmo.isBusy
                || this.excludeObjects.some(obj => obj.containsScreenPoint(eventData.getTouchPosition()))) {
                return;
            }
            if (!this.valid()) {
                this.selectionListener.forceCallSelectionUpdate();
                this.reset();
                return;
            }
            this.selectionListener.forceUpdate();
            const closestScreenTransform = this.getTouchedScreenTransform(eventData.getTouchPosition());
            if (closestScreenTransform) {
                this.updateSelection(closestScreenTransform.getSceneObject());
            }
            else {
                this.updateSelection(null);
            }
            touchMoveEvent.enabled = true;
            touchEndEvent.enabled = true;
        };
        const onTouchMove = (eventData) => {
            touchMoveEvent.enabled = false;
            touchEndEvent.enabled = false;
        };
        const onTouchEnd = (eventData) => {
            const closestScreenTransform = this.getTouchedScreenTransform(eventData.getTouchPosition(), true);
            if (closestScreenTransform) {
                this.updateSelection(closestScreenTransform.getSceneObject());
            }
            touchMoveEvent.enabled = false;
            touchEndEvent.enabled = false;
        };
        touchStartEvent.bind(onTouchStart);
        touchMoveEvent.bind(onTouchMove);
        touchEndEvent.bind(onTouchEnd);
        touchMoveEvent.enabled = false;
        touchEndEvent.enabled = false;
    }
}
exports.SelectionPicker = SelectionPicker;
