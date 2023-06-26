<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardInfoVO, dao.BoardInfoDAO, util.JSFunction" %>

<jsp:useBean id="boardInfoVO" class="vo.BoardInfoVO" />
<jsp:setProperty name="boardInfoVO" property="*" />

<%
BoardInfoVO vo = (BoardInfoVO)pageContext.getAttribute("boardInfoVO");

//DAO객체를 통해 DB에 VO에 저장된 내용 저장
BoardInfoDAO dao = new BoardInfoDAO();
int result = dao.insertBoard(vo);
dao.close();

if(result == 1){ //글 등록 성공시
	response.sendRedirect("list.jsp");

}else{//글 등록 실패시
	JSFunction.alertBack("글등록에 실패했습니다", out);
}
%>