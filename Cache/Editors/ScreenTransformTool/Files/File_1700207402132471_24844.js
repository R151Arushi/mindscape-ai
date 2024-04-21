"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Rulers = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
if (false) {
    require("@src/Editor/Config");
}
const _Config = RequireModule.requireModule("@src/Editor/Config");
class Rulers {
    onAwake() {
        this.lensRegion.instance.addOnLensRegionUpdate(() => {
            this.updateRulers();
        });
        _Config.module.Config.isRulerEnabled.addCallback((value) => {
            if (value) {
                this.show();
            }
            else {
                this.hide();
            }
        });
    }
    show() {
        this.script.getSceneObject().enabled = true;
    }
    hide() {
        this.script.getSceneObject().enabled = false;
    }
    updateRulers() {
        const topRight = this.frame.localPointToScreenPoint(vec2.one());
        const bottomLeft = this.frame.localPointToScreenPoint(vec2.one().uniformScale(-1));
        this.fixDistortion(topRight, bottomLeft);
        this.updateRuler(this.horizontal, bottomLeft, topRight, true);
        this.updateRuler(this.vertical, bottomLeft, topRight, false);
    }
    updateRuler(screenTransform, bottomLeft, topRight, isHorizontal) {
        const bottomLeftParent = screenTransform.screenPointToParentPoint(bottomLeft);
        const topRightParent = screenTransform.screenPointToParentPoint(topRight);
        if (isHorizontal) {
            screenTransform.anchors.left = bottomLeftParent.x;
            screenTransform.anchors.right = topRightParent.x;
        }
        else {
            screenTransform.anchors.bottom = bottomLeftParent.y;
            screenTransform.anchors.top = topRightParent.y;
        }
    }
    fixDistortion(topRight, bottomLeft) {
        const height = this.lensRegion.instance.getWindowTexture().getHeight() * (bottomLeft.y - topRight.y);
        const width = this.lensRegion.instance.getWindowTexture().getWidth() * (topRight.x - bottomLeft.x);
        this.horizontalMaterial.mainPass.widthScale = 640 / width;
        this.verticalMaterial.mainPass.widthScale = 640 / height;
    }
}
exports.Rulers = Rulers;
