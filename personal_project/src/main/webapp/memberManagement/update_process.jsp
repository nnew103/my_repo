<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberInfoDAO, vo.MemberInfoVO"%>  

<%-- 화면단에서 넘어온 값들을 일괄적으로 MemberVo에 저장하기 위해서 자바빈과 액션태그를 사용함 --%>
<jsp:useBean id="MemberInfoVO" class="vo.MemberInfoVO" />
<jsp:setProperty name="MemberInfoVO" property="*" />

<%
//페이지 영역에 저장된 자바빈 객체 가져오기
MemberInfoVO vo = (MemberInfoVO)pageContext.getAttribute("MemberInfoVO");

MemberInfoDAO dao = new MemberInfoDAO();

MemberInfoVO vo2 = dao.update(vo); 

if(vo2 != null){//회원정보 수정 성공시
	session.removeAttribute("member_update_Vo");
	session.setAttribute("member_update_Vo", vo2);
	response.sendRedirect("list.jsp");

}else{//회원정보 수정 실패시
	RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
	rd.forward(request, response);
}

%>