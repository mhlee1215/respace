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
	init();
	waitingGamers();
	waitingDecisions();
});

function init(){
	var gameStatus = JSON.parse('${gameStatus}');
	//var gameStatus = '{"time_current":"0","time_max":"0","leftUser":"{"id":"252530578279290","birthday":"null","email":"dlalsgodsla@naver.com","first_name":"민행","gender":"남자","last_name":"이","link":"https://www.facebook.com/app_scoped_user_id/252530578279290/","locale":"ko_KR","name":"이민행","timezone":"9","updated_time":"2014-07-16T04:50:36+0000","verified":"false"}","leftUserChoise":"scissor","leftUserWins":"0","isLeftUserWin":"false","rightUser":"{"id":"10203366910927605","birthday":"12/15/1984","email":"mhlee1215@gmail.com","first_name":"민행","gender":"남자","last_name":"이","link":"https://www.facebook.com/app_scoped_user_id/10203366910927605/","locale":"ko_KR","name":"이민행","timezone":"9","updated_time":"2014-06-16T14:13:46+0000","verified":"true"}","rightUserChoise":"","rightUserWins":"1","isRightUserWin":"true"}';
	//printStatus(gameStatus);
	//var gameStatus = eval('{"time_current":"0","time_max":"0","leftUser":"{"id":"252530578279290","birthday":"null","email":"dlalsgodsla@naver.com","first_name":"민행","gender":"남자","last_name":"이","link":"https://www.facebook.com/app_scoped_user_id/252530578279290/","locale":"ko_KR","name":"이민행","timezone":"9","updated_time":"2014-07-16T04:50:36+0000","verified":"false"}","leftUserChoise":"scissor","leftUserWins":"0","isLeftUserWin":"false","rightUser":"{"id":"10203366910927605","birthday":"12/15/1984","email":"mhlee1215@gmail.com","first_name":"민행","gender":"남자","last_name":"이","link":"https://www.facebook.com/app_scoped_user_id/10203366910927605/","locale":"ko_KR","name":"이민행","timezone":"9","updated_time":"2014-06-16T14:13:46+0000","verified":"true"}","rightUserChoise":"","rightUserWins":"1","isRightUserWin":"true"}');
	showGameScore(gameStatus);
	showUserInfo(gameStatus, 'all');
	//showDecisions(gameStatus, 'all');
}

function goReset(){
	window.location = 'game.reset.do';
}

function printStatus(data){
	var str = JSON.stringify(data, undefined, 1);
	alert(str);
}

function resetGameScore(){
	$('#id_game_score').html('0:0');
	
	var i=1;
	for(; i <= 3 ; i++){
		$('#id_td_left_wins_circle_'+i).html('<img width="20" src="images/circle_medium.png">');
		$('#id_td_right_wins_circle_'+i).html('<img width="20" src="images/circle_medium.png">');
	}
}

function showGameScore(data){
	$('#id_game_score').html(data.leftUserWins+':'+data.rightUserWins);
	
	var i=1;
	for(; i <= data.leftUserWins ; i++){
		$('#id_td_left_wins_circle_'+i).html('<img width="20" src="images/circle_big.png">');
	}
	for(; i <= 3 ; i++){
		$('#id_td_left_wins_circle_'+i).html('<img width="20" src="images/circle_medium.png">');
	}
	
	i=1;
	for(; i <= data.rightUserWins ; i++){
		$('#id_td_right_wins_circle_'+i).html('<img width="20" src="images/circle_big.png">');
	}
	for(; i <= 3 ; i++){
		$('#id_td_right_wins_circle_'+i).html('<img width="20" src="images/circle_medium.png">');
	}
	
}

function showUserInfo(data, type){
	if(type == 'left' || type == 'all'){
		if(data.leftUser != null){
			$('#id_picture_left').attr('src', 'http://graph.facebook.com/'+data.leftUser.id+'/picture?type=normal');
			$('#id_name_left').text(data.leftUser.name);
		}else{
			$('#id_picture_left').attr('src', 'images/web_title.png');
			$('#id_name_left').text('사용자 없음');
		}
	}
	
	if(type == 'right' || type == 'all'){
		if(data.rightUser != null){
			$('#id_picture_right').attr('src', 'http://graph.facebook.com/'+data.rightUser.id+'/picture?type=normal');
			$('#id_name_right').text(data.rightUser.name);
		}else{
			$('#id_picture_right').attr('src', 'images/web_title.png');
			$('#id_name_right').text('사용자 없음');
		}
	}
}

