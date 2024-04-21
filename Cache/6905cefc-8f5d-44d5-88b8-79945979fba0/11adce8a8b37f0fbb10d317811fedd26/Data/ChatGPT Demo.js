// @input Component.Text question_text
// @input Component.Text answer_text
// @input SceneObject question
// @input SceneObject hint
// @input SceneObject main
// @input SceneObject body
// @input SceneObject answer

// @input Component.Camera camArm
// @input SceneObject armLeft

global.touchSystem.touchBlocking = true;


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
        global.tweenManager.startTween(script.main, "box_in", (function () {
                    boxReady = true;
                    // script.body.enabled = true;
                })); 
    }
});


function tapFun() {
    if(boxReady) {

        boxReady = false;

        var delayedEvent11 = script.createEvent("DelayedCallbackEvent");
        delayedEvent11.bind(function(eventData)
        {
                global.tweenManager.stopTween(script.main, "box_rot");

        });
        delayedEvent11.reset(2.8);

        global.tweenManager.startTween(script.main, "box_rot");
        global.tweenManager.startTween(script.main, "box_out", (function () {
            script.answer.enabled = true;
        })); 
    }

    // script.question.text = ""
    // if(script.question.text != "Click on this text to change it to your question") requestGPT();
}





script.createEvent("UpdateEvent").bind(onUpdate);

function onUpdate() {

    print(script.camArm.worldSpaceToScreenSpace().x);
}