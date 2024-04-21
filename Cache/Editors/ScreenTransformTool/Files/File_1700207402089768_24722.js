"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SidePoint = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Gizmo/Points/Point");
}
const _Point = RequireModule.requireModule("@src/Editor/Gizmo/Points/Point");
if (false) {
    require("@src/Editor/Gizmo/Gizmo");
}
const _Gizmo = RequireModule.requireModule("@src/Editor/Gizmo/Gizmo");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
class SidePoint extends _Point.module.Point {
    constructor(sceneObject) {
        super(sceneObject);
    }
    setupInteractions() {
        let worldOffset = vec3.zero();
        let interactionStarted = false;
        const processTouch = (position) => {
            this.callback && this.callback({ sidePointOffset: this.offset, worldPosition: position });
        };
        const translatedTouchPosition = (eventData) => {
            return this.interactionCamera.screenSpaceToWorldSpace(eventData.position, -1);
        };
        const onTouchStart = (eventData) => {
            if (_LensRegion.module.LensRegion.isBusy) {
                return;
            }
            interactionStarted = true;
            if (this.validator && this.validator()) {
                const sidePointWorldPosition = this.screenTransform.localPointToWorldPoint(vec2.zero());
                worldOffset = translatedTouchPosition(eventData).sub(sidePointWorldPosition);
            }
            _Gizmo.module.Gizmo.isBusy = true;
        };
        const onTouchMove = (eventData) => {
            if (!interactionStarted) {
                return;
            }
            processTouch(translatedTouchPosition(eventData).sub(worldOffset));
        };
        const onTouchEnd = (eventData) => {
            if (!interactionStarted) {
                return;
            }
            interactionStarted = false;
            processTouch(translatedTouchPosition(eventData).sub(worldOffset));
            _Gizmo.module.Gizmo.isBusy = false;
        };
        this.interactionComponent.onTouchStart.add(onTouchStart);
        this.interactionComponent.onTouchMove.add(onTouchMove);
        this.interactionComponent.onTouchEnd.add(onTouchEnd);
    }
}
exports.SidePoint = SidePoint;
