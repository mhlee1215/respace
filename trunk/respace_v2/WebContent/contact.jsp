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
<script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDWbQkciXXMXPhb2PBb3x-VUpID2LWVLio&sensor=true">
    </script>
  <script type="text/javascript">
    var map;
    var geocoder;
    geocoder = new google.maps.Geocoder();
    var address = '서울특별시 서대문구 창천동 연세대학교 공학원';
    
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
    	      alert('Geocode was not successful for the following reason: ' + status);
    	    }
    	  });
      }
     
      
      
      
    </script>
    
</head>

<body onload="initialize()">
    
    <!-- *********  Header  ********** -->
    
    <%@include file = "header.jsp"%>
    
    <!-- *********  Main part – headline ********** -->
    
        
          <div id="main_part_inner">
            <div id="main_part_inner_in">
        
            <h2>ABOUT</h2>
       
            
            </div>
            
        </div>
        
        
        <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            
            <!-- *** contact form *** -->
             <div id="content_inner">
            <h3><font color="#ff5721" style="text-shadow:0px 1px #777"><b>사업 소개</b></font></h3>
             <div class="cara"></div>
         	 <div class="featured"><h3><img src="img/icon_1.png" width="20px" height="22px"> &nbsp;&nbsp;RESPACE</h3></div>
         	 <div class="introduce_1"><h3>남는 공간과<br>
         	 필요한 공간을 연결하는 플랫폼</h3></font></div>
         	<div id="align"> 
			<div id="contents"> 
				<h7><font style="line-height:1.8em">RESPACE는 카페, 교회, 강당 등의 공간과 공간을 필요로 하는<br>
         	 강연업체, 공연기획단, 각종 프로모션 및 행사를 기획하는 기업 및 개인들을<br>
         	 보다 쉽고 효과적으로 연결해주는 서비스입니다.</font></h7> 
			</div> 
			</div>
         	 
         	 </div>
         	 
         	 <div class="featured"><h3><img src="img/icon_1.png" width="20px" height="22px"> &nbsp;&nbsp;VISION</h3></div>
         	 <div class="introduce_1">
			 <h3><font color="#777">{</font>&nbsp; 새로운 문화공간 창출 &nbsp;<font color="#777">}</font><br></div>
         	<div id="align"> 
			<div id="contents"> 
         	 <h7><font color="#959595"></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Innovate New Cultural Space</h7></font></div></h3>
			</div> 
			
			
			<div class="featured"><h3><img src="img/icon_1.png" width="20px" height="22px"> &nbsp;&nbsp;사업 내용</h3></div>
			<div class="introduce_1"><img src="img/bmintro_1.jpg" width="750px"></div>
			
         	<div class="featured"><h3><img src="img/icon_1.png" width="20px" height="22px"> &nbsp;&nbsp;BUSINESS MODEL</h3></div>
			<div class="introduce_1"><img src="img/bmintro_2.jpg" width="750px">
			 <h3>공간에 가치를 더합니다</h3></div>
			 <div id="align"> 
			<div id="contents"> 
         	 <h7><font color="#959595"></font>&nbsp;&nbsp;&nbsp;&nbsp;
         	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;빈 공간이 필요한 공간으로 재탄생하다 <br> &nbsp;&nbsp;&nbsp;&nbsp;
         	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RESPACE를 통한 임대인과 임차인의 연결</h7></font></div></h3>
			</div> 
      

            <div class="cara"></div>
            
            <div class="introduce_1">
			 <h3>Contact information</h3></div>
			 
            <div class="contactinfo">
                <span><b><font color="#4d4d4d">서울특별시 서대문구 창천동 연세대학교 공학원 B193</b></span></font>  
            </div>
            
            <div class="contactinfo">
                <span><b>respace@respace.co.kr</b></span>    
            </div>
     
            
            <hr class="cleanit">
            
            
             <div id="map_canvas" style="width:100%; height:300px;"></div>

            
            
            
            
            
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
