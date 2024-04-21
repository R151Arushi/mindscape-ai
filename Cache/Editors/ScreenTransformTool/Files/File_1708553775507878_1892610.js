"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Cursor = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/MouseCursor/CursorData");
}
const _CursorData = RequireModule.requireModule("@src/Editor/MouseCursor/CursorData");
if (false) {
    require("@src/Editor/MouseCursor/CursorModule");
}
const _CursorModule = RequireModule.requireModule("@src/Editor/MouseCursor/CursorModule");
if (false) {
    require("@src/Editor/MouseCursor/CursorUtils");
}
const _CursorUtils = RequireModule.requireModule("@src/Editor/MouseCursor/CursorUtils");
class Cursor {
    constructor() {
        this.priority = 0;
        this.rotation = 0;
        this.rotationOffset = 0;
        this.isSet = false;
        this.onAwake = () => {
            this.transform = this.script.getTransform();
            this.id = this.script.uniqueIdentifier;
            this.createCropTexture();
            this.setupTriggers();
        };
    }
    // In radians
    setRotation(angle) {
        this.rotation = angle * 180 / Math.PI;
        this.tryUpdateCursor();
    }
    setCursorType(cursorType) {
        this.cursorType = cursorType;
        this.tryUpdateCursor();
    }
    tryUpdateCursor() {
        if (this.isSet) {
            _CursorModule.module.setCursorTexture(this.prepareTexture());
        }
    }
    getTexture() {
        if (this.cursorType === _CursorData.module.CursorType.Custom) {
            return this.cursorTexture;
        }
        if (global.deviceInfoSystem.getOS() === OS.MacOS) {
            return this.macIconTextures[this.cursorType];
        }
        if (global.deviceInfoSystem.getOS() === OS.Windows) {
            return this.winIconTextures[this.cursorType];
        }
        throw new Error("Your OS isn't supported");
    }
    prepareTexture() {
        this.cropTextureProvider.inputTexture = this.getTexture();
        if (this.rotationType === _CursorData.module.RotationType.Custom) {
            this.cropTextureProvider.rotation = _CursorUtils.module.CursorUtils.degToRad(this.rotation);
        }
        else {
            this.cropTextureProvider.rotation = this.transform.getWorldRotation().toEulerAngles().z + _CursorUtils.module.CursorUtils.degToRad(this.rotationOffset);
        }
        return this.cropTexture;
    }
    setupTriggers() {
        const interactionComponent = this.script.getSceneObject().getComponent("InteractionComponent");
        const onStart = () => {
            if (_CursorModule.module.lastPriority < this.priority) {
                return;
            }
            this.isSet = true;
            _CursorModule.module.setCursorTexture(this.prepareTexture());
            _CursorModule.module.setInfo(this.id, this.cropTextureProvider.rotation, this.priority);
        };
        const onChange = () => {
            if (_CursorModule.module.lastPriority < this.priority) {
                return;
            }
            const texture = this.prepareTexture(); // need to do this before 'if' to have updated rotation
            if (this.id !== _CursorModule.module.lastCursorID || this.cropTextureProvider.rotation !== _CursorModule.module.lastRotation) {
                this.isSet = true;
                _CursorModule.module.setCursorTexture(texture);
                _CursorModule.module.setInfo(this.id, this.cropTextureProvider.rotation, this.priority);
            }
        };
        const onEnd = () => {
            if (this.id !== _CursorModule.module.lastCursorID) {
                return;
            }
            _CursorModule.module.resetCursorTexture();
            _CursorModule.module.setInfo("", 0, 100000);
            this.isSet = false;
        };
        if (!_CursorUtils.module.CursorUtils.isEditor()) {
            if (interactionComponent) {
                interactionComponent.onTouchStart.add(onStart);
                interactionComponent.onTouchMove.add(onChange);
                interactionComponent.onTouchEnd.add(onEnd);
            }
            else {
                this.script.createEvent("TouchStartEvent").bind(onStart);
                this.script.createEvent("TouchMoveEvent").bind(onChange);
                this.script.createEvent("TouchEndEvent").bind(onEnd);
            }
            return;
        }
        switch (this.triggerType) {
            case _CursorData.module.TriggerType.onTouch:
                if (interactionComponent) {
                    interactionComponent.onTouchStart.add(onStart);
                    interactionComponent.onTouchMove.add(onChange);
                    interactionComponent.onTouchEnd.add(onEnd);
                }
                else {
                    this.script.createEvent("TouchStartEvent").bind(onStart);
                    this.script.createEvent("TouchMoveEvent").bind(onChange);
                    this.script.createEvent("TouchEndEvent").bind(onEnd);
                }
                break;
            case _CursorData.module.TriggerType.onHover:
                if (interactionComponent) {
                    interactionComponent.onHoverStart.add(onStart);
                    interactionComponent.onTouchMove.add(onChange); // There are no hover move events when touch is active
                    interactionComponent.onHover.add(onChange);
                    interactionComponent.onHoverEnd.add(onEnd);
                }
                else {
                    this.script.createEvent("HoverStartEvent").bind(onStart);
                    this.script.createEvent("TouchMoveEvent").bind(onChange); // There are no hover move events when touch is active
                    this.script.createEvent("HoverEvent").bind(onChange);
                    this.script.createEvent("HoverEndEvent").bind(onEnd);
                }
                break;
            case _CursorData.module.TriggerType.onPan:
                if (interactionComponent) {
                    interactionComponent.onPanStart.add(onStart);
                    interactionComponent.onPanMove.add(onChange);
                    interactionComponent.onPanEnd.add(onEnd);
                }
                else {
                    this.script.createEvent("PanGestureStartEvent").bind(onStart);
                    this.script.createEvent("PanGestureMoveEvent").bind(onChange);
                    this.script.createEvent("PanGestureEndEvent").bind(onEnd);
                }
                break;
            case _CursorData.module.TriggerType.onPinch:
                if (interactionComponent) {
                    interactionComponent.onPinchStart.add(onStart);
                    interactionComponent.onPinchMove.add(onChange);
                    interactionComponent.onPinchEnd.add(onEnd);
                }
                else {
                    this.script.createEvent("PinchGestureStartEvent").bind(onStart);
                    this.script.createEvent("PinchGestureMoveEvent").bind(onChange);
                    this.script.createEvent("PinchGestureEndEvent").bind(onEnd);
                }
                break;
            default:
                throw new Error("Trigger type not implemented");
        }
    }
    createCropTexture() {
        this.cropTexture = global.assetSystem.createAsset("Asset.Texture");
        this.cropTexture.control = global.scene.createResourceProvider("Provider.RectCropTextureProvider");
        this.cropTextureProvider = this.cropTexture.control;
    }
}
exports.Cursor = Cursor;
