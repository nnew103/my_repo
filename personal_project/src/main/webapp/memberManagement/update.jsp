<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberInfoDAO, vo.MemberInfoVO, util.JSFunction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
int member_idx = Integer.parseInt(request.getParameter("no")); // 일련번호 받기 

MemberInfoDAO dao = new MemberInfoDAO(); // DAO 생성 
MemberInfoVO vo = dao.selectView(member_idx); // 게시물 가져오기
dao.close();
pageContext.setAttribute("member_update_Vo", vo);
%>

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
	/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
	font-family: 'NanumBarunGothic';
	border-radius: 5px;
}

#update_btn {
	background-color: #15075f;
	color: white;
}
</style>

</head>
<body>

	<header>
		<jsp:include page="../main/folder_header.jsp" />
	</header>

	<div id="update_container">
		<div id="update_logo">회원정보 수정</div>
		<hr>
		<form action="update_process.jsp" method="post" name="frm_update">
			<table>
				<tr>
					<td><label for="id">아이디</label></td>
					<td>
						<div class="id-input-wrapper">
							<input type="text" id="id" value="${member_update_Vo.member_id}"
								disabled> <input type="hidden" name="member_id"
								value="${member_update_Vo.member_id}">
						</div>
					</td>
				</tr>
				<tr>
					<td><label for="pswd">비밀번호</label></td>
					<td><input type="password" name="member_pw" id="pswd"
						value="${member_update_Vo.member_pw}"></td>
				</tr>
				<tr>
					<td><label for="pswd2">비밀번호 확인</label></td>
					<td><input type="password" name="member_pw2" id="pswd2"
						value="${member_update_Vo.member_pw}"></td>
				</tr>
				<tr>
					<td><label for="name">이름</label></td>
					<td><input type="text" name="member_name" id="name"
						value="${member_update_Vo.member_name}"></td>
				</tr>
				<tr>
					<td><label for="handphone">전화번호</label></td>



					<td><input type="text" name="handphone" id="handphone"
						value="${member_update_Vo.handphone}"></td>
				</tr>
				<tr>
					<td><label for="email">이메일</label></td>
					<td><input type="email" name="member_email" id="email"
						value="${member_update_Vo.member_email}"></td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: right;">
					<c:if test="${member_info.grade==2}">
							<a href="cancel.jsp?no=${member_update_Vo.member_idx}" style="color: gray">회원탈퇴</a>
						</c:if> 
						<input type="button" id="cancel_btn" value="취소"
						onclick="history.back()"> <input type="submit"
						id="update_btn" value="완료"></td>
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