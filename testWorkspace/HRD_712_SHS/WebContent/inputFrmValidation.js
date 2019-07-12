/**
 * 
 */

function inputFrmValidation(frmName){
	
	var frm = frmName;
	
	if(frm.name.value == ""){
		frm.name.placeholder = "값을 입력하세요";
		return false;
	}
	
	if(frm.id.value == ""){
		frm.id.placeholder = "값을 입력하세요";
		return false;
	}
	
	if(frm.duty.value == ""){
		frm.duty.placeholder = "값을 입력하세요";
		return false;
	}
	
	if(frm.phone.value == ""){
		frm.phone.placeholder = "값을 입력하세요";
		return false;
	}
	
	
	return true;
	
	
}

