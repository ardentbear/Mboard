function writeSave(){
	eval writeform = document.writeform;
	
	if(!writeform.card_company_name.value){
	  alert("회사명을 입력해주세요.");
	  writeform.card_company_name.focus();
	  return false;
	}
	if(!writeform.card_employee.value){
	  alert("직원명을 입력해주세요.");
	  writeform.card_employee.focus();
	  return false;
	}
	if(!writeform.card_phone.value){
	  alert("연락처를 입력해주세요.");
	  writeform.card_phone.focus();
	  return false;
	}
	if(!writeform.card_email.value){
	  alert("이메일을 입력해주세요.");
	  writeform.card_email.focus();
	  return false;
	}
	
	if(!writeform.card_memo.value){
	  alert("메모를 입력해주세요.");
	  writeform.card_memo.focus();
	  return false;
	}
        
	
 };