"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GizmoUtils = void 0;
var GizmoUtils;
(function (GizmoUtils) {
    GizmoUtils.aspectSource = global.scene.liveTarget;
    const topLeft = new vec2(-1, 1);
    const topRight = new vec2(1, 1);
    const bottomLeft = new vec2(-1, -1);
    const bottomRight = new vec2(1, -1);
    function getAspect() {
        return GizmoUtils.aspectSource.control.getAspect();
    }
    GizmoUtils.getAspect = getAspect;
    function getPerpendicularVec3(vec) {
        return new vec3(-vec.y, vec.x, 0);
    }
    GizmoUtils.getPerpendicularVec3 = getPerpendicularVec3;
    function localPointToParentPoint(screenTransform, point) {
        return screenTransform.screenPointToParentPoint(screenTransform.localPointToScreenPoint(point));
    }
    GizmoUtils.localPointToParentPoint = localPointToParentPoint;
    function screenPointToWorldPoint(screenTransform, point) {
        return screenTransform.localPointToWorldPoint(screenTransform.screenPointToLocalPoint(point));
    }
    GizmoUtils.screenPointToWorldPoint = screenPointToWorldPoint;
    function getParentWorldWidth(screenTransform) {
        // try {
        return screenPointToWorldPoint(screenTransform, parentPointToScreenPoint(screenTransform, topLeft))
            .distance(screenPointToWorldPoint(screenTransform, parentPointToScreenPoint(screenTransform, topRight)));
        // } catch (e) {
        //     print("CATCH");
        //     return 0;
        // }
    }
    GizmoUtils.getParentWorldWidth = getParentWorldWidth;
    function getParentWorldHeight(screenTransform) {
        // try {
        return screenPointToWorldPoint(screenTransform, parentPointToScreenPoint(screenTransform, topLeft))
            .distance(screenPointToWorldPoint(screenTransform, parentPointToScreenPoint(screenTransform, bottomLeft)));
        // } catch (e) {
        //     return 0;
        // }
    }
    GizmoUtils.getParentWorldHeight = getParentWorldHeight;
    function screenPointToScreenPoint(point, cameraA, cameraB) {
        return cameraB.worldSpaceToScreenSpace(cameraA.screenSpaceToWorldSpace(point, -1));
    }
    GizmoUtils.screenPointToScreenPoint = screenPointToScreenPoint;
    function parentPointToScreenPoint(screenTransform, point) {
        const topLeft = screenTransform.screenPointToParentPoint(vec2.zero());
        const bottomRight = screenTransform.screenPointToParentPoint(vec2.one());
        return new vec2((point.x - topLeft.x) / (bottomRight.x - topLeft.x), 1 - (point.y - bottomRight.y) / (topLeft.y - bottomRight.y));
    }
    GizmoUtils.parentPointToScreenPoint = parentPointToScreenPoint;
    function execPreservePosition(screenTransform, func) {
        const centerWorldPosition = screenTransform.localPointToWorldPoint(vec2.zero());
        func();
        const newCenterWorldPosition = screenTransform.localPointToWorldPoint(vec2.zero());
        const worldDelta = screenTransform.worldPointToParentPoint(centerWorldPosition)
            .sub(screenTransform.worldPointToParentPoint(newCenterWorldPosition));
        screenTransform.anchors.setCenter(screenTransform.anchors.getCenter().add(worldDelta));
    }
    GizmoUtils.execPreservePosition = execPreservePosition;
    function setPivotPreservePosition(screenTransform, point) {
        execPreservePosition(screenTransform, () => {
            screenTransform.pivot = point;
        });
    }
    GizmoUtils.setPivotPreservePosition = setPivotPreservePosition;
    function rotateVec2(vec, angle) {
        const res = vec2.zero();
        res.x = vec.x * Math.cos(angle) - vec.y * Math.sin(angle);
        res.y = vec.x * Math.sin(angle) + vec.y * Math.cos(angle);
        return res;
    }
    GizmoUtils.rotateVec2 = rotateVec2;
    function rotateVec3z(vec, angle) {
        const res = vec3.zero();
        res.x = vec.x * Math.cos(angle) - vec.y * Math.sin(angle);
        res.y = vec.x * Math.sin(angle) + vec.y * Math.cos(angle);
        return res;
    }
    GizmoUtils.rotateVec3z = rotateVec3z;
})(GizmoUtils = exports.GizmoUtils || (exports.GizmoUtils = {}));
