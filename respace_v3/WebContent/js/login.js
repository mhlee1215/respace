function fblogin() {
	var id;
    var name;
    var link;

    FB.api('/me', function (response) {
    	id = response.id;
        name = response.name;
        FB.api('/me/picture?width=35&height=35', function(response){
            link = response.data.url;
            $.ajax({
                url: "./login.php",
                dataType: 'JSON',
                data: {
                	login_type: "facebook",
                	user_id : id,
                    name_data: name,
                    link_data: link
                },
                success: function (data) {
                    alert("페북 로그인 : " + data.code + "\n이름 : " + data.data.name + "\n프로필링크 : " + data.data.link);
                    
                }
            });
        });
    });
}

function notEmpty(el, msg) {
	var $el = $(el);
	if(!$.trim($el.val())) {
		$el.focus();
		alert(msg);
		return false;
	}
	
	return true;
}

function onSubmit(form) {
	if (!notEmpty(form.MEM_EMAIL, "이메일을 입력해 주시기 바랍니다.")) {
		form.MEM_EMAIL.focus();
		return false;
	}
	if (!notEmpty(form.MEM_PW, "비밀번호를 입력해 주시기 바랍니다.")) {
		form.MEM_PW.focus();
		return false;
	}

	return true;
}

$(document).ready(function () {
    $('#facebook-btn, .fb-login').click(function () {
        FB.login(function(response){
            fblogin();
        });

    });
});