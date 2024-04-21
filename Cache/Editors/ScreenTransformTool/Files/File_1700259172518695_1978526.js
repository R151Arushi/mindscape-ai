"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.GuideBars = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/RulersAndGuides/Guide");
}
const _Guide = RequireModule.requireModule("@src/Editor/RulersAndGuides/Guide");
if (false) {
    require("@src/Editor/RulersAndGuides/GuidePool");
}
const _GuidePool = RequireModule.requireModule("@src/Editor/RulersAndGuides/GuidePool");
if (false) {
    require("@src/Editor/LineRenderer");
}
const _LineRenderer = RequireModule.requireModule("@src/Editor/LineRenderer");
if (false) {
    require("@src/Editor/CallScheduler");
}
const _CallScheduler = RequireModule.requireModule("@src/Editor/CallScheduler");
if (false) {
    require("@src/Editor/Config");
}
const _Config = RequireModule.requireModule("@src/Editor/Config");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
if (false) {
    require("@src/Editor/Gizmo/Gizmo");
}
const _Gizmo = RequireModule.requireModule("@src/Editor/Gizmo/Gizmo");
if (false) {
    require("@src/Editor/MouseHint");
}
const _MouseHint = RequireModule.requireModule("@src/Editor/MouseHint");
class GuideBars {
    constructor() {
        this.activeGuide = null;
        this.guides = [];
        this.guidePointsBuffer = [];
    }
    onAwake() {
        this.guidePool = new _GuidePool.module.GuidePool(this.horizontalGuideRef, this.verticalGuideRef);
        this.callScheduler = new _CallScheduler.module.CallScheduler(this.script, "UpdateEvent");
        this.setupInteractions();
        _Config.module.Config.isGuideEnabled.addCallback((value) => {
            if (!value) {
                this.guideLines.instance.reset();
            }
            else {
                this.drawLines();
            }
        });
        this.lensRegion.instance.addOnLensRegionUpdate(() => {
            this.drawLines();
        });
    }
    getScreenPoints() {
        if (!_Config.module.Config.isSnappingToGuideEnabled.value) {
            return [];
        }
        this.guidePointsBuffer = [];
        let horizontalIdx = 0;
        let verticalIdx = 0;
        this.guides.forEach((guide) => {
            if (guide.instance.getType() === _Guide.module.GuideType.Vertical) {
                if (verticalIdx >= this.guidePointsBuffer.length) {
                    this.guidePointsBuffer.push(vec2.zero());
                }
                this.guidePointsBuffer[verticalIdx].x = guide.instance.getScreenPosition().x;
                verticalIdx += 1;
            }
            else {
                if (horizontalIdx >= this.guidePointsBuffer.length) {
                    this.guidePointsBuffer.push(vec2.zero());
                }
                this.guidePointsBuffer[horizontalIdx].y = guide.instance.getScreenPosition().y;
                horizontalIdx += 1;
            }
        });
        return this.guidePointsBuffer;
    }
    setupInteractions() {
        this.topInteraction = this.topBar.getComponent("InteractionComponent");
        this.leftInteraction = this.leftBar.getComponent("InteractionComponent");
        this.topInteraction.onTouchStart.add((eventData) => {
            if (!_Config.module.Config.isGuideEnabled.value || _LensRegion.module.LensRegion.isBusy || _Gizmo.module.Gizmo.isBusy) {
                return;
            }
            this.mouseHint.instance.show();
            this.mouseHint.instance.updateFromMousePosition(eventData.position);
            this.activeGuide = this.guidePool.getHorizontalGuide();
            this.guides.push(this.activeGuide);
            this.activeGuide.instance.addOnUpdate(() => this.drawLines());
            this.activeGuide.instance.enabled = true;
            this.activeGuide.instance.setScreenPosition(eventData.position);
            this.mouseHint.instance.setText(this.activeGuide.instance.getHint());
            this.callScheduler.scheduleCall(() => { this.drawLines(); });
        });
        this.topInteraction.onTouchMove.add((eventData) => {
            if (!this.activeGuide) {
                return;
            }
            this.mouseHint.instance.updateFromMousePosition(eventData.position);
            this.activeGuide.instance.setScreenPosition(eventData.position);
            this.mouseHint.instance.setText(this.activeGuide.instance.getHint());
            this.callScheduler.scheduleCall(() => { this.drawLines(); });
        });
        this.topInteraction.onTouchEnd.add((eventData) => {
            if (!this.activeGuide) {
                return;
            }
            this.mouseHint.instance.updateFromMousePosition(eventData.position);
            this.activeGuide.instance.setScreenPosition(eventData.position);
            this.mouseHint.instance.setText(this.activeGuide.instance.getHint());
            this.callScheduler.scheduleCall(() => { this.drawLines(); });
            this.mouseHint.instance.hide();
            this.activeGuide = null;
        });
        this.leftInteraction.onTouchStart.add((eventData) => {
            if (!_Config.module.Config.isGuideEnabled.value || _LensRegion.module.LensRegion.isBusy || _Gizmo.module.Gizmo.isBusy) {
                return;
            }
            this.mouseHint.instance.show();
            this.mouseHint.instance.updateFromMousePosition(eventData.position);
            this.activeGuide = this.guidePool.getVerticalGuide();
            this.guides.push(this.activeGuide);
            this.activeGuide.instance.addOnUpdate(() => this.drawLines());
            this.activeGuide.instance.enabled = true;
            this.activeGuide.instance.setScreenPosition(eventData.position);
            this.mouseHint.instance.setText(this.activeGuide.instance.getHint());
            this.callScheduler.scheduleCall(() => { this.drawLines(); });
        });
        this.leftInteraction.onTouchMove.add((eventData) => {
            if (!this.activeGuide) {
                return;
            }
            this.mouseHint.instance.updateFromMousePosition(eventData.position);
            this.activeGuide.instance.setScreenPosition(eventData.position);
            this.mouseHint.instance.setText(this.activeGuide.instance.getHint());
            this.callScheduler.scheduleCall(() => { this.drawLines(); });
        });
        this.leftInteraction.onTouchEnd.add((eventData) => {
            if (!this.activeGuide) {
                return;
            }
            this.activeGuide.instance.setScreenPosition(eventData.position);
            this.callScheduler.scheduleCall(() => { this.drawLines(); });
            this.mouseHint.instance.updateFromMousePosition(eventData.position);
            this.mouseHint.instance.setText(this.activeGuide.instance.getHint());
            this.mouseHint.instance.hide();
            this.activeGuide = null;
        });
    }
    drawLines() {
        if (!_Config.module.Config.isGuideEnabled.value) {
            return;
        }
        this.guideLines.instance.reset();
        this.guides.forEach((guide) => {
            const pointA = guide.instance.getWorldCenter();
            const pointB = guide.instance.getWorldCenter();
            if (guide.instance.getType() === _Guide.module.GuideType.Vertical) {
                pointA.y = 10000;
                pointB.y = -10000;
            }
            else {
                pointA.x = -10000;
                pointB.x = 10000;
            }
            this.guideLines.instance.addLine(pointA, pointB);
        });
        this.guideLines.instance.update();
    }
}
exports.GuideBars = GuideBars;
