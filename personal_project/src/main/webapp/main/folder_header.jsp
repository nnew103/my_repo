<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="../resources/css/header_jsp.css">
</head>

<body><!-- 폴더 내에 있는 jsp에 사용하는 header -->

	<div id="logo">
		<img src="../resources/img/main_logo.png" id="header_logo" />
	</div>

	<c:choose>
		<c:when test="${!empty member_info}">
			<!-- 회원용 -->
			<div id="member">
				${member_info.member_name}님&nbsp;&nbsp; <a
					href="../memberProcess/logout.jsp" style="color: black">LOGOUT</a>
				| <a href="../memberProcess/update.jsp" style="color: black">EDIT</a>
				<!-- 관리자용 -->
				<c:if test="${member_info.grade==1 or member_info.grade==2}">
					| <a href="../memberManagement/list.jsp" style="color: black">관리자</a>
				</c:if>

			</div>
			<div id="menu">
				<a href="../index.jsp">홈</a> <a href="../boardInfo/list.jsp">정보공유</a>
				<a href="../boardFile/list.jsp">중고거래/자료나눔</a> <a
					href="../boardNotice/list.jsp">공지사항</a>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 일반용 -->
			<div id="member">
				<a href="../memberProcess/login.jsp" style="color: black">LOGIN</a>
				| <a href="../memberProcess/join.jsp" style="color: black">JOIN</a>
			</div>
			<div id="menu">
				<a href="../index.jsp">홈</a> <a href="../boardInfo/list.jsp">정보공유</a>
				<a href="../boardFile/list.jsp">중고거래/자료나눔</a> <a
					href="../boardNotice/list.jsp">공지사항</a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
</html>