window.onload = function() {
	let update_btn = document.getElementById("update_btn");
	update_btn.addEventListener("click", update_Input);
}

function update_Input() {	// 회원정보 수정 검사
    if (frm_update.member_pw.value.length == 0) {
        alert("비밀번호가 입력되지 않았습니다.");
        frm_update.member_pw.focus();
        return false;
    } else if (frm_update.member_pw2.value.length == 0) {
        alert("비밀번호 재확인이 입력되지 않았습니다.");
        frm_update.member_pw2.focus();
        return false;
    } else if (frm_update.member_pw.value != frm_update.member_pw2.value) {
        alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 재입력해주세요.");
        frm_update.member_pw.focus();
        return false;
    } else if (frm_update.member_name.value.length == 0) {
        alert("이름이 입력되지 않았습니다.");
        frm_update.member_name.focus();
        return false;
    } else if (frm_update.handphone.value.length == 0) {
        alert("전화번호가 입력되지 않았습니다.");
        frm_update.handphone.focus();
        return false;
    } else if (frm_update.handphone.value.length > 11) {
        alert("전화번호는 11자 이하여야 합니다.");
        frm_update.member_id.focus();
        return false;
    }else if (frm_update.member_email.value.length == 0) {
        alert("이메일이 입력되지 않았습니다.");
        frm_update.handphone.focus();
        return false;
    } else {
        document.frm_update.submit();
    }
    return true;
}
