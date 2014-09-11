$(document).ready(function () {
	
	$("#calendar1").datepicker({
		minDate: 0,			// 오늘 이전은 선택 불가능
		changeMonth: true,	// 콤보 박스에 월 보이기
		changeYear: true,	// 콤보 박스에 년도 보이기
		//showOn: 'button'	// 우측에 달력 icon을 보인다
		//buttonImage: '/images/btn_cal.png',	// 우측 달력 icon의 이미지 경로
		//buttonImageOnly: true	// 달력에 아이콘 사용하기
	});
	$("#calendar2").datepicker({
		minDate: 0,			// 오늘 이전은 선택 불가능
		changeMonth: true,	// 콤보 박스에 월 보이기
		changeYear: true,	// 콤보 박스에 년도 보이기
		//showOn: 'button'	// 우측에 달력 icon을 보인다
		//buttonImage: '/images/btn_cal.png',	// 우측 달력 icon의 이미지 경로
		//buttonImageOnly: true	// 달력에 아이콘 사용하기
	});
	
	// 마우스를 손가락 모양으로 하고 여백 주기
	$('img.ui-datepicker-trigger').css({
		'cursor':'pointer',
		'margin-left':'5px',
		'margin-top':'3px'
	});
	
	// 날짜 형식을 0000-00-00으로 지정하기
	$.datepicker.setDefaults({dateFormat:'yy / mm / dd'});

	// 대여기간 첫 번째에 오늘 날짜 넣기
	var fullDate = new Date();
	var twoDigitMonth = ((fullDate.getMonth().toString().length) === 2)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
	var twoDigitDate = ((fullDate.getDate().toString().length) === 2)? (fullDate.getDate()) : '0' + (fullDate.getDate());
	var currentDate = fullDate.getFullYear() + " / " + twoDigitMonth + " / " + twoDigitDate;
	$("#calendar1").val(currentDate);
	
	start_period = currentDate;	// Default로 오늘 날짜
	
//	var address = "서울특별시 동대문구 전농동 270번지";
//  alert(address);
//  codeAddress(address); 
    
});

var start_period = "";	// 시작 날짜
var end_period = "";	// 종료 날짜
var space_purpose = [-1,-1,-1,-1,-1,-1];	// 목적 0 ~ 5
var space_region = [1,-1,-1,-1,-1];		// 지역 0 ~ 4
var space_price = [-1,-1,-1,-1];		// 금액 0 ~ 3

// 필터값을 종합하여 서버와 통신하는 함수
function space_filter(position){
	
	var text = "시작날짜 : ";
	text += start_period + "\n종료날짜 : " + end_period;
	
	text += "\n목적 : ";
	for(var i=0;i<6;i++){
		 text += space_purpose[i] + " / ";
	}
	text += "\n지역 : ";
	for(var i=0;i<5;i++){
		 text += space_region[i] + " / ";
	}
	text += "\n금액 : ";
	for(var i=0;i<4;i++){
		 text += space_price[i] + " / ";
	}
	
//	alert(text);
	
	
	////서버와 통신
	
	
	// 맵 위치 이동 및 마커 설정
	map.setCenter(position);
	getMapInfo(map);
	removeAllMarker();
	setMarkers();
}

// 대여기간 선택 시 마커 갱신
function ChangeValue(el){
	start_period = $("#calendar1").val();
	end_period = $("#calendar2").val();
	
	if(start_period && end_period){
		// 날짜 선택이 올바르지 않을 경우
		if(start_period > end_period){
			if(el.id == "calendar1"){
				alert("종료날짜보다 앞의 날짜를 선택해주세요.");
				$("#calendar1").val("");
			} else if(el.id == "calendar2"){
				alert("시작날짜보다 뒤의 날짜를 선택해주세요.");
				$("#calendar2").val("");
			}
		}
		else{
			//// 서버와 통신
			
			var position = map.getCenter();
			space_filter(position);
		}
		
	}
	
}


