<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
<script>
	function okId(id) { // 사용버튼 클릭 시
		opener.document.frm_join.confirm_id.value = id;
		self.close();
	}
</script>
<style>
* {
	margin: 0;
	padding: 0;
	font-family: 'NanumBarunGothic';
}

input {
	font-family: 'NanumBarunGothic';
}

#container-checkId {
	width: 430px;
	height: 160px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -180px;
	margin-top: -80px;
	text-align: center;
}

#id_input {
	width: 400px;
	height: 50px;
	border: 1px solid #15075f;
	background-color: #EFF2FB;
	margin: 0 auto;
	padding-top: 20px;
	margin-bottom: 20px;
}

#check_btn, #ok_btn {
	width: 60px;
	height: 20px;
	font-family: 'NanumBarunGothic';
	cursor: pointer;
	border: none;
	border-radius: 20px;
}

#ok_btn {
	background-color: #15075f;
	color: white;
}
</style>
</head>
<body>

	<div id="container-checkId">
		<h3>아이디 중복검사</h3>

		<!-- 아이디 중복 검사 form -->
		<form action="checkId_process.jsp" name="frm_checkId" method="post">
			<div id="id_input">
				아이디 <input type="text" name="member_id" value="${param.member_id}">
				<input type="submit" id="check_btn" value="중복확인"><br>
			</div>
			<label> <c:choose>
					<c:when test="${param.result == 1}">
						<script>
							opener.document.frm_join.member_id.value = "";
						</script>
						${member_id}는 이미 사용 중인 아이디입니다.
					</c:when>

					<c:when test="${param.result == -1}">
						<script>
							opener.document.frm_join.member_id.value = "${member_id}";
						</script>
						${member_id}는 사용 가능한 아이디입니다.
						<input type="button" id="ok_btn" value="사용"
							onclick="okId('${member_id}')">
					</c:when>
				</c:choose>
			</label>
		</form>
	</div>
</body>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
</html>