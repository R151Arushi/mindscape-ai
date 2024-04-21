"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Guide = exports.GuideType = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/MouseHint");
}
const _MouseHint = RequireModule.requireModule("@src/Editor/MouseHint");
var GuideType;
(function (GuideType) {
    GuideType[GuideType["Horizontal"] = 0] = "Horizontal";
    GuideType[GuideType["Vertical"] = 1] = "Vertical";
})(GuideType = exports.GuideType || (exports.GuideType = {}));
class Guide {
    constructor() {
        this.type = GuideType.Horizontal;
        this.position = vec2.zero();
        this.callbacks = [];
    }
    onAwake() {
        this.sceneObject = this.script.getSceneObject();
        this.screenTransform = this.sceneObject.getComponent("ScreenTransform");
        this.position = this.screenTransform.anchors.getCenter();
        this.image = this.sceneObject.getComponent("Image");
        this.interaction = this.sceneObject.getComponent("InteractionComponent");
        const position = this.screenTransform.position;
        position.z = 15;
        this.screenTransform.position = position;
        this.setupInteractions();
    }
    addOnUpdate(cb) {
        this.callbacks.push(cb);
    }
    set enabled(value) {
        this.image.enabled = value;
    }
    setType(type) {
        this.type = type;
    }
    getSingleAxisPosition() {
        if (this.getType() === GuideType.Vertical) {
            return this.position.x;
        }
        else {
            return this.position.y;
        }
    }
    getPosition() {
        return this.position;
    }
    getScreenPosition() {
        return this.screenTransform.localPointToScreenPoint(vec2.zero());
    }
    setScreenPosition(position) {
        this.setPosition(this.screenTransform.screenPointToParentPoint(position));
    }
    setPosition(position) {
        if (this.type === GuideType.Vertical) {
            this.position.x = position.x;
        }
        else {
            this.position.y = position.y;
        }
        this.screenTransform.anchors.setCenter(this.position);
        this.doCallbacks();
    }
    getWorldCenter() {
        return this.screenTransform.localPointToWorldPoint(vec2.zero());
    }
    getType() {
        return this.type;
    }
    getHint() {
        if (this.getType() === GuideType.Vertical) {
            return "X: " + this.getSingleAxisPosition().toFixed(4);
        }
        else {
            return "Y: " + this.getSingleAxisPosition().toFixed(4);
        }
    }
    doCallbacks() {
        this.callbacks.forEach((cb) => {
            cb && cb();
        });
    }
    setupInteractions() {
        this.interaction.onTouchStart.add((eventData) => {
            this.mouseHint.instance.show();
            this.setScreenPosition(eventData.position);
            this.mouseHint.instance.updateFromMousePosition(eventData.position);
            this.mouseHint.instance.setText(this.getHint());
        });
        this.interaction.onTouchMove.add((eventData) => {
            this.setScreenPosition(eventData.position);
            this.mouseHint.instance.updateFromMousePosition(eventData.position);
            this.mouseHint.instance.setText(this.getHint());
        });
        this.interaction.onTouchEnd.add((eventData) => {
            this.setScreenPosition(eventData.position);
            this.mouseHint.instance.updateFromMousePosition(eventData.position);
            this.mouseHint.instance.setText(this.getHint());
            this.mouseHint.instance.hide();
        });
    }
}
exports.Guide = Guide;
