//@input Component.Camera camera
//@input Component.ScreenTransform parentScreenT
//@input Component.ScreenTransform screenT
//@input Component.ScriptComponent effectEditor
//@input Asset.Texture dcT
//@input SceneObject[] manipulatePoints
//@input SceneObject[] rotationPoints

var curSizeY = 2;
var speed = 0.1;

var oppositeIdxs = [];
var adjacentIdxs = {};
var manipulatePointsT = [];
var rotationPointsT = [];
var faceRegionScale = {};
var touchIsBusy = false;
var curTouchId = -1;

var coef;
var initSize = new vec2(0.1, 0.05584);
var initScale = new vec3(1, 1, 1);
var prevTouchPos;

var anchors = script.screenT.anchors;

function init(){ 
    coef = script.dcT.getHeight() / script.dcT.getWidth();
    anchors.setSize(initSize);

//    print(" ==>>   " + script.effectEditor.instance.setFaceInsetPosition);
    script.effectEditor.instance.setManipulateController(script, updateScreenT, setFaceRegionType);
    
    oppositeIdxs = [1, 0, 3, 2, 5, 4, 7, 6];
    adjacentIdxs[0] = {"x" : null, "y" : 1};
    adjacentIdxs[1] = {"x" : null, "y" : 0};
    adjacentIdxs[2] = {"x" : 3, "y" : null};
    adjacentIdxs[3] = {"x" : 2, "y" : null};    
    adjacentIdxs[4] = {"x" : 6, "y" : 7};
    adjacentIdxs[5] = {"x" : 7, "y" : 6};
    adjacentIdxs[6] = {"x" : 4, "y" : 5};
    adjacentIdxs[7] = {"x" : 5, "y" : 4};
    
    faceRegionScale[FaceInsetRegion.LeftEye] = new vec2(0.54, 0.19);
    faceRegionScale[FaceInsetRegion.RightEye] = new vec2(0.54, 0.19);
    faceRegionScale[FaceInsetRegion.Mouth] = new vec2(0.66, 0.21);
    faceRegionScale[FaceInsetRegion.Nose] = new vec2(0.5, 0.5);
    faceRegionScale[FaceInsetRegion.Face] = new vec2(1.5, 1.2);
    
    script.manipulatePoints.forEach(function(obj, idx){
        var interactionComponent = createInteractionComponent(obj);
        setUpTouchEvents(interactionComponent, idx, onTMove);
        manipulatePointsT.push(obj.getComponent("Component.ScreenTransform"));
    })
    
    script.rotationPoints.forEach(function(obj, idx){
        var interactionComponent = createInteractionComponent(obj);
        setUpTouchEvents(interactionComponent, idx, onTMoveRotation);
        rotationPointsT.push(obj.getComponent("Component.ScreenTransform"));
    })
    
//    var newRot = quat.fromEulerAngles(0, 0, -45 * Math.PI / 180);
//    script.screenT.rotation = newRot;
}

function setFaceRegionType(newType){
    if (faceRegionScale[newType]){
        initSize = faceRegionScale[newType];
    }
}

function createInteractionComponent(obj){
    obj.createComponent("Component.InteractionComponent");        
    var interactionComponent = obj.getComponent("Component.InteractionComponent");
    interactionComponent.setCamera(script.camera);
    interactionComponent.isFilteredByDepth = true;
    interactionComponent.addMeshVisual(obj.getComponent("Component.Image"));
    interactionComponent.enabled = true;
    
    return interactionComponent;
}

