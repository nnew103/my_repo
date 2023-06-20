window.onload = function() {
	let join_btn = document.getElementById("join_btn");
	join_btn.addEventListener("click", checkInput);

	let checkId_btn = document.getElementById("checkId_btn");
	checkId_btn.addEventListener("click", checkId);


}
let isIdChecked = false; // 아이디 중복검사를 통과했는지 여부를 저장하는 변수

function checkId() {
    if (frm_join.member_id.value.length == 0) {
        alert("아이디를 입력해 주세요.");
        frm_join.focus();
        return false;
    } else {
        let url = "checkId.jsp?member_id=" + frm_join.member_id.value;
        window.open(url, "_blank", "toolbar=no,menubar=no,scrollbar=yes,resizable=no,width=500,height=180");
        isIdChecked = true; // 아이디 중복검사 통과로 체크
    }
}

function checkInput() {
    if (!isIdChecked) {
        alert("아이디 중복검사를 진행해 주세요.");
        return false;
    } else if (frm_join.member_id.value.length == 0) {
        alert("아이디가 입력되지 않았습니다.");
        frm_join.member_id.focus();
        return false;
    } else if (frm_join.member_id.value.length < 5 || frm_join.member_id.value.length > 12) {
        alert("아이디는 5자 이상, 12자 이하여야 합니다.");
        frm_join.member_id.focus();
        return false;
    } else if (frm_join.member_pw.value.length == 0) {
        alert("비밀번호가 입력되지 않았습니다.");
        frm_join.member_pw.focus();
        return false;
    } else if (frm_join.member_pw2.value.length == 0) {
        alert("비밀번호 재확인이 입력되지 않았습니다.");
        frm_join.member_pw2.focus();
        return false;
    } else if (frm_join.member_pw.value != frm_join.member_pw2.value) {
        alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 재입력해주세요.");
        frm_join.member_pw.focus();
        return false;
    } else if (frm_join.member_name.value.length == 0) {
        alert("이름이 입력되지 않았습니다.");
        frm_join.member_name.focus();
        return false;
    } else if (frm_join.handphone.value.length == 0) {
        alert("전화번호가 입력되지 않았습니다.");
        frm_join.handphone.focus();
        return false;
    } else if (frm_join.handphone.value.length > 11) {
        alert("전화번호는 11자 이하여야 합니다.");
        frm_join.member_id.focus();
        return false;
    }else if (frm_join.member_email.value.length == 0) {
        alert("이메일이 입력되지 않았습니다.");
        frm_join.handphone.focus();
        return false;
    } else {
        document.frm_join.submit();
    }
    return true;
}
