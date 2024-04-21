


var wrapScript = function(spoof, original)
{
	spoof.createEvent = function(eventType) { return original.createEvent(eventType); };
spoof.removeEvent = function(event) { return original.removeEvent(event); };
Object.defineProperty(spoof, "api", { get: function() { return original.api;}, set: function(value) { original.api = value; }});
spoof.getSceneObject = function() { return original.getSceneObject(); };
spoof.getTransform = function() { return original.getTransform(); };
Object.defineProperty(spoof, "enabled", { get: function() { return original.enabled;}, set: function(value) { original.enabled = value; }});
spoof.destroy = function() { return original.destroy(); };
Object.defineProperty(spoof, "uniqueIdentifier", { get: function() { return original.uniqueIdentifier;}, set: function(value) { original.uniqueIdentifier = value; }});
spoof.getTypeName = function() { return original.getTypeName(); };
spoof.isOfType = function(type) { return original.isOfType(type); };
spoof.isSame = function(other) { return original.isSame(other); };

}

