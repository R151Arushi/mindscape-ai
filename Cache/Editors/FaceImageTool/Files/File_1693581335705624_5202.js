"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.RenderLayerUtils = void 0;
var RenderLayerUtils;
(function (RenderLayerUtils) {
    var layerToUnique = {};
    function parseLayersString(str) {
        return str.split(",").map(function (item) { return +item; });
    }
    function getUniqueLayerSet(layerSet) {
        var currentUniqueLayerSet = null;
        var layerNumbers = parseLayersString(layerSet.toString());
        layerNumbers.forEach(function (num) {
            if (!layerToUnique[num]) {
                layerToUnique[num] = LayerSet.makeUnique();
            }
            if (!currentUniqueLayerSet) {
                currentUniqueLayerSet = layerToUnique[num];
            }
            currentUniqueLayerSet = currentUniqueLayerSet.union(layerToUnique[num]);
        });
        return currentUniqueLayerSet;
    }
    function handleCameraComponent(object) {
        var cameras = object.getComponents("Component.Camera");
        if (cameras) {
            cameras.forEach(function (camera) {
                camera.renderLayer = getUniqueLayerSet(camera.renderLayer);
            });
        }
    }
    function handleLightComponent(object) {
        var lights = object.getComponents("Component.LightSource");
        if (lights) {
            lights.forEach(function (light) {
                light.renderLayer = getUniqueLayerSet(light.renderLayer);
            });
        }
    }
    function setUniqueLayersForHierarchy(root) {
        root.layer = getUniqueLayerSet(root.layer);
        handleCameraComponent(root);
        handleLightComponent(root);
        var childrenCount = root.getChildrenCount();
        for (var i = 0; i < childrenCount; i++) {
            setUniqueLayersForHierarchy(root.getChild(i));
        }
    }
    RenderLayerUtils.setUniqueLayersForHierarchy = setUniqueLayersForHierarchy;
})(RenderLayerUtils = exports.RenderLayerUtils || (exports.RenderLayerUtils = {}));
