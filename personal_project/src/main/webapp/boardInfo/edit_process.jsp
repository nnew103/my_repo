<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardInfoVO, dao.BoardInfoDAO, util.JSFunction"%>

<!-- 글 등록에서 입력된 내용을 BoardVo객체에 일괄적으로 저장하기 -->
<jsp:useBean id="boardInfoVO" class="vo.BoardInfoVO" />
<jsp:setProperty name="boardInfoVO" property="*" />

<%
//자바빈으로 페이지영역에 저장된 boardVo객체를 스크립트릿 내로 가져오기
BoardInfoVO vo = (BoardInfoVO)pageContext.getAttribute("boardInfoVO");

//DAO객체를 통해 DB에 VO에 저장된 내용 저장
BoardInfoDAO dao = new BoardInfoDAO();
int result = dao.updateBoard(vo);
dao.close();

if(result == 1){ //글등록 성공시
	response.sendRedirect("view.jsp?no="+vo.getBoard_idx());

}else{//글등록 실패시
	JSFunction.alertBack("수정하기에 실패했습니다", out);
}

%>