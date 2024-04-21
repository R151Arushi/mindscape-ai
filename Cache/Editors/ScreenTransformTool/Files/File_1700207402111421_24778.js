"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ConstraintsListener = void 0;
class ConstraintsListener {
    constructor() {
        this.doOnChange = [];
        this.pinToLeft = false;
        this.pinToRight = false;
        this.pinToTop = false;
        this.pinToBottom = false;
        this.isAdvanced = false;
        this.scale = vec3.one();
        this.anchors = Rect.create(0, 0, 0, 0);
    }
    setFijiScreenTransform(screenTransform) {
        this.fijiScreenTransform = screenTransform;
        this.checkForChange();
    }
    checkForChange() {
        if (this.isChanged()) {
            this.callOnChange();
        }
    }
    addDoOnChange(cb) {
        this.doOnChange.push(cb);
    }
    callOnChange() {
        this.doOnChange.forEach((cb) => {
            cb && cb();
        });
    }
    isChanged() {
        if (isNull(this.fijiScreenTransform)) {
            return;
        }
        let changed = false;
        if (this.pinToLeft !== this.fijiScreenTransform.constraints.pinToLeft) {
            this.pinToLeft = !this.pinToLeft;
            changed = true;
        }
        if (this.pinToRight !== this.fijiScreenTransform.constraints.pinToRight) {
            this.pinToRight = !this.pinToRight;
            changed = true;
        }
        if (this.pinToTop !== this.fijiScreenTransform.constraints.pinToTop) {
            this.pinToTop = !this.pinToTop;
            changed = true;
        }
        if (this.pinToBottom !== this.fijiScreenTransform.constraints.pinToBottom) {
            this.pinToBottom = !this.pinToBottom;
            changed = true;
        }
        if (this.isAdvanced !== this.fijiScreenTransform.advanced) {
            this.isAdvanced = !this.isAdvanced;
            changed = true;
        }
        if (this.scale.distanceSquared(this.fijiScreenTransform.transform.scale) > 0) {
            this.scale = this.fijiScreenTransform.transform.scale;
            changed = true;
        }
        if (this.anchors.getCenter().distanceSquared(this.fijiScreenTransform.anchor.getCenter()) > 0 ||
            this.anchors.getSize().distanceSquared(this.fijiScreenTransform.anchor.getSize()) > 0) {
            this.anchors.setCenter(this.fijiScreenTransform.anchor.getCenter());
            this.anchors.setSize(this.fijiScreenTransform.anchor.getSize());
            changed = true;
        }
        return changed;
    }
}
exports.ConstraintsListener = ConstraintsListener;
