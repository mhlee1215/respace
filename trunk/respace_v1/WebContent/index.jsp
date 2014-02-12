<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<html>
<head>
    <meta charset="utf-8">
    <title>RESPACE :: 공간에 가치를 더합니다 </title>
    
    
    
        
    

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
            <div id="main_part_in">
        <div id="service" >
            <h2>RESPACE</h2>
            <br><br><br>
            <p>리스페이스는 공간이 필요한 사람들에게</p>
            <p>유휴공간을 제공하는 공유경제 플랫폼입니다</p>
            
            </div>
       
        </div>
        </div>
        
        
        <!-- *********  Content  ********** -->
        
        <div id="content">
            
            <div class="thirds">
                <h3>Share your space</h3>
                <p>당신의 유휴 공간, 버려진 가치를 살립니다. <p> 기존의 단기임대에서 발생하는 리스크를 줄이고 공간의 새로운 가치를 얻어가세요!</p>
            
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
                <h3>Open Your Project </h3>
                <p>프로젝트나 이벤트를 개최할 공간이 필요하세요? 행사의 성격에 맞는 다양한 공간들을 합리적으로 이용하실 수 있습니다. 당신을 기다립니다!</p>
            </div>
            
            <div class="thirds">
                <h3>Now Playing </h3>
                <p>RESPACE에서 진행 중인 즐거운 프로젝트들을 </p><p>소개합니다. 지금 만나보세요. 당신에게도 좋은 </p><p>영감을 줄 수 있답니다! </p>
            </div>
            
            <hr class="cleanit">
            
           <div class="banner1">
                <p>&nbsp;&nbsp;3월 첫째주, 톡톡튀는 기업들의 팝업스토어! <br>&nbsp;&nbsp;리스페이스의 공간을 즐겁고 신나게 채워주세요!</p>
                <a href="http://www.facebook.co.kr/remakespace" class="button_dark">자세히 보기</a>
            </div>
             <hr class="cleanit">
             <div class="cara"></div>  
                
                
            <!-- ****  Recent works  ***** -->        
            
            <div class="featured">   
            <h3>Featured Spaces
            <p>좋은 공간을 갖고 계신가요? <a href="space.do"> 더 보러가기 </a></p></h3></div>
            
            <c:forEach items="${featuredSpaceList}" var="featuredSpace" varStatus="list_status">
						
			<div class="fourths_portfolio">
                <h4>${featuredSpace.name}<br>
                <span>see detail</span>
                </h4>
                <a href="spaceDetail.do?id=${featuredSpace.id}"><img src="${featuredSpace.thumbnail_url}" alt="${featuredSpace.name}" class="thumb_nail"></a>
            </div>
            
	 		</c:forEach>
           
            <!-- ****  Recent works  ***** -->        
            
            <div class="featured">   
            <h3>Featured Projects
            <p>새로운 프로젝트나 행사 이벤트를 개최하고 싶다면? <a href="project.do"> 더 보러가기 </a></p></h3></div>
            
             <c:forEach items="${featuredProjectList}" var="featuredProject" varStatus="list_status">
						
			<div class="fourths_portfolio">
                <h4>${featuredProject.title}<br>
                <span>see detail</span>
                </h4>
                <a href="projectRegister.do?id=${featuredProject.id}"><img src="${featuredProject.thumbnail_url}" alt="${featuredProject.title}" class="thumb_nail"></a>
            </div>
            
	 		</c:forEach>
            
            
            <hr class="cleanit">
            
            
            <div class="cara"></div>
            
            
            <!-- ****  About & Testimonials  ***** --> 
            
            
            <div class="about_blok">
                <h3>About Us</h3>
                <p class="about">리스페이스는 남는 공간을 필요로 하는 사람들에게 공간을 제공하는 공유 공간 &nbsp; 플랫폼입니다. 임대인들에게는 유휴공간에 안정적인 수익을, 임차인에게는 행사에 적합한 공간을 제공합니다. 리스페이스와 함께하는 다양한 행사에 참여하세요! </p>
                
                <a href="contact.do" class="button_light">Contact us!</a>
            </div>
            
            <div id="message_set" class="testimonials">
                <div id="message_set-1" class="quote">리스페이스 덕분에 저도 저만의 공연 공간을 갖게 된 좋은 기회가 될 것 같아요! 번화가에서 공연하는 건 이번이 처음이라 너무 설렙니다! 리스페이스 화이팅 :) </div>
                <!-- <div id="message_set-2" class="quote">456</div>
                <div id="message_set-3" class="quote">789</div> -->
                <span class="testimonials_bottom"></span>
                
                <ul class="controls">
                    <li><a href="#message_set-1"></a></li>
                    <li><a href="#message_set-2"></a></li>
                    <li><a href="#message_set-3"></a></li>
                </ul>
                <span class="by">리스페이스를 응원합니다! </span>
            </div>
            
        </div>

       
    
  
    <%@include file = "footer.jsp"%>  
    <!-- *********  Footer  ********** -->
    
   
         


</body>
</html>

