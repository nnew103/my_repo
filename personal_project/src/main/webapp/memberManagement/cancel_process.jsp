<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberInfoDAO, vo.MemberInfoVO" %>  

<%
int member_idx = Integer.parseInt(request.getParameter("no")); // 일련번호 받기 

MemberInfoDAO dao = new MemberInfoDAO();

int result = dao.cancel(member_idx); 

if(result == 1){//회원탈퇴 성공시
	response.sendRedirect("list.jsp");

}else{//회원탈퇴 실패시
	RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
	rd.forward(request, response);
}

%>