/**
 * 
 */

function searchFrmValidation(frmName){
	var frm = frmName;
	
	if(frm.code.value == ""){
		frm.code.placeholder = "값을 입력하세요";
		return false;
	}
}


function insertFrmValidation(frmName){
	
	var frm = frmName;
	
	
	if(frm.code.value == "" ){
		frm.code.placeholder = "값을 입력하세요";
		return false;
	}
	
	if(frm.pname.value == "" ){
		frm.pname.placeholder = "값을 입력하세요";
		return false;
	}
	
	if(frm.cost.value == "" ){
		frm.cost.placeholder = "값을 입력하세요";
		return false;
	}
	
	if(frm.pnum.value == "" ){
		frm.pnum.placeholder = "값을 입력하세요";
		return false;
	}
	
	if(frm.jnum.value == "" ){
		frm.jnum.placeholder = "값을 입력하세요";
		return false;
	}
	
	if(frm.sale.value == "" ){
		frm.sale.placeholder = "값을 입력하세요";
		return false;
	}
	
	return true;
	
}