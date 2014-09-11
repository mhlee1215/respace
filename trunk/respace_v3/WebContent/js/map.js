// 위도 - Lat - 세로 - 37.xxx
// 경도 - Lng - 가로 - 127.xxx

var map;
var geocoder;
var map_zoom = 15;
var min_distance = 0.001;

var infowindow = new google.maps.InfoWindow();
var markersArray = new Array();

// 현재 맵 정보
var map_info = new Array();
map_info["zoom"] = 15;
map_info["width"] = 0.03051280975341797;
map_info["height"] = 0.028508139616555184;
map_info["southwest"] = new Array();	// 남서
map_info["southwest"][0] = 37.546609566674626;	map_info["southwest"][1] = 126.92018459512326;
map_info["southeast"] = new Array();	// 남동
map_info["southeast"][0] = 37.546609566674626;	map_info["southeast"][1] = 126.95069740487668;
map_info["northwest"] = new Array();	// 북서
map_info["northwest"][0] = 37.57511770629118;	map_info["northwest"][1] = 126.92018459512326;
map_info["northeast"] = new Array();	// 북동
map_info["northeast"][0] = 37.57511770629118;	map_info["northeast"][1] = 126.95069740487668;

// 초기 지도 정보값
// 줌 - 15
// 가로 - 0.03051280975341797
// 세로 - 0.028508139616555184
// 북동 - 37.57511770629118, 126.95069740487668
// 북서 - 37.57511770629118, 126.92018459512326
// 남서 - 37.546609566674626, 126.92018459512326
// 남동 - 37.546609566674626, 126.95069740487668

//마커 줌, 마커 중요도에 따른 마커 출력
// 16 - 5
// 15 - 4
// 14 - 3
// 13 - 2
// 12 - 1
// 11 - 0

// 지역별 가운데 좌표
var center_latlng = new Array();
center_latlng[0] = [37.560865, 126.935441, "신촌/홍대/상수", 0];
center_latlng[1] = [37.570267, 126.987510, "종로/삼청/인사", 0];
center_latlng[2] = [37.536504, 127.000765, "이태원/한남", 0];
center_latlng[3] = [37.500759, 127.036451, "강남/역삼/논현", 0];
center_latlng[4] = [37.520679, 127.031837, "신사/압구정", 0];

// 주소기반 마커 배열
var address_maker = new Array();


// 신촌 37.560865, 126.935441
// 종로 37.570267, 126.987510
// 이태원 37.536504, 127.000765
// 강남 37.500759, 127.036451
// 신사 37.520679, 127.031837


// 지도에 나타날 마커
var latlng = new Array();
/*
latlng[0] = [37.583524, 127.054240,"테스트1"];
latlng[1] = [37.585292, 127.060956,"테스트2"];
latlng[2] = [37.583710, 127.060066,"테스트2"];
latlng[3] = [37.586924, 127.060302,"테스트2"];
latlng[4] = [37.586879, 127.056573,"테스트2"];
*/

latlng[0] = [37.560865, 126.935441, "테스트1", 0];
latlng[1] = [37.556202, 126.935910, "테스트2", 1];
latlng[2] = [37.558977, 126.940639, "테스트3", 2];
latlng[3] = [37.559079, 126.929760, "테스트4", 3];
latlng[4] = [37.555439, 126.939888, "테스트5", 4];
latlng[5] = [37.557855, 126.935382, "테스트6", 5];

var test_num = 6;

latlng[6] = [37.566575, 126.922678, "테스트7", 3];
latlng[7] = [37.568598, 126.915266, "테스트8", 2];
latlng[8] = [37.556550, 126.923008, "테스트9", 4];
latlng[9] = [37.545685, 126.922930, "테스트10", 5];
latlng[10] = [37.549879, 126.914475, "테스트11", 4];
latlng[11] = [37.556697, 126.945851, "테스트12", 5];

