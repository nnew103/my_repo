<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

footer {
	position: fixed;
	bottom: 0px;
	text-align: center;
	width: 100%;
	height: 90px;
	line-height: 30px;
}

#container {
	width: 100%;
}

#logo {
	width: 100%;
	height: 50px;
	margin-top: 70px;
	margin-bottom: 10px;
	font: bold 25px Arial, Sans-serif;
}
</style>
<script type="text/javascript" src="../resources/js/checkMember.js"></script>
</head>
<body>

	<header>
		<jsp:include page="../main/memberProcess_header.jsp" />
	</header>

	<div id="container">
		<div id="logo">회원 가입</div>
		<hr>
		<form action="join_process.jsp" method="post" name="frm_join">
            <p >
                <label>아이디(이메일)<br>
                    <input type="text" name="member_id" id="id" placeholder="이메일로 아이디를 입력해주세요">
                    <input type="button" id="checkId_btn" value="중복검사" >
                    <input type="hidden" name="confirm_id">
                    </label></p>
            <p >
                <label>비밀번호<br>
                    <input type="password" name="member_pw" id="pswd"></label></p>
            <p >
                <label>비밀번호 재확인<br>
                    <input type="password" name="member_pw2" id="pswd2"></label></p>
            <p >
                <label>이름<br>
                    <input type="text" name="member_name" id="name"></label></p>
           <p >
                <label>전화번호<br>
                    <input type="text" name="handphone" id="handphone" placeholder="전화번호 입력">
                </label></p>
                <p >
                <label>이메일<br>
                    <input type="email" name="member_email" id="email"></label></p>
                <input type="reset" id="reset_btn" value="취소하기">
                <input type="button" id="join_btn" value="가입하기">
        </form>
	</div>

	<footer>
		<jsp:include page="../main/footer.jsp" />
	</footer>
</body>
</html>