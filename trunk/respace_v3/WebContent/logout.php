<?php
	session_start();
	
	header("Content-Type: text/html;charset=UTF-8");
	if(session_destroy()){
		echo '<script type = "text/javascript">alert("로그아웃 되었습니다.")</script> ';
		echo "<script>location.href='respace.html'</script>";
	}
?>