<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>안녕 친구들</title>

<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
	
<script type="text/javascript">

function go(url){
	//window.location.href=url;
	$.mobile.changePage(url, { reloadPage: true, transition: "none"} );
}

$(document).ready(function(){

	$('#bodyTable').attr('width', $(window).width());
	$('#bodyTable').attr('height', $(window).height());
	
	//(function poll() {
	//   setTimeout(function() {
	       /* $.ajax({ 
	    	    type:"POST",
	    		url: "social/facebook/test.do", 
	    		success: function(data) {
	    	   	//alert(data.name+' '+data.round);
	            //sales.setValue(data.value);
	       		}, 
	       		dataType: "json"
	       		//,complete: poll 
	       	}); */
	 //   }, 1000);
	//})();
	/* function poll(){
		alert('hi');
	} */
	//alert(poll);
	
	
});

var decision = 'nothing';
function change_decision(type){
	//decision = type;
	$.ajax({ 
	    type:"POST",
		url: "game.changeDecision.do?type="+type, 
		success: function(data) {
			if(data == 'success'){
				decision = type;
    			mark_decision();
			}else{
				alert('change error.');
			}
			
	   	//alert(data.name+' '+data.round);
	   	
        //sales.setValue(data.value);
   		}//, 
   		//dataType: "json"
   		//,complete: poll 
   	});
}
function mark_decision(){
	type = decision;
	if(type == 'scissor'){
		decisino = type;
		$('#mark_scissor').attr('src', 'images/scissor_on.png');
		$('#mark_rock').attr('src', 'images/rock_off.png');
		$('#mark_paper').attr('src', 'images/paper_off.png');
	}else if(type == 'rock'){
		$('#mark_scissor').attr('src', 'images/scissor_off.png');
		$('#mark_rock').attr('src', 'images/rock_on.png');
		$('#mark_paper').attr('src', 'images/paper_off.png');
	}else if(type == 'paper'){
		$('#mark_scissor').attr('src', 'images/scissor_off.png');
		$('#mark_rock').attr('src', 'images/rock_off.png');
		$('#mark_paper').attr('src', 'images/paper_on.png');
	}
}
</script>
	
</head>
<body>
	<!-- 720 x 1280 -->
	<table id="bodyTable" border="0" width="640" height="960"
		style="background-color: #232222" cellpadding="50">
		<tr height="10%">
			<td><img src="images/mobile_title.png" width="100%" alt=""></td>
		</tr>
		<tr>
			<td align="center">
				<table>
					<tr>
						<td colspan="3" rowspan="2" width="35%" height="188"></td>
						<td colspan="3" width="30%" align="center">
							<a href="#" onclick="change_decision('scissor')"><img id="mark_scissor" src="images/scissor_off.png"  alt="scissor"/></a>
						</td>
						<td colspan="3" rowspan="2" width="35%" height="188"></td>
					</tr>
					<tr>
						<td colspan="3" width="161"
							height="27"></td>
					</tr>
					</table>
					<table>
					<tr>
						
						<td colspan="3" width="45%" align="right" >
							<a href="#" onclick="change_decision('rock')"><img id="mark_rock" src="images/rock_off.png" alt=""></a>
						</td>
						<td rowspan="2" width="10%"
							></td>
						<td colspan="3" width="45%" align="left">
							<a href="#" onclick="change_decision('paper')"><img id="mark_paper" src="images/paper_off.png" alt=""></a>
						</td>
						
					</tr>
				</table>
			</td>
		</tr>
		<tr height="10%">
			<td align="center"><img src="images/mobile_foot.png" width="80%" alt=""></td>
		</tr>

	</table>


</body>
</html>