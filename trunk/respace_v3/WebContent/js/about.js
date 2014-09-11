/*
$(document).ready(function() {
    $('#contact-button').click(function() {
    	
    });
});
*/

function onSubmitContact(form) {
	if (!notEmpty(form.contact_category, "카테고리를 선택해주세요.")) {
		form.contact_category.focus();
		return false;
	}
	if (!notEmpty(form.contact_email, "이메일을 입력해주세요.")) {
		form.contact_email.focus();
		return false;
	}
	if (!notEmpty(form.contact_content, "내용을 입력해주세요.")) {
		form.contact_content.focus();
		return false;
	}

	return true;
}
