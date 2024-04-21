"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SharedContent = void 0;
var SharedContent = /** @class */ (function () {
    function SharedContent() {
    }
    SharedContent.getInstance = function () {
        return this.instance;
    };
    SharedContent.prototype.run = function () {
        SharedContent.instance = this;
    };
    return SharedContent;
}());
exports.SharedContent = SharedContent;
