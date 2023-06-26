<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberInfoDAO, vo.MemberInfoVO"%>

<%
String member_id = request.getParameter("member_id");
String member_pw = request.getParameter("member_pw");

MemberInfoDAO dao = new MemberInfoDAO();

MemberInfoVO vo = dao.login(member_id, member_pw);

if (vo != null) {//로그인 성공시
	session.setAttribute("member_info", vo);
	response.sendRedirect("../index.jsp");

} else {//로그인 실패시
	RequestDispatcher rd = request.getRequestDispatcher("login.jsp?msg=fail");
	rd.forward(request, response);
}
%>