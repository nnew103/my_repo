<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

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
<script type="text/javascript" src="../resources/js/checkLogin.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../main/memberProcess_header.jsp" />
	</header>

	<section id="content">
		<div class="login_logo">로그인</div>
		<hr>
		<form name="frm_login" action="login_process.jsp" method="post">
			<input type="text" name="member_id" placeholder="아이디"><br>
			<input type="password" name="member_pw" placeholder="비밀번호"><br>
			<input type="button" name="submit_btn" value="로그인">
		</form>

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
</html>