latlng[12] = [37.570267, 126.987510, "종로/삼청/인사", 0];
latlng[13] = [37.536504, 127.000765, "이태원/한남", 0];
latlng[14] = [37.500759, 127.036451, "강남/역삼/논현", 0];
latlng[15] = [37.520679, 127.031837, "신사/압구정", 0];


function initialize() {
	geocoder = new google.maps.Geocoder();
	var mapOptions = {
		center: new google.maps.LatLng(37.560865, 126.935441), // 위치 좌표 작성
		zoom: map_zoom, // 초기 확대값
		scaleControl: false,
		panControl: false,
		zoomControl: true,
		mapTypeControl: false,
		streetViewControl: false,
		overviewMapControl: false
	};

	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	
	// 지도 줌 변경 이벤트
	google.maps.event.addListener(map, 'zoom_changed', function(event) {
		getMapInfo(map);
		removeAllMarker();
		setMarkers();
	});

	// 지도 드래그 시작 이벤트
	google.maps.event.addListener(map, 'dragstart', function(event){

	});
	
	// 지도 드래그 끝난뒤 이벤트
	google.maps.event.addListener(map, 'dragend', function(event){
		var before_lat = map_info["northeast"][0];
		
		getMapInfo(map);
		
		// 맵 이동한 수치
		var move_distance = Math.abs(before_lat - map_info["northeast"][0]);
		
		// min_distance - 0.001
		// 15 - 0.001
		// 14 - 0.002
		// 13 - 0.003
		
		// 맵 움직임이 적어 갱신이 필요없을 경우
		if(map_info["zoom"] < map_zoom && move_distance < min_distance*(map_zoom - map_info["zoom"])){
			// alert("갱신 필요없음\n" + map_info["zoom"] + "\n" + move_distance);
			
			// 마커 갱신 필요없음
		}
		// 맵 움직임이 커서 갱신이 필요할 경우
		else{
			//// 서버에서 해당 좌표 데이터 얻어오기
			
			removeAllMarker();
			setMarkers();
			
//			alert(map_info["zoom"] + "\n" + move_distance);
			
			// 마커 갱신
//			var marker_latlng = new google.maps.LatLng(map_southwest, map_northeast);
//			addMarker(marker_latlng);
		}
	});
	
	// 지도 클릭 이벤트
	google.maps.event.addListener(map, 'click', function(event){
		infowindow.close();
	});
	
	// 브라우저 크기 변경 이벤트
	google.maps.event.trigger(map, "resize");
	
	// 지도 모두 로딩된 후에 한번 실행될 이벤트
	google.maps.event.addListenerOnce(map, 'idle', function(){
	    //loaded fully
		/*
		var address = "서울특별시 동대문구 전농동 270번지";
		document.getElementById('address').value = address;
		codeAddress();
		*/ 
	});
	
	/*
	//// ajax() 서버에서 초기 좌표 데이터 얻어오기
	$.ajax({
		url: "",
		dataType: 'JSON',
		data: {
			what : "map"
		},
		success: function(data){
			for(var k=0; k<data.length; k++){
				address_maker[k] = new Array();
				address_maker[k]["num"] = data[k].num;
				address_maker[k]["author"] = data[k].author;
				address_maker[k]["address"] = data[k].address;			
			}
		}
	});
	
	for (var j=0; j < address_maker.length;j++){
		codeAddress(address_maker["address"]);
	}
	*/
	
	// 초기 마커 세팅
	setMarkers();
}


