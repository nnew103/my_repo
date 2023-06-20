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

#join_btn, #reset_btn {
	width: 25%;
	height: 40px;
	margin-top: 20px;
	margin-left: 10px;
	cursor: pointer;
	/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
	border-radius: 5px;
}

#join_btn {
	background-color: #15075f;
	color: white;
}
</style>
<link rel="stylesheet" href="../resources/css/common.css">
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
			<form action="join_process.jsp" method="post" name="frm_join">
				<table>
					<tr>
						<td><label for="id">아이디</label></td>
						<td>
							<div class="id-input-wrapper">
								<input type="text" name="member_id" id="id"
									placeholder="아이디(5~12글자)를 입력해주세요." style="width: 70%;">
								<input type="button" id="checkId_btn" value="중복확인"
									style="width: 30%;">
							</div> <input type="hidden" name="confirm_id">
						</td>
					</tr>
					<tr>
						<td><label for="pswd">비밀번호</label></td>
						<td><input type="password" name="member_pw" id="pswd">
						</td>
					</tr>
					<tr>
						<td><label for="pswd2">비밀번호 확인</label></td>
						<td><input type="password" name="member_pw2" id="pswd2">
						</td>
					</tr>
					<tr>
						<td><label for="name">이름</label></td>
						<td><input type="text" name="member_name" id="name"></td>
					</tr>
					<tr>
						<td><label for="handphone">전화번호</label></td>
						<td><input type="text" name="handphone" id="handphone"
							placeholder="전화번호 입력"></td>
					</tr>
					<tr>
						<td><label for="email">이메일</label></td>
						<td><input type="email" name="member_email" id="email"
							placeholder="이메일 입력"></td>
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