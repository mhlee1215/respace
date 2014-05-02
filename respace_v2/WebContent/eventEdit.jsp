<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>

<title>RESPACE :: 공간에 가치를 더합니다</title>

<link rel="stylesheet" href="reset.css" type="text/css">
<link rel="stylesheet" href="style.css" type="text/css">

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDWbQkciXXMXPhb2PBb3x-VUpID2LWVLio&sensor=true"></script>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext'	rel='stylesheet' type='text/css'>

<script src="js/fileupload/jquery-1.8.2.min.js"></script>
<script src="js/fileupload/vendor/jquery.ui.widget.js"></script>
<script src="js/fileupload/jquery.fileupload.js"></script>
<script src="js/fileupload/bootstrap.min.js"></script>

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
	padding: 0px 21px;
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

ul.tabs li.active {
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
	font-color: #777;
}
</style>

<style type="text/css">
ul.price {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #999999;
	border-left: 1px solid #999999;
	width: 100%;
}

ul.price li {
	float: left;
	margin: 0;
	cursor: pointer;
	padding: 0px 15px;
	height: 31px;
	line-height: 31px;
	border: 1px solid #999999;
	border-left: none;
	font-weight: bold;
	font-color: #777;
	font-family: 'Nanum Gothic';
	background: #EEEEEE;
	overflow: hidden;
	position: relative;
}

ul.price li:hover {
	background: #CCCCCC;
}

ul.price li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.price_container {
	border: 1px solid #999999;
	border-top: none;
	clear: both;
	float: left;
	width: 100%;
	background: #FFFFFF;
}

.how_much {
	padding: 10px;
	font-size: 0.9em;
	display: block;
	font-weight: light;
	font-family: 'Nanum Gothic';
}
</style>
<script type="text/javascript">
	var map;
	var geocoder;
	geocoder = new google.maps.Geocoder();
	var address = '${event.address_simple}';

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
	
	var isLocationValid = false;
	function location_validate(){
		var cur_loc = $('#address_simple').val();
		 geocoder.geocode( { 'address': cur_loc}, function(results, status) {
	       	 
	    	    if (status == google.maps.GeocoderStatus.OK) {
	    	    	
	    	      map.setCenter(results[0].geometry.location);
	    	      var marker = new google.maps.Marker({
	    	          map: map,
	    	          position: results[0].geometry.location
	    	      });
	    	      $('#loc_verified_img').show();
	    	    } else {
	    	      alert('올바른 지명을 입력해 주세요. (찾지 못할시 근처 지명을 입력해주면 됩니다.)');
	    	      $('#loc_verified_img').hide();
	    	    }
	    	  });
		//initialize();
		 event.preventDefault();
	}
	
	function copy_from_simple_to_detail(){
		var cur_loc = $('#address_simple').val();
		$('#address_full').val(cur_loc);
	}
	
	$(document).ready(function() {
		$('#tab_picture_content').show();
		$('#tab_map_content').show();
		$('#tab_schedule_content').show();
		$(".how_much").show();
		
		
		$("#id_button_update")
		  .click(function( event ) {
			   var str = $("#event_edit_form").serialize();

			   $.ajax({
				    type:"post",
				    data:str,
				    url:"eventEditSubmit.do",
				    async: false,
				    success: function(msg){
				    	if( msg == 'success')
				       		alert('업데이트 성공!');
				    	 	document.location = 'eventDetail.do?id=${event.id}';
				    }
				});
		   event.preventDefault();
		  });
		
		$("#id_button_delete")
		  .click(function( event ) {

			  var str = $("#event_edit_form").serialize();
			  if(confirm('정말 지웁니까?')){
				  $.ajax({
					    type:"post",
					    data:str,
					    url:"eventDelete.do",
					    async: false,
					    success: function(msg){
					    	if( msg == 'success'){
					    		 document.location = 'event.do';
					    	}
					    }
					});
			  }
			  
		   event.preventDefault();
		  });
	});
	
	function blank(){
		
	}
</script>
</head>

