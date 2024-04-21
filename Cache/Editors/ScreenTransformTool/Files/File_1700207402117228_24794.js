"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GizmoPool = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Gizmo/Gizmo");
}
const _Gizmo = RequireModule.requireModule("@src/Editor/Gizmo/Gizmo");
class GizmoPool {
    constructor(gizmoRef, poolSize) {
        this.gizmoRef = gizmoRef;
        this.poolSize = poolSize;
        this.pool = [];
        this.gizmoRef.instance.hide();
        this.sceneObject = this.gizmoRef.getSceneObject();
        this.root = this.sceneObject.getParent();
        for (let i = 0; i < poolSize; i++) {
            this.spawnNewGizmo();
        }
    }
    getNewGizmo() {
        this.spawnNewGizmo();
        const gizmo = this.pool.pop();
        gizmo.instance.init();
        return gizmo;
    }
    spawnNewGizmo() {
        const newGizmoObject = this.root.copyWholeHierarchyAndAssets(this.sceneObject);
        const newGizmo = newGizmoObject.getComponent("ScriptComponent");
        newGizmo.instance.hide();
        this.pool.push(newGizmo);
    }
}
exports.GizmoPool = GizmoPool;
