"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SelectionListener = void 0;
var SelectionListener = /** @class */ (function () {
    function SelectionListener(script) {
        var _this = this;
        this.script = script;
        this.selectedObject = null;
        this.prevSelectedObject = null;
        this.onSelectionUpdate = function () { };
        if (typeof Editor !== 'undefined') {
            this.updateEvent = this.script.createEvent("UpdateEvent");
            this.updateEvent.bind(function () {
                if (_this.checkForSelectionUpdate()) {
                    _this.onSelectionUpdate && _this.onSelectionUpdate();
                }
            });
        }
    }
    SelectionListener.prototype.getSelectedObject = function () {
        if (isNull(this.selectedObject)) {
            return null;
        }
        return this.selectedObject;
    };
    SelectionListener.prototype.setOnSelectionUpdate = function (cb) {
        this.onSelectionUpdate = cb;
    };
    SelectionListener.prototype.checkForSelectionUpdate = function () {
        if (!(typeof Editor !== 'undefined')) {
            return false;
        }
        var newSelectedObject = this.getSelection();
        if (isNull(newSelectedObject)) {
            this.selectedObject = this.prevSelectedObject;
            return false;
        }
        if (isNull(this.selectedObject)) {
            this.selectedObject = newSelectedObject;
            return true;
        }
        if (this.selectedObject.id.toString() !== newSelectedObject.id.toString()) {
            this.selectedObject = newSelectedObject;
            this.prevSelectedObject = this.selectedObject;
            return true;
        }
        return false;
    };
    SelectionListener.prototype.getSelection = function () {
        var currentSelection = Editor.root.project.selection;
        return currentSelection.sceneObjects.length == 1 ? currentSelection.sceneObjects[0] : null;
    };
    return SelectionListener;
}());
exports.SelectionListener = SelectionListener;