function showDecisions(data, type){
	if(type == 'left' || type == 'all'){
		if(data.leftUserChoise != null && data.leftUserChoise != ''){
			$('#id_left_choise').attr('src', 'images/'+data.leftUserChoise+'_off.png');
		}
	}
	
	if(type == 'right'  || type == 'all'){
		if(data.rightUserChoise != null && data.rightUserChoise != ''){
			$('#id_right_choise').attr('src', 'images/'+data.rightUserChoise+'_off.png');
		}
	}
	
	if(type == 'reset'){
		$('#id_left_choise').attr('src', 'images/'+'unknown'+'_off.png');
		$('#id_right_choise').attr('src', 'images/'+'unknown'+'_off.png');
	}
}

function waitingGamers(){
	$.ajax({ 
	    type:"POST",
		url: "game.waitingGamers.do", 
		success: function(data) {
			//alert('wait user!');
			//printStatus(data);
			showUserInfo(data, 'all');
		} 
		,dataType: "json"
		,complete: waitingGamers 
	});
}

function goNextRound(){
	//alert('go next round');
	setTimeout(function(){
		showDecisions('', 'reset');
		waitingDecisions();
	}, 5000)
}

function showWinner(userData){
	$('#id_winner_picture').attr('src', 'http://graph.facebook.com/'+userData.id+'/picture?type=normal');
	$('#id_winner_name').text(userData.name);
	
	$('#id_game_vs').hide();
	$('#id_game_result').show();
	
	
	
	//alert('show winner');
	setTimeout(function(){
		goNextGame();
	}, 10000)
}

function showMatch(){
	$('#id_game_vs').show();
	$('#id_game_result').hide();
}

function goNextGame(){
	resetGameScore();
	showDecisions('', 'reset');
	
	showMatch();
	waitingDecisions();
}

function waitingDecisions(){
	$.ajax({ 
	    type:"POST",
		url: "game.waitingDecisions.do", 
		success: function(data) {
			showGameScore(data);
			showDecisions(data, 'all');
			
			if(data.leftUserWins == 3 || data.rightUserWins == 3){
				if(data.leftUserWins == 3)
					showWinner(data.leftUser);
				else if(data.rightUserWins == 3)
					showWinner(data.rightUser);
			}else{
				goNextRound();
			}
		} 
		,dataType: "json"
	});
}

/*function polling(){
		//decision = type;
		$.ajax({ 
		    type:"POST",
			url: "game.getNextStatus.do?time_current="+time_current, 
			success: function(data) {
				//printStatus(data);
				
				
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
		
}*/
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
		
		<tr height="6%">
			<td><a href="#" onclick="goReset();">RESET</a></td>
		</tr> 
		<tr height="12%">
			<td align="center"> <img src="images/web_title.png" width="20%" alt=""></td>
		</tr> 
		
		<tr id="id_game_vs" height="37%">
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
										<span id="id_game_score" style="font-size:50px; color: #a9abae">2:3</span>
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
		<tr id="id_game_result" height="37%" style="display:none">
			<td>
				<table border="0" width="100%">
					<tr>
						<td align="center">
							<img width="400" src="images/winner.png"/>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<img id="id_winner_picture" width="62" height="62" class="circle-mask" src="images/web_title.png">
							<span id="id_winner_name" style="color: #a9abae; font-size: xx-large;">이름없음</span>
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
									<td id="id_td_left_wins_circle_1" align="center"><img width="20" src="images/circle_big.png"></td>
									<td id="id_td_left_wins_circle_2" align="center"><img width="20" src="images/circle_medium.png"></td>
									<td id="id_td_left_wins_circle_3" align="center"><img width="20" src="images/circle_medium.png"></td>
								</tr>
							</table>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td align="center">
							<table width="100%">
								<tr>
									<td id="id_td_right_wins_circle_3" align="center"><img width="20" src="images/circle_big.png"></td>
									<td id="id_td_right_wins_circle_2" align="center"><img width="20" src="images/circle_big.png"></td>
									<td id="id_td_right_wins_circle_1" align="center"><img width="20" src="images/circle_big.png"></td>
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