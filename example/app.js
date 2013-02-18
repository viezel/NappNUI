var NappNUI = require('dk.napp.nui');
Ti.API.info("module is => " + NappNUI);

NappNUI.navigationBar("Round.NUI.nss");
//without the .nss

var window = Ti.UI.createWindow({
	backgroundColor : 'white',
	title : "Test Window"
});

var navGroup = Ti.UI.iPhone.createNavigationGroup({
	window : window
});
var main = Ti.UI.createWindow();
main.add(navGroup);
main.open();

var container = Ti.UI.createView({
	layout : "vertical",
	nuiClass: "View"
});

var textField = Ti.UI.createTextField({
	hintText : "im a textfield",
	top : 20,
	color : '#336699'
});

var btn = Ti.UI.createButton({
	title : "im a button",
	top : 10,
	nuiClass: "Button",
	color : '#336699'
});

var slider = Ti.UI.createSlider({
    top: 10,
    min: 0,
    max: 100,
    nuiClass: "Slider",
    width: '200dp',
    value: 50
});

var basicSwitch = Ti.UI.createSwitch({
	top:10,
	//nuiClass: "Switch",
	value:true // mandatory property for iOS 
});

container.add(textField);
container.add(btn);
container.add(slider);
container.add(basicSwitch);

window.add(container);

var bookButton = Ti.UI.createButton({
	systemButton : Ti.UI.iPhone.SystemButton.BOOKMARKS,
	left : 5
});
window.setRightNavButton(bookButton);