<body onload="initialize()">
	<form id="event_edit_form" >
	<input type="hidden" name="id" value="${event.id}"/>
	<input type="hidden" name="status" value="V"/>
	<!-- *********  Header  ********** -->

	<%@include file="header.jsp"%>
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
		<h3>
			<label>공간명: </label><input type="text" value="${event.name}" name="name"></input>
		</h3>
		</font>

		<p class="teamline"></p>
		<div class="cara"></div>
		<hr class="cleanit">

			<!-- **** Details **** -->

			<div class="left_portfolio" style="overflow: auto; height: 100%;">

				<ul id="tab_picture" class="tabs">
					<li class="active" rel="tab1">사진</li>
				</ul>

				<div id="tab_picture_container" class="tab_container">

					<div id="tab_picture_content" class="tab_content">
						
						<iframe width="660" height="450" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="imageSlider.do?id=${event.id}&type=event&readOnly=N"> 
                		</iframe>




					</div>
				</div>
				<hr class="cleanit">
					<ul class="tabs">
						<li class="active" rel="tab2">지도</li>
					</ul>

					<div class="tab_container">


						<div id="tab_map_content" class="tab_content">
							<fieldset class="l2_fieldset">
								<legend class="l2_fieldset_legend">주소 (지도 검색용) - 노출되는
									맵의 위치는 지도검색용에 근거해 만들어집니다.</legend>
								<input type="text" id="address_simple" name="address_simple"
									value="${event.address_simple}" style="width: 80%"></input>
									<button onclick="location_validate();">Validate</button> 
									<img id="loc_verified_img" src="img/icons/verified-icon.png" style="width:30px;height:30px;display:none" alt="" />
								<br> 
								<legend	class="l2_fieldset_legend">주소 (상세)</legend> 
								<input
									type="text" id="address_full" name="address_full"
									style="width: 80%" value="${event.address_full }"></input>
								<input type="checkbox" onchange="copy_from_simple_to_detail();"></input>
								위와 동일
							</fieldset>

							<div class="mapevent">
								<div id="map_canvas" style="width: 100%; height: 360px;"></div>

							</div>
							<br />

						</div>
						<!-- #tab2 -->


					</div>
					<hr class="cleanit">
						<ul class="tabs">
							<li class="active" rel="tab3">일정</li>
						</ul>

						<div class="tab_container">



							<div id="tab_schedule_content" class="tab_content">


								<strong> 현재 가능한 예약 일정을 알려드립니다.
									<p>
								</strong>
								</p>
								<br />

							</div>
							<!-- #tab3 -->

						</div>
						<!-- .tab_container -->

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
						<b><input type="text" value="${event.price_hour}" name="price_hour"
							style="width: 40%; display: inline" /> \</b><span>/Per Hour</span> <br><br>
					</div>
					<!-- #price0 -->

					<div id="price1" class="how_much">
						<h5>Standard Rental Rate</h5>
						<b><input type="text" value="${event.price_day}" style="width: 40%;" name="price_day"/>
							\</b><span>/Per Day</span> <br><br>
					</div>
					<!-- #price1 -->
					<div id="price2" class="how_much">
						<h5>Standard Rental Rate</h5>
						<b><input type="text" value="${event.price_week}" style="width: 40%;" name="price_week" />
							\</b><span>/Per Week</span>


					</div>
					<!-- #price2 -->
					<div id="price3" class="how_much">
						<h5>Standard Rental Rate</h5>
						<b><input type="text" value="${event.price_month}" style="width: 40%;" name="price_month"/>
							\</b><span>/Per Month</span>


					</div>
					<!-- #price3 -->
				</div>
				<!-- .tab_container -->
				<hr class="cleanit">
					<section class="ac-container">
					<div>
						<input id="ac-1" name="accordion-1" type="checkbox" checked /> <label
							for="ac-1"><b>비용 상세내역 보기</b></label>
						<article class="ac-small" style="overflow:auto;">
						<p>
							<b>임대료</b> <span><input type="text"
								style="width: 100px; display: inline" name="price_detail_rental" value="${event.price_detail_rental}">\</span>
							<br> <b>보증금</b> <span><input type="text"
									style="width: 100px; display: inline" name="price_detail_deposit" value="${event.price_detail_deposit}">\</span>
								<br> <b>수수료</b> <span>오픈행사중</span>
						</p>
						</article>
					</div>
					<div>
						<input id="ac-2" name="accordion-1" type="checkbox" checked /> <label
							for="ac-2"><b>공간 소개</b></label>
						<article class="ac-medium">
						<p>
							<b>수용인원</b>&nbsp;&nbsp;최대 <input type="text"
								style="width: 20px; display: inline" value="${event.accommodation_min }" name="accommodation_min"></input>-<input
								type="text" style="width: 20px; display: inline" value="${event.accommodation_max }" name="accommodation_max"></input>명
							<br><b>이용시간</b>&nbsp;&nbsp;<input type="text"
								style="width: 50px; display: inline" name="open_date" value="월-금"></input>
								<input type="text" style="width: 20px; display: inline"
								value="10:00" name="open_time"></input>-<input type="text"
								style="width: 20px; display: inline" value="22:00" name="close_time"></input> <br><b>구비시설</b>&nbsp;&nbsp;<input
									type="text" style="width: 120px; display: inline"
									value="${event.facilities_list }" name="facilities_list"></input>
						</p>

						</article>
					</div>
					</section>
			</div>

			<hr class="cleanit">

				<div class="story_portfolio" style="height: 100%">




					<fieldset class="l2_fieldset" style="padding: 10px;">
						<legend class="l2_fieldset_legend">공간소개 (구현안됨)</legend>
						<textarea  rows="3"
							style="width: 100%;" name="review"></textarea>
					</fieldset>
					<fieldset class="l2_fieldset" style="padding: 10px;">
						<legend class="l2_fieldset_legend">이용후기 (구현안됨)</legend>
						<textarea  rows="3"
							style="width: 100%"></textarea>
					</fieldset>

				</div>

				<hr class="cleanit">

					<div style="float: right;">

						<a href="javascript:blank();" class="button_light" id="id_button_update"
							style="float: left">UPDATE</a>
						<a href="event.do" class="button_light" id="id_button_update"
							style="float: left">CANCEL</a> 
						<a href="javascript:blank();" class="button_light" id="id_button_delete"
							style="float: left">DELETE</a>
					</div>
	</div>


	<div id="dialog-modal" title="Now uploading.." style="overflow: hidden;">
	  	<div id="progress" class="progress" >
	    	<div class="bar" style="width: 0%;"></div>
		</div>
	</div>
	
	
</form>

	<!-- *********  Footer  ********** -->
	<%@include file="footer.jsp"%>

</body>
</html>
