/**
 * 
 */


function joinCheck(){
	if (document.joinForm.userID.value.length == 0){
		// 0 대신 최소 글자수를 지정하는 것도 방법
		alert("아이디는 필수 입력입니다.")
		document.joinForm.userID.focus() //해당 폼 위치로 커서 이동 
		return false;
	} 
	
	
	if (document.joinForm.userPW.value.length == 0){
		alert("비밀번호는 필수 입력입니다.")
		document.joinForm.userPW.focus() //해당 폼 위치로 커서 이동 
		return false;
	} 
		
		
	if (document.joinForm.userEmail.value.length == 0){
		alert("이메일는 필수 입력입니다.")
		document.joinForm.userEmail.focus() //해당 폼 위치로 커서 이동 
		return false;
	} 
		
	
	return True; // 여기까지 와야 정상 제출
	
	
	
	
}