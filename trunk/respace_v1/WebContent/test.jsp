<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>jQuery validation plug-in - main demo</title>



<script src="js/jquery-validation-1.11.1/lib/jquery.js"></script>

<script>

$().ready(function() {
	// validate the comment form when it is submitted
	$("#commentForm").validate();	
});
</script>


</head>
<body>


<form  id="commentForm" method="get" action="">
	<fieldset>
		<legend>Please provide your name, email address (won't be published) and a comment</legend>
		<p>
			
			<input id="cname" name="name" minlength="2" type="text" required />
		<p>
			
			<input id="cemail" type="email11" name="email" required />
		</p>
		<p>
			
			<input id="curl" type="url" name="url" />
		</p>
		<p>
			
			<textarea id="ccomment" name="comment" required></textarea>
		</p>
		<p>
			<input class="submit" type="submit" value="Submit"/>
		</p>
	</fieldset>
</form>



</body>
</html>
