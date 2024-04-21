// @input Component.Text question
// @input Component.Text answer
// @input SceneObject question_obj
// @input SceneObject button

function requestGPT() {
    
    
    const request = { 
    "temperature": 1,
    "messages": [
        {"role": "user", "content": script.question.text}
    ]
};
    
    
    global.chatGpt.completions(request, (errorStatus, response) => {
        if (!errorStatus && typeof response === 'object') {
            const mainAnswer = response.choices[0].message.content;
            
            script.question_obj.enabled = false;
            script.button.enabled = false;
            script.answer.text = mainAnswer;
        } else {
            print(JSON.stringify(response));
        }
    })
}

script.createEvent("TapEvent").bind(start);

// global.behaviorSystem.addCustomTriggerResponse(
//   "start",
//   start
// );


// onEditingFinished



var onTapEvent = script.question.onEditingFinished.add(function(tapEventArgs){
    print("onFinished!"); 
});




function start() {
    if(script.question.text != "Click on this text to change it to your question") requestGPT();
}