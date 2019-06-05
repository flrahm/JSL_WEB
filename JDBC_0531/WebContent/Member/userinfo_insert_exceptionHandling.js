/**
 *  userinfo_insert.jsp       exceptionHandling
 */



	function addr2check(){
		if(insertFrm.addr1.value == ""){
			alert("우편번호 검색을 먼저 해주세요");
			insertFrm.addr2.value = "";
		}
		return true;
	}
	
	
	function validity_id(){
		
		if(insertFrm.userid.value == ""){
			alert("아이디는 필수 입력입니다");
			insertFrm.userid.focus();
			return false; 
		}
		
		return true;
	}
	
	function validity_name(){
		
 		if(insertFrm.name.value==""){
 			
			alert("이름은 필수 입력입니다");
			insertFrm.name.focus();
			
		
			return false;
			
		}
 		
 		return true;
		
	}
	
	function validity_passwd(){
		
		if(insertFrm.passwd.value==""){
			alert("비빌번호는 필수 입력입니다");
			insertFrm.passwd.focus();
			return false;
		}
		
		// 영문 대 소 숫자 특문 
		// 2가지 이상 조합 : 10자 이상
		// 3가지 이상 조합 : 8자 이상
		// id와 4자 이상 같으면 안됨
		// 연속된 숫자 사용 불가
		// 동일 숫자 또는 문자 사용 불가
		
		var isSmall = false;	// 소문자가 있는지	//
		var isCap = false;	// 대문자가 있는지	//
		var isNum = false;	// 숫자가 있는지	//
		var isSpecial = false;	// 특수문자가 있는지	//
		var condition_cnt = 0;	// 위의 조건중 참인것의 갯수
		
		//var check_length = true;	// 길이 // 
		//var check_idDuple = true;	// 아이디와 4자이상 중복되는지
		//var check_continum = true;	// 연속된 숫자가 있는지	//
		var dupleCnt = 0; // 중복 문자를 세기 위한 카운터
		//var check_chDuple = true;	// 동일한 문자가 있는지	//
		
		var str = insertFrm.passwd.value;
		
		for(var i = 0; i < str.length; i ++){
			var ch = str.charAt(i);
			
			if(ch>='0' && ch <='9'){	// 숫자면
				isNum = true;	// 숫자가 있는지 확인하는 스위치 켜줌
				
				if(i != 0){// 0이 아닐경우에
					if(ch - str.charAt(i-1) == 1 || ch - str.charAt(i-1) == -1 ) {// 연속된 숫자가 있으면
						//check_continum = false;	// 연속된 숫자가 있는지 판단하는 스위치를 꺼줌
						alert("비밀번호에 연속된 숫자가 있습니다");
						return false;
					}
				}
			}else if(ch>='a' && ch <='z') // 소문자가 있는지
				isSmall = true;
			else if(ch>='A' && ch <='Z')	// 대문자가 있는지
				isCap = true;
			else	// 특수문자가 있는지
				isSpecial = true;
			
			dupleCnt = 0;
			for(var j = 0; j < str.length ; j++){
				if(ch == str.charAt(j)){
					dupleCnt++;
					if(dupleCnt == 3){
						alert("동일한 문자 혹은 숫자를 3회 이상 사용하지 마십시오");
						return false;
					}
				}
			}
	
		}
		
		// condition_cnt 계산
		if(isSmall)
			condition_cnt++;
		if(isCap)
			condition_cnt++;
		if(isNum)
			condition_cnt++;
		if(isSpecial)
			condition_cnt++;
		
		// 글자수 계산
		if(condition_cnt < 2){
			//check_length = false;
			alert("비밀번호는 영문 대소문자, 특수문자, 숫자 중 두 가지 이상을 조합하세요");
			return false;
		}else if (condition_cnt == 2){
			if(str.length < 10){
				//check_length = false;
				alert("비밀번호는 두 가지 이상을 조합할 경우 10자 이상을 입력하세요");
				return false;
			}
		}else
			if(str.length < 8){
				//check_length = false;
				alert("비밀번호는 세 가지 이상을 조합할 경우 8자 이상을 입력하세요");
				return false;
			}
		
		
		// 아이디와 4글자 이상 겹치는지 확인
		
		var userid = insertFrm.userid.value;
		
		for(var i = 0 ; i <= userid.length-4 ; i ++){
			
			var test = userid.substring(i,i+4);
			if(str.indexOf(test) != -1){
				alert("비밀번호가 아이디와 4자 이상 중복됩니다.");
				return false;
			}
		}
		

		return true;
	}
	
	
	function validity_repasswd(){
		
		if(insertFrm.passwd.value != insertFrm.repasswd.value ){
			alert("비밀번호가 일치하지 않습니다");
			insertFrm.repasswd.focus();
			return false;
		}
		
		return true;
	}
	
	function validity_tel(){
		if(insertFrm.tel.value==""){
			alert("전화번호는 필수 입력입니다");
			insertFrm.tel.focus();
			return false;
		}else{
			var telPattern = /([0-9]{3})-([0-9]{4})-([0-9]{4})/;
			if( !telPattern.test(insertFrm.tel.value)  ){
				alert("전화번호 형식이 맞지 않습니다");
				insertFrm.tel.focus();
				return false;
			}
		}
		
		return true;
	}
	
	function validity_email(){
		
		if(!(insertFrm.email.value=="")){
			var emailPattern =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if( !emailPattern.test(insertFrm.email.value)  ){
				alert("이메일 형식이 맞지 않습니다");
				insertFrm.email.focus();
				return false;
			}
			
		}
		
		return true;
	}