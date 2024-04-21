"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SceneUtils = void 0;
var SceneUtils;
(function (SceneUtils) {
    function findObjectInLensStudio(sceneObjectToFind) {
        if (!sceneObjectToFind) {
            // print("You get what you give");
            return null;
        }
        var pathToObject = [sceneObjectToFind];
        while (sceneObjectToFind.hasParent()) {
            sceneObjectToFind = sceneObjectToFind.getParent();
            pathToObject.push(sceneObjectToFind);
        }
        sceneObjectToFind = pathToObject.pop();
        var root;
        Editor.root.project.scene.sceneObjects.forEach(function (sceneObject) {
            var id = Editor.Engine.idToUniqueIdentifier(sceneObject.id);
            if (sceneObjectToFind.uniqueIdentifier === id) {
                root = sceneObject;
            }
        });
        if (!root) {
            // print("Couldn't find object in LS scene");
            return null;
        }
        var _loop_1 = function () {
            sceneObjectToFind = pathToObject.pop();
            var newRoot = null;
            root.children.forEach(function (sceneObject) {
                var id = Editor.Engine.idToUniqueIdentifier(sceneObject.id);
                if (sceneObjectToFind.uniqueIdentifier === id) {
                    newRoot = sceneObject;
                }
            });
            if (!newRoot) {
                return { value: null };
            }
            root = newRoot;
        };
        while (pathToObject.length) {
            var state_1 = _loop_1();
            if (typeof state_1 === "object")
                return state_1.value;
        }
        return root;
    }
    SceneUtils.findObjectInLensStudio = findObjectInLensStudio;
    function findObjectInLensCore(sceneObjectToFind) {
        if (!sceneObjectToFind) {
            // print("You get what you give");
            return null;
        }
        var pathToObject = [sceneObjectToFind];
        while (sceneObjectToFind.getParent()) {
            sceneObjectToFind = sceneObjectToFind.getParent();
            pathToObject.push(sceneObjectToFind);
        }
        sceneObjectToFind = pathToObject.pop();
        var rootObjectsCount = global.scene.getRootObjectsCount();
        var root;
        for (var i = 0; i < rootObjectsCount; i++) {
            var sceneObject = global.scene.getRootObject(i);
            var uuid = Editor.Engine.idFromUniqueIdentifier(sceneObject.uniqueIdentifier).toString();
            if (sceneObjectToFind.id.toString() === uuid) {
                root = sceneObject;
            }
        }
        if (!root) {
            // print("Couldn't find object in Lens scene");
            return null;
        }
        var _loop_2 = function () {
            sceneObjectToFind = pathToObject.pop();
            var newRoot = null;
            root.children.forEach(function (sceneObject) {
                var uuid = Editor.Engine.idFromUniqueIdentifier(sceneObject.uniqueIdentifier).toString();
                if (sceneObjectToFind.id.toString() === uuid) {
                    newRoot = sceneObject;
                }
            });
            if (!root) {
                return { value: null };
            }
            root = newRoot;
        };
        while (pathToObject.length) {
            var state_2 = _loop_2();
            if (typeof state_2 === "object")
                return state_2.value;
        }
        return root;
    }
    SceneUtils.findObjectInLensCore = findObjectInLensCore;
    function printHierarchyFromRoot(object) {
        while (object.hasParent()) {
            object = object.getParent();
        }
        dfsPrintHierarchy(object);
    }
    SceneUtils.printHierarchyFromRoot = printHierarchyFromRoot;
    function dfsPrintHierarchy(root, level) {
        if (level === void 0) { level = 0; }
        var str = "";
        for (var i = 0; i < level; i++) {
            str += "-";
        }
        // print(str + root.name + " <> " + root.uniqueIdentifier);
        root.children.forEach(function (child) {
            dfsPrintHierarchy(child, level + 1);
        });
    }
})(SceneUtils = exports.SceneUtils || (exports.SceneUtils = {}));
