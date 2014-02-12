<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>RESPACE :: 공간에 가치를 더합니다 </title>
    
        
    <link rel="stylesheet" href="reset.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" href="style_ex.css" type="text/css">
        
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    
    
	
<style>
label.error{
	color: #d54e21;
	display: none;
	margin-left: .5em;
}
</style>


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
            
              <h3><font color="#ff5721" style="text-shadow:0px 1px #777"><b>공간에 관한 모든 것, 리스페이스와 함께 하세요!</b></font></h3>
            <p class="teamline">공간 공유를 원하시는 임대인, 프로젝트를 열고 싶으신 임차인, <br>재미있는 행사에 참여하고 싶은 모든 분들을 환영합니다.</p>
            <div class="cara"></div>
           <!-- *** contact form *** -->
           <hr class="cleanit">
        	<div class="button_main">
                <a href="spaceShare.do" class="button_register">임대공간 등록하기</a>
            </div> <br>
            <div class="button_main">
                <a href="projectOpen.do" class="button_register">프로젝트 등록하기</a>
            </div>
            <div class="cara"></div>
            <hr class="cleanit">
        
            <!-- sign up/sign in tab -->
            
            <div class="signup">
                     
              <ul class="tabs"> 
       			<li class="active" rel="tab1"> 로그인</li>
       			<li rel="tab2"> 가입하기</li>
    		   </ul>
    		   
    		   <div class="tab_container"> 

     <div id="tab1" class="tab_content"> 
 
        	<form action="login.do" method="post" class="formit" id="loginForm">
        	 
                <input type="email" name="email" id="login_email" placeholder="EMAIL" value="admin@respace.co.kr" required/>
                <br>
                <input type="password" name="password" placeholder="PASSWORD" value="respace" required/>
                <br><input type="submit" class="button_submit" value="로그인">
                
                
            </form>
		<br />
     </div><!-- #tab1 -->
     <div id="tab2" class="tab_content"> 

        <form action="register.do" method="post" class="formit" id="registerForm">
                <input type="email" name="email" id="regi_email" placeholder="EMAIL" required/>
                <!-- <br><input type="text" name="name" placeholder="NAME"/> -->
                <!-- <br><input type="text" name="company" placeholder="소속"/> -->
                <br><input type="password" name="password" placeholder="PASSWORD" required/>
                <br><input type="password" name="confirm_password" placeholder="PASSWORD_CONFIRM" equalTo="password" required/>
                <br><input type="submit" class="button_submit" value="가입하기">
                
            </form>
        
      	<br />
     </div><!-- #tab2 -->
     <div id="tab3" class="tab_content"> 

        
      	<strong>
      	현재 가능한 예약 일정을 알려드립니다.
      	<p><img src="images/calender.jpg">
      	</strong>
       </p><br />

     </div><!-- #tab3 -->
     <div id="tab4" class="tab_content"> 

      
      	<strong>
      	이 공간을 이용했던 기업 및 개인 임차인들의 후기입니다. 
      	<p><img src="images/sharereview.jpg">
      	</strong>
       </p><br />

     </div><!-- #tab4 --> 
     
 </div> <!-- .tab_container -->
            
   
</div>
 <style type="text/css">

	ul.tabs {
		margin: 0;
		padding: 0;
		float: left;
		list-style: none;
		height: 32px;
		border-bottom: 1px solid #999999;
		border-left: 1px solid #999999;
		width: 100%;
	}
	ul.tabs li {
		float: left;
		margin: 0;
		cursor: pointer;
		padding: 0px 21px ;
		height: 31px;
		line-height: 31px;
		border: 1px solid #999999;
		border-left: none;
		font-weight: bold;
		font-family: 'Nanum Gothic';
		background: #EEEEEE;
		overflow: hidden;
		position: relative;
	}
	ul.tabs li:hover {
		background: #CCCCCC;
	}	
	ul.tabs li.active{
		background: #FFFFFF;
		border-bottom: 1px solid #FFFFFF;
	}
	.tab_container {
		border: 1px solid #999999;
		border-top: none;
		clear: both;
		float: left; 
		width: 100%;
		background: #FFFFFF;
	}
	.tab_content {
		padding: 20px;
		font-size: 0.9em;
		display: none;
		font-weight: light;
		font-family: 'Nanum Gothic';
	}
 
</style>


           </div>
            <!-- sign up tab end -->
            
        </div>
    
    
 <!-- *********  Footer  ********** -->
    
    <%@include file = "footer.jsp"%>
    
    
    
<script src="js/jquery-validation-1.11.1/dist/jquery.validate.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	// validate signup form on keyup and submit
	
	

	$("#loginForm").validate({
		rules: {
			password: {
				required: true,
				minlength: 5
			},
			email: {
				required: true,
				email: true
			}
		},
		messages: {
			password: {
				required: "<br>패스워드를 입력 해주세요.",
				minlength: "<br>패스워드는 최소 5글자 이상이어야 합니다."
			},
			email: "<br>올바른 이메일 주소를 넣어주세요."
		}
	});
	
	$("#registerForm").validate({
		rules: {
			password: {
				required: true,
				minlength: 5
			},
			confirm_password: {
				required: true,
				minlength: 5,
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			}
		},
		messages: {
			password: {
				required: "<br>패스워드를 입력 해주세요.",
				minlength: "<br>패스워드는 최소 5글자 이상이어야 합니다."
			},
			confirm_password: {
				required: "<br>패스워드값과 동일하게 입력 해주세요.",
				minlength: "<br>패스워드는 최소 5글자 이상이어야 합니다.",
				equalTo: "<br>패스워드갑과 동일한 값을 넣어주세요."
			},
			email: "<br>올바른 이메일 주소를 넣어주세요."
		}
	});
});

</script> 
    
<script>
// script for testimonial' tabs
$(function() {
      

   	$(".tab_content").hide();
   	$(".tab_content:first").show(); 

   	$("ul.tabs li").click(function() {
   		$("ul.tabs li").removeClass("active");
   		$(this).addClass("active");
   		$(".tab_content").hide();
   		var activeTab = $(this).attr("rel"); 
   		$("#"+activeTab).fadeIn(); 
   	});
    	
});
</script>

</body>
</html>
