window.onload = function(){
	let join_btn = document.getElementById("join_btn");
	join_btn.addEventListener("click", checkInput);
	
	let checkId_btn = document.getElementById("checkId_btn");
	checkId_btn.addEventListener("click", checkId);
	
}

function checkId(){
	if(frm_join.member_id.value.length == 0){
		alert("아이디를 입력해 주세요.");
		frm_join.focus();
		return false;
	}else{
		let url = "checkId.jsp?member_id="+frm_join.member_id.value;
		window.open(url, "_blank","toolbar=no,menubar=no,scrollbar=yes,resizable=no,width=500,height=180");
	}
}


function checkInput(){
   
    if(frm_join.member_id.value.length==0){
        alert("아이디가 입력되지 않았습니다.");
        frm_join.member_id.focus();
        return false;

    }else if(frm_join.member_pw.value.length==0){
        alert("비밀번호가 입력되지 않았습니다.");
        frm_join.member_pw.focus();
        return false;

    }else if(frm_join.member_pw2.value.length==0){
        alert("비밀번호 재확인이 입력되지 않았습니다.");
        frm_join.member_pw2.focus();
        return false;

    }else if(frm_join.member_name.value.length==0){
        alert("이름이 입력되지 않았습니다.");
        frm_join.member_name.focus();
        return false;

    }else if(frm_join.handphone.value.length==0){
        alert("전화번호가 입력되지 않았습니다.");
        frm_join.handphone.focus();
        return false;
        
    }else if(frm_join.member_email.value.length==0){
        alert("이메일이 입력되지 않았습니다.");
        frm_join.handphone.focus();
        return false;
        
    }else{
        document.frm_join.submit();
    }
    
    return true;
}