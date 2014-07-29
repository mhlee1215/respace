<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>안녕 친구들1</title>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>

<style>
@font-face {
	font-family: 'Helvetica_Extended_Light';
	src: url('WebContent/Fonts/Helvetica_Extended_Light.ttf');
}

@font-face {
	font-family: 'Helvetica_Extended_Thin';
	src: url('WebContent/Fonts/Helvetica_Extended_Thin.ttf');
}

@font-face {
	font-family: 'Helvetica_Extended';
	src: url('WebContent/Fonts/Helvetica_Extended.ttf');
}

html {
	font-family: 'Helvetica_Extended';
}
</style>

</head>

<script type="text/javascript">
	function go(url) {
		//window.location.href=url;
		$.mobile.changePage(url, {
			reloadPage : true,
			transition : "none"
		});
	}

	$(document).ready(function() {

		/*  alert($(window).height());
		alert($(window).width());  */

		$('#bodyTable').attr('width', $(window).width());
		$('#bodyTable').attr('height', $(window).height());

		// jQuery methods go here...
		$(document).bind('mobileinit', function() {
			$.mobile.loader.prototype.options.text = "loading";
			$.mobile.loader.prototype.options.textVisible = false;
			$.mobile.loader.prototype.options.theme = "a";
			$.mobile.loader.prototype.options.html = "";
		});
	});
</script>

<body>
	<!-- 720 x 1280 -->
	<table id="bodyTable" border="0" width="640" height="960"
		style="background-color: #232222" cellpadding="50">
		<tr height="10%">
			<td width="100%" align="center"><img src="images/web_title.png"
				width="60%" alt=""></td>
		</tr>
		<tr>
			<td align="center">
				<table>
					<tr>
						<td><a href="social/facebook/signin.do" rel="external"><img
								src="images/mobile_login.gif" alt=""></a></td>
					</tr>
					<tr>
						<td><img src="images/mobile_howto.gif" alt=""></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="10%">
			<td align="center"><img src="images/mobile_foot.png" width="80%"
				alt=""></td>
		</tr>

	</table>


</body>
</html>