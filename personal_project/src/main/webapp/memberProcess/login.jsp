<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<style>
#container {
	width: 800px;
	height: 500px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -400px;
	margin-top: -270px;
}

#login_logo {
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
	margin-top: 10%;
}

#content input {
	margin-bottom: 15px;
	/* 아래쪽 여백 설정 */
}

input {
	width: 360px;
	height: 54px;
	margin: 3px 0;
	padding-left: 20px;
	font-size: 16px;
}

input:focus {
	outline: 1px solid #15075f;
}

input[type="text"], input[type="password"] {
	text-align: left;
	font-family: 'NanumGothic';
}

input[type="button"] {
	width: 380px;
	margin-top: 10px;
	font: bold 20px nanum-barun-gothic, sans-serif;
	background-color: #15075f;
	color: white;
	cursor: pointer;
	/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
}
</style>
<script type="text/javascript" src="../resources/js/checkLogin.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../main/memberProcess_header.jsp" />
	</header>

	<section id="container">
		<div class="login_logo" id="login_logo">로그인</div>
		<hr>
		<div id="content">
			<form name="frm_login" action="login_process.jsp" method="post">
				<input type="text" name="member_id" placeholder="아이디"><br>
				<input type="password" name="member_pw" placeholder="비밀번호"><br>
				<input type="button" name="submit_btn" value="로그인">
			</form>
		</div>

		<c:choose>
			<c:when test="${param.msg eq 'ok'}">
				<div id="msg">회원가입이 정상적으로 이루어졌습니다</div>
			</c:when>
			<c:when test="${param.msg eq 'fail'}">
				<div id="msg">회원정보가 없거나 아이디나 비밀번호가 일치하지 않습니다</div>
			</c:when>
		</c:choose>
	</section>

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