function setUpTouchEvents(interactionComponent, idx, onTMove){
    interactionComponent.onTouchStart.add(function(eventData){
        if (touchIsBusy || script.effectEditor.instance.getLensRegionStatus()){
            return;
        }
        prevTouchPos = eventData.position;
        curTouchId = eventData.touchId;
    })
    
    interactionComponent.onTouchMove.add(function(eventData){
        coef = script.dcT.getHeight() / script.dcT.getWidth();
        if (eventData.touchId != curTouchId || script.effectEditor.instance.getLensRegionStatus()){
            return;
        }
        onTMove(eventData.position, idx);
        prevTouchPos = eventData.position;
    })
    
    interactionComponent.onTouchEnd.add(function(eventData){
        if (eventData.touchId != curTouchId){
            return;
        }
        curTouchId = -1;
        touchIsBusy = false;
    })
}

function onTMove(position, idx){
   
    var horizontalData = null;
    var verticalData = null;
    var newPos = null;
    
    var prevPivot = script.screenT.pivot;
    
    let prevPos1 = script.screenT.screenPointToParentPoint(script.screenT.localPointToScreenPoint(vec2.zero()));
    script.screenT.pivot = vec2.zero();
    let newPos1 = script.screenT.screenPointToParentPoint(script.screenT.localPointToScreenPoint(vec2.zero()));
    let newCenter1 = script.screenT.anchors.getCenter().add(prevPos1.sub(newPos1));
    script.screenT.anchors.setCenter(newCenter1);    
    
//    script.screenT.pivot = vec2.zero();
    
    if (adjacentIdxs[idx].x != null){
        horizontalData = getNewSizeData(idx, adjacentIdxs[idx].x, position);
    }
    if (adjacentIdxs[idx].y != null){
        verticalData = getNewSizeData(idx, adjacentIdxs[idx].y, position);
    }
    
    if (horizontalData && horizontalData.isValid && verticalData && verticalData.isValid){
        newPos = position;
    }
    else if (horizontalData && horizontalData.isValid){
        newPos = horizontalData.newPos;
    }
    else if (verticalData && verticalData.isValid){        
        newPos = verticalData.newPos;
    }
    else {
        return;
    }
    
    var oppositePos = script.screenT.localPointToScreenPoint(manipulatePointsT[oppositeIdxs[idx]].anchors.getCenter());  
    
    var newCenter = newPos.add(oppositePos).uniformScale(0.5);
    anchors.setCenter(script.screenT.screenPointToParentPoint(newCenter));
    script.onPositionChanged(newCenter);
    
    var prevSize = anchors.getSize();
    if (horizontalData && horizontalData.isValid){
        prevSize.x *= horizontalData.newDist / horizontalData.prevDist;
    }
    if (verticalData && verticalData.isValid){
        prevSize.y *= verticalData.newDist / verticalData.prevDist;
    }
    
    anchors.setSize(prevSize);
    
    initScale.x = prevSize.x / initSize.x;
    initScale.y = prevSize.y / initSize.y;

    let prevPos2 = script.screenT.screenPointToParentPoint(script.screenT.localPointToScreenPoint(vec2.zero()));
    script.screenT.pivot = prevPivot;
    let newPos2 = script.screenT.screenPointToParentPoint(script.screenT.localPointToScreenPoint(vec2.zero()));
    let newCenter2 = script.screenT.anchors.getCenter().add(prevPos2.sub(newPos2));
    script.screenT.anchors.setCenter(newCenter2);

    
//    script.screenT.pivot = prevPivot;
    script.onScaleChanged(initScale); 
}

function updateScreenT(newRot, newScale){
    if (touchIsBusy){
        return;
    }
    var prevPivot = script.screenT.pivot;
    script.screenT.pivot = vec2.zero();
    
    script.screenT.rotation = newRot;
    var newSize = new vec2(newScale.x * initSize.x, newScale.y * initSize.y);
    anchors.setSize(newSize);
    
    script.screenT.pivot = prevPivot;
}

