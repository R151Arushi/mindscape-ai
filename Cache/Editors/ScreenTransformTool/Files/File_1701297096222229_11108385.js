"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.InactiveFramePool = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/InactiveFrame");
}
const _InactiveFrame = RequireModule.requireModule("@src/Editor/InactiveFrame");
if (false) {
    require("@src/Editor/Utils");
}
const _Utils = RequireModule.requireModule("@src/Editor/Utils");
class InactiveFramePool {
    constructor(inactiveFrameRef, poolSize) {
        this.inactiveFrameRef = inactiveFrameRef;
        this.poolSize = poolSize;
        this.pool = [];
        this.defaultInteractionCamera = null;
        this.lastActiveFrame = null;
    }
    getNewInactiveFrame() {
        if (this.pool.length < this.poolSize) {
            this.resetPool();
        }
        const frame = this.pool.pop();
        this.spawnNewInactiveFrame();
        frame.instance.show();
        return frame;
    }
    setDefaultInteractionCamera(camera) {
        this.defaultInteractionCamera = camera;
    }
    resetPool() {
        this.pool = [];
        for (let i = 0; i < this.poolSize; i++) {
            this.spawnNewInactiveFrame();
        }
    }
    spawnNewInactiveFrame() {
        const newCopy = this.inactiveFrameRef.instance.copy();
        if (this.defaultInteractionCamera) {
            newCopy.instance.setInteractionCamera(this.defaultInteractionCamera);
        }
        newCopy.instance.setOnHover(() => {
            if (!isNull(this.lastActiveFrame) && !this.lastActiveFrame.isSame(newCopy)) {
                this.lastActiveFrame.instance.setInactive();
            }
            this.lastActiveFrame = newCopy;
        });
        newCopy.instance.setLayerSet(newCopy.instance.getLayerSet().union(_Utils.module.Utils.SYSTEM_LAYER));
        this.pool.push(newCopy);
    }
}
exports.InactiveFramePool = InactiveFramePool;
