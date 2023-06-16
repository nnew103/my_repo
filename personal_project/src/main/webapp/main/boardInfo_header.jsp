<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body>
	<!-- 
	<a href="../index.jsp">홈</a>
	<a href="../index.jsp">정보공유</a>
	<a href="../index.jsp">중고거래/자료나눔</a>
	<a href="../index.jsp">공지사항</a>
	<a href="memberFunction/login.jsp">LOGIN</a>
	<a href="memberFunction/join.jsp">JOIN</a>
 -->

	<c:choose>
		<c:when test="${!empty member_info}">
			<!-- 회원용 -->
			${member_info.member_name}님&nbsp;&nbsp;<a href="../index.jsp">홈</a>
			<a href="list.jsp">정보공유</a>
			<a href="../boardFile/list.jsp">중고거래/자료나눔</a>
			<a href="../index.jsp">공지사항</a>
			<a href="../memberProcess/logout.jsp">LOGOUT</a>
			<a href="../memberProcess/update.jsp">회원정보수정</a>
		</c:when>
		<c:otherwise>
			<!-- 일반용 -->
			<a href="../index.jsp">홈</a>
			<a href="list.jsp">정보공유</a>
			<a href="../boardFile/list.jsp">중고거래/자료나눔</a>
			<a href="../index.jsp">공지사항</a>

			<a href="../memberProcess/login.jsp">LOGIN</a>
			<a href="../memberProcess/join.jsp">JOIN</a>
		</c:otherwise>
	</c:choose>
</body>
</html>