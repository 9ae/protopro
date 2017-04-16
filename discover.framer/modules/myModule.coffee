# Add the following line to your project in Framer Studio. 
# myModule = require "myModule"
# Reference the contents by name, like myModule.myFunction() or myModule.myVar

exports.profileViewed = (kinks, vouched) ->
	analytics.track("Profile Viewed", {kinks: kinks, vouched: vouched})

exports.screenLoaded = ->
	analytics.track("Screen Loaded")

exports.profileAction = (name, action) ->
	analytics.track("Profile "+action, {name: name})