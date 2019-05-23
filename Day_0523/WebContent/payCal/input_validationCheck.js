/**
 * input.jsp validation check(name, pay)
 */


	function name_check(str){	// 이름의 유효성을 검사하는 함수
	//alert("name_check");
	var str;
	if(str == ""){
		alert("이름을 입력하세요");
		return false;
	}else{
		return true;
	}
}
	
	
	function onlyNum(str){	// 입력 문자가 숫자인지 검사하는 함수
		
		for(i = 0; i < lower_str.length ; i++){
			ch = lower_str.charAt(i);
			if((ch >= '0') && (ch <= '9')){
				if(i == lower_str.length-1){
					return true;
				}
			}else
				return false;
		}
	}