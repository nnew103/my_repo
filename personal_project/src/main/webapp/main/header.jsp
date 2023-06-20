<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<script>
	function link(url) {
		/* window.location = url;//현재의 윈도우에 url 웹페이지를 출력 */
		window.open(url, '_top');
		/* header.html파일이 iframe으로 다른 페이지에 삽입되기 때문에
		출력되는 화면을 브라우저(_top)로 지정해줌. iframe도 윈도우이기 때문에 
		페이지 링크를 브라우저로 지정해주지 않으면 iframe이 가지는 윈도우에 링크된
		페이지를 출력함 */
	}
</script>

<link rel="stylesheet" href="resources/css/header_jsp.css">

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<!-- 나눔바른고딕
	font-family: 'NanumBarunGothicExtraLight';
	font-family: 'NanumBarunGothicLight';
	font-family: 'NanumBarunGothic';
	font-family: 'NanumBarunGothicBold';
	-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css"
	rel="stylesheet">
<!-- 나눔고딕
	font-family: 'NanumGothicLight';
	font-family: 'NanumGothic';
	font-family: 'NanumGothicBold';
	font-family: 'NanumGothicExtraBold';
-->
</head>
<body>

	<div id="logo">
		<img src="resources/img/main_logo.png" />
	</div>

	<c:choose>
		<c:when test="${!empty member_info}">
			<!-- 회원용 -->
			<div id="member">
				${member_info.member_name}님&nbsp;&nbsp; 
				<a href="memberProcess/logout.jsp" style="color: black">LOGOUT</a> |
				<a href="memberProcess/update.jsp" style="color: black">EDIT</a>
				<c:if test="${member_info.grade==1 or member_info.grade==2}">
					| <a href="memberManagement/list.jsp" style="color: black">관리자</a>
				</c:if>
			</div>
			<div id="menu">
				<a href="index.jsp">홈</a> <a href="boardInfo/list.jsp">정보공유</a>
				<a href="boardFile/list.jsp">중고거래/자료나눔</a>
				<a href="boardNotice/list.jsp">공지사항</a>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 일반용 -->
			<div id="member">
				<a href="memberProcess/login.jsp" style="color: black">LOGIN</a> |
				<a href="memberProcess/join.jsp" style="color: black">JOIN</a>
			</div>
			<div id="menu">
				<a href="index.jsp">홈</a>
				<a href="boardInfo/list.jsp">정보공유</a>
				<a href="boardFile/list.jsp">중고거래/자료나눔</a>
				<a href="boardNotice/list.jsp">공지사항</a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>