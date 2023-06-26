<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
#update_container {
	width: 70%;
	height: 500px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -450px;
	margin-top: -240px;
}
table {
	margin: 0 auto;
}

hr {
	border: 0;
	height: 5px;
	background: #15075f;
}

#update_logo {
	font-size: 30px;
	text-align: left;
	font-family: 'NanumBarunGothic';
}

#content {
	margin-top: 20px;
	margin-left: 200px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

#content table {
	border-collapse: separate;
	border-spacing: 20px;
}

#content table td {
	text-align: center;
}

#content table .button-group {
 	display: flex;
	justify-content: flex-end;
 	margin-top: 20px;
}

p {
	margin-top: 20px;
	margin-bottom: 20px;
}

input[type="text"], input[type="email"], input[type="password"] {
	width: 300px;
	text-align: left;
}

input {
	width: 50%;
	height: 35px;
	padding-left: 10px;
	margin-top: 5px;
	border-color: rgb(199, 198, 198);
	border-style: solid;
	border-width: 1px;
	outline-color: #15075f;
	outline-width: 1px;
	font-family: 'NanumGothic';
}

#update_btn, #cancel_btn {
	width: 25%;
	height: 40px;
	margin-top: 20px;
	margin-left: 10px;
	cursor: pointer;
	font-family: 'NanumBarunGothic';
	border-radius: 5px;
}

#update_btn {
	background-color: #15075f;
	color: white;
}

</style>
<script>
	function noSpaceForm(obj) { // 공백 검사
		let str_space = /\s/; // 공백 체크
		if (str_space.exec(obj.value)) { // 공백 체크
			alert("해당 항목에는 공백을 사용할 수 없습니다.\n\n공백이 제거됩니다.");
			obj.focus();
			obj.value = obj.value.replace(' ', ''); // 공백제거
			return false;
		}
	}
</script>
<script type="text/javascript" src="../resources/js/checkUpdate.js"></script>
</head>

<body>

	<header>
		<jsp:include page="../main/folder_header.jsp" />
	</header>

	<div id="update_container">
		<div id="update_logo">회원정보 수정</div>
		<hr>
		<!-- 회원정보 수정 form -->
		<form action="update_process.jsp" method="post" name="frm_update">
			<table>
				<tr>
					<td><label for="id">아이디</label></td>
					<td>
						<div class="id-input-wrapper">
							<input type="text" id="id" value="${member_info.member_id}"
								disabled> <input type="hidden" name="member_id"
								value="${member_info.member_id}">
						</div>
					</td>
				</tr>
				<tr>
					<td><label for="pswd">비밀번호</label></td>
					<td><input type="password" name="member_pw" id="pswd" onkeyup="noSpaceForm(this);"
						value="${member_info.member_pw}"></td>
				</tr>
				<tr>
					<td><label for="pswd2">비밀번호 확인</label></td>
					<td><input type="password" name="member_pw2" id="pswd2" onkeyup="noSpaceForm(this);"
						value="${member_info.member_pw}"></td>
				</tr>
				<tr>
					<td><label for="name">이름</label></td>
					<td><input type="text" name="member_name" id="name"
						value="${member_info.member_name}"></td>
				</tr>
				<tr>
					<td><label for="handphone">전화번호</label></td>

					<td><input type="text" name="handphone" id="handphone" placeholder="(-)를 빼고 작성해주세요." onkeyup="noSpaceForm(this);"
						value="${member_info.handphone}"></td>
				</tr>
				<tr>
					<td><label for="email">이메일</label></td>
					<td><input type="text" name="member_email" id="email" onkeyup="noSpaceForm(this);"
						value="${member_info.member_email}"></td>
				</tr>
				<tr>
				<td></td>
					<td style="text-align: right;">
						<a href="cancel.jsp" style="color: gray">회원탈퇴</a>
						<input type="button" id="cancel_btn" value="취소" onclick="history.back()"> 
						<input type="button" id="update_btn" value="완료">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<footer>
		<jsp:include page="../main/footer.jsp" />
	</footer>

</body>
<link rel="stylesheet" href="../resources/css/common.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css"
	rel="stylesheet">
</html>