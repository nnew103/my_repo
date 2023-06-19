<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardInfoVO, dao.BoardInfoDAO, util.JSFunction" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

int board_idx = Integer.parseInt(request.getParameter("no"));  // 일련번호 받기 

BoardInfoDAO dao = new BoardInfoDAO(); // DAO 생성 
dao.updateReadCount(board_idx); // 조회수 증가 
BoardInfoVO vo = dao.selectView(board_idx); // 게시물 가져오기
dao.close();
pageContext.setAttribute("boardInfoVO", vo);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
<script>
function deletePost() {
	
    var confirmAns = confirm("정말로 삭제하겠습니까?");
    
    if (confirmAns) {
    	
        frm_view.method = "post"; // 전송 방식 
        frm_view.action = "delete_process.jsp?no=${boardInfoVO.board_idx}"; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    }
    
}
</script>

<link rel="stylesheet" href="../resources/css/view_jsp.css">

</head>
<body>

<header>
	<jsp:include page="../main/folder_header.jsp" />
</header>

<form name="frm_view">
    <input type="hidden" name="board_idx" value="${boardInfoVO.board_idx}" />  <!-- 공통 링크 -->

    <table>
    	<caption>글 내용</caption>
        <tr>
            <th>번호</th>
            <td>${boardInfoVO.board_idx}</td>
            <th>작성자</th>
            <td>${boardInfoVO.member_id}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${boardInfoVO.post_date}</td>
            <th>조회수</th>
            <td>${boardInfoVO.read_count}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${boardInfoVO.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3" >
                <%= vo.getContent().replace("\r\n", "<br/>") %></td> 
        </tr>
        <tr>
            <td colspan="4" id="td_btn">
	           <c:if test="${(!empty member_info) and (member_info.member_idx eq boardInfoVO.member_idx)}" >
	            	<input type="button" onclick="location.href='edit.jsp?no=${boardInfoVO.board_idx}'" value="수정하기">
	                <input type="button" onclick="deletePost();" value="삭제하기">
	            </c:if>
                
	            <input type="button" onclick="location.href='list.jsp';" value="목록보기">
            </td>
        </tr>
    </table>
</form>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer> 

</body>
</html>
