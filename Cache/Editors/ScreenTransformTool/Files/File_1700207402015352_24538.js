"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Main = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
if (false) {
    require("@lib/Utilities/RenderLayerUtils");
}
const _RenderLayerUtils = RequireModule.requireModule("@lib/Utilities/RenderLayerUtils");
if (false) {
    require("../../Common/Utilities/LensRegion/PanControl");
}
const _PanControl = RequireModule.requireModule("../../Common/Utilities/LensRegion/PanControl");
if (false) {
    require("@src/Editor/Gizmo/GizmoUtils");
}
const _GizmoUtils = RequireModule.requireModule("@src/Editor/Gizmo/GizmoUtils");
class Main {
    onAwake() {
        _RenderLayerUtils.module.RenderLayerUtils.setUniqueLayersForHierarchy(this.script.getSceneObject().getParent());
        // this.lensRegion.addOnLensRegionUpdate(() => {
        //     LineRenderer.getInstance().update();
        // })
        // this.script.createEvent("UpdateEvent").bind(() => {
        //     LineRenderer.getInstance().update();
        // })
        //
        // this.updateEvent = this.script.createEvent("UpdateEvent");
        // this.updateEvent.bind(() => {
        //     // global.LensEditor?.context.requestUpdate();
        //     this.updateEvent.enabled = false;
        // })
        // this.updateEvent.enabled = false;
        this.panControl = this.lensRegion.instance.getPanControl();
        _GizmoUtils.module.GizmoUtils.aspectSource = this.lensRegion.instance.getWindowTexture();
    }
    callUpdate() {
        this.updateEvent.enabled = true;
    }
    getLensRegion() {
        return this.lensRegion.instance;
    }
    resetLensRegionPosition() {
        this.panControl.resetPosition();
    }
}
exports.Main = Main;
