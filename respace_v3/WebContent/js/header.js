$(document).ready(function () {
	var current_page = document.documentURI;
	var current_page_input_hidden1 = document.getElementById("current_page1");
	current_page_input_hidden1.setAttribute("value",current_page);	// 현재 페이지값 넣기
	
	var current_page_input_hidden2 = document.getElementById("current_page2");
	current_page_input_hidden2.setAttribute("value",current_page);	// 현재 페이지값 넣기
	
	var body = document.getElementsByTagName("body");

	
	if(body[0].className == "index"){
		$(".head").css("background-color","#aaa");
	} else if(body[0].className == "space_search"){
		$(".head").css("background-color","#333333");
	} else{
		$(".head").css("background-color","#333333");
	}
	/*
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
	*/
});

/*
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
*/