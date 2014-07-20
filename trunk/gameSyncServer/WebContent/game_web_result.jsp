<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
	
<script type="text/javascript">

$(document).ready(function(){
	waiting();
});


function printStatus(data){
	var str = JSON.stringify(data, undefined, 1);
	alert(str);
}

function setTimeTic(time_current, time_max){
	var time_tic_str = '';
	
	for(var i = 1 ; i <= time_max ; i++){
		if(i == time_current){
			time_tic_str += '<img width="50" height="50" src="images/circle_medium.png">';
		}else{
			time_tic_str += '<img width="50" height="50" src="images/circle_small.png">';
		}
	}
	$('#id_game_tic_td').html(time_tic_str);
}

var time_current = 0;

function waiting(){
	$.ajax({ 
	    type:"POST",
		url: "game.waitingGamers.do", 
		success: function(data) {
			if(data == 'success'){
				polling();
			}
		} 
		//,dataType: "json"
	});
}

function polling(){
		//decision = type;
		$.ajax({ 
		    type:"POST",
			url: "game.getNextStatus.do?time_current="+time_current, 
			success: function(data) {
				//printStatus(data);
				
				time_current = data.time_current;
				
				setTimeTic(data.time_current, data.time_max);
				
				if(data.time_current==data.time_max){
					if(data.leftUser != null){
						$('#id_picture_left').attr('src', 'http://graph.facebook.com/'+data.leftUser.id+'/picture?type=normal');
						$('#id_name_left').text(data.leftUser.name);
						
						if(data.leftUserChoise != null && data.leftUserChoise != ''){
							$('#id_left_choise').attr('src', 'images/'+data.leftUserChoise+'_off.png');
						}
					}
					if(data.rightUser != null){
						$('#id_picture_right').attr('src', 'http://graph.facebook.com/'+data.rightUser.id+'/picture?type=normal');
						$('#id_name_right').text(data.rightUser.name);
						if(data.rightUserChoise != null && data.rightUserChoise != ''){
							$('#id_right_choise').attr('src', 'images/'+data.rightUserChoise+'_off.png');
						}
					}
				}else{
					polling();
				}
				
		   	//alert(data.name+' '+data.round);
		   	
	        //sales.setValue(data.value);
	   		}, 
	   		dataType: "json"
	   		//,complete: polling 
	   	});
}
</script>

<style>

.circle-mask {
  	-webkit-mask: url(images/mask62.png) no-repeat center center;
}

</style>
</head>
<body>

<table id="bodyTable" border="0" width="1024" height="695"
		style="background-color: #232222" cellpadding="0">
		
		<tr height="6%"></tr> 
		<tr height="12%">
			<td align="center"> <img src="images/web_title.png" width="20%" alt=""></td>
		</tr> 
		<tr height="14%">
			<td>
				<table width="100%">
					<tr>
						<td id="id_game_tic_td" align="center">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr id="id_game_vs" height="37%" style="display:none">
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="1.7%"></td>
						<td>
							<table width="100%">
								<tr> 
									<td width="7%"></td>
									<td width="27%"><img id="id_left_choise" width="100%" src="images/unknown_off.png"  alt="scissor"/></td>
									<td width="32%" align="center" >
										<span style="font-size:50px; color: #a9abae">2:3</span>
									</td> 
									<td width="27%"><img id="id_right_choise" width="100%" src="images/unknown_off.png"  alt="scissor"/></td>
									<td width="7%"></td>
								</tr>
							</table>
						</td>
						<td width="1.7%"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr id="id_game_result" height="37%" style="">
			<td>
				<table border="0" width="100%">
					<tr>
						<td align="center" width="100%">
							<img width="300" src="images/winner.png"/>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<img id="id_winner_picture" width="62" height="62" class="circle-mask" src="images/web_title.png">
							<span id="id_winner_name" style="color: #a9abae; font-size: xx-large;">이름없음1</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="9%"></tr>
		<tr height="11%">
			<td>
				<table width="100%" border="0" style="border-spacing: 2px;">
					<tr>
						<td align="center">
							<table width="100%" height="30" style="border-spacing: 0px;">
								<tr>
									<td align="center"><img width="20" src="images/game_circle.gif"></td>
									<td align="center"><img width="20" src="images/game_circle.gif"></td>
									<td align="center"><img width="20" src="images/game_circle.gif"></td>
								</tr>
							</table>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td align="center">
							<table width="100%">
								<tr>
									<td align="center"><img width="20" src="images/game_circle.gif"></td>
									<td align="center"><img width="20" src="images/game_circle.gif"></td>
									<td align="center"><img width="20" src="images/game_circle.gif"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="left"><img id="id_picture_left" width="62" height="62" class="circle-mask" src="images/web_title.png"></td>
						<td align="left" width="25%" style="color: #a9abae" id="id_name_left">사용자 없음</td>
						<td width="40%"></td>
						<td align="right" width="25%" style="color: #a9abae" id="id_name_right">사용자 없음</td>
						<td align="right"><img id="id_picture_right" width="62" height="62" class="circle-mask" src="images/web_title.png"></td>
					</tr>
				</table>
			</td>
		</tr> 
		<tr height="1%"></tr>
</table>

</body>
</html>