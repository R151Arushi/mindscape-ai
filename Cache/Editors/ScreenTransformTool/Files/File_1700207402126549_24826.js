"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Utils = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("../Shared/SharedContent");
}
const _SharedContent = RequireModule.requireModule("../Shared/SharedContent");
var Utils;
(function (Utils) {
    Utils.SYSTEM_LAYER = LayerSet.makeUnique();
    function isEditor() {
        return typeof Editor !== 'undefined';
    }
    Utils.isEditor = isEditor;
    function screenSpaceToWorldSpace(pos) {
        return _SharedContent.module.SharedContent.getInstance().orthoCamera.screenSpaceToWorldSpace(pos, 0);
    }
    Utils.screenSpaceToWorldSpace = screenSpaceToWorldSpace;
    function vec4ToRect(vec) {
        return Rect.create(vec.x, vec.y, vec.z, vec.w);
    }
    Utils.vec4ToRect = vec4ToRect;
    function sign(val) {
        if (val > 0) {
            return 1;
        }
        if (val < 0) {
            return -1;
        }
        return 0;
    }
    Utils.sign = sign;
    function performOnHierarchy(root, func) {
        const res = func(root);
        if (!res) {
            return;
        }
        root.children.forEach(child => performOnHierarchy(child, func));
    }
    Utils.performOnHierarchy = performOnHierarchy;
})(Utils = exports.Utils || (exports.Utils = {}));
