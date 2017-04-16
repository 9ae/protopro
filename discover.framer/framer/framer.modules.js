require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"myModule":[function(require,module,exports){
exports.profileViewed = function(kinks, vouched) {
  return analytics.track("Profile Viewed", {
    kinks: kinks,
    vouched: vouched
  });
};

exports.screenLoaded = function() {
  return analytics.track("Screen Loaded");
};

exports.profileAction = function(name, action) {
  return analytics.track("Profile " + action, {
    name: name
  });
};


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL2FsaWNlL1dvcmtzcGFjZXMva2kvZGVzaWducy9wcm90bzMvZGlzY292ZXIuZnJhbWVyL21vZHVsZXMvbXlNb2R1bGUuY29mZmVlIiwibm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyJdLCJzb3VyY2VzQ29udGVudCI6WyIjIEFkZCB0aGUgZm9sbG93aW5nIGxpbmUgdG8geW91ciBwcm9qZWN0IGluIEZyYW1lciBTdHVkaW8uIFxuIyBteU1vZHVsZSA9IHJlcXVpcmUgXCJteU1vZHVsZVwiXG4jIFJlZmVyZW5jZSB0aGUgY29udGVudHMgYnkgbmFtZSwgbGlrZSBteU1vZHVsZS5teUZ1bmN0aW9uKCkgb3IgbXlNb2R1bGUubXlWYXJcblxuZXhwb3J0cy5wcm9maWxlVmlld2VkID0gKGtpbmtzLCB2b3VjaGVkKSAtPlxuXHRhbmFseXRpY3MudHJhY2soXCJQcm9maWxlIFZpZXdlZFwiLCB7a2lua3M6IGtpbmtzLCB2b3VjaGVkOiB2b3VjaGVkfSlcblxuZXhwb3J0cy5zY3JlZW5Mb2FkZWQgPSAtPlxuXHRhbmFseXRpY3MudHJhY2soXCJTY3JlZW4gTG9hZGVkXCIpXG5cbmV4cG9ydHMucHJvZmlsZUFjdGlvbiA9IChuYW1lLCBhY3Rpb24pIC0+XG5cdGFuYWx5dGljcy50cmFjayhcIlByb2ZpbGUgXCIrYWN0aW9uLCB7bmFtZTogbmFtZX0pIiwiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFDQUE7QURJQSxPQUFPLENBQUMsYUFBUixHQUF3QixTQUFDLEtBQUQsRUFBUSxPQUFSO1NBQ3ZCLFNBQVMsQ0FBQyxLQUFWLENBQWdCLGdCQUFoQixFQUFrQztJQUFDLEtBQUEsRUFBTyxLQUFSO0lBQWUsT0FBQSxFQUFTLE9BQXhCO0dBQWxDO0FBRHVCOztBQUd4QixPQUFPLENBQUMsWUFBUixHQUF1QixTQUFBO1NBQ3RCLFNBQVMsQ0FBQyxLQUFWLENBQWdCLGVBQWhCO0FBRHNCOztBQUd2QixPQUFPLENBQUMsYUFBUixHQUF3QixTQUFDLElBQUQsRUFBTyxNQUFQO1NBQ3ZCLFNBQVMsQ0FBQyxLQUFWLENBQWdCLFVBQUEsR0FBVyxNQUEzQixFQUFtQztJQUFDLElBQUEsRUFBTSxJQUFQO0dBQW5DO0FBRHVCIn0=
