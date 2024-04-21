"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.resetCursorTexture = exports.setCursorTexture = exports.setInfo = exports.lastPriority = exports.lastRotation = exports.lastCursorID = void 0;
var RequireModule = require("RequireModule");
if (false) {
    require("@src/Editor/MouseCursor/CursorData");
}
const _CursorData = RequireModule.requireModule("@src/Editor/MouseCursor/CursorData");
exports.lastCursorID = "";
exports.lastRotation = 0;
exports.lastPriority = 100000;
function setInfo(id, rotation, priority) {
    exports.lastCursorID = id;
    exports.lastRotation = rotation;
    exports.lastPriority = priority;
}
exports.setInfo = setInfo;
function setCursorTexture(texture) {
    performRequest(_CursorData.module.RequestType.SetCursor, texture).catch((reason) => {
        print("Failed to set cursor texture: " + reason);
    });
}
exports.setCursorTexture = setCursorTexture;
function resetCursorTexture() {
    performRequest(_CursorData.module.RequestType.UnsetCursor).catch((reason) => {
        print("Failed to unset cursor texture" + reason);
    });
}
exports.resetCursorTexture = resetCursorTexture;
function performRequest(requestType, texture = null) {
    return __awaiter(this, void 0, void 0, function* () {
        const request = RemoteApiRequest.create();
        request.endpoint = requestType;
        if (requestType === _CursorData.module.RequestType.SetCursor) {
            if (!texture) {
                throw new Error("No Texture Provided For Cursor");
            }
            request.uriResources = [yield convertTexture(texture)];
        }
        _CursorData.module.CursorRemoteServiceModule.performApiRequest(request, (response) => {
            if (response.statusCode !== 200) {
                print("Cursor request failed: " + response.body);
            }
        });
    });
}
function convertTexture(texture) {
    return __awaiter(this, void 0, void 0, function* () {
        //@ts-ignore
        return _CursorData.module.CursorRemoteMediaModule.createImageResourceForTexture(texture, _CursorData.module.CursorTextureUploadOptions);
    });
}
