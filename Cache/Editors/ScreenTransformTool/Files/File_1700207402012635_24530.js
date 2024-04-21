"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SharedContent = void 0;
class SharedContent {
    static getInstance() {
        return this.instance;
    }
    onAwake() {
        SharedContent.instance = this;
    }
}
exports.SharedContent = SharedContent;
