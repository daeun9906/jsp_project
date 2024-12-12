/**
 * 
 */

function LoginCheck(){
	
	if (document.LoginForm.adminID.value.length == 0){
		alert("관리자 아이디는 필수 입력입니다.");
		document.LoginForm.adminID.focus();
		return false;
	}
	
	if (document.LoginForm.adminPW.value.length == 0){
			alert("관리자 비밀번호는 필수 입력입니다.");
			document.LoginForm.adminPW.focus();
			return false;
		}
	
	return True
	
}