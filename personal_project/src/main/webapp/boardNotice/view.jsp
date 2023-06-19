<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardNoticeDAO, vo.BoardNoticeVO, util.JSFunction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

int board_idx = Integer.parseInt(request.getParameter("no"));  // 일련번호 받기 

BoardNoticeDAO dao = new BoardNoticeDAO(); // DAO 생성 
dao.updateReadCount(board_idx); // 조회수 증가 
BoardNoticeVO vo = dao.selectView(board_idx); // 게시물 가져오기
dao.close();
pageContext.setAttribute("BoardNoticeVO", vo);


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
        frm_view.action = "delete_process.jsp?no=${BoardNoticeVO.board_idx}"; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    }
    
}
</script>

<link rel="stylesheet" href="../resources/css/view_jsp.css">

</head>
<body>

<header>
	<jsp:include page="../main/folder_header.jsp"/>
</header>

<form name="frm_view">
    <input type="hidden" name="board_idx" value="${BoardNoticeVO.board_idx}" />  <!-- 공통 링크 -->

    <table>
    	<caption>글 내용</caption>
        <tr>
            <th>번호</th>
            <td>${BoardNoticeVO.board_idx}</td>
            <th>작성자</th>
            <td>${BoardNoticeVO.member_id}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${BoardNoticeVO.post_date}</td>
            <th>조회수</th>
            <td>${BoardNoticeVO.read_count}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${BoardNoticeVO.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3" >
                <%= vo.getContent().replace("\r\n", "<br/>") %></td> 
        </tr>
        <tr>
            <th>첨부파일</th>
            <td colspan="3" >
                <a href="download.jsp?oName=${BoardNoticeVO.originFile}&sName=${BoardNoticeVO.saveFile}">
                	<img src="../uploads/${BoardNoticeVO.saveFile}" width="200px" height="150px"><br>
                	${BoardNoticeVO.originFile}
                </a>
            </td> 
        </tr>
        <tr>
            <td colspan="4" id="td_btn">
	           <c:if test="${(!empty member_info) and (member_info.member_idx eq BoardNoticeVO.member_idx)}" >
	            	<input type="button" onclick="location.href='edit.jsp?no=${BoardNoticeVO.board_idx}'" value="수정하기">
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
