<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberInfoDAO" %>    

<%
//checkId.jsp에서 전달된 값을 받아서 DAO클래스를 이용해서 아이디 중복검사 실행
String member_id = request.getParameter("member_id");

MemberInfoDAO dao = new MemberInfoDAO();

int result = dao.checkId(member_id);

request.setAttribute("member_id", member_id);
RequestDispatcher rd = request.getRequestDispatcher("checkId.jsp?result="+result);
rd.forward(request, response);

%>