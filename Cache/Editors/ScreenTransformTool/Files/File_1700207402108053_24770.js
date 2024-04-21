"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.EffectEditor = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/SelectionListener");
}
const _SelectionListener = RequireModule.requireModule("@src/Editor/SelectionListener");
if (false) {
    require("@src/Editor/SceneViewer");
}
const _SceneViewer = RequireModule.requireModule("@src/Editor/SceneViewer");
if (false) {
    require("@src/Editor/SCTree");
}
const _SCTree = RequireModule.requireModule("@src/Editor/SCTree");
if (false) {
    require("@lib/Utilities/LensRegion/LensRegion");
}
const _LensRegion = RequireModule.requireModule("@lib/Utilities/LensRegion/LensRegion");
if (false) {
    require("@lib/Utilities/LensRegion/PinchControl");
}
const _PinchControl = RequireModule.requireModule("@lib/Utilities/LensRegion/PinchControl");
if (false) {
    require("@lib/Utilities/LensRegion/PanControl");
}
const _PanControl = RequireModule.requireModule("@lib/Utilities/LensRegion/PanControl");
if (false) {
    require("@src/Editor/Utils");
}
const _Utils = RequireModule.requireModule("@src/Editor/Utils");
if (false) {
    require("@lib/Utilities/LensRegion/AspectControl");
}
const _AspectControl = RequireModule.requireModule("@lib/Utilities/LensRegion/AspectControl");
if (false) {
    require("@src/Editor/SceneUtils");
}
const _SceneUtils = RequireModule.requireModule("@src/Editor/SceneUtils");
if (false) {
    require("@src/Editor/Gizmo/Gizmo");
}
const _Gizmo = RequireModule.requireModule("@src/Editor/Gizmo/Gizmo");
if (false) {
    require("@src/Editor/CallScheduler");
}
const _CallScheduler = RequireModule.requireModule("@src/Editor/CallScheduler");
if (false) {
    require("@src/Editor/SelectionPicker");
}
const _SelectionPicker = RequireModule.requireModule("@src/Editor/SelectionPicker");
if (false) {
    require("@src/Editor/GizmoPool");
}
const _GizmoPool = RequireModule.requireModule("@src/Editor/GizmoPool");
if (false) {
    require("@src/Editor/AlignerHelper");
}
const _AlignerHelper = RequireModule.requireModule("@src/Editor/AlignerHelper");
if (false) {
    require("@src/Editor/LineRenderer");
}
const _LineRenderer = RequireModule.requireModule("@src/Editor/LineRenderer");
if (false) {
    require("@src/Editor/OffsetHighlight");
}
const _OffsetHighlight = RequireModule.requireModule("@src/Editor/OffsetHighlight");
if (false) {
    require("@src/Editor/Gizmo/AlignmentTypes");
}
const _AlignmentTypes = RequireModule.requireModule("@src/Editor/Gizmo/AlignmentTypes");
if (false) {
    require("@src/Editor/ConstraintsListener");
}
const _ConstraintsListener = RequireModule.requireModule("@src/Editor/ConstraintsListener");
if (false) {
    require("@src/Editor/RulersAndGuides/GuideBars");
}
const _GuideBars = RequireModule.requireModule("@src/Editor/RulersAndGuides/GuideBars");
if (false) {
    require("@src/Editor/Config");
}
const _Config = RequireModule.requireModule("@src/Editor/Config");
class EffectEditor {
    constructor() {
        this.toolbarObjects = [];
        this.onAwake = () => {
            this.callScheduler = new _CallScheduler.module.CallScheduler(this.script, "LateUpdateEvent");
            this.toolbar.forEach(sc => this.toolbarObjects.push(sc.getSceneObject()));
            this.setupSelectionListener();
            this.setupSCTree();
            this.bindLensRegionToSceneViewer();
            this.setupGizmo();
            this.setupSelectionPicker();
            this.aligner = new _AlignerHelper.module.AlignerHelper(this.tree, this.sceneViewer.instance.getCamera(), this.pinLineRenderer, this.guides);
            this.offsetHighlight = new _OffsetHighlight.module.OffsetHighlight(this.offsetLineRenderer, this.sceneViewer.instance.getCamera());
            this.constraintsListener = new _ConstraintsListener.module.ConstraintsListener();
            if (!_Utils.module.Utils.isEditor()) {
                this.update();
            }
            this.constraintsListener.addDoOnChange(() => {
                this.offsetHighlight.drawOffsets(this.gizmo.instance.getEditableScreenTransform(), this.tree.getSelectedFijiScreenTransform());
                _Config.module.Config.isAdvancedMode.value = this.constraintsListener.isAdvanced;
                if (!isNull(this.gizmo)) {
                    this.gizmo.instance.setVisualScale(this.constraintsListener.scale);
                    this.gizmo.instance.updateAnchorsFrame();
                }
            });
            this.script.createEvent("UpdateEvent").bind(() => {
                this.sceneViewer.instance.resetZPosition();
                if (!this.tree.reassureValidPath()) {
                    if (!isNull(this.gizmo)) {
                        this.gizmo.getSceneObject().destroy();
                        this.gizmo = null;
                    }
                    this.update();
                    return;
                }
                this.constraintsListener.checkForChange();
                if (!isNull(this.gizmo)) {
                    this.gizmo.instance.updatePivot();
                    this.gizmo.instance.setLayer(this.sceneViewer.instance.getLayer());
                }
            });
        };
    }
    setupSelectionListener() {
        this.selectionListener = new _SelectionListener.module.SelectionListener(this.script);
        this.selectionListener.setOnSelectionUpdate(() => {
            this.update();
        });
    }
    setupSelectionPicker() {
        this.selectionPicker = new _SelectionPicker.module.SelectionPicker(this.script, this.tree, this.sceneViewer.instance.getCamera(), this.selectionListener, this.toolbar);
    }
    setupGizmo() {
        this.gizmoPool = new _GizmoPool.module.GizmoPool(this.gizmoRef, 2);
        this.lensRegion.instance.getPinchControl().addOnUpdateCallback(() => {
            this.updateGizmoVisualZoom();
        });
        _Config.module.Config.isAdvancedMode.addCallback((value) => {
            if (!isNull(this.gizmo)) {
                this.gizmo.instance.setAdvancedMode(value);
            }
        });
    }
    respawnGizmo() {
        this.gizmo = this.gizmoPool.getNewGizmo();
        this.gizmo.instance.addAlignmentFunction(this.aligner.align);
        this.gizmo.instance.show();
        this.gizmo.instance.addOnUpdateCallback((data) => {
            this.offsetHighlight.drawOffsets(data.screenTransform, data.fijiScreenTransform);
            // this.callScheduler.scheduleCall(() => {
            this.tree.syncEditable();
            // })
        });
        this.gizmo.instance.setAdvancedMode(_Config.module.Config.isAdvancedMode.value);
        this.updateGizmoVisualZoom();
    }
    updateGizmoVisualZoom() {
        if (!isNull(this.gizmo)) {
            this.gizmo.instance.setVisualZoom(this.sceneViewer.instance.getSize() / 20);
        }
    }
    update() {
        let selectedObject = _SceneUtils.module.SceneUtils.findObjectInLensCore(this.selectionListener.getSelectedObject());
        if (_Utils.module.Utils.isEditor()) {
            this.tree.selectObject(selectedObject);
        }
        else {
            this.tree.selectObject(this.testObject);
            selectedObject = this.testObject;
        }
        if (!selectedObject || !this.tree.isValidHierarchy || (!isNull(this.gizmo) && !this.gizmo.instance.isValid())) {
            this.toolbarObjects.forEach(obj => obj.enabled = false);
            this.clearView();
            return;
        }
        this.toolbarObjects.forEach(obj => obj.enabled = true);
        if (isNull(this.gizmo)) {
            this.respawnGizmo();
        }
        this.gizmo.instance.show();
        const camera = this.tree.getRoot().getComponent("Camera");
        const canvas = this.tree.getRoot().getComponent("Canvas");
        if (camera) {
            this.setAspectForRootCamera(camera);
            this.lensRegion.instance.getAspectControl().setAspect(camera.aspect);
            this.gizmo.instance.setEditable(selectedObject);
            this.sceneViewer.instance.init(camera);
        }
        else if (canvas) {
            const size = canvas.getSize();
            this.lensRegion.instance.getAspectControl().setAspect(size.x / size.y);
            this.setAspectForRootCanvas(canvas);
            this.gizmo.instance.setEditable(selectedObject);
            this.sceneViewer.instance.initFromCanvas(canvas);
        }
        else {
            return;
        }
        this.gizmo.instance.setInteractionCamera(this.sceneViewer.instance.getCamera());
        this.gizmo.instance.setLayer(this.sceneViewer.instance.getLayer());
        this.gizmo.instance.setFijiScreenTransform(this.tree.getSelectedFijiScreenTransform());
        this.updateSceneViewerParams();
        this.updateGizmoVisualZoom();
        this.selectionPicker.setCamera(this.sceneViewer.instance.getCamera());
        this.selectionPicker.setGizmo(this.gizmo);
        this.selectionPicker.reset();
        this.constraintsListener.setFijiScreenTransform(this.tree.getSelectedFijiScreenTransform());
        this.callScheduler.scheduleCall(() => {
            this.gizmo.instance.forceUpdate();
        });
        this.aligner.reset();
    }
    clearView() {
        if (!isNull(this.gizmo)) {
            this.gizmo.instance.hide();
        }
        this.offsetHighlight.reset();
        this.sceneViewer.instance.clearView();
    }
    setupSCTree() {
        this.tree = new _SCTree.module.SCTree();
    }
    updateSceneViewerParams() {
        if (!this.sceneViewer.instance.isInitialized()) {
            return;
        }
        const aspectControl = this.lensRegion.instance.getAspectControl();
        const pinchControl = this.lensRegion.instance.getPinchControl();
        const panControl = this.lensRegion.instance.getPanControl();
        const delta = panControl.getWorldDelta();
        this.sceneViewer.instance.setDelta(delta.uniformScale(this.sceneViewer.instance.getCamera().size / 20));
        this.sceneViewer.instance.setScale(pinchControl.getScale() * aspectControl.getShrinkScale());
        if (_Utils.module.Utils.isEditor()) {
            panControl.forceUpdate();
        }
    }
    bindLensRegionToSceneViewer() {
        this.lensRegion.instance.addOnLensRegionUpdate(() => {
            this.updateSceneViewerParams();
        });
        if (_Utils.module.Utils.isEditor()) {
            this.lensRegion.instance.getAspectControl().setLensStudioPreviewResolution(true);
        }
    }
    setAspectForRootCamera(camera) {
        camera.devicePropertyUsage = Camera.DeviceProperty.None;
        camera.aspect = this.lensRegion.instance.getAspectControl().getAspect();
    }
    setAspectForRootCanvas(canvas) {
        const size = canvas.getSize();
        size.x = this.lensRegion.instance.getAspectControl().getAspect() * size.x;
        // canvas.setSize(size);
    }
}
exports.EffectEditor = EffectEditor;
