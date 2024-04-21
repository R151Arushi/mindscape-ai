"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.LineRenderer = void 0;
class LineRenderer {
    constructor() {
        this.zero = vec3.zero();
        this.DIMENTION = 100;
        this.CHANNELS = 4;
        this.lines = [];
        this.onAwake = () => {
            const startTexture = ProceduralTextureProvider.create(this.DIMENTION, this.DIMENTION, Colorspace.RGBAFloat);
            this.startPointTexProvider = startTexture.control;
            this.startPointTexData = new Float32Array(this.DIMENTION * this.DIMENTION * this.CHANNELS);
            this.startPoint.control = this.startPointTexProvider;
            const endTexture = ProceduralTextureProvider.create(this.DIMENTION, this.DIMENTION, Colorspace.RGBAFloat);
            this.endPointTexProvider = endTexture.control;
            this.endPointTexData = new Float32Array(this.DIMENTION * this.DIMENTION * this.CHANNELS);
            this.endPoint.control = this.endPointTexProvider;
            this.linesMat.mainPass.instanceCount = this.DIMENTION * this.DIMENTION;
        };
    }
    addLine(from, to) {
        this.lines.push([from, to]);
    }
    reset() {
        for (let i = 0; i < this.lines.length; i++) {
            this.addVectorAt(this.startPointTexData, i, this.zero);
            this.addVectorAt(this.endPointTexData, i, this.zero);
        }
        this.lines = [];
        this.update();
    }
    update() {
        this.lines.forEach((line, idx) => {
            this.addVectorAt(this.startPointTexData, idx, line[0]);
            this.addVectorAt(this.endPointTexData, idx, line[1]);
        });
        this.startPointTexProvider.setPixelsFloat32(0, 0, this.DIMENTION, this.DIMENTION, this.startPointTexData);
        this.endPointTexProvider.setPixelsFloat32(0, 0, this.DIMENTION, this.DIMENTION, this.endPointTexData);
    }
    addVectorAt(data, index, position) {
        data[4 * index] = position.x;
        data[4 * index + 1] = position.y;
        data[4 * index + 2] = position.z;
        data[4 * index + 3] = 0;
    }
}
exports.LineRenderer = LineRenderer;
