<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>RESPACE :: 공간에 가치를 더합니다 </title>
    
    <link rel="stylesheet" href="reset.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">
       
    <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
        
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

</head>

<body>
    
    <!-- *********  Header  ********** -->
    
    <%@include file = "header.jsp"%>
     <!-- *********  Main part – headline ********** -->
    
        
        <div id="main_part_inner">
            <div id="main_part_inner_in">
        
            <h2>SPACE</h2>
            
            <div class="button_main">
                <a href="download.html" class="button_dark">SHARE!</a>
            </div>
            
            </div>
            
        </div>
        
   
      <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            <h3><font color="#e66e0d">스페이스 코노이</h3></font>
           
           <p class="teamline">도산대로13길 32, 강남구, 서울</p>
           <div class="cara"></div>
           <hr class="cleanit">
           
       <!-- **** Details **** -->
            
           <div class="left_portfolio">
                <a href="#"><img src="img/space_1.jpg"></a>
            </div>
            
            
           <div class="right_portfolio">
           		 <div class="booking">
                <div class="button_main">
                <a href="booking.html" class="button_dark">Booking</a>
            </div>
           </div>
                <p><h4>가격, 신청하기 배너 등등 </h4>
           </div>
           
           <hr class="cleanit">
           <div class="mapit">
                <iframe width="960" height="360" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=San+Francisco,+CA,+United+States&amp;aq=0&amp;oq=san+f&amp;sll=37.0625,-95.677068&amp;sspn=45.553578,93.076172&amp;ie=UTF8&amp;hq=&amp;ll=37.77493,-122.419416&amp;z=14&amp;output=embed"> 
                
                </iframe>
            </div>
            <hr class="cleanit">
           
           
       <!-- 상세설명 -->    
           <div class="story_portfolio">
                     
              <ul class="tabs"> 
       			<li class="active" rel="tab1"> 공간 소개</li>
       			<li rel="tab2"> 임대 조건</li>
       			<li rel="tab3"> 예약 일정</li>
        		<li rel="tab4"> 이용 후기</li>
    		   </ul>
    		   
    		   <div class="tab_container"> 

     <div id="tab1" class="tab_content"> 
 
        
         <strong>
         신사동에 위치한 코노이 스페이스는, 가로수길 한 가운데 자리한 아담한 잔디광장입니다. <br>
         이 곳에서는 40명 이하의 인원이 수용될 수 있으며, 다양한 즐길 거리, 팝업스토어, 
         <p>플리마켓에서 파티까지 놀라운 일들을 실현하는 공간입니다. 
         <p>단언컨대 코노이 스페이스는 여러분의 즐거움을 책임질 수 있는 공간입니다. 
         <br> <p><img src="images/shareclass.jpg">
         </strong>
         </p> <br />

     </div><!-- #tab1 -->
     <div id="tab2" class="tab_content"> 

        
      	<strong>
      	하루 단위 : 100만원, 일주일 : 500만원, 2주 이상~한달 미만 : 날짜 별 상이 (별도 협의)
      	<p>소동 금지, 소란 금지, 뽕 금지, 불법 전시나 판매 금지
      	<br /> <p><img src="images/shareconditons.jpg">
      	</strong>
        </p><br />

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
          
    <!-- *********  Footer  ********** -->
    
    <hr class="cleanit">
    
     <div id="footer">
        <div id="footer_in">
            
            <p>리스페이스 &mdash; 대표 : 여동인 사업자등록번호 : 110-555-55555 주소 : 서울특별시 서대문구 연세로 50</p>
            <span>리스페이스 <a href="http://blog.naver.com/respace">&nbsp;BLOG</a> 
            <a href="http://www.facebook.com/remakespace">&nbsp;&nbsp;FACEBOOK</a></span>
            

        
        </div>
    </div>
         
<script>
// script for testimonial' tabs
$(function() {
    $("ul.controls").tabs("div.testimonials > div");
});
</script>

</body>
</html>
