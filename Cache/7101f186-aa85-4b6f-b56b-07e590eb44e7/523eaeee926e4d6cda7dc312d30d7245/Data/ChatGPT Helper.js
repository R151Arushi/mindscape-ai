//@ui {"widget":"label", "label":"This custom component allows you to call ChatGPT Completions API"}
//@ui {"widget":"label", "label":"through the Remote Service Module."}
//@ui {"widget":"label", "label":""}
//@ui {"widget":"label", "label":"<b>You can call:</b>"}
//@ui {"widget":"label", "label":"global.chatGpt.completions(request, (successStatus, response) => {print(response)})"}
//@ui {"widget":"label", "label":""}
//@ui {"widget":"label", "label":"<b>An example `request`:</b>"}
//@ui {"widget":"label", "label": "{'messages': [{'role': 'user', 'content': 'my question'}]}"}

/* // NOTE: This file contains code for accessing an external API encapsulated as a JS module. You should not modify this file.
 * // Instead, you should modify the "ChatGPT API" script and access the functions through the imported class wrapper.
*/
// @input Asset.RemoteServiceModule remote

/*
 * @param {RemoteApiResponse} response A raw API response from an ChatGPT API
 * @param {function} cb A callback to call with error and result data once the response has been parsed and error checked
 *
*/

function handleAPIResponse(response, cb) {
    if (response.statusCode !== 1) {
        var errorMessage = getErrorMessage(response);
        print(errorMessage);
        cb(true, errorMessage);
    } else {
        try {
            var parsedBody = JSON.parse(response.body);
        } catch (e) {
            var errorMessage = "ERROR: Failed to parse response";
            print(errorMessage);
            if (cb) {
                cb(true, errorMessage);
            }
            return;
        }
        if (cb) {
            cb(false, parsedBody);
        }
    }
}

function getErrorMessage(unparsedResponse) {
    var bugText = " - Please report this as a bug.";
    var errorMessage = "API Call Error - " + getErrorCodeMessage() + ": " + unparsedResponse.body;
    return errorMessage;

    // https://docs.snap.com/api/lens-studio/Classes/ScriptObjects/#RemoteApiResponse--statusCode
    function getErrorCodeMessage() {
        switch(unparsedResponse.statusCode) {
            case 0: return "Unknown Status Code"+bugText;
            case 1: return "Success";
            case 2: return "Redirected";
            case 3: return "Bad Request";
            case 4: return "Access Denied";
            case 5: return "Api Call Not Found";
            case 6: return "Timeout";
            case 7: return "Request Too Large";
            case 8: return "Server Processing Error";
            case 9: return "Request cancelled by caller";
            case 10: return "Internal: Framework Error";
        }
    }
}

function ApiModule(remoteServiceModule) {
    this.remoteServiceModule = remoteServiceModule;
}

function setParameter(paramKey, paramValue, parameters, isOptional) {
    if (paramValue != null) {
        parameters[paramKey] = paramValue;
    } else if (paramValue == null && !isOptional) {
        throw (paramKey + " is a required parameter. Please input a valid value.");
    }
}

ApiModule.prototype.moderations = function(cb) {
    var req = global.RemoteApiRequest.create();
    req.endpoint = "moderations";
    this.remoteServiceModule.performApiRequest(req, function(response) {
        if(cb) {
            handleAPIResponse(response, cb);
        }
    });
};
ApiModule.prototype.completions = function(request, cb) {
    var req = generateCompletionRequest(request); // Modfied
    req.endpoint = "completions";
    this.remoteServiceModule.performApiRequest(req, function(response) {
        if(cb) {
            handleAPIResponse(response, cb);
        }
    });
};

/*************************************************************************
 * Custom code below
 *************************************************************************/

const baseBodyParams = {
    "model": "gpt-3-5-turbo-snap-0613",
    "temperature": 0,
    "max_tokens": 1500,
    "prompt": {"role": "system", "content": "You are a helpful assistant. You must respond ONLY with content age-appropriate for users younger than 18 and keep it PG-13. You must NOT respond if the user's message contains content that is illegal, illicit or inappropriate or if the user's message is related to protected classes. You must NOT respond when a user inputs sensitive topics such as drugs, alcohol, sexual situations, illegal activities and other adult behavior. Never generate content on sensitive topics such as: politics, location requests, privacy questions, religions, religious figures, ethnic groups, genders, nationalities, sexual orientations. Do not respond if the user mentions committing crimes or dangerous acts."},
};

function setIfMissing(obj, key, value) {
    if (!obj.hasOwnProperty(key)) {
        obj[key] = value;
    }
    return obj[key];
}

function generateCompletionRequest(params) {
    setIfMissing(params, "model", baseBodyParams.model);
    setIfMissing(params, "temperature", baseBodyParams.temperature);
    setIfMissing(params, "max_tokens", baseBodyParams.max_tokens);

    if (params.messages) {
        params.messages.unshift(baseBodyParams.prompt)
    } else {
        params.messages = [baseBodyParams.prompt]
    }

    var req = RemoteApiRequest.create();
    req.endpoint = "completions";
    req.body = JSON.stringify(params);

    return req;
}

global.chatGpt = new ApiModule(script.remote);
script.remote = null;
script.api.remote = null;
