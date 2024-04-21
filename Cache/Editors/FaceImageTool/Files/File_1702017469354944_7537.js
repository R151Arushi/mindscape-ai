"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AddButton = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Main");
}
var _Main = RequireModule.requireModule("@src/Main");
if (false) {
    require("./Button");
}
var _Button = RequireModule.requireModule("./Button");
if (false) {
    require("../Shared/SharedContent");
}
var _SharedContent = RequireModule.requireModule("../Shared/SharedContent");
if (false) {
    require("@src/Editor/EffectEditor");
}
var _EffectEditor = RequireModule.requireModule("@src/Editor/EffectEditor");
var AddButton = /** @class */ (function () {
    function AddButton() {
    }
    AddButton.prototype.run = function () {
        this.setupButton();
    };
    AddButton.prototype.setupButton = function () {
        var _this = this;
        this.button = new _Button.module.Button(this.so, _SharedContent.module.SharedContent.getInstance().overlayCamera, this.hintObj, true, function () {
            _this.spawnNewFaceLiquify();
        });
    };
    AddButton.prototype.spawnNewFaceLiquify = function () {
        var selectedObject = this.effectEditor.instance.getSelectedObject();
        var parent = selectedObject.getParent().getParent();
        var newObject = Editor.root.project.scene.addSceneObject(parent);
        newObject.name = "Face Inset Binding";
        var head = newObject.addComponent("Head");
        head.attachmentPoint = Editor.Components.HeadAttachmentPointType.CandideCenter;
        var faceInsetObject = Editor.root.project.scene.addSceneObject(newObject);
        faceInsetObject.name = "Face Inset";
        var faceInset = faceInsetObject.addComponent("FaceInsetVisual");
    };
    return AddButton;
}());
exports.AddButton = AddButton;
