<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
* {
	margin: 0;
	padding: 0;
}

header {
	position: fixed;
	top: 0px;
	text-align: right;
	width: 100%;
	height: 50px;
	line-height: 50px;
}

#content {
	width: 800px;
	height: 500px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -400px;
	margin-top: -270px;
}

footer {
	position: fixed;
	bottom: 0px;
	text-align: center;
	width: 100%;
	height: 90px;
	line-height: 30px;
}
</style>

</head>
<body>

	<header>
		<jsp:include page="../main/memberProcess_header.jsp" />
	</header>

	<div id="container">
		<div id="logo">회원정보 수정</div>
		<form action="update_process.jsp" method="post" name="frm_update">
			<p>
				<label>아이디<br> <input type="text" id="id"
					value="${member_info.member_id}" disabled> <input type="hidden"
					name="member_id" value="${member_info.member_id}">
				</label>
			</p>
			<p>
				<label>비밀번호<br> <input type="password" name="member_pw"
					id="pswd" value="${member_info.member_pw}"></label>
			</p>
			<p>
				<label>비밀번호 재확인<br> <input type="password"
					name="member_pw2" id="pswd2" value="${member_info.member_pw}"></label>
			</p>
			<p>
				<label>이름<br> <input type="text" name="member_name"
					id="name" value="${member_info.member_name}"></label>
			</p>
			<p>
				<label>전화번호<br> <input type="text" name="handphone"
					id="handphone" value="${member_info.handphone}">
				</label>
			</p>
			<p>
				<label>이메일<br> <input type="email" name="member_email"
					id="email" value="${member_info.member_email}"></label>
			</p>

			<input type="button" id="cancel_btn" value="취소하기" onclick="history.back()">
                <input type="submit" id="update_btn" value="수정하기">
		</form>
	</div>

	<div id="cancel">
		<a href="cancel.jsp">회원탈퇴</a>
	</div>

	<footer>
		<jsp:include page="../main/footer.jsp" />
	</footer>

</body>
</html>