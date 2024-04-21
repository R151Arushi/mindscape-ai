"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SCTree = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/ObjectConverter");
}
const _ObjectConverter = RequireModule.requireModule("@src/Editor/ObjectConverter");
if (false) {
    require("@src/Editor/SceneUtils");
}
const _SceneUtils = RequireModule.requireModule("@src/Editor/SceneUtils");
if (false) {
    require("@src/Editor/Utils");
}
const _Utils = RequireModule.requireModule("@src/Editor/Utils");
if (false) {
    require("@src/Editor/TraverseHelper");
}
const _TraverseHelper = RequireModule.requireModule("@src/Editor/TraverseHelper");
class SCTree {
    constructor() {
        this.root = null;
        this.selectedObject = null;
        this.objectConverter = new _ObjectConverter.module.ObjectConverter();
        this.traverseHelper = new _TraverseHelper.module.TraverseHelper();
        this.isValidHierarchy = false;
    }
    selectObject(object) {
        this.selectedObject = object;
        if (!isNull(this.selectedObject) && this.validate(this.selectedObject)) {
            this.objectConverter.reset();
            this.isValidHierarchy = true;
            this.init();
        }
        else {
            this.isValidHierarchy = false;
            return;
        }
        if (_Utils.module.Utils.isEditor()) {
            this.selectedLensTransform = this.selectedObject.getComponent("ScreenTransform");
            this.fijiSelectedObject = this.objectConverter.convertToLensStudioObject(this.selectedObject);
            this.selectedFijiTransform = this.fijiSelectedObject.getComponent("ScreenTransform");
        }
    }
    /* Check if the path from root camera/canvas to selected object is still valid */
    reassureValidPath() {
        if (!this.isValidHierarchy) {
            return false;
        }
        if (isNull(this.selectedObject) || isNull(this.root) || !this.selectedObject.hasParent()) {
            this.isValidHierarchy = false;
            return false;
        }
        let parent = this.selectedObject;
        do {
            parent = parent.getParent();
            if (parent.uniqueIdentifier === this.root.uniqueIdentifier) {
                return true;
            }
        } while (parent.hasParent());
        this.isValidHierarchy = false;
        return false;
    }
    getRoot() {
        return this.root;
    }
    getSelectedFijiScreenTransform() {
        return this.selectedFijiTransform;
    }
    collectObjects() {
        if (!this.isValidHierarchy) {
            return [];
        }
        const rule = (sceneObject) => {
            return !!sceneObject.getComponent("ScreenTransform") && !sceneObject.layer.contains(_Utils.module.Utils.SYSTEM_LAYER);
        };
        return this.objectConverter.collectLensCoreObjects(rule);
    }
    collectObjectsForAlignment() {
        if (!this.isValidHierarchy) {
            return [];
        }
        const rule = (sceneObject) => {
            const screenTransform = sceneObject.getComponent("ScreenTransform");
            return this.traverseHelper.isInHierarchy(this.root, sceneObject)
                && !this.traverseHelper.isInHierarchy(this.selectedObject, sceneObject)
                && !sceneObject.layer.contains(_Utils.module.Utils.SYSTEM_LAYER)
                && screenTransform && screenTransform.isInScreenHierarchy() && sceneObject.isEnabledInHierarchy;
        };
        return this.objectConverter.collectLensCoreObjects(rule);
    }
    syncEditable() {
        if (isNull(this.selectedObject) || !this.selectedFijiTransform || !this.isValidHierarchy || !_Utils.module.Utils.isEditor()) {
            return;
        }
        this.syncScreenTransforms(this.selectedLensTransform, this.selectedFijiTransform);
    }
    convertSceneObject(sceneObject) {
        return this.objectConverter.convertToLensStudioObject(sceneObject);
    }
    isInHierarchy(objA, objB) {
        if (!objA || !objB) {
            return false;
        }
        return this.traverseHelper.isInHierarchy(objA, objB);
    }
    syncScreenTransforms(src, dst) {
        const fijiTransform = dst.transform;
        fijiTransform.rotation = src.rotation.toEulerAngles().uniformScale(180 / Math.PI);
        // fijiTransform.position = src.position;
        dst.transform = fijiTransform;
        dst.pivot = src.pivot;
        dst.offset = this.syncRect(src.offsets, dst.offset);
        dst.anchor = this.syncRect(src.anchors, dst.anchor);
        // print("POSITION SET FROM: " + fijiTransform.position + " TO: " + src.position);
    }
    syncRect(src, dst) {
        dst.top = src.top;
        dst.left = src.left;
        dst.right = src.right;
        dst.bottom = src.bottom;
        return dst;
    }
    init() {
        this.updateObjectConverter(this.root);
        this.traverseHelper.setRoot(this.root);
    }
    updateObjectConverter(root) {
        // if (this.objectConverter.hasLensCoreObject(root)) {
        //     return;
        // }
        this.objectConverter.addLensCoreHierarchy(root);
        if (_Utils.module.Utils.isEditor()) {
            this.objectConverter.addLensStudioHierarchy(_SceneUtils.module.SceneUtils.findObjectInLensStudio(root));
        }
    }
    validate(sceneObject, isSelectedObject = true) {
        if (!sceneObject.enabled) {
            return false;
        }
        const camera = sceneObject.getComponent("Camera");
        if (!isSelectedObject && camera && camera.enabled) {
            if (camera.type !== Camera.Type.Orthographic) {
                return false;
            }
            this.root = sceneObject;
            return true;
        }
        const canvas = sceneObject.getComponent("Canvas");
        if (!isSelectedObject && canvas && canvas.enabled) {
            this.root = sceneObject;
            return true;
        }
        const screenTransform = sceneObject.getComponent("ScreenTransform");
        if (!screenTransform || !screenTransform.enabled) {
            return false;
        }
        if (!sceneObject.hasParent()) {
            return false;
        }
        return this.validate(sceneObject.getParent(), false);
    }
}
exports.SCTree = SCTree;
