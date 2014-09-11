<?
	include("api/include.php");
	
	$LOGIN_TYPE = str_request("login_type");
	
	$data = array();

	if($LOGIN_TYPE === "facebook"){
		$MEM_ID = str_request("user_id");
		$MEM_NAME = str_request("name_data");
		$MEM_LINK = str_request("link_data");

		// DB 로그인 & 회원가입

		$data["num"] = 25;
		$data["name"] = $MEM_NAME;
		$data["link"] = $MEM_LINK;
		
		$_SESSION[SESSION_MEM_TYPE] = $LOGIN_TYPE;
		$_SESSION[SESSION_MEM_NUM] = 25;
		$_SESSION[SESSION_MEM_ID] = $MEM_ID;
		$_SESSION[SESSION_MEM_NAME] = $MEM_NAME;
//		$_SESSION[SESSION_MEM_PICTURE] = $MEM_LINK;

		json_result($data);
//		go("respace.html");
	}
	else if($LOGIN_TYPE === "email"){
		$MEM_EMAIL = str_request("MEM_EMAIL");
		$MEM_PW = str_request("MEM_PW");
		$current_page = str_request("current_page");
		
		if($MEM_EMAIL == "" || $MEM_PW == ""){	
			msg("아이디나 비밀번호를 입력해주세요.",$current_page);
		}
		else{

			// DB 로그인

			$data["num"] = 127;
			$data["email"] = $MEM_EMAIL;

			
			$_SESSION[SESSION_MEM_TYPE] = $LOGIN_TYPE;
			$_SESSION[SESSION_MEM_NUM] = 127;
			$_SESSION[SESSION_MEM_ID] = $MEM_EMAIL;
			$_SESSION[SESSION_MEM_NAME] = "관리자";

//			msg("이메일 : ".$MEM_EMAIL."\n회원번호 : ".get_mem_num());
			go($current_page);
		}	
	}
	else if($LOGIN_TYPE === "emailjoin"){
		$MEM_EMAIL = str_request("MEM_EMAIL");
		$MEM_PW = str_request("MEM_PW");
		$MEM_NAME = str_request("MEM_NAME");
		$current_page = str_request("current_page");
		
		if($MEM_EMAIL == "" || $MEM_PW == "" || $MEM_NAME == ""){	
			msg("형식에 맞게 입력해주세요.",$current_page);
		}
		else{

			// DB 회원가입

			$data["num"] = 127;
			$data["email"] = $MEM_EMAIL;

			$_SESSION[SESSION_MEM_TYPE] = $LOGIN_TYPE;
			$_SESSION[SESSION_MEM_NUM] = 127;
			$_SESSION[SESSION_MEM_ID] = $MEM_EMAIL;
			$_SESSION[SESSION_MEM_NAME] = $MEM_NAME;

//			msg("이메일 : ".$MEM_EMAIL."\n회원번호 : ".get_mem_num());
//			go($current_page);
			msg("회원가입 되었습니다.",$current_page);
		}	
	}
	
?>