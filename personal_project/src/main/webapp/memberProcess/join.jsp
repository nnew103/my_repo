<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
#container {
	width: 70%;
	height: 500px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -450px;
	margin-top: -240px;
}

#join_logo {
	font-size: 30px;
	text-align: left;
	font-family: 'NanumBarunGothic';
}

hr {
	border: 0;
	height: 5px;
	background: #15075f;
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
	font-family: 'NanumBarunGothic';
}

.id-input-wrapper {
	display: flex;
	align-items: center;
	width: 300px;
}

.id-input-wrapper input[type="text"] {
	width: 70%;
	margin-right: 5px;
}

.id-input-wrapper input[type="button"] {
	width: 30%;
}

#checkId_btn {
	cursor: pointer;
	width: 25%;
	height: 35px;
	border-radius: 5px;
	text-align: center;
}

#join_btn, #reset_btn {
	width: 25%;
	height: 40px;
	margin-top: 20px;
	margin-left: 10px;
	cursor: pointer;
	border-radius: 5px;
}

#join_btn {
	background-color: #15075f;
	color: white;
}
</style>
<link rel="stylesheet" href="../resources/css/common.css">
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
<script type="text/javascript" src="../resources/js/checkMember.js"></script>
</head>

<body>

	<header>
		<jsp:include page="../main/folder_header.jsp" />
	</header>

	<div id="container">
		<div id="join_logo">회원 가입</div>
		<hr>
		<div id="content">
		<!-- 회원가입 form -->
			<form action="join_process.jsp" method="post" name="frm_join">
				<table>
					<tr>
						<td><label for="id">아이디</label></td>
						<td>
							<div class="id-input-wrapper">
								<input type="text" name="member_id" id="id"
									placeholder="아이디(2~12글자)를 입력해주세요." style="width: 70%;"
									onkeyup="noSpaceForm(this);"> <input type="button"
									id="checkId_btn" value="중복확인" style="width: 30%;">
							</div> <input type="hidden" name="confirm_id">
						</td>
					</tr>
					<tr>
						<td><label for="pswd">비밀번호</label></td>
						<td><input type="password" name="member_pw" id="pswd"
							onkeyup="noSpaceForm(this);"></td>
					</tr>
					<tr>
						<td><label for="pswd2">비밀번호 확인</label></td>
						<td><input type="password" name="member_pw2" id="pswd2"
							onkeyup="noSpaceForm(this);"></td>
					</tr>
					<tr>
						<td><label for="name">이름</label></td>
						<td><input type="text" name="member_name" id="name"></td>
					</tr>
					<tr>
						<td><label for="handphone">전화번호</label></td>
						<td><input type="text" name="handphone" id="handphone"
							placeholder="(-)를 빼고 작성해주세요." placeholder="전화번호 입력"
							onkeyup="noSpaceForm(this);"></td>
					</tr>
					<tr>
						<td><label for="email">이메일</label></td>
						<td><input type="text" name="member_email" id="email"
							placeholder="이메일 입력" onkeyup="noSpaceForm(this);"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right;"><input
							type="reset" id="reset_btn" value="취소"> <input
							type="button" id="join_btn" value="가입하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<footer>
		<jsp:include page="../main/footer.jsp" />
	</footer>
</body>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css"
	rel="stylesheet">
</html>