<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }
    </style>
    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDWbQkciXXMXPhb2PBb3x-VUpID2LWVLio&sensor=true">
    </script>
    <script type="text/javascript">
    var map;
    var geocoder;
    geocoder = new google.maps.Geocoder();
    var address = '¼­¿ï';
    
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
    <div id="map_canvas" style="width:50%; height:60%"></div>
  </body>
</html>