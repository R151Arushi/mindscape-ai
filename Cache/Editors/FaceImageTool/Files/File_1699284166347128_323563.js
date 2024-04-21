"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Button = void 0;
var Button = /** @class */ (function () {
    function Button(so, cam, newHintObj, useMaterial, onTap) {
        this.hintObj = null;
        this.isHovered = false;
        this.so = so;
        this.child = this.createChild(so);
        this.cam = cam;
        this.onTapCallback = onTap;
        this.useMaterial = useMaterial;
        this.hintObj = newHintObj;
        this.mainMaterial = this.so.getComponent("Component.Image").mainMaterial;
        this.createInteractionComponentOnSceneObject();
        this.createScriptComponentWithEvents();
    }
    Button.prototype.createChild = function (root) {
        var newChild = global.scene.createSceneObject("");
        newChild.setParent(root);
        return newChild;
    };
    Button.prototype.createInteractionComponentOnSceneObject = function () {
        if (this.so.getComponents("Component.Image").length > 0) {
            this.image = this.so.getComponent("Component.Image");
        }
        this.interactionComponent = this.child.createComponent("Component.InteractionComponent");
        // this.interactionComponent.isFilteredByDepth = true;
        this.interactionComponent.setCamera(this.cam);
        this.interactionComponent.addMeshVisual(this.image);
    };
    Button.prototype.createScriptComponentWithEvents = function () {
        var _this = this;
        var _a;
        var skipTap = false;
        var startTouch = vec2.zero();
        this.interactionComponent.onTouchStart.add(function (eventData) {
            startTouch = eventData.position;
            if (_this.useMaterial) {
                _this.mainMaterial.mainPass.Active = !_this.mainMaterial.mainPass.Active;
            }
            skipTap = false;
        });
        this.interactionComponent.onTouchMove.add(function (eventData) {
            if (eventData.position.x !== startTouch.x || eventData.position.y !== startTouch.y) {
                skipTap = true;
            }
        });
        this.interactionComponent.onTouchEnd.add(function () {
            if (_this.useMaterial) {
                _this.mainMaterial.mainPass.Active = !_this.mainMaterial.mainPass.Active;
            }
            if (!skipTap) {
                _this.onTapCallback();
            }
        });
        //@ts-ignore
        (_a = this.interactionComponent.onHover) === null || _a === void 0 ? void 0 : _a.add(function () {
            _this.isHovered = true;
        });
        var script = this.child.createComponent("ScriptComponent");
        script.createEvent("LateUpdateEvent").bind(function () {
            if (_this.mainMaterial) {
                _this.mainMaterial.mainPass.Hover = _this.isHovered;
                if (_this.hintObj) {
                    _this.hintObj.enabled = _this.isHovered;
                }
            }
            _this.isHovered = false;
        });
    };
    return Button;
}());
exports.Button = Button;
