/**
 * 
 */

	function a_or_d(str){	// 입력 문자가 숫자나 영문자인지 검사하는 메소드
	var lower_str = str.toLowerCase();
	for(i = 0; i < lower_str.length ; i++){
		ch = lower_str.charAt(i);
		if((ch >= 'a' && ch <= 'z' )||(ch >= '0') && (ch <= '9')){
			if(i == lower_str.length-1){
				return true;
			}
		}else
			return false;
	}
}
	
	function name_check(){	// 이름의 유효성을 검사하는 메소드
	//alert("name_check");
	var userName = userinfo.name;
	if(userName.value == ""){
		alert("이름을 입력하세요");
		userName.focus();
		return false;
	}else{
		return true;
	}
}
	
	function id_validate(){	// id의 유효성을 검사하는 메소드
		//alert("id_check");	
		
		var userid = userinfo.userid;
		
		if(userid.value == ""){
			alert("아이디를 입력하세요");
			userid.focus();
			return false;
		} 
		
		if(userid.value.length < 5 || userid.value.length > 16){
			alert("5~16자 이내의 값을 입력해주세요");
			userid.focus();
			return false;
		} 
		
		if(!a_or_d(userid.value)){
			alert("아이디는 영문이나 숫자만 가능합니다")
			return false;
		}
		
			alert("사용 가능한 아이디 입니다")
		return true;
}
		
	function passwd_check(){
		
		var passwd = userinfo.passwd;
		if(passwd.value == ""){
			alert("비밀번호를 입력하세요");
			passwd.focus();
			return false;
		}else{
			return true;
		}
	}
	
	function repasswd_check(){
		var repasswd = userinfo.repasswd;
		if(repasswd.value == userinfo.passwd.value){
			return true;
		}else{
			alert("비밀번호가 일치하지 않습니다");
			repasswd.focus();
			return false;
		}
	}
	
	function email_check(){
		
		var email = userinfo.email.value;
		
		if(email == "")
			return true;
		else{
			var emailPattern =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(emailPattern.test(email) == false){
				alert("이메일 형식이 올바르지 않습니다");
				userinfo.email.focus();
				return false;
			}else{
				return true;
			}
			
		}
		
	}
	
	function tel_check(){
		var tel = userinfo.tel;

		if(tel.value == ""){
			alert("전화번호를 입력하세요");
			tel.focus();
			return false;
		}
		
		//
		telp = tel.value.split("-").join("");
		var telPattern = /^(010[1-9]{3,4}[0-9]{4})$/;
			
		if(!telPattern.test(telp)){
			alert("전화번호 형식이 올바르지 않습니다");
			tel.focus();
			return false;
		}
		//
		
		return true;
		
	}
	
	function job_check(){
		var jobArr = userinfo.job;
		if(jobArr.selectedIndex == 0){
			alert("직업을 고르세요");
			jobArr.focus();
			return false;
		}
	}
	
	function interest_check(){
		
		var sw = 0;
		var faArr = userinfo.fa;
		for(var i = 0; i < faArr.length;i++){
			if(faArr[i].checked){
				sw = 1;
				break;
			}
		}
		
		if(sw == 0){
			alert("관심 분야를 하나 이상 선택하세요");
			return false;
		}
		
		return true;
	}
	
	
	function reset(){
		userinfo.reset();
	}
