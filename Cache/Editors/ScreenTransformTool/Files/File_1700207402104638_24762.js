"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AlignerHelper = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/SCTree");
}
const _SCTree = RequireModule.requireModule("@src/Editor/SCTree");
if (false) {
    require("@src/Editor/Gizmo/AlignmentTypes");
}
const _AlignmentTypes = RequireModule.requireModule("@src/Editor/Gizmo/AlignmentTypes");
if (false) {
    require("@src/Editor/Config");
}
const _Config = RequireModule.requireModule("@src/Editor/Config");
if (false) {
    require("@src/Editor/LineRenderer");
}
const _LineRenderer = RequireModule.requireModule("@src/Editor/LineRenderer");
if (false) {
    require("@src/Editor/DrawHelper");
}
const _DrawHelper = RequireModule.requireModule("@src/Editor/DrawHelper");
if (false) {
    require("@src/Editor/Gizmo/GizmoUtils");
}
const _GizmoUtils = RequireModule.requireModule("@src/Editor/Gizmo/GizmoUtils");
if (false) {
    require("@src/Editor/RulersAndGuides/GuideBars");
}
const _GuideBars = RequireModule.requireModule("@src/Editor/RulersAndGuides/GuideBars");
var CornerType;
(function (CornerType) {
    CornerType[CornerType["TopRight"] = 0] = "TopRight";
    CornerType[CornerType["BottomRight"] = 1] = "BottomRight";
    CornerType[CornerType["BottomLeft"] = 2] = "BottomLeft";
    CornerType[CornerType["TopLeft"] = 3] = "TopLeft";
    CornerType[CornerType["Count"] = 4] = "Count";
})(CornerType || (CornerType = {}));
class AlignerHelper {
    constructor(tree, camera, lineRenderer, guides) {
        this.tree = tree;
        this.camera = camera;
        this.lineRenderer = lineRenderer;
        this.guides = guides;
        this.EPS = 1e-5;
        this.UNREACHABLE_DISTANCE = 1000;
        this.cornersLocalPoint = [vec2.one(), new vec2(1, -1),
            vec2.one().uniformScale(-1), new vec2(-1, 1)];
        this.objects = [];
        this.screenTransforms = [];
        this.lastCameraSize = 0;
        this.horizontal = [];
        this.vertical = [];
        this.align = (data) => {
            if (!_Config.module.Config.isSnappingEnabled.value) {
                return;
            }
            if (this.camera.size !== this.lastCameraSize) {
                this.lastCameraSize = this.camera.size;
                this.reset();
            }
            this.lineRenderer.instance.reset();
            switch (data.interactionType) {
                case _AlignmentTypes.module.InteractionType.Move:
                    this.alignMove(data.screenTransform);
                    break;
                case _AlignmentTypes.module.InteractionType.Pivot:
                    this.alignPivot(data.screenTransform);
                    break;
                case _AlignmentTypes.module.InteractionType.Rotation:
                    this.alignRotation(data.screenTransform);
                    break;
                case _AlignmentTypes.module.InteractionType.Scale:
                    this.alignScale(data.screenTransform, data.direction);
                    break;
                default:
                    throw new Error("[AlignerHelper] Unregistered Interaction Type");
            }
            this.lineRenderer.instance.update();
        };
    }
    reset() {
        this.init();
    }
    alignMove(screenTransform) {
        const extraPoints = this.guides.instance.getScreenPoints();
        const screenPoints = [];
        this.cornersLocalPoint.forEach((corner) => {
            screenPoints.push(this.localPointToScreenSpace(screenTransform, corner, this.camera));
        });
        screenPoints.push(this.localPointToScreenSpace(screenTransform, screenTransform.pivot, this.camera));
        let verticalDelta = this.UNREACHABLE_DISTANCE; //this.getClosestVerticalDelta(screenPoints);
        let horizontalDelta = this.UNREACHABLE_DISTANCE; //this.getClosestHorizontalDelta(screenPoints);
        if (_Config.module.Config.isSnappingEnabled.value) {
            verticalDelta = this.getClosestVerticalDelta(screenPoints);
            horizontalDelta = this.getClosestHorizontalDelta(screenPoints);
        }
        screenPoints.forEach((screenPoint) => {
            extraPoints.forEach((line) => {
                const deltaX = line.x - screenPoint.x;
                const deltaY = line.y - screenPoint.y;
                if (Math.abs(deltaX) < Math.abs(verticalDelta)) {
                    verticalDelta = deltaX;
                }
                if (Math.abs(deltaY) < Math.abs(horizontalDelta)) {
                    horizontalDelta = deltaY;
                }
            });
        });
        const worldParentCenter = screenTransform.localPointToWorldPoint(vec2.zero());
        const screenParentCenter = this.camera.worldSpaceToScreenSpace(worldParentCenter);
        if (Math.abs(verticalDelta) < _Config.module.Config.MaxAttachScreenDistance) {
            screenParentCenter.x += verticalDelta;
            screenPoints.forEach(point => point.x += verticalDelta);
        }
        if (Math.abs(horizontalDelta) < _Config.module.Config.MaxAttachScreenDistance) {
            screenParentCenter.y += horizontalDelta;
            screenPoints.forEach(point => point.y += horizontalDelta);
        }
        screenTransform.anchors.setCenter(screenTransform.worldPointToParentPoint(this.camera.screenSpaceToWorldSpace(screenParentCenter, 10)));
        this.drawHelper.drawLines(screenPoints, extraPoints);
    }
    alignPivot(screenTransform) {
        const extraPoints = this.guides.instance.getScreenPoints();
        this.cornersLocalPoint.forEach((point) => {
            extraPoints.push(this.localPointToScreenSpace(screenTransform, point, this.camera));
        });
        extraPoints.push(this.localPointToScreenSpace(screenTransform, vec2.zero(), this.camera));
        const screenPivotPoint = this.localPointToScreenSpace(screenTransform, screenTransform.pivot, this.camera);
        let verticalDelta = this.UNREACHABLE_DISTANCE; //this.getClosestVerticalDelta([screenPivotPoint]);
        let horizontalDelta = this.UNREACHABLE_DISTANCE; //this.getClosestHorizontalDelta([screenPivotPoint]);
        if (_Config.module.Config.isSnappingEnabled.value) {
            verticalDelta = this.getClosestVerticalDelta([screenPivotPoint]);
            horizontalDelta = this.getClosestHorizontalDelta([screenPivotPoint]);
        }
        extraPoints.forEach((line) => {
            const deltaX = line.x - screenPivotPoint.x;
            const deltaY = line.y - screenPivotPoint.y;
            if (Math.abs(deltaX) < Math.abs(verticalDelta)) {
                verticalDelta = deltaX;
            }
            if (Math.abs(deltaY) < Math.abs(horizontalDelta)) {
                horizontalDelta = deltaY;
            }
        });
        if (Math.abs(verticalDelta) < _Config.module.Config.MaxAttachScreenDistance) {
            screenPivotPoint.x += verticalDelta;
        }
        if (Math.abs(horizontalDelta) < _Config.module.Config.MaxAttachScreenDistance) {
            screenPivotPoint.y += horizontalDelta;
        }
        _GizmoUtils.module.GizmoUtils.setPivotPreservePosition(screenTransform, screenTransform.worldPointToLocalPoint(this.camera.screenSpaceToWorldSpace(screenPivotPoint, 10)));
        this.drawHelper.drawLines([screenPivotPoint], extraPoints);
    }
    alignRotation(screenTransform) {
        // There's no need for this, it wasn't supported in Studio3D
    }
    alignScale(screenTransform, direction) {
        const savePivot = screenTransform.pivot;
        if (Math.abs(direction.x) > this.EPS && Math.abs(direction.y) > this.EPS) { // CORNER
            const extraPoints = this.guides.instance.getScreenPoints();
            const cornerScreenPoint = this.localPointToScreenSpace(screenTransform, direction, this.camera);
            let horizontalDelta = this.UNREACHABLE_DISTANCE; //this.getClosestHorizontalDelta([cornerScreenPoint]);
            let verticalDelta = this.UNREACHABLE_DISTANCE; //this.getClosestVerticalDelta([cornerScreenPoint]);
            if (_Config.module.Config.isSnappingEnabled.value) {
                horizontalDelta = this.getClosestHorizontalDelta([cornerScreenPoint]);
                verticalDelta = this.getClosestVerticalDelta([cornerScreenPoint]);
            }
            extraPoints.forEach((line) => {
                const deltaX = line.x - cornerScreenPoint.x;
                const deltaY = line.y - cornerScreenPoint.y;
                if (Math.abs(deltaX) < Math.abs(verticalDelta)) {
                    verticalDelta = deltaX;
                }
                if (Math.abs(deltaY) < Math.abs(horizontalDelta)) {
                    horizontalDelta = deltaY;
                }
            });
            if (Math.abs(verticalDelta) < _Config.module.Config.MaxAttachScreenDistance) {
                cornerScreenPoint.x += verticalDelta;
            }
            if (Math.abs(horizontalDelta) < _Config.module.Config.MaxAttachScreenDistance) {
                cornerScreenPoint.y += horizontalDelta;
            }
            let cornerWorldPoint = this.camera.screenSpaceToWorldSpace(cornerScreenPoint, 10);
            const pivotWorldPoint = screenTransform.localPointToWorldPoint(savePivot);
            cornerWorldPoint.z = pivotWorldPoint.z;
            cornerWorldPoint = cornerWorldPoint.sub(pivotWorldPoint);
            cornerWorldPoint = quat.fromEulerAngles(0, 0, -screenTransform.rotation.toEulerAngles().z).multiplyVec3(cornerWorldPoint);
            cornerWorldPoint = cornerWorldPoint.add(pivotWorldPoint);
            // Adjust for scale
            let diff = cornerWorldPoint.sub(pivotWorldPoint);
            const scale = screenTransform.scale;
            diff.x = diff.x * (Math.abs(scale.x) > this.EPS ? 1 / scale.x : 0);
            diff.y = diff.y * (Math.abs(scale.y) > this.EPS ? 1 / scale.y : 0);
            diff.z = diff.z * (Math.abs(scale.z) > this.EPS ? 1 / scale.z : 0);
            cornerWorldPoint = pivotWorldPoint.add(diff);
            const anchors = screenTransform.anchors;
            const cornerParentPoint = screenTransform.worldPointToParentPoint(cornerWorldPoint);
            let topRight = new vec2(screenTransform.anchors.top, screenTransform.anchors.right);
            const leftBottom = new vec2(screenTransform.anchors.left, screenTransform.anchors.bottom);
            let localDirection = vec2.one();
            if (direction.x > this.EPS) {
                topRight.y = cornerParentPoint.x;
                localDirection.x *= -1;
            }
            else if (direction.x < -this.EPS) {
                leftBottom.x = cornerParentPoint.x;
            }
            if (direction.y > this.EPS) {
                topRight.x = cornerParentPoint.y;
                localDirection.y *= -1;
            }
            else if (direction.y < -this.EPS) {
                leftBottom.y = cornerParentPoint.y;
            }
            _GizmoUtils.module.GizmoUtils.setPivotPreservePosition(screenTransform, direction.uniformScale(-1));
            const oldSize = anchors.getSize();
            const newSize = new vec2(topRight.y - leftBottom.x, topRight.x - leftBottom.y);
            localDirection = localDirection.mult(oldSize.sub(newSize));
            anchors.setSize(newSize);
            anchors.setCenter(anchors.getCenter().add(localDirection.uniformScale(0.5)));
            this.drawHelper.drawLines([cornerScreenPoint], extraPoints);
        }
        else { // SIDE POINT
        }
        _GizmoUtils.module.GizmoUtils.setPivotPreservePosition(screenTransform, savePivot);
    }
    init() {
        this.objects = this.tree.collectObjectsForAlignment();
        this.screenTransforms = [];
        this.objects.forEach(obj => this.screenTransforms.push(obj.getComponent("ScreenTransform")));
        this.collectAlignPoints();
        this.drawHelper = new _DrawHelper.module.DrawHelper(this.horizontal, this.vertical, this.lineRenderer, this.camera);
    }
    getClosestVerticalDelta(points, extraLines = []) {
        return this.findClosestDelta(this.vertical, points, (a, b) => {
            return a.x - b.x;
        });
    }
    getClosestHorizontalDelta(points) {
        return this.findClosestDelta(this.horizontal, points, (a, b) => {
            return a.y - b.y;
        });
    }
    findClosestDelta(lines, points, compareFunc) {
        let delta = _Config.module.Config.MaxAttachScreenDistance + 10;
        let absDelta = -1;
        let line = vec2.zero();
        let corner = vec2.zero();
        points.forEach((point) => {
            const closestLine = this.findClosestInSortedArray(lines, point, compareFunc);
            if (!closestLine) {
                return;
            }
            const currentDelta = compareFunc(closestLine, point); //closestLine.y - point.y;
            const currentAbsDelta = Math.abs(currentDelta);
            if (absDelta < 0 || currentAbsDelta < absDelta) {
                absDelta = currentAbsDelta;
                delta = currentDelta;
                line = closestLine;
                corner = point;
            }
        });
        return delta;
    }
    findClosestInSortedArray(arr, point, fun) {
        if (!arr.length) {
            return null;
        }
        let l = 0;
        let r = arr.length - 1;
        while (r - l > 2) {
            const mid = Math.floor((r + l) / 2);
            const midValue = fun(arr[mid], point);
            if (midValue < 0) {
                l = mid;
            }
            else {
                r = mid;
            }
        }
        let res = Math.abs(fun(arr[l], point));
        let idx = l;
        for (let i = l + 1; i <= r; i++) {
            const currentDelta = Math.abs(fun(arr[i], point));
            if (res >= currentDelta) {
                res = currentDelta;
                idx = i;
            }
        }
        return arr[idx];
    }
    localPointToScreenSpace(screenTransform, point, camera) {
        return camera.worldSpaceToScreenSpace(screenTransform.localPointToWorldPoint(point));
    }
    collectAlignPoints() {
        this.horizontal = [];
        this.vertical = [];
        const addPoint = (point) => {
            this.horizontal.push(point);
            this.vertical.push(point);
        };
        this.screenTransforms.forEach((screenTransform) => {
            this.cornersLocalPoint.forEach((corner) => {
                addPoint(this.localPointToScreenSpace(screenTransform, corner, this.camera));
            });
            addPoint(this.localPointToScreenSpace(screenTransform, screenTransform.pivot, this.camera));
        });
        this.vertical = this.vertical.sort((a, b) => {
            if (a.x !== b.x) {
                return a.x - b.x;
            }
            return b.y - a.y;
        });
        this.horizontal = this.horizontal.sort((a, b) => {
            if (a.y !== b.y) {
                return a.y - b.y;
            }
            return b.x - a.x;
        });
    }
}
exports.AlignerHelper = AlignerHelper;
