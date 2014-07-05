<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>안녕 친구들</title>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a1.min.css" />
<script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a1.min.js"></script>
</head>

<script type="text/javascript">

function go(url){
	window.location.href=url;
}

</script>

<body>
	<!-- 720 x 1280 -->
	<table border="0" width="640" height="960"
		style="background-color: #232222" cellpadding="50">
		<tr height="10%">
			<td width="100%"align="center"><img src="images/web_title.png" width="60%" alt=""></td>
		</tr>
		<tr>
			<td align="center">
				<table>
					<tr>
						<td><a href="#" onclick="go('game.login.do')"><img src="images/mobile_login.gif"  alt=""></a></td>
					</tr>
					<tr>
						<td><img src="images/mobile_howto.gif"  alt=""></td>
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