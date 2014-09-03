<?
	$_CONNECTION["respace"] = array(
		"host" => "localhost",
		"user" => "respace",
		"pw" => "fltmvpdltm",
		"db" => "respace"
	);
	
//	ini_set("include_path", $_SERVER["DOCUMENT_ROOT"] . "/include");
//	ini_set("include_path", $_SERVER["DOCUMENT_ROOT"] . "/api");
	
	define("SESSION_MEM_TYPE", "respace_mem_type");
	define("SESSION_MEM_NUM", "respace_mem_num");
	define("SESSION_MEM_ID", "respace_mem_id");
	define("SESSION_MEM_NAME", "respace_mem_name");
	define("SESSION_MEM_PICTURE", "respace_mem_picture");
	
//	define("UPLOAD_ROOT", $_SERVER["DOCUMENT_ROOT"] . "/WebContent/upload");
	
	define("RESULT_OK", 200);
	
	define("ERROR_NO_FAIL", 101);
	define("ERROR_NO_GRANT", 102);
	define("ERROR_NO_LOGIN", 103);
	define("ERROR_NEED_LOGIN", 104);
	
	$_ERROR_MESSAGE[ERROR_NO_FAIL] = "요청실패";
	$_ERROR_MESSAGE[ERROR_NO_GRANT] = "권한이 없습니다.";
	$_ERROR_MESSAGE[ERROR_NO_LOGIN] = "로그인에 실패하였습니다.";
	$_ERROR_MESSAGE[ERROR_NEED_LOGIN] = "로그인이 필요합니다.";
?>
