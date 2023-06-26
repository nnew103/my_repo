<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardInfoVO, dao.BoardInfoDAO, util.JSFunction"%>

<!-- 글 등록에서 입력된 내용을 BoardVo객체에 일괄적으로 저장 -->
<jsp:useBean id="boardInfoVO" class="vo.BoardInfoVO" />
<jsp:setProperty name="boardInfoVO" property="*" />

<%
BoardInfoVO vo = (BoardInfoVO)pageContext.getAttribute("boardInfoVO");

//DAO객체를 통해 DB에 VO에 저장된 내용 저장
BoardInfoDAO dao = new BoardInfoDAO();
int result = dao.updateBoard(vo);
dao.close();

if(result == 1){ //글 등록 성공 시
	response.sendRedirect("view.jsp?no="+vo.getBoard_idx());

}else{//글 등록 실패 시
	JSFunction.alertBack("수정하기에 실패했습니다", out);
}

%>