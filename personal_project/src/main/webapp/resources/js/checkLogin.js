window.onload = function(){
	// 로그인 버튼 클릭 시 checkInput() 실행
	let s_btn = frm_login.submit_btn;
	s_btn.addEventListener("click", checkInput);
}

function checkInput(){	// 아이디와 비밀번호 빈칸으로 작성했는지 검사
    if(frm_login.member_id.value.length==0){
        alert("아이디가 입력되지 않았습니다.");
        frm_login.member_id.focus();
        return false;
    }else if(frm_login.member_pw.value.length==0){
        alert("비밀번호가 입력되지 않았습니다.");
        frm_login.member_pw.focus();
        return false;
    }else{
       document.frm_login.submit();
    }
    
    return true;
}