function getNewSizeData(idx, oppositeIdx, newPosition){
    var pointPos = script.screenT.localPointToScreenPoint(manipulatePointsT[idx].anchors.getCenter());
    var oppositePointPos = script.screenT.localPointToScreenPoint(manipulatePointsT[oppositeIdx].anchors.getCenter())
    var newPos = new vec2(newPosition.x, newPosition.y);    
    
    pointPos.y *= coef;
    oppositePointPos.y *= coef;
    newPos.y *= coef;
    
    var forward = pointPos.sub(oppositePointPos);
    forward = forward.normalize();
    
    var right = new vec2(forward.y, -forward.x);
    
    var prevDist = pointPos.distance(oppositePointPos);
    
    var dir = newPos.sub(pointPos);
    var dist = newPos.distance(pointPos);
    dist = calculateDistanceToOppositeSide(forward, dir, dist);
    
    newPos = pointPos.add(forward.uniformScale(dist)); 
    
    var newDist = newPos.distance(oppositePointPos);
    var isValid = (newDist > 0.01) && (isRightSide(right, oppositePointPos, pointPos) == isRightSide(right, oppositePointPos, newPos));
    
    newPos.y /= coef;

    var sizeData = {"isValid" : isValid, "newPos" : newPos, "prevDist" : prevDist, "newDist" : newDist};
    
    return sizeData;
}

function onTMoveRotation(position, idx){
//    var pointPos = script.screenT.localPointToScreenPoint(rotationPointsT[idx].anchors.getCenter());
    var objCenter = anchors.getCenter();
    
    var pointPos = new vec2((prevTouchPos.x - 0.5) * 2, (0.5 - prevTouchPos.y) * 2);
    
//    pointPos.x = (pointPos.x - 0.5) * 2;
//    pointPos.y = (0.5 - pointPos.y) * 2;
    
    var dir = pointPos.sub(objCenter);
    dir = dir.normalize();

    var touchPos = new vec2((position.x - 0.5) * 2, (0.5 - position.y) * 2);
    var newDir = touchPos.sub(objCenter);
    newDir = newDir.normalize();
    
//    print(dir + " ->   " + newDir);
    var angle = getAngleBetweenVectors([dir.x, dir.y], [newDir.x, newDir.y]);
//    print(angle + "   =>    " + curAngle);
//    curAngle += angle;
    var curAngle = script.screenT.rotation.toEulerAngles().z + angle;
    var newRot = quat.fromEulerAngles(0, 0, curAngle);
    script.screenT.rotation = newRot;
    script.onRotationChanged(newRot, angle);
}

function calculateDistanceToOppositeSide(forward, dir, dist) {
    var angle = forward.angleTo(dir);
    var curDist = Math.cos(angle) * dist;
    
    return curDist;
}

function getAngleBetweenVectors(vector1, vector2) {
    var dotProduct = vector1[0] * vector2[0] + vector1[1] * vector2[1];
    var crossProduct = vector1[0] * vector2[1] - vector1[1] * vector2[0];
    var magnitude1 = Math.sqrt(vector1[0] * vector1[0] + vector1[1] * vector1[1]);
    var magnitude2 = Math.sqrt(vector2[0] * vector2[0] + vector2[1] * vector2[1]);

    var cosTheta = dotProduct / (magnitude1 * magnitude2);
    if (cosTheta > 1){
        return 0;
    }
    var radians = Math.acos(cosTheta);
    var sign = Math.sign(crossProduct);

    var degrees = sign * radians * (180 / Math.PI);
    if (degrees < 0){
        degrees += 360;
    }
    
//    print(" -->  " + degrees.toFixed(2));

    return sign * radians;
}

function isRightSide(right, pos, pt) {
	var x1, x2, x3, y1, y2, y3, D;

    var secondPoint = pos.uniformScale(right);
	x1 = pos.x
	y1 = pos.y
	x2 = secondPoint.x
	y2 = secondPoint.y
	x3 = pt.x
	y3 = pt.y

	D = (x3 - x1) * (y2 - y1) - (y3 - y1) * (x2 - x1)
	return D < 0
}

script.onPositionChanged = function() {}
script.onRotationChanged = function() {}
script.onScaleChanged = function() {}

init();