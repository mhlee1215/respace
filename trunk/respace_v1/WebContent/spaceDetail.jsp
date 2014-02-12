<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8">
    <title>RESPACE :: 공간에 가치를 더합니다 </title>
    
    <link rel="stylesheet" href="reset.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">
       
    <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
        
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDWbQkciXXMXPhb2PBb3x-VUpID2LWVLio&sensor=true"></script>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

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

<script type="text/javascript">
var map;
var geocoder;
geocoder = new google.maps.Geocoder();
var address = '${space.address_simple}';

function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(-34.397, 150.644),
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
    
    geocoder.geocode( { 'address': address}, function(results, status) {
   	 
	    if (status == google.maps.GeocoderStatus.OK) {
	    	
	      map.setCenter(results[0].geometry.location);
	      var marker = new google.maps.Marker({
	          map: map,
	          position: results[0].geometry.location
	      });
	    } else {
	      //alert('Geocode was not successful for the following reason: ' + status);
	    }
	  });
  }
  
$(document).ready(function() {
	$("#id_button_delete")
	.click(function( event ) {
	
		  var str = $("#space_edit_form").serialize();
		  if(confirm('정말 지웁니까?')){
			  $.ajax({
				    type:"post",
				    data:'id=${space.id}',
				    url:"spaceDelete.do",
				    async: false,
				    success: function(msg){
				    	if( msg == 'success'){
				    		 document.location = 'space.do';
				    	}
				    }
				});
		  }
		  
	 event.preventDefault();
	});
});
</script>
</head>

<body onload="initialize()">
    
    <!-- *********  Header  ********** -->
    
    <%@include file = "header.jsp"%>
     <!-- *********  Main part – headline ********** -->
    
        
        <div id="main_part_inner">
            <div id="main_part_inner_in">
        
            <h2>SPACE</h2>
            
            <div class="button_main">
                <a href="spaceShare.do" class="button_dark">SHARE!</a>
            </div>
            
            </div>
            
        </div>
        
   
      <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            <h3><font color="#e66e0d"><b>${space.name}</b></h3></font>
           
           <p class="teamline">${space.address_simple }</p>
           <div class="cara"></div>
           <hr class="cleanit">
           
    <!-- **** Details **** -->
    
               <div class="left_portfolio">
              
              <ul class="tabs"> 
       			<li class="active" rel="tab1"> 사진</li>
       			<li rel="tab2"> 지도</li>
       			<li rel="tab3"> 일정</li>
    		   </ul>
    		   
    		   <div class="tab_container"> 

     <div id="tab1" class="tab_content"> 
    
<iframe width="660" height="450" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="imageSlider.do?id=${space.id}&type=space"> 
                		</iframe>
       
       
       
       

     </div><!-- #tab1 -->
     <div id="tab2" class="tab_content"> 

         <div class="mapspace">
                 <div id="map_canvas" style="width: 100%; height: 360px;"></div>
            </div>
      	<br />

     </div><!-- #tab2 -->
     <div id="tab3" class="tab_content"> 

        
      	<strong>
      	현재 가능한 예약 일정을 알려드립니다.
      	<p>
      	</strong>
       </p><br />

     </div><!-- #tab3 -->
          
 </div> <!-- .tab_container -->
 
  


  </div>
   <div class="right_portfolio">
   <ul class="price"> 
       			<li class="active" rel="price0">시간</li>
       			<li rel="price1">일</li>
       			<li rel="price2">주</li>
       			<li rel="price3">월</li>
    		   </ul>
    		   
    		   <div class="price_container"> 

	 <div id="price0" class="how_much"> 
       <h5>Standard Rental Rate</h5>
       <h3><b><font color="#e66e0d">${space.price_hour} \</b></font></h3><br><span>/Per Hour</span>
       <br><br>


     </div><!-- #price0 -->

     <div id="price1" class="how_much"> 
       <h5>Standard Rental Rate</h5>
       <h3><b><font color="#e66e0d">${space.price_day} \</b></font></h3><br><span>/Per Day</span>
       <br><br>
     
     </div><!-- #price1 -->
    <div id="price2" class="how_much"> 
       <h5>Standard Rental Rate</h5>
       <h3><b><font color="#e66e0d">${space.price_week} \</b></font></h3><br><span>/Per Week</span>
       
     
     </div><!-- #price2 -->
     <div id="price3" class="how_much"> 
       <h5>Standard Rental Rate</h5>
       <h3><b><font color="#e66e0d">${space.price_month} \</b></font></h3><br><span>/Per Month</span>
       
     
     </div><!-- #price3 -->
 </div> <!-- .tab_container -->
 
 <section class="ac-container">
    <div>
        <input id="ac-1" name="accordion-1" type="checkbox" />
        <label for="ac-1"><b>비용 상세내역 보기</b></label>
        <article class="ac-small">
            <p><b>임대료</b> <span>${space.price_detail_rental}\</span>
            <br><b>보증금</b>  <span>${space.price_detail_deposit}\</span>
            <br><b>수수료</b>	<span>오픈행사중</span></p>
        </article>
    </div>
    <div>
        <input id="ac-2" name="accordion-1" type="checkbox" checked />
        <label for="ac-2"><b>공간 소개</b></label>
        <article class="ac-medium">
            <p><b>수용인원</b>&nbsp;&nbsp;최대 ${space.accommodation_min}-${space.accommodation_max}명
            <br><b>이용시간</b>&nbsp;&nbsp;월-금 ${space.open_time}-${space.close_time}
            <br><b>상세주소</b>&nbsp;&nbsp;${space.address_full}
            <br><b>구비시설</b>&nbsp;&nbsp;${space.facilities_list} </p>
            
        </article>
    </div>
 </section>
 
 <div class="button_main">
                <a href="spaceBooking.do" class="button_booking">예약하기</a>
            </div> <br>
 
</div>

<div class="story_portfolio">
 <p><b>장소 이용후기</p></b><br>
 <div class="review_pic">
 <img src="img/review_1.png" width="80px" height="80px" ></div>
 <div class="review_twt">
 <p><font size=10> 연말에 홈커밍데이 때문에 대여했던 카페 비닷은 최고의 선택이었습니다. 
 나중에 연구실에서 있을 모임이나, 동창회 낮모임 등에도 딱일 듯 합니다! <p> 리스페이스 감사합니다~ </p></font>
 </div> 
  <div class="cbrb" width="660px"></div> 
 <div class="review_pic">
 <img src="img/review_2.png" width="80px" height="80px" ></div>
 <div class="review_twt">
 <p> 공연 장소 구하기가 만만치 않았는데, 덕분에 좋은 곳에서 좋은 사람들과 저희 음악을 공유할 수 있었습니다! 앞으로도 다양한 지역에서 이런 기회가 생겼으면 하네요... 리스페이스 계속 들어와볼게요! ㄱㅅㄱㅅ </p></div> 
 
</div>
       
   

<script type="text/javascript">

$(document).ready(function() {

	$(".how_much").hide();
	$(".how_much:first").show(); 

	$("ul.price li").click(function() {
		$("ul.price li").removeClass("active");
		$(this).addClass("active");
		$(".how_much").hide();
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).fadeIn(); 
	});
});

</script> 
	<%if("true".equals(islogin)){ %>    
			<div style="float: right;">
                
                 
				<a href="javascript:blank();" class="button_light" id="id_button_delete"
					style="float: left">DELETE</a>
                <a href="spaceEdit.do?id=${space.id}" class="button_light" style="float: right;">EDIT</a>
				<a href="space.do" class="button_light" style="float: right;">LIST</a>
                
            </div>
            <%} %>
   
   </div>
   

		
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
