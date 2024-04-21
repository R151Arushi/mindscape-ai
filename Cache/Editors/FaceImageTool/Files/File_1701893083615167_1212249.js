"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ObjectsFinder = void 0;
var ObjectsFinder = /** @class */ (function () {
    function ObjectsFinder() {
    }
    ObjectsFinder.prototype.getFaceInsetObjs = function () {
        if (typeof Editor === 'undefined') {
            return [];
        }
        var objsList = [];
        var faceInsetIds = {};
        var headObjIds = {};
        var objs = {};
        var faceInsetComponents = Editor.root.project.scene.findComponents("Image");
        if (faceInsetComponents.length > 0) {
            faceInsetComponents.forEach(function (comp) {
                faceInsetIds[comp.sceneObject.id.toString()] = comp;
                var parent = comp.sceneObject.getParent();
                var parentId = parent.id.toString();
                var headComp = parent.getComponent("Head");
                if (headComp && !headObjIds[parentId]) {
                    headObjIds[parentId] = true;
                    objs[comp.sceneObject.id.toString()] = {
                        "sceneObject": comp.sceneObject,
                        "faceInsetComponent": comp,
                        "headComponent": headComp
                    };
                }
            });
            // let headComponents = Editor.root.project.scene.findComponents("Head");
            // headComponents.forEach((comp) => {
            //     let curId = comp.sceneObject.id.toString();
            //     if (faceInsetIds[curId]){
            //         objs[curId] = {"sceneObject" : comp.sceneObject, "liquifyComponent" : faceInsetIds[curId], "headComponent" : comp}
            //     }
            // })
        }
        return objs;
    };
    return ObjectsFinder;
}());
exports.ObjectsFinder = ObjectsFinder;
