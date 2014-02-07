<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>RESPACE :: 공간에 가치를 더합니다 </title>
    
    <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
    
    <link rel="stylesheet" href="reset.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" href="style_ex.css" type="text/css">
        
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

	<script>  	
	$(function() {
		$.validate();
	});
	</script>
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
           <hr class="cleanit">
        
            <!-- sign up/sign in tab -->
            
            <div class="signup">
                     
              <ul class="tabs"> 
       			<li class="active" rel="tab1"> 로그인</li>
       			<li rel="tab2"> 가입하기</li>
    		   </ul>
    		   
    		   <div class="tab_container"> 

     <div id="tab1" class="tab_content"> 
 
        <form action="login.do" method="post" class="formit">
                <input type="text" name="email" placeholder="EMAIL" value="admin@respace.co.kr"/>
                <br><input type="password" name="password" placeholder="PASSWORD" value="respace"/>
                <!-- <br><input type="password" name="password_confirm" placeholder="PASSWORD_CONFIRM"/> -->
                <br><input type="submit" class="button_submit" value="로그인">
                
            </form>
		<br />
     </div><!-- #tab1 -->
     <div id="tab2" class="tab_content"> 

        <form action="register.do" method="post" class="formit">
                <input type="text" name="email" placeholder="EMAIL" />
                <!-- <br><input type="text" name="name" placeholder="NAME"/> -->
                <!-- <br><input type="text" name="company" placeholder="소속"/> -->
                <br><input type="text" name="password" placeholder="PASSWORD"/>
                <br><input type="text" name="password_confirm" placeholder="PASSWORD_CONFIRM"/>
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
<script type="text/javascript">

$(document).ready(function() {

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

           </div>
            <!-- sign up tab end -->
            
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