// 현재 지도의 값 얻는 함수
function getMapInfo(map){
	// lat, lng
	var bounds =  map.getBounds();
	map_info["southwest"][0] = bounds.getSouthWest().lat();	map_info["southwest"][1] = bounds.getSouthWest().lng();	// 남서
	map_info["northeast"][0] = bounds.getNorthEast().lat();	map_info["northeast"][1] = bounds.getNorthEast().lng();	// 북동
	map_info["width"] = map_info["northeast"][1] - map_info["southwest"][1];		// 가로 길이
	map_info["height"] = map_info["northeast"][0] - map_info["southwest"][0];		// 세로 길이
	map_info["southeast"][0] = map_info["southwest"][0]; map_info["southeast"][1] =  map_info["southwest"][1] + map_info["width"]; // 남동
	map_info["northwest"][0] = map_info["northeast"][0]; map_info["northwest"][1] =  map_info["northeast"][1] - map_info["width"]; // 북서
	map_info["zoom"] = map.getZoom();	// 맵의 줌
	
//	alert("줌 : " + map_info["zoom"] + "\n가로 : " + map_info["width"] + "\n세로 : " + map_info["height"] + "\n\n북동 : " + map_info["northeast"] + "\n북서 : " + map_info["northwest"] + "\n남서 : " + map_info["southwest"] + "\n남동 : " + map_info["southeast"]);
}

// 마커 출력 함수
function setMarkers() {
	for (var i = 0; i < latlng.length; i++){
		// 현재 맵 범위 안에 해당할 경우 출력
		if(latlng[i][3] <= map_info["zoom"]-11 && latlng[i][0] < map_info["northeast"][0] && latlng[i][0] > map_info["southeast"][0] && latlng[i][1] < map_info["northeast"][1] && latlng[i][1] > map_info["northwest"][1]){
			var marker_latlng = new google.maps.LatLng(latlng[i][0], latlng[i][1]);
			addMarker(marker_latlng);
		}
	}
	
	// 마커가 하나도 없을 경우
	if(check_marker() == 0){
		$('.space-no-list').css("display","block");
		$('.space-list-content').css("display","none");
	}
	else{
		$('.space-no-list').css("display","none");
		$('.space-list-content').css("display","block");
		//// list에 정보 뿌려주기
	}
}


// 마커 한개 출력 함수
function addMarker(marker_latlng) {
	marker = new google.maps.Marker({
		position: marker_latlng,
		map: map,
		title: "테스트"
	});
	markersArray.push(marker);

	//지도에 출력된 마커를 클릭했을 경우 이벤트(infoWindow 출력)
	google.maps.event.addListener(marker, 'click', function (event){
		popInfoWindow(marker_latlng);
	});
}

// 맵의 모든 마커 지우기
function removeAllMarker(){
    while(markersArray.length){
    	markersArray.pop().setMap(null);
    }	
}

// infoWindow 출력
function popInfoWindow(marker_latlng){
	var geocoder = new google.maps.Geocoder();
//	map.setCenter(marker_latlng);
	addMarker(marker_latlng);	//마커출력
	
	geocoder.geocode({'latLng': marker_latlng}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[1]) {
				var contentString =
					'<div id="content" style="width:200px;height:200px;">'+
						'<br><div id="adress">'+
						'<b>Respace</b>'+
						'<br></div>'+
						'<p>' +
						'<b>주소 :</b> ' +results[1].formatted_address+
						'</p>'+
					'</div>';
				infowindow.setContent(contentString);
				infowindow.open(map, marker);
//				infowindow.setPosition(marker_latlng);
			} else {
				alert("No results found");
			}
		}else{
			alert("Geocoder failed due to: " + status);
		}
	});
}

// 요구하는 조건에 해당하는 마커가 있는지 확인하는 함수
function check_marker(){
	return markersArray.length;
}

/*
//브라우저창 크기에 따른 지도 중심이동
google.maps.event.addDomListener(window, "resize", function() {
	google.maps.event.trigger(map, "resize");
	
	getMapInfo(map);
	removeAllMarker();
	setMarkers();
	
	var center = map.getCenter();
	map.setCenter(center);
});
*/

// 주소 기반으로 마커 찍는 함수
function codeAddress() {
	var address = document.getElementById('address').value;
    
    geocoder.geocode({
        'address': address
    }, function(results, status) {
    	alert(address + "\n" + results[0].geometry.location);
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            addMarker(results[0].geometry.location);
            
            /*
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
            */
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}

google.maps.event.addDomListener(window, 'load', initialize);
