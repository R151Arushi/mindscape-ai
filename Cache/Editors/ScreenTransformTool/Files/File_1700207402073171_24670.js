"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SelectionListener = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/Utils");
}
const _Utils = RequireModule.requireModule("@src/Editor/Utils");
class SelectionListener {
    constructor(script) {
        this.script = script;
        this.selectedObject = null;
        this.onSelectionUpdate = () => { };
        if (_Utils.module.Utils.isEditor()) {
            this.updateEvent = this.script.createEvent("UpdateEvent");
            this.updateEvent.bind(() => {
                if (this.checkForSelectionUpdate()) {
                    this.onSelectionUpdate && this.onSelectionUpdate();
                }
            });
        }
    }
    getSelectedObject() {
        if (isNull(this.selectedObject) || !this.selectedObject.getComponent("ScreenTransform")) {
            return null;
        }
        return this.selectedObject;
    }
    setOnSelectionUpdate(cb) {
        this.onSelectionUpdate = cb;
    }
    forceUpdate() {
        if (this.checkForSelectionUpdate()) {
            this.onSelectionUpdate && this.onSelectionUpdate();
        }
    }
    forceCallSelectionUpdate() {
        this.onSelectionUpdate && this.onSelectionUpdate();
    }
    checkForSelectionUpdate() {
        if (!_Utils.module.Utils.isEditor()) {
            return false;
        }
        const newSelectedObject = this.getSelection();
        if (isNull(this.selectedObject) || isNull(newSelectedObject)) {
            this.selectedObject = newSelectedObject;
            return true;
        }
        if (this.selectedObject.id.toString() !== newSelectedObject.id.toString()) {
            this.selectedObject = newSelectedObject;
            return true;
        }
        return false;
    }
    getSelection() {
        const currentSelection = Editor.root.project.selection;
        return currentSelection.sceneObjects.length ? currentSelection.sceneObjects[0] : null;
    }
}
exports.SelectionListener = SelectionListener;