// 이용목적 클릭 시 마커 갱신 
function click_purpose(id) {
	var position;
	var classname = $("#" + id).attr("class");
	if(classname == "space-btn-purpose"){
		$("#" + id).attr("class","space-btn-purpose-active");
		$("#" + id).children().attr("class","space-img-purpose-active");
	} else if(classname == "space-btn-purpose-active"){
		$("#" + id).attr("class","space-btn-purpose");
		$("#" + id).children().attr("class","space-img-purpose");
	}
	
	if (id == "purpose_1") {
		space_purpose[0] *= -1;
		position = new google.maps.LatLng(center_latlng[0][0], center_latlng[0][1]);
	} else if (id == "purpose_2") {
		space_purpose[1] *= -1;
		position = new google.maps.LatLng(center_latlng[1][0], center_latlng[1][1]);
	} else if (id == "purpose_3") {
		space_purpose[2] *= -1;
		position = new google.maps.LatLng(center_latlng[2][0], center_latlng[2][1]);
	} else if (id == "purpose_4") {
		space_purpose[3] *= -1;
		position = new google.maps.LatLng(center_latlng[3][0], center_latlng[3][1]);
	} else if (id == "purpose_5") {
		space_purpose[4] *= -1;
		position = new google.maps.LatLng(center_latlng[4][0], center_latlng[4][1]);
	} else if (id == "purpose_6") {
		space_purpose[5] *= -1;
		position = new google.maps.LatLng(center_latlng[0][0], center_latlng[0][1]);
	}
	
	space_filter(position);
}

// 지역선택 시 지도 위치 이동하고 마커 갱신
function click_region(id) {
	var position;
	var classname = $("#" + id).attr("class");
	if(classname == "space-btn-region"){
		$("#" + id).attr("class","space-btn-region-active");
	} else if(classname == "space-btn-region-active"){
		$("#" + id).attr("class","space-btn-region");
	}
	
	if (id == "space_1") {
		space_region[0] *= -1;
		position = new google.maps.LatLng(center_latlng[0][0], center_latlng[0][1]);
		/*
		$("#" + id).attr("disabled", false);
		$("#etov-body").show({
			duration : 400,
			done : function() {
				$(document.body).scrollTop($(this).position().top);
			}
		});
		$("#MEM_TYPE").val(id);
		
		var next_url = 'login.html';
		location.replace(next_url);
		*/
	} else if (id == "space_2") {
		space_region[1] *= -1;
		position = new google.maps.LatLng(center_latlng[1][0], center_latlng[1][1]);
	} else if (id == "space_3") {
		space_region[2] *= -1;
		position = new google.maps.LatLng(center_latlng[2][0], center_latlng[2][1]);
	} else if (id == "space_4") {
		space_region[3] *= -1;
		position = new google.maps.LatLng(center_latlng[3][0], center_latlng[3][1]);
	} else if (id == "space_5") {
		space_region[4] *= -1;
		position = new google.maps.LatLng(center_latlng[4][0], center_latlng[4][1]);
	}
	
	
	space_filter(position);
}

// 임대가격 클릭 시 마커 갱신
function click_price(id) {
	var position;
	var classname = $("#" + id).attr("class");
	if(classname == "space-btn-price"){
		$("#" + id).attr("class","space-btn-price-active");
	} else if(classname == "space-btn-price-active"){
		$("#" + id).attr("class","space-btn-price");
	}
	
	if (id == "price_1") {
		space_price[0] *= -1;
		position = new google.maps.LatLng(center_latlng[0][0], center_latlng[0][1]);
	} else if (id == "price_2") {
		space_price[1] *= -1;
		position = new google.maps.LatLng(center_latlng[1][0], center_latlng[1][1]);
	} else if (id == "price_3") {
		space_price[2] *= -1;
		position = new google.maps.LatLng(center_latlng[2][0], center_latlng[2][1]);
	} else if (id == "price_4") {
		space_price[3] *= -1;
		position = new google.maps.LatLng(center_latlng[3][0], center_latlng[3][1]);
	}
	
	space_filter(position);
}