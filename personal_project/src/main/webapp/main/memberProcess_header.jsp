<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<link rel="stylesheet" href="../resources/css/header_jsp.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
</head>
<body>
	<div id="logo">
		<img src="../resources/img/main_logo.png" id="header_logo"/>
	</div>

	<c:choose>
		<c:when test="${!empty member_info}">
			<!-- 회원용 -->
			<div id="member">
				${member_info.member_name}님&nbsp;&nbsp;
				<a href="logout.jsp" style="color: black">LOGOUT</a> | 
				<a href="update.jsp" style="color: black">회원정보수정</a>
			</div>
			<div id="menu">
				<a href="../index.jsp">홈</a>
				<a href="../boardInfo/list.jsp">정보공유</a>
				<a href="../boardFile/list.jsp">중고거래/자료나눔</a>
				<a href="../boardNotice/list.jsp">공지사항</a>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 일반용 -->
			<div id="member">
				<a href="login.jsp" style="color: black">LOGIN</a> | 
				<a href="join.jsp" style="color: black">JOIN</a>
			</div>
			<div id="menu">
				<a href="../index.jsp">홈</a>
				<a href="../boardInfo/list.jsp">정보공유</a>
				<a href="../boardFile/list.jsp">중고거래/자료나눔</a>
				<a href="../boardNotice/list.jsp">공지사항</a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>