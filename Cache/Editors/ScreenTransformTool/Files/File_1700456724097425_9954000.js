"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MouseHint = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Gizmo/GizmoUtils");
}
const _GizmoUtils = RequireModule.requireModule("@src/Editor/Gizmo/GizmoUtils");
class MouseHint {
    constructor() {
        this.parentPointOffset = vec2.zero();
    }
    onAwake() {
        this.object = this.script.getSceneObject();
        this.screenTransform = this.object.getComponent("ScreenTransform");
        this.image = this.object.getComponent("Image");
        this.textComponent = this.object.getComponent("Text");
        this.updateParentPointOffset();
        this.hide();
    }
    setText(msg) {
        this.textComponent.text = msg;
    }
    show() {
        this.textComponent.enabled = true;
        this.image.enabled = true;
    }
    hide() {
        this.textComponent.enabled = false;
        this.image.enabled = false;
    }
    updateFromMousePosition(mouseScreenPosition, updateOffsets = true) {
        const parentPosition = this.screenTransform.screenPointToParentPoint(mouseScreenPosition);
        this.screenTransform.anchors.setCenter(parentPosition);
    }
    updateParentPointOffset() {
        this.parentPointOffset = _GizmoUtils.module.GizmoUtils.localPointToParentPoint(this.screenTransform, vec2.zero())
            .sub(_GizmoUtils.module.GizmoUtils.localPointToParentPoint(this.screenTransform, vec2.one()));
    }
}
exports.MouseHint = MouseHint;
