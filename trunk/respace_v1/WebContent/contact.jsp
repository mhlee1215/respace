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
    var address = '서울특별시, 서대문구 연세로 50';
    
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
        
            <h2>Contact</h2>
       
            
            <c:if test="${send_message_complete	 == 'true'}">
            <script type="text/javascript">
			alert('메시지를 정상적으로 보냈습니다.');
			</script>
			</c:if>
            </div>
            
        </div>
        
        
        <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            
            <!-- *** contact form *** -->
           <h3>About RESPACE</h3>
           <span>여기에 통이미지 사업제안서 이미지 들어가자 헤ㅜ</span>
           <div class="cara"></div>
            
           <h3>Leave a message</h3>
           
           <form action="leave_message.do" method="post" class="formit">
                <input type="text" name="name" placeholder="YOUR NAME"/>
                <input type="text" name="email" placeholder="EMAIL"/>
                <input type="text" name="website" placeholder="WEBSITE (OPTIONAL)"/>
                <textarea name="content" placeholder="Leave your message here..."></textarea>
                <input type="submit" class="button_submit" value="SEND A MESSAGE">
            </form>

            <div class="cara"></div>
            
            <h3>Contact information</h3>
            
            <div class="contactinfo">
                <span class="ico_mapmark"><b>서울특별시, 서대문구 연세로 50</b></span>    
            </div>
            
            <div class="contactinfo">
                <span class="ico_message"><b>respace@respace.co.kr</b></span>    
            </div>
     
            
            <hr class="cleanit">
            
            
            <div id="map_canvas" style="width:100%; height:300px;"></div>

            
            
            
            
            
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
