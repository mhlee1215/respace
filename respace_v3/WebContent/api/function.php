<?

function array_request($name){
	return is_array($_REQUEST[$name]) ? $_REQUEST[$name] : array();
}

function bool_request($name) {
	return $_REQUEST[$name] ? true : false;
}

function str_request($name) {
	return trim(strval($_REQUEST[$name]));
}

function int_request($name) {
	return intval($_REQUEST[$name]);
}

function float_request($name) {
	return floatval($_REQUEST[$name]);
}

function file_request($name) {
	return $_FILES[$name];
}

function get_default($value, $default){
		return !$value ? $default  : $value;
}

function login($mem_id, $mem_pw, $type) {
	if($type == "etov"){
		$member = mysql::get() -> get_record("select A.MEM_NAME,B.* from MEMBER AS A,(select * from ETOV_MEMBER where MEM_ID = '$mem_id' and MEM_PW = password('$mem_pw')) AS B 
												where A.MEM_NUM = B.MEM_NUM");
	}
	else if($type == "facebook"){
		$member = mysql::get() -> get_record("select A.MEM_NAME,B.* from MEMBER AS A,(select * from FB_MEMBER where FB_CODE = '$mem_id') AS B where A.MEM_NUM=B.FB_MEM");
	}
	else if($type == "twitter"){
		$member = mysql::get() -> get_record("select A.MEM_NAME,B.* from MEMBER AS A,(select * from TW_MEMBER where TW_CODE = '$mem_id') AS B where A.MEM_NUM=B.TW_MEM");
	}
	else if($type == "kakao"){
		$member = mysql::get() -> get_record("select A.MEM_NAME,B.* from MEMBER AS A,(select * from KAKAO_MEMBER where KAKAO_CODE = '$mem_id') AS B where A.MEM_NUM=B.KAKAO_MEM");
	}
	
	if(!$member) {
		return false;
	}
	
	// 세션 변수 생성
	$_SESSION[SESSION_MEM_TYPE] = $type;
	if($type == "etov"){
		$_SESSION[SESSION_MEM_NUM] = $member["MEM_NUM"];
		$_SESSION[SESSION_MEM_ID] = $member["MEM_ID"];
		$_SESSION[SESSION_MEM_NAME] = $member["MEM_NAME"];
		$_SESSION[SESSION_MEM_PICTURE] = $member["MEM_PICTURE"];
	}
	else if($type == "facebook"){
		$_SESSION[SESSION_MEM_NUM] = $member["FB_MEM"];
		$_SESSION[SESSION_MEM_ID] = $member["FB_CODE"];
		$_SESSION[SESSION_MEM_NAME] = $member["MEM_NAME"];
		$_SESSION[SESSION_MEM_PICTURE] = $member["FB_PIC_URL"];
		$_SESSION[SESSION_MEM_LINK] = $member["FB_LINK"];
	}
	else if($type == "twitter"){
		$_SESSION[SESSION_MEM_NUM] = $member["TW_MEM"];
		$_SESSION[SESSION_MEM_ID] = $member["TW_CODE"];
		$_SESSION[SESSION_MEM_NAME] = $member["MEM_NAME"];
		$_SESSION[SESSION_MEM_PICTURE] = $member["TW_PIC_URL"];
		$_SESSION[SESSION_S_NAME] = $member["TW_SNAME"];
	}
	else if($type == "kakao"){
		$_SESSION[SESSION_MEM_NUM] = $member["KAKAO_MEM"];
		$_SESSION[SESSION_MEM_ID] = $member["KAKAO_CODE"];
		$_SESSION[SESSION_MEM_NAME] = $member["MEM_NAME"];
		$_SESSION[SESSION_MEM_PICTURE] = $member["KAKAO_PICTURE"];
	}
	
	return true;
}

function is_login() {
	return $_SESSION[SESSION_MEM_NUM] ? true : false;
}

function valid_login() {
	if(!is_login()) {
		error(ERROR_NEED_LOGIN, "/etovWeb/index.html");
	}
}

function get_mem_num()
{
	return $_SESSION[SESSION_MEM_NUM];
}

function get_mem_id()
{
	return $_SESSION[SESSION_MEM_ID];
}

function get_mem_name() {
	return $_SESSION[SESSION_MEM_NAME];
}

function get_mem_picture()
{
	return $_SESSION[SESSION_MEM_PICTURE];
}

function get_mem_link()
{
	return $_SESSION[SESSION_MEM_LINK];
}

function get_mem_type()
{
	return $_SESSION[SESSION_MEM_TYPE];
}

function replace_uri($name, $value) {
	$pattern = "/$name=[^&]*/";
	$param = "$name=" . urlencode($value);
	if(preg_match($pattern, $_SERVER["QUERY_STRING"])) {
		return "?" . preg_replace($pattern, $param, $_SERVER["QUERY_STRING"]);
	}
	else {
		return "?$_SERVER[QUERY_STRING]&$param";  
	}
}

function create_pagination($page, $count, $limit, $pageLimit) {
	$html = '<ul>';
	$totalPage = ceil($count / $limit);
	$startPage = floor(($page - 1) / $pageLimit) * $pageLimit + 1;
	$endPage = ceil($page / $pageLimit) * $pageLimit;
	$max = min($totalPage, $endPage);
	if($startPage - 1) {
		$html .= '<li><a href="' . replace_uri("page", $startPage - 1) . '">Prev</li>';
	}
	
	for($i = $startPage; $i <= $max; ++$i) {
		$html .= '<li ' . ($i == $page ? 'class="active"' : '') . '><a href="' . replace_uri("page", $i) . '">' . $i . '</li>';
	}
	
	if($endPage + 1 <= $totalPage) {
		$html .= '<li><a href="' . replace_uri("page", $endPage + 1) . '">Next</li>';
	}
	$html .= '</ul>';
	
	return $html;
}

function upload_file($type, $name, $ori = ""){
	$file = file_request($name);
	if(!$file || !is_uploaded_file($file["tmp_name"]))
		return $ori;
	
	$ext = array_pop(explode(".", $file["name"]));
	$file_name = date("YmdHis");
	$full_path = UPLOAD_ROOT . "/$type/$file_name.$ext";
	if(!move_uploaded_file($file["tmp_name"], $full_path))
		return "";
	
	$info_image=getimagesize($full_path);	// 이미지 정보
//	$image_save = UPLOAD_ROOT . "/$type/mobile/$file_name.$ext";;				// 실제로 저장할 위치 + 파일명
	$image_save = $full_path;
	$resize_width = 720;		// 리사이징 할 가로사이즈
	$resize_height = 720;		// 리사이징 할 세로사이즈
	
	// 일정 이상 클 경우 리사이징
	if($info_image[0] > $resize_width || $info_image[1] > $resize_height){
		// 이미지 타입을 알아내기
		if($info_image[2] == IMAGETYPE_JPEG){
			$new_image=imagecreatefromjpeg($full_path);
		}
		else if($info_image[2] == IMAGETYPE_PNG){
			$new_image=imagecreatefrompng($full_path);
		}
		else if($info_image[2] == IMAGETYPE_GIF){
			$new_image=imagecreatefromgif($full_path);
		}
		else if($info_image[2] == IMAGETYPE_BMP){
			$new_image=imagecreatefromwbmp($full_path);
		}
		else if($info_image[2] == IMAGETYPE_WBMP){
			$new_image=imagecreatefromwbmp($full_path);
		}

		// 이미지 리사이징
		if($new_image){
			$width = $resize_width;	// 섬네일 가로 사이즈 (지정)
			$ratio = $width / $info_image[0];	// 가로 세로 비율 조정
			$height= $info_image[1] * $ratio; 	// 섬네일 세로 사이즈
			
			// 캔버스를 엽니다 (캔버스 사이즈는 이미지의 사이즈)
			$canvas=imagecreatetruecolor($width,$height);
			imagecopyresampled($canvas,$new_image,0,0,0,0,$width,$height,$info_image[0],$info_image[1]);
			
			// 이미지 복사
			if($info_image[2] == IMAGETYPE_JPEG){
				imagejpeg($canvas,$image_save);
			}
			else if($info_image[2] == IMAGETYPE_PNG){
				imagepng($canvas,$image_save);
			}
			else if($info_image[2] == IMAGETYPE_GIF){
				imagegif($canvas,$image_save);
			}
			else if($info_image[2] == IMAGETYPE_BMP){
				imagewbmp($canvas,$image_save);
			}
			else if($info_image[2] == IMAGETYPE_WBMP){
				imagewbmp($canvas,$image_save);
			}
			
			imagedestroy($new_image);
			imagedestroy($canvas);
			// 이곳에 하고 싶은 작업을 수행하면 됨
			
		}
		else{
			// 리사이징 실패할 경우 작업
		}	
	}
	
	return "$file_name.$ext";
}

function is_mobile() {
	return bool_request("mobile") || preg_match("/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i", $_SERVER["HTTP_USER_AGENT"]) || preg_match("/LG|SAMSUNG|Samsung/", $_SERVER["HTTP_USER_AGENT"]) ?  true : false; 
}

function htmlentities2($str) {
	return htmlentities($str, ENT_COMPAT, "UTF-8");
}

// 알럿 출력
function alert($msg) {
	?><meta charset="utf-8"><script>alert("<?=str_replace("\n", "\\n", $msg)?>");</script><?
}

// 이동
function go($url = -1) {
	?><script>
		<? if($url == -1) { ?>
		history.back();
		<? } else { ?>
		location.replace("<?=$url?>");
		<? }?>
	</script><?
	exit;
}

// 알럿 출력 및 이동
function msg($msg, $url = -1) {
	global $_ERROR_MESSAGE;

	alert($_ERROR_MESSAGE[$msg]? $_ERROR_MESSAGE[$msg] : $msg);
	go($url);
}

function json_result($data) {
	header("Content-Type: application/json;charset=UTF-8");
	
	$result = array();
	
	$result["data"] = $data;
	$result["code"] = RESULT_OK;
	
	print json_encode($result);
	
	exit;
}

function json_error($code) {
	global $_ERROR_MESSAGE;
	
	header("Content-Type: application/json;charset=UTF-8");
	
	$result = array();
	
	$result["message"] = $_ERROR_MESSAGE[$code] ? $_ERROR_MESSAGE[$code] : $code;
	$result["code"] = $code;
	
	print json_encode($result);
	
	exit;
}

function result($data, $url = -1) {
	$view = str_request("view");
	if($view == "json") {
		json_result($data);
	}
	else {
		msg($data, $url);
	}
	
}

function error($code, $url = -1) {
	$view = str_request("view");
	if($view == "json") {
		json_error($code);
	}
	else {
		msg($code, $url);
	}
}


function parse_etov_code($code) {
	$length = ord(substr($code, 0, 1)) - ord('A') + 1;
	return substr($code, 3 + $length, strlen($code) - 4 - $length);
}

function generate_etov_code($vote_num, $mem_num) {
	$vote_num_str = strval($vote_num);
	return chr(ord('A') + strlen($vote_num_str) - 1) . $mem_num
		. rand(0, 9)
		. rand(0, 9)
		. $vote_num_str
		. rand(0, 9);
}
?>