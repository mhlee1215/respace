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
	var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
	var twoDigitDate = ((fullDate.getDate().length+1) === 1)? (fullDate.getDate()) : '0' + (fullDate.getDate());
	var currentDate = fullDate.getFullYear() + " / " + twoDigitMonth + " / " + twoDigitDate;
	$("#calendar1").val(currentDate);
});


// 대여기간 선택 시 마커 갱신
function ChangeValue(el){
	var start_period = $("#calendar1").val();
	var end_period = $("#calendar2").val();
	
	if(start_period && end_period){
		alert(start_period + "\n" + end_period);
	}
	
}


// 이용목적 클릭 시 마커 갱신 
function click_purpose(id) {
	var position;
	if (id == "purpose_1") {
		position = new google.maps.LatLng(center_latlng[0][0], center_latlng[0][1]);
	} else if (id == "purpose_2") {
		position = new google.maps.LatLng(center_latlng[1][0], center_latlng[1][1]);
	} else if (id == "purpose_3") {
		position = new google.maps.LatLng(center_latlng[2][0], center_latlng[2][1]);
	} else if (id == "purpose_4") {
		position = new google.maps.LatLng(center_latlng[3][0], center_latlng[3][1]);
	} else if (id == "purpose_5") {
		position = new google.maps.LatLng(center_latlng[4][0], center_latlng[4][1]);
	} else if (id == "purpose_6") {
		position = new google.maps.LatLng(center_latlng[0][0], center_latlng[0][1]);
	}
	
	// 맵 위치 이동 및 마커 설정
	map.setCenter(position);
	getMapInfo(map);
	removeAllMarker();
	setMarkers();
}

// 지역선택 시 지도 위치 이동하고 마커 갱신
function click_space(id) {
	var position;
	if (id == "space_1") {
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
		*/
		/*
		var next_url = 'login.html';
		location.replace(next_url);
		*/
	} else if (id == "space_2") {
		position = new google.maps.LatLng(center_latlng[1][0], center_latlng[1][1]);
	} else if (id == "space_3") {
		position = new google.maps.LatLng(center_latlng[2][0], center_latlng[2][1]);
	} else if (id == "space_4") {
		position = new google.maps.LatLng(center_latlng[3][0], center_latlng[3][1]);
	} else if (id == "space_5") {
		position = new google.maps.LatLng(center_latlng[4][0], center_latlng[4][1]);
	}
	
	// 맵 위치 이동 및 마커 설정
	map.setCenter(position);
	getMapInfo(map);
	removeAllMarker();
	setMarkers();
}

// 임대가격 클릭 시 마커 갱신
function click_price(id) {
	var position;
	if (id == "price_1") {
		position = new google.maps.LatLng(center_latlng[0][0], center_latlng[0][1]);
	} else if (id == "price_2") {
		position = new google.maps.LatLng(center_latlng[1][0], center_latlng[1][1]);
	} else if (id == "price_3") {
		position = new google.maps.LatLng(center_latlng[2][0], center_latlng[2][1]);
	} else if (id == "price_4") {
		position = new google.maps.LatLng(center_latlng[3][0], center_latlng[3][1]);
	}
	
	// 맵 위치 이동 및 마커 설정
	map.setCenter(position);
	getMapInfo(map);
	removeAllMarker();
	setMarkers();
}