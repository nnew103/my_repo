<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardFileVO, vo.MemberInfoVO, dao.BoardFileDAO, util.JSFunction" %>

<%
int board_idx = Integer.parseInt(request.getParameter("no"));

BoardFileDAO dao = new BoardFileDAO();
BoardFileVO vo = dao.selectView(board_idx);

//로그인된 회원의 member_idx 얻기
MemberInfoVO mVo = (MemberInfoVO)session.getAttribute("member_info");
int m_member_idx = mVo.getMember_idx();

int result = 0;
if(m_member_idx == vo.getMember_idx()){//작성자가 회원 본인인 것을 다시 확인
	
	result = dao.deletePost(vo);
	dao.close();

	if(result == 1){//성공시 글목록 페이지로 이동
		JSFunction.alertLocation("삭제되었습니다", "list.jsp", out);
	
	}else{//실패시 이전 페이지로 이동
		JSFunction.alertBack("본인만 삭제할 수 있습니다", out);
	}
	
}

%>    