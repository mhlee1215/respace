<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>RESPACE :: 공간에 가치를 더합니다 </title>
    
    <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
    
    <link rel="stylesheet" href="reset.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">
        
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	
</head>

<body>
    
    <!-- *********  Header  ********** -->
    <%@include file = "header.jsp"%>
    <script type="text/javascript">
	<c:if test="${loginFail == 'true'}">
	alert('아이디 또는 패스워드가 틀렸습니다.');
	</c:if>
	</script>
    <!-- *********  Main part – headline ********** -->
    
        
        <div id="main_part_inner">
            <div id="main_part_inner_in">
        
            <h2>JOIN</h2>
            
            </div>
            
        </div>
        
        
        <!-- *********  Content  ********** -->
        
        <div id="content_inner" style="height: 600px;">
            
           <!-- *** contact form *** -->
            
           <h3>공간에 관한 모든 것, 리스페이스와 함께 하세요!</h3>
           
           <form action="login.do" method="post" class="formit">
                <input type="text" name="email" placeholder="EMAIL" value="admin@respace.co.kr"/>
                <br><input type="password" name="password" placeholder="PASSWORD" value="respace"/>
                <br><input type="password" name="password_confirm" placeholder="PASSWORD_CONFIRM"/>
                <br><input type="submit" class="button_submit" value="로그인">
            </form>
            <div class="button_main">
                <a href="sign.html" class="button_sign">가입하기</a>

            </div>
        
            
            
        </div>
        
    
    
 <!-- *********  Footer  ********** -->
    
    <%@include file = "footer.jsp"%>
    
<script>
// script for testimonial' tabs
$(function() {
    $("ul.controls").tabs("div.testimonials > div");
});
</script>

</body>
</html>
