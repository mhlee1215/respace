<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>안녕 친구들</title>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>

<script type="text/javascript">
	function go(url) {
		//window.location.href=url;
		$.mobile.changePage(url, {
			reloadPage : true,
			transition : "none"
		});
	}

	var id = '${id}';

	$(document).ready(function() {
		$('#bodyTable').attr('width', $(window).width());
		$('#bodyTable').attr('height', $(window).height());
		$('#id_mobile_result').attr('width', $(window).width() - 100);

		waitingMobileResult();

	});

	function goNextRound() {
		//alert('go next round');
		setTimeout(function() {
			mark_decision('reset');
			showContent('game');
		}, 5000)
	}

	function showContent(type) {
		if (type == 'game') {
			$('#id_tr_decision').show();
			$('#id_tr_result').hide();
		} else {
			if (type == 'win') {
				$('#id_mobile_result').attr('src', 'images/you_win.png');
				goNextRound();
			} else if (type == 'lose') {
				$('#id_mobile_result').attr('src', 'images/you_lose.png');
				goNextRound();
			} else if (type == 'win_triple') {
				$('#id_mobile_result').attr('src', 'images/you_win_triple.png');
				goNextRound();
			} else if (type == 'draw') {
				$('#id_mobile_result').attr('src', 'images/draw.png');
				goNextRound();
			}
			$('#id_tr_result').show();
			$('#id_tr_decision').hide();

		}
	}

	function printStatus(data) {
		var str = JSON.stringify(data, undefined, 1);
		alert(str);
	}

	function waitingMobileResult() {
		$.ajax({
			type : "POST",
			url : "game.waitingMobileResult.do?id=" + id,
			success : function(data) {
				if (id == data.leftUser.id) {
					//printStatus(data.leftUserWins);
					if (data.isLeftUserWin == 'true') {
						if (data.leftUserWins == '3') {
							showContent('win_triple');
						} else {
							showContent('win');
						}
					} else {
						if (data.isRightUserWin == 'true') {
							showContent('lose');
							if (data.rightUserWins == '3') {
								quitGame();
							}
						} else {
							showContent('draw');
						}

					}
				} else if (id == data.rightUser.id) {
					if (data.isRightUserWin == 'true') {
						if (data.rightUserWins == '3') {
							showContent('win_triple');
						} else {
							showContent('win');
						}
					} else {
						if (data.isLeftUserWin == 'true') {
							showContent('lose');
							if (data.leftUserWins == '3') {
								quitGame();
							}
						} else {
							showContent('draw');
						}

					}
				}

				waitingMobileResult();

				//alert(data.name+' '+data.round);

				//sales.setValue(data.value);
			},
			dataType : "json"
		//,complete: poll 
		});
	}

	function quitGame() {
		setTimeout(function() {
			window.location = 'game.index.do';
		}, 5000)

	}

	function change_decision(type) {
		//decision = type;
		$.ajax({
			type : "POST",
			url : "game.changeDecision.do?choise=" + type + "&id=" + id,
			success : function(data) {
				if (data == 'success' || data == 'finish') {
					//decision = type;
					mark_decision(type);
				} else {
					//alert('change error. error: '+data);
					alert('연결에 문제가 발생했습니다. 다시 로그인 해주세요.');
					window.location = 'game.index.do';
				}

				//alert(data.name+' '+data.round);

				//sales.setValue(data.value);
			}//, 
		//dataType: "json"
		//,complete: poll 
		});
	}
	function mark_decision(type) {
		//type = decision;
		if (type == 'scissor') {
			decisino = type;
			$('#mark_scissor').attr('src', 'images/scissor_on.png');
			$('#mark_rock').attr('src', 'images/rock_off.png');
			$('#mark_paper').attr('src', 'images/paper_off.png');
		} else if (type == 'rock') {
			$('#mark_scissor').attr('src', 'images/scissor_off.png');
			$('#mark_rock').attr('src', 'images/rock_on.png');
			$('#mark_paper').attr('src', 'images/paper_off.png');
		} else if (type == 'paper') {
			$('#mark_scissor').attr('src', 'images/scissor_off.png');
			$('#mark_rock').attr('src', 'images/rock_off.png');
			$('#mark_paper').attr('src', 'images/paper_on.png');
		} else if (type == 'reset') {
			$('#mark_scissor').attr('src', 'images/scissor_off.png');
			$('#mark_rock').attr('src', 'images/rock_off.png');
			$('#mark_paper').attr('src', 'images/paper_off.png');
		}
	}
</script>
<style>
@font-face {
	font-family: 'Helvetica_Extended_Light';
	src: url('Fonts/Helvetica_Extended_Light.ttf');
}

@font-face {
	font-family: 'Helvetica_Extended_Thin';
	src: url('Fonts/Helvetica_Extended_Thin.ttf');
}

@font-face {
	font-family: 'Helvetica_Extended';
	src: url('Fonts/Helvetica_Extended.ttf');
}

html {
	font-family: 'Helvetica_Extended';
}
</style>
</head>
<body>
	<!-- 720 x 1280 -->
	<table id="bodyTable" border="0" width="640" height="960"
		style="background-color: #232222" cellspacing="50">
		<tr height="10%">
			<td><img src="images/mobile_title.png" width="100%" alt=""></td>
		</tr>
		<tr id="id_tr_result" style="display: none">
			<td><img id="id_mobile_result" width="100"
				src="images/you_win.png" /></td>
		</tr>
		<tr id="id_tr_decision">
			<td align="center">
				<table>
					<tr>
						<td colspan="3" rowspan="2" width="35%" height="188"></td>
						<td colspan="3" width="30%" align="center"><a href="#"
							onclick="change_decision('scissor')"><img id="mark_scissor"
								src="images/scissor_off.png" alt="scissor" /></a></td>
						<td colspan="3" rowspan="2" width="35%" height="188"></td>
					</tr>
					<tr>
						<td colspan="3" width="161" height="27"></td>
					</tr>
				</table>
				<table>
					<tr>

						<td colspan="3" width="45%" align="right"><a href="#"
							onclick="change_decision('rock')"><img id="mark_rock"
								src="images/rock_off.png" alt=""></a></td>
						<td rowspan="2" width="10%"></td>
						<td colspan="3" width="45%" align="left"><a href="#"
							onclick="change_decision('paper')"><img id="mark_paper"
								src="images/paper_off.png" alt=""></a></td>

					</tr>
				</table>
			</td>
		</tr>
		<tr height="10%">
			<td align="center"><span style="font-family: 'Helvetica_Extended_Thin'; color: #b2b1b1;"> www.facebook.com/remakespace</span></td>
		</tr>

	</table>


</body>
</html>