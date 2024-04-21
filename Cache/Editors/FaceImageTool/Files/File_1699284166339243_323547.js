"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.EffectEditor = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("./SelectionListener");
}
var _SelectionListener = RequireModule.requireModule("./SelectionListener");
if (false) {
    require("./SceneUtils");
}
var _SceneUtils = RequireModule.requireModule("./SceneUtils");
if (false) {
    require("../Shared/Data");
}
var _Data = RequireModule.requireModule("../Shared/Data");
if (false) {
    require("../Main");
}
var _Main = RequireModule.requireModule("../Main");
if (false) {
    require("./ObjectsFinder");
}
var _ObjectsFinder = RequireModule.requireModule("./ObjectsFinder");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
var _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
var EffectEditor = /** @class */ (function () {
    function EffectEditor() {
        this.faceInsetObjs = {};
        this.idxs = [0, 0, 10];
        this.points = [];
        this.updateIdxs = [];
        this.offsets = {};
        this.barycentricVertices = {};
    }
    EffectEditor.prototype.run = function () {
        var _this = this;
        if (typeof Editor !== 'undefined') {
            this.attachmentType = Editor.Components.HeadAttachmentPointType;
            this.saveBarycentricPoints();
        }
        this.effectsT = this.effects.getTransform();
        this.initEffectsScale = this.effectsT.getLocalScale();
        this.objectsFinder = new _ObjectsFinder.module.ObjectsFinder();
        this.main.instance.addPinchOnUpdateCallback(function () {
            _this.updateIteractionPointsScale();
        });
        // let faceInsetT = this.faceInsetObj.getTransform();
        // this.setUpMoveEvent(null, this.interactionComponent, this.screenTransform, faceInsetT);
        var candideEvent = this.script.createEvent("CandideUpdatedEvent");
        candideEvent.bind(function () {
            _this.points = candideEvent.points2d;
            _this.setupSelectionListener();
            candideEvent.enabled = false;
        });
    };
    EffectEditor.prototype.saveBarycentricPoints = function () {
        this.barycentricVertices[this.attachmentType.CandideCenter] = { "indices": [94, 70, 70], "weights": [1, 0, 0] };
        this.barycentricVertices[this.attachmentType.LeftEyeballCenter] = { "indices": [67, 72, 70], "weights": [0.5, 0.5, 0] };
        this.barycentricVertices[this.attachmentType.RightEyeballCenter] = { "indices": [73, 70, 70], "weights": [0.5, 0.5, 0] };
        this.barycentricVertices[this.attachmentType.MouthCenter] = { "indices": [7, 8, 70], "weights": [0.5, 0.5, 0] };
        this.barycentricVertices[this.attachmentType.Chin] = { "indices": [10, 8, 70], "weights": [1, 0, 0] };
        this.barycentricVertices[this.attachmentType.Forehead] = { "indices": [34, 1, 70], "weights": [0.5, 0.5, 0] };
        this.barycentricVertices[this.attachmentType.LeftForehead] = { "indices": [34, 46, 70], "weights": [0.5, 0.5, 0] };
        this.barycentricVertices[this.attachmentType.RightForehead] = { "indices": [13, 1, 70], "weights": [0.5, 0.5, 0] };
        this.barycentricVertices[this.attachmentType.LeftCheek] = { "indices": [60, 91, 70], "weights": [0.5, 0.5, 0] };
        this.barycentricVertices[this.attachmentType.RightCheek] = { "indices": [27, 90, 70], "weights": [0.5, 0.5, 0] };
    };
    EffectEditor.prototype.getSelectedObject = function () {
        return this.selectedObject;
    };
    EffectEditor.prototype.setupSelectionListener = function () {
        var _this = this;
        this.selectionListener = new _SelectionListener.module.SelectionListener(this.script);
        this.selectionListener.setOnSelectionUpdate(function () {
            _this.update();
        });
        this.script.createEvent("UpdateEvent").bind(function () {
            _this.copyTo();
        });
        this.script.createEvent("LateUpdateEvent").bind(function () {
            _this.updateIdxs.forEach(function (idx) {
                _this.updateWorldPosition(idx);
            });
        });
    };
    EffectEditor.prototype.update = function () {
        // this.selectedObject = SceneUtils.findObjectInLensCore(this.selectionListener.getSelectedObject());
        this.selectedObject = this.selectionListener.getSelectedObject();
    };
    EffectEditor.prototype.copyTo = function () {
        // return;
        this.updateIdxs = [];
        for (var _i = 0, _a = Object.keys(this.faceInsetObjs); _i < _a.length; _i++) {
            var obj = _a[_i];
            this.faceInsetObjs[obj].screenObj.enabled = false;
            // this.faceInsetObjs[obj].faceInsetObj.enabled = false;
        }
        var objs = this.objectsFinder.getFaceInsetObjs();
        for (var _b = 0, _c = Object.keys(objs); _b < _c.length; _b++) {
            var objId = _c[_b];
            if (!this.faceInsetObjs[objId]) {
                var newObjs = this.createNewFaceInset(objId);
                this.faceInsetObjs[objId] = newObjs;
                this.faceInsetObjs[objId].headComp = objs[objId].headComponent;
                this.faceInsetObjs[objId].editorFaceInsetComp = objs[objId].faceInsetComponent;
                this.faceInsetObjs[objId].sceneObject = objs[objId].sceneObject;
                this.faceInsetObjs[objId].lensCoreObject = _SceneUtils.module.SceneUtils.findObjectInLensCore(objs[objId].sceneObject);
                this.faceInsetObjs[objId].prevPivotPos = new vec2(0, 0);
                this.faceInsetObjs[objId].pivotOffset = new vec2(0, 0);
            }
            if (this.barycentricVertices[this.faceInsetObjs[objId].headComp.attachmentPoint]) {
                var vertex = void 0;
                if (this.barycentricVertices[this.faceInsetObjs[objId].headComp.attachmentPoint]) {
                    vertex = this.barycentricVertices[this.faceInsetObjs[objId].headComp.attachmentPoint];
                }
                var screenPos = this.barycentricToCoordinates(this.points[vertex.indices[0]], this.points[vertex.indices[1]], this.points[vertex.indices[2]], vertex.weights);
                screenPos.y /= 1.34465045;
                this.faceInsetObjs[objId].screenT.anchors.setCenter(screenPos.add(this.faceInsetObjs[objId].screenT.anchors.getCenter().sub(this.faceInsetObjs[objId].screenT.screenPointToParentPoint(this.faceInsetObjs[objId].screenT.localPointToScreenPoint(this.faceInsetObjs[objId].screenT.pivot)))));
            }
            this.updateIdxs.push(objId);
            // this.updateWorldPosition(objId);
            if (this.faceInsetObjs[objId].sceneObject.enabled && this.faceInsetObjs[objId].editorFaceInsetComp.enabled) {
                this.faceInsetObjs[objId].screenObj.enabled = true;
                // this.faceInsetObjs[objId].faceInsetObj.enabled = true;
                this.copyFaceInsetData(objId, this.faceInsetObjs[objId].screenT, this.faceInsetObjs[objId].imageComp, this.faceInsetObjs[objId].sceneObject);
                // if (this.faceInsetObjs[objId].setFaceRegionType){
                //     this.faceInsetObjs[objId].setFaceRegionType(this.faceInsetObjs[objId].faceInsetComp.faceRegion);
                // }
            }
        }
        if (isNull(this.selectedObject)) {
            this.editorObject.enabled = false;
            this.effects.enabled = false;
            this.defaultTextObject.enabled = true;
            return;
        }
        if (!objs[this.selectedObject.id.toString()]) {
            this.editorObject.enabled = false;
            this.effects.enabled = false;
            this.defaultTextObject.enabled = true;
            return;
        }
        this.defaultTextObject.enabled = false;
        this.editorObject.enabled = true;
        this.effects.enabled = true;
        this.faceInsetObjs[this.selectedObject.id.toString()].headComp = objs[this.selectedObject.id.toString()].headComponent;
    };
    EffectEditor.prototype.copyFaceInsetData = function (objId, screenT, editorComponent, faceInsetObject) {
        var lensObj = _SceneUtils.module.SceneUtils.findObjectInLensCore(faceInsetObject);
        var lensComponent = lensObj.getComponent("Component.Image");
        editorComponent.flipX = lensComponent.flipX;
        editorComponent.flipY = lensComponent.flipY;
        editorComponent.pivot = lensComponent.pivot;
        editorComponent.stretchMode = lensComponent.stretchMode;
        if (screenT.pivot.distance(lensComponent.pivot) > 0.0001) {
            var prevPos = screenT.screenPointToParentPoint(screenT.localPointToScreenPoint(vec2.zero()));
            screenT.pivot = lensComponent.pivot;
            var newPos = screenT.screenPointToParentPoint(screenT.localPointToScreenPoint(vec2.zero()));
            var newCenter = screenT.anchors.getCenter().add(prevPos.sub(newPos));
            this.faceInsetObjs[objId].pivotOffset = prevPos.sub(newPos);
            screenT.anchors.setCenter(newCenter);
        }
        var material = lensComponent.mainMaterial;
        if (material) {
            if (!editorComponent.mainMaterial || !material.isSame(editorComponent.mainMaterial)) {
                editorComponent.mainMaterial = material;
                // editorComponent.mainMaterial.mainPass.baseTex = this.deviceCameraTexture;
            }
        }
    };
    EffectEditor.prototype.createNewFaceInset = function (objId) {
        var newScreenObj = this.screenTransform.getSceneObject().getParent().copyWholeHierarchyAndAssets(this.screenTransform.getSceneObject());
        var imageComp = newScreenObj.getChild(0).getComponent("Component.Image");
        // let newFaceInsetObj = this.faceInsetObj.getParent().copyWholeHierarchy(this.faceInsetObj);
        newScreenObj.name = objId;
        this.offsets[objId] = vec2.zero();
        newScreenObj.enabled = true;
        // newFaceInsetObj.enabled = true;
        var interactionComp = newScreenObj.getComponent("Component.InteractionComponent");
        var screenT = newScreenObj.getComponent("Component.ScreenTransform");
        // let faceInsetT: Transform = newFaceInsetObj.getTransform();
        // let faceInsetComp: FaceInsetVisual = newFaceInsetObj.getComponent("Component.FaceInsetVisual");
        this.setUpMoveEvent(objId, interactionComp, screenT);
        return { "screenObj": newScreenObj, "screenT": screenT, "imageComp": imageComp };
    };
    EffectEditor.prototype.setUpMoveEvent = function (objId, interactionComp, screenT) {
        var _this = this;
        interactionComp.onTouchStart.add(function (eventData) {
            if (_LensRegion.module.LensRegion.isBusy) {
                return;
            }
            Editor.root.project.selection.set([_this.faceInsetObjs[objId].sceneObject]);
            _this.offsets[objId] = screenT.anchors.getCenter().sub(screenT.screenPointToParentPoint(eventData.position));
        });
        interactionComp.onTouchMove.add(function (eventData) {
            if (_LensRegion.module.LensRegion.isBusy) {
                return;
            }
            _this.setFaceInsetPosition(eventData.position, objId, screenT);
        });
        interactionComp.onTouchEnd.add(function (eventData) {
            _this.offsets[objId] = vec2.zero();
        });
    };
    EffectEditor.prototype.setManipulateController = function (newController, updateFunction, setFaceRegionType) {
        var _this = this;
        var idx = newController.getSceneObject().name;
        this.faceInsetObjs[idx].updateScreenTFunction = updateFunction;
        this.faceInsetObjs[idx].setFaceRegionType = setFaceRegionType;
        newController.onPositionChanged = function (newPos) {
            _this.setFaceInsetPosition(newPos, idx, _this.faceInsetObjs[idx].screenT);
        };
        newController.onRotationChanged = function (newRot, angle) {
            // this.faceInsetObjs[idx].faceInsetT.setLocalRotation(newRot);
            var lookAtComponent = _this.faceInsetObjs[idx].sceneObject.getComponent("LookAtComponent");
            if (lookAtComponent) {
                var curQuat = lookAtComponent.offsetRotation;
                var newQuat = quat.fromEulerAngles(0, 0, angle);
                lookAtComponent.offsetRotation = curQuat.multiply(newQuat);
            }
            else {
                var fijiTransform = _this.faceInsetObjs[idx].sceneObject.localTransform;
                fijiTransform.rotation = newRot.toEulerAngles().uniformScale(180 / Math.PI);
                _this.faceInsetObjs[idx].sceneObject.localTransform = fijiTransform;
            }
        };
        newController.onScaleChanged = function (newScale) {
            var fijiTransform = _this.faceInsetObjs[idx].sceneObject.localTransform;
            fijiTransform.scale = newScale;
            _this.faceInsetObjs[idx].sceneObject.localTransform = fijiTransform;
        };
    };
    EffectEditor.prototype.setFaceInsetPosition = function (screenPos, objId, screenT) {
        this.faceInsetObjs[objId].headComp.attachmentPoint = Editor.Components.HeadAttachmentPointType.TriangleBarycentric;
        var parentPos = screenT.screenPointToParentPoint(screenPos).add(this.offsets[objId]);
        // let parentPos: vec2 = screenT.screenPointToParentPoint(screenPos);
        screenT.anchors.setCenter(parentPos);
        parentPos.y *= 1.34465045;
        for (var i = 0; i < _Data.module.Constants.CANDIDE_TRIANGLES.length; i++) {
            var curTriangle = _Data.module.Constants.CANDIDE_TRIANGLES[i];
            // parentPos.y *= 1.34465045;
            if (this.isPointInsideTriangle(parentPos, this.points[curTriangle[0]], this.points[curTriangle[1]], this.points[curTriangle[2]])) {
                this.idxs = curTriangle;
            }
        }
        var weights = this.barycentricCoordinates(this.points[this.idxs[0]], this.points[this.idxs[1]], this.points[this.idxs[2]], parentPos);
        var vertex = this.faceInsetObjs[objId].headComp.attachedBarycentricVertex;
        vertex.indices = [this.idxs[0], this.idxs[1], this.idxs[2]];
        vertex.weights = [weights[0], weights[1], weights[2]];
        // this.triangleBarycentricVertices[objId] = vertex;
        this.faceInsetObjs[objId].headComp.attachedBarycentricVertex = vertex;
        // this.setWorldPosition(screenT.localPointToScreenPoint(screenT.anchors.getCenter()), faceInsetObjT, objId);
        this.setWorldPosition(screenT.localPointToScreenPoint(vec2.zero()), objId);
    };
    EffectEditor.prototype.setWorldPosition = function (screenPos, objId) {
        var normal = this.camera.screenSpaceToWorldSpace(screenPos, 1);
        // faceInsetT.setWorldPosition(normal);
        var localT = this.faceInsetObjs[objId].lensCoreObject.getTransform();
        var scale = localT.getLocalScale();
        // faceInsetT.setLocalScale(scale);
        var newRot = localT.getLocalRotation();
        // faceInsetT.setWorldRotation(newRot);
        this.updateScreenTransform(objId, newRot, scale);
    };
    EffectEditor.prototype.updateScreenTransform = function (idx, rotation, scale) {
        if (this.faceInsetObjs[idx].updateScreenTFunction) {
            this.faceInsetObjs[idx].updateScreenTFunction(rotation, scale);
        }
    };
    EffectEditor.prototype.updateWorldPosition = function (id) {
        if (this.faceInsetObjs[id].screenT.pivot.distance(this.faceInsetObjs[id].prevPivotPos) > 0.001) {
            var screenTT = this.faceInsetObjs[id].screenT.getSceneObject().getChild(1).getChild(2).getChild(9).getComponent("Component.ScreenTransform");
            screenTT.anchors.setCenter(this.faceInsetObjs[id].screenT.pivot);
            var screenPos = this.faceInsetObjs[id].screenT.screenPointToParentPoint(this.faceInsetObjs[id].screenT.localPointToScreenPoint(vec2.zero()));
            this.faceInsetObjs[id].screenT.anchors.setCenter(screenPos.add(this.faceInsetObjs[id].screenT.anchors.getCenter().sub(this.faceInsetObjs[id].screenT.screenPointToParentPoint(this.faceInsetObjs[id].screenT.localPointToScreenPoint(this.faceInsetObjs[id].screenT.pivot.sub(this.faceInsetObjs[id].prevPivotPos))))));
            this.faceInsetObjs[id].prevPivotPos = this.faceInsetObjs[id].screenT.pivot;
        }
        this.setWorldPosition(this.faceInsetObjs[id].screenT.localPointToScreenPoint(vec2.zero()), id);
    };
    EffectEditor.prototype.barycentricCoordinates = function (A, B, C, P) {
        // Calculate vectors
        var v0 = new vec2(C.x - A.x, C.y - A.y);
        var v1 = new vec2(B.x - A.x, B.y - A.y);
        var v2 = new vec2(P.x - A.x, P.y - A.y);
        // Calculate dot products
        var dot00 = v0.x * v0.x + v0.y * v0.y;
        var dot01 = v0.x * v1.x + v0.y * v1.y;
        var dot02 = v0.x * v2.x + v0.y * v2.y;
        var dot11 = v1.x * v1.x + v1.y * v1.y;
        var dot12 = v1.x * v2.x + v1.y * v2.y;
        // Calculate barycentric coordinates
        var inv_denom = 1 / (dot00 * dot11 - dot01 * dot01);
        var u = (dot11 * dot02 - dot01 * dot12) * inv_denom;
        var v = (dot00 * dot12 - dot01 * dot02) * inv_denom;
        var w = 1 - u - v;
        return [w, v, u];
    };
    EffectEditor.prototype.barycentricToCoordinates = function (A, B, C, barycentricCoords) {
        var x = A.x * barycentricCoords[0] + B.x * barycentricCoords[1] + C.x * barycentricCoords[2];
        var y = A.y * barycentricCoords[0] + B.y * barycentricCoords[1] + C.y * barycentricCoords[2];
        // return { x, y };
        return new vec2(x, y);
    };
    EffectEditor.prototype.isPointInsideTriangle = function (p, p0, p1, p2) {
        var dX = p.x - p2.x;
        var dY = p.y - p2.y;
        var dX21 = p1.x - p2.x;
        var dY21 = p1.y - p2.y;
        var dX31 = p0.x - p2.x;
        var dY31 = p0.y - p2.y;
        var dot00 = dX31 * dX31 + dY31 * dY31;
        var dot01 = dX31 * dX21 + dY31 * dY21;
        var dot02 = dX31 * dX + dY31 * dY;
        var dot11 = dX21 * dX21 + dY21 * dY21;
        var dot12 = dX21 * dX + dY21 * dY;
        var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
        var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
        var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
        return u >= 0 && v >= 0 && u + v < 1;
    };
    EffectEditor.prototype.planeLineIntersection = function (dirVector) {
        var pointOnLine = new vec3(0, 0, 0);
        var pointOnPlane = new vec3(0, 0, -18);
        var normal = new vec3(0, 0, 1);
        var d = -(normal.x * pointOnPlane.x + normal.y * pointOnPlane.y + normal.z * pointOnPlane.z);
        var t = -(normal.x * pointOnLine.x + normal.y * pointOnLine.y + normal.z * pointOnLine.z + d) / (normal.x * dirVector.x + normal.y * dirVector.y + normal.z * dirVector.z);
        var intersectionPos = new vec3(pointOnLine.x + t * dirVector.x, pointOnLine.y + t * dirVector.y, pointOnLine.z + t * dirVector.z);
        return intersectionPos;
    };
    EffectEditor.prototype.updateIteractionPointsScale = function () {
        var curScale = this.main.instance.getLensRegion().getPinchControl().getScale();
        this.effectsT.setLocalScale(this.initEffectsScale.uniformScale(curScale));
    };
    EffectEditor.prototype.getLensRegionStatus = function () {
        return _LensRegion.module.LensRegion.isBusy;
    };
    return EffectEditor;
}());
exports.EffectEditor = EffectEditor;
