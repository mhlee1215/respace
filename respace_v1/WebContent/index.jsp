<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

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
    
    <%@include file = "header.jsp"%>
    
    <script>
// script for testimonial' tabs
$(function() {
	//$( "#dialog" ).dialog();
    //$("#message_set").tabs("div.testimonials > div");
});
</script>
    
    <!-- *********  Main part (slider)  ********** -->
    
        
        <div id="main_part">
            <div id="main_part_in"style="background:url('./images/service_bg.gif');">
        <div id="service" >
            <h2>RESPACE</h2>
            
            <p>리스페이스는 공간이 필요한 사람들에게</p>
            <p>유휴공간을 제공하는 공유경제 플랫폼입니다</p>
            
            </div>
            
            
            <div class="button_main">
                  
                <ul><a href="space.do" class="button_dark">RESPACE</a></ul>
               
            </div>
            
        </div>
        </div>
        
        
        <!-- *********  Content  ********** -->
        
        <div id="content">
            
            <div class="thirds">
                <h3>Share your space</h3>
                <p>당신의 유휴 공간, 버려진 가치를 살립니다. 기존 단기임대에서 발생하는 리스크를 줄이고 공간의 새로운 가치를 얻어가세요!</p>
                <!-- <p>${index_top_left.content } 
                <%if("true".equals(islogin)){ %>
                
                <%} %>
                
                </p>
                 -->
                <!-- ${indexDesc}
				
				<script type="text/javascript" src="js/ckeditor/ckeditor_4.1.2_standard/ckeditor.js"></script>
				<script type="text/javascript">
					window.onload = function()
					{
						CKEDITOR.replace( 'desc' );
					};
				</script>
				<form method="post" name="descForm" action="/updateDesc.do">
				<textarea name="desc" rows="70" cols="100">${indexDesc}</textarea><br>
				password : <input type="password" name="password"></input>
				<input type="hidden" name="category" value="index"></input>
				</form>
				<button onclick="document.descForm.submit();">apply</button>
				 -->
            </div>
            
            <div class="thirds">
                <h3>Open Your Project</h3>
                <p>프로젝트나 이벤트를 개최할 공간이 필요하신가요? 행사의 성격에 맞는 다양한 공간들을 합리적으로 이용하실 수 있습니다. 당신을 기다립니다!</p>
                <!-- <p>${index_top_center.content }</p> -->
            </div>
            
            <div class="thirds">
                <h3>Now Playing</h3>
                <p>RESPACE에서 진행중인 즐거운 프로젝트들을 소개합니다. 지금 만나보세요. 당신에게도 좋은 영감을 수 있답니다!</p>
                <!-- <p>${index_top_right.content }</p> -->
            </div>
            
            <hr class="cleanit">
            
            <div class="banner1">
                <p>The <b>소개 ? n</b> ~~ 사용해주세요 ~배너도. <p>
                <a href="#" class="button_dark">WHAT CAN</a>
            </div>
                
                
            <!-- ****  Recent works  ***** -->        
            
            <h3>Featured Spaces</h3>
            
            <c:forEach items="${featuredSpaceList}" var="featuredSpace" varStatus="list_status">
						
			<div class="fourths_portfolio">
                <h4>${featuredSpace.name}<br>
                <span>see detail</span>
                </h4>
                <a href="spaceDetail.do?id=${featuredSpace.id}"><img src="${featuredSpace.thumbnail_url}" alt="item1"></a>
            </div>
            
	 		</c:forEach>
            <p class="youlike">좋은 공간을 알고 있나요?<br><a href="contact.do"> 여기</a>로<a href="contact.do">contact us</a> and get started on your project? Or are you thinking about <a href="project.do">opening your own project</a>?</p>            
            <!-- ****  Recent works  ***** -->        
            
            <h3>Featured Projects</h3>
            
             <c:forEach items="${featuredProjectList}" var="featuredProject" varStatus="list_status">
						
			<div class="fourths_portfolio">
                <h4>${featuredProject.title}<br>
                <span>see detail</span>
                </h4>
                <a href="projectDetail.do?id=${featuredProject.id}"><img src="${featuredProject.thumbnail_url}" alt="item1"></a>
            </div>
            
	 		</c:forEach>
            
            
            <hr class="cleanit">
            
            <p class="youlike">더 많은 정보를 보고 싶다면?<a href="contact.do">see more</a> or even <a href="contact.do">contact us</a> and get started on your project? Or are you thinking about <a href="project.do">opening your own project</a>?</p>
            
            <div class="cara"></div>
            
            
            <!-- ****  About & Testimonials  ***** --> 
            
            
            <div class="about_blok">
                <h3>About Us</h3>
                <p class="about">리스페이스는 남는 공간을 필요로하는 사람들에게 팝업~~~ 등등 소개멘트 </p>
                
                <a href="contact.do" class="button_light">LEARN MORE</a>
            </div>
            
            <div id="message_set" class="testimonials">
                <div id="message_set-1" class="quote">123</div>
                
                <div id="message_set-2" class="quote">456</div>
                
                <div id="message_set-3" class="quote">789</div>
                <span class="testimonials_bottom"></span>
                
                <ul class="controls">
                    <li><a href="#message_set-1"></a></li>
                    <li><a href="#message_set-2"></a></li>
                    <li><a href="#message_set-3"></a></li>
                </ul>
                <span class="by">리스페이스를 방문한 사람들! </span>
            </div>
            
        </div>

       
    
  
    <%@include file = "footer.jsp"%>  
    <!-- *********  Footer  ********** -->
    
   
         


</body>
</html>

