<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//사용자 세션 초기화 후 메인 페이지 이동
	session.invalidate();
	response.sendRedirect("../index.jsp");

%>    