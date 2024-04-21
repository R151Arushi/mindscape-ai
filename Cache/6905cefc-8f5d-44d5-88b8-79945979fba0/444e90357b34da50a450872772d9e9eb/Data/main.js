// @input Component.Text question_text
// @input Component.Text answer_text
// @input SceneObject question
// @input SceneObject hint
// @input SceneObject main
// @input SceneObject body
// @input SceneObject answer
// @input SceneObject magicBox

// @input Component.Camera camArm
// @input Component.Camera camPlane
// @input SceneObject armLeft
// @input SceneObject armRight
// @input SceneObject boxHandle

// @input SceneObject LeftThumb
// @input SceneObject LeftIndex
// @input SceneObject RightThumb
// @input SceneObject RightIndex


// @input Component.AudioComponent audioBust

// @input Component.ObjectTracking3D leftHandTracker
// @input Component.ObjectTracking3D rightHandTracker
// @input Component.ScreenTransform screen2d



// global.touchSystem.touchBlocking = true;


function requestGPT() {
    const request = { 
        "temperature": 1,
        "messages": [
            {"role": "user", "content": script.question_text.text}
        ]
    };
    
    global.chatGpt.completions(request, (errorStatus, response) => {
        if (!errorStatus && typeof response === 'object') {
            const mainAnswer = response.choices[0].message.content;
            script.answer_text.text = "Your Answer \n\n" + mainAnswer;
        } else {
            print(JSON.stringify(response));
        }
    })
}

script.createEvent("TapEvent").bind(tapFun);

// global.behaviorSystem.addCustomTriggerResponse(
//   "start",
//   start
// );


var isAsked = false;
var inputStarted = false;
var boxReady = false;

var onTapEvent = script.question_text.onEditingUpdated.add(function(tapEventArgs){
    if(!inputStarted) {
        inputStarted = true;
        script.hint.enabled = false;
    }
});

var onTapEvent = script.question_text.onEditingFinished.add(function(tapEventArgs){
    if(!isAsked) {
        isAsked = true;
        requestGPT();
        script.question.enabled = false;
                    // print("box_in");


        script.magicBox.getTransform().setWorldPosition(script.camPlane.screenSpaceToWorldSpace(new vec2(0.5,.5), 180))
        // script.magicBox.getTransform().setWorldRotation(script.camPlane.getTransform().getWorldRotation());
        script.magicBox.getTransform().setWorldRotation(quat.lookAt(script.magicBox.getTransform().getWorldPosition(), new vec3(0,1,0)));


        global.tweenManager.startTween(script.main, "box_in", (function () {
            global.tweenManager.startTween(script.main, "boxFirst_rot");
            boxReady = true;
            // script.body.enabled = true;
        })); 
    }
});


function tapFun() {
    // print(script.camPlane.screenSpaceToWorldSpace(new vec2(0,0), 40));


global.tweenManager.startTween(script.main, "box_in");


        script.magicBox.getTransform().setWorldPosition(script.camPlane.screenSpaceToWorldSpace(new vec2(0.5,.5), 180))
        // script.magicBox.getTransform().setWorldRotation(script.camPlane.getTransform().getWorldRotation());
        script.magicBox.getTransform().setWorldRotation(quat.lookAt(script.magicBox.getTransform().getWorldPosition(), new vec3(0,1,0)));

//     if(boxReady) {

//         boxReady = false;

//         var delayedEvent11 = script.createEvent("DelayedCallbackEvent");
//         delayedEvent11.bind(function(eventData)
//         {
//                 global.tweenManager.stopTween(script.main, "box_rot");

//         });
//         delayedEvent11.reset(2.8);

//         global.tweenManager.startTween(script.main, "box_rot");
//         global.tweenManager.startTween(script.main, "box_out", (function () {
//             script.answer.enabled = true;
//         })); 
//     }

//     // script.question.text = ""
//     // if(script.question.text != "Click on this text to change it to your question") requestGPT();
}




        




script.createEvent("UpdateEvent").bind(onUpdate);

var boxUpdateCount = 0;

var left_finger1 = 0;
var left_finger2 = 0;
var right_finger1 = 0;
var right_finger2 = 0;

var left_fingers_pinch = 0;
var right_fingers_pinch = 0;

var left_hand_dist = 0;
var right_hand_dist = 0;

var boxPos = 0;

var camToBox_dist = 0;

var boxRot_move1 = true;
var boxRot_move2 = false;



function onUpdate() {


    if(boxReady) {

        boxPos = script.boxHandle.getTransform().getWorldPosition();
        left_finger1 = script.LeftIndex.getTransform().getWorldPosition();
        left_finger2 = script.LeftThumb.getTransform().getWorldPosition();
        right_finger1 = script.RightIndex.getTransform().getWorldPosition();
        right_finger2 = script.RightThumb.getTransform().getWorldPosition();

        camToBox_dist = 80/script.camPlane.getTransform().getWorldPosition().distance(boxPos);
        if(boxUpdateCount < 8) {
            if(script.camArm.worldSpaceToScreenSpace(left_finger1).distance(script.camPlane.worldSpaceToScreenSpace(boxPos)) < camToBox_dist || script.camArm.worldSpaceToScreenSpace(right_finger1).distance(script.camPlane.worldSpaceToScreenSpace(boxPos)) < camToBox_dist) {
                if(left_finger1.distance(left_finger2) < 2 || right_finger1.distance(right_finger2) < 2) {
                    


                    if(boxRot_move1 && ((script.leftHandTracker.isTracking() && script.camArm.worldSpaceToScreenSpace(left_finger1).y > script.camPlane.worldSpaceToScreenSpace(boxPos).y) || (script.rightHandTracker.isTracking() && script.camArm.worldSpaceToScreenSpace(right_finger1).y > script.camPlane.worldSpaceToScreenSpace(boxPos).y))) {
                        // print("ok1")
                        boxRot_move1 = false;
                        boxRot_move2 = true;
                        global.tweenManager.startTween(script.main, "box_rot");
                        boxUpdateCount++;
                    }
                    else if (boxRot_move2 && ((script.leftHandTracker.isTracking() && script.camArm.worldSpaceToScreenSpace(left_finger1).y < script.camPlane.worldSpaceToScreenSpace(boxPos).y) || (script.rightHandTracker.isTracking() && script.camArm.worldSpaceToScreenSpace(right_finger1).y < script.camPlane.worldSpaceToScreenSpace(boxPos).y))) {
                        // print("ok2")
                        boxRot_move1 = true;
                        boxRot_move2 = false;
                        global.tweenManager.startTween(script.main, "box_rot");
                        boxUpdateCount++;
                    }

                }
            }

        } else {
            boxReady = false;
            script.audioBust.play(1);
            global.tweenManager.startTween(script.main, "box_out", (function () {
                script.answer.enabled = true;
                script.magicBox.enabled = false;
            })); 
        }



        // else if(boxRot_move2 && (script.camArm.worldSpaceToScreenSpace(left_finger1).distance(script.camPlane.worldSpaceToScreenSpace(boxPos)) > camToBox_dist && script.camArm.worldSpaceToScreenSpace(right_finger1).distance(script.camPlane.worldSpaceToScreenSpace(boxPos)) > camToBox_dist)) {
        //         boxRot_move1 = true;
        //         boxRot_move2 = false;
        //         print("ok2")
        // }


        // if(script.camArm.worldSpaceToScreenSpace(script.LeftIndex.getTransform().getWorldPosition()).distance(script.camPlane.worldSpaceToScreenSpace(script.boxHandle.getTransform().getWorldPosition())) < 0.2) {

        //     if(script.camArm.worldSpaceToScreenSpace(script.RightIndex.getTransform().getWorldPosition()).distance(script.camPlane.worldSpaceToScreenSpace(script.boxHandle.getTransform().getWorldPosition())) < 0.3) {

        //         boxUpdateCount++;
        //         var delayedEvent11 = script.createEvent("DelayedCallbackEvent");
        //         delayedEvent11.bind(function(eventData)
        //         {
        //                 global.tweenManager.stopTween(script.main, "box_rot");

        //         });
        //         delayedEvent11.reset(2.8);

        //         global.tweenManager.startTween(script.main, "box_rot");
        //         global.tweenManager.startTween(script.main, "box_out", (function () {
        //             script.answer.enabled = true;
        //         })); 
                
        //     }

        // }
    }


}