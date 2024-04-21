//@input Asset.Texture deviceCameraTexture
//@input Component.ScreenTransform toolbarScreenT
//@input Component.ScreenTransform toolbarLeftSection
//@input Component.ScreenTransform toolbarRightSection
//@input Component.ScreenTransform toolbarMidSection
//@input Component.ScreenTransform bottomMidSection

var provider = script.deviceCameraTexture.control;
var toolbarAnchors = script.toolbarScreenT.anchors;
var pixelSize = 45;
var screenWidth = 800;

var toolbarLeftSectionRight;
var toolbarRightSectionLeft;
var toolbarTopSectionRight;
var bottomMidSectionRight;

var viewportUpdateEvent = script.createEvent("ViewportUpdateEvent");
viewportUpdateEvent.bind(function(eventData){
    pixelSize = 24 * eventData.viewportData.screenScale;
    screenWidth = 427 * eventData.viewportData.screenScale;
})

var updateEvent = script.createEvent("UpdateEvent");
updateEvent.bind(update);

init();

function init(){
    if (script.toolbarLeftSection){
        toolbarLeftSectionRight = script.toolbarLeftSection.anchors.right + 1;
    }
    
    if (script.toolbarRightSection){
        toolbarRightSectionLeft = 1 - script.toolbarRightSection.anchors.left;
    }
    
    if (script.toolbarMidSection){
        toolbarTopSectionRight = script.toolbarMidSection.anchors.right;
    }
    
    if (script.bottomMidSection){
        bottomMidSectionRight = script.bottomMidSection.anchors.right;
    }
}

function update() {

    toolbarAnchors.bottom = 1 - pixelSize * 2 / provider.getHeight();

    if (script.toolbarLeftSection){
        script.toolbarLeftSection.anchors.left = -1;
        script.toolbarLeftSection.anchors.right = -1 + toolbarLeftSectionRight * screenWidth / provider.getWidth();   
    }
        
    if (script.toolbarRightSection){
        script.toolbarRightSection.anchors.right = 1;
        script.toolbarRightSection.anchors.left = 1 - toolbarRightSectionLeft * screenWidth / provider.getWidth();
    }
    
    if (script.toolbarMidSection){
        script.toolbarMidSection.anchors.left = 0 - toolbarTopSectionRight * screenWidth / provider.getWidth();
        script.toolbarMidSection.anchors.right = 0 + toolbarTopSectionRight * screenWidth / provider.getWidth();
    }
    
    if (script.bottomMidSection){
        script.bottomMidSection.anchors.bottom = -1;
        script.bottomMidSection.anchors.top = -1 + pixelSize * 2 / provider.getHeight();
        script.bottomMidSection.anchors.left = 0 - bottomMidSectionRight * screenWidth / provider.getWidth();
        script.bottomMidSection.anchors.right = 0 + bottomMidSectionRight * screenWidth / provider.getWidth();
    }
}