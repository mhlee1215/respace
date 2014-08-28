$(document).ready(function () {
	var body = document.getElementsByTagName("body");
	
	if(body[0].className == "index"){

	} else if(body[0].className == "space_search"){
		$(".head").css("background-color","#333333");
	} else{
		$(".head").css("background-color","#333333");
	}
	
	if($(window).width() > 1170){
		$("#head-title").css({
			"display" : "table",
			"float" : "left",
			"position" : "relative",
			"left" : "0px"
		});
	} else {
		$("#head-title").css({
			"position" : "absolute",
			"left" : "10px"
		});
	}
});

$(function() {
	$(window).resize(function() {
		if ($(this).width() > 1170) {
			$("#head-title").css({
				"display" : "table",
				"float" : "left",
				"position" : "relative",
				"left" : "0px"
			});
		} else {
			$("#head-title").css({
				"position" : "absolute",
				"left" : "10px"
			});
		}
	});
});