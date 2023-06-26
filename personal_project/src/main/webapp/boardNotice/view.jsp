<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.BoardNoticeDAO, vo.BoardNoticeVO, util.JSFunction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int board_idx = Integer.parseInt(request.getParameter("no")); // 일련번호 받기 

BoardNoticeDAO dao = new BoardNoticeDAO();
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
	function deletePost() { // 삭제 버튼을 클릭했을 시
		var confirmAns = confirm("정말로 삭제하겠습니까?");
		if (confirmAns) {
			frm_view.method = "post"; // 전송 방식 
			frm_view.action = "delete_process.jsp?no=${BoardNoticeVO.board_idx}"; // 전송 경로
			frm_view.submit(); // 폼값 전송
		}
	}
</script>

<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/board_view_jsp.css">
</head>

<body>

	<header>
		<jsp:include page="../main/folder_header.jsp" />
	</header>

	<div id="view_logo">글 보기</div>
	<hr>

<!-- 글보기 form -->
	<form name="frm_view">
		<input type="hidden" name="board_idx"
			value="${BoardNoticeVO.board_idx}" />

		<table>
			<tr>
				<th>작성자</th>
				<td>${BoardNoticeVO.member_id}</td>
				<th>등록일</th>
				<td>${BoardNoticeVO.post_date}</td>
				<th>조회수</th>
				<td>${BoardNoticeVO.read_count}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5" id="view_title">${BoardNoticeVO.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5" id="view_content"><%=vo.getContent().replace("\r\n", "<br/>")%></td>
			</tr>
			<!-- 파일이 첨부되어있을 경우에만 보이기 -->
			<c:if test="${!empty BoardNoticeVO.originFile}">
				<tr>
					<th>첨부파일</th>
					<td colspan="5"><a
						href="download.jsp?oName=${BoardNoticeVO.originFile}&sName=${BoardNoticeVO.saveFile}">
							<img src="../uploads/${BoardNoticeVO.saveFile}" width="200px"
							height="150px"><br> ${BoardNoticeVO.originFile}
					</a></td>
				</tr>
			</c:if>
		</table>
	</form>
	
	<!-- 삭제, 목록, 글 수정 버튼 구현 -->
	<!-- 삭제와 글 수정은 관리자만 버튼을 볼 수 있음 -->
	<div id="view_btn">
		<c:if
			test="${(!empty member_info) and ((member_info.member_idx eq BoardNoticeVO.member_idx) or (member_info.grade eq 2))}">
			<input type="button" onclick="deletePost();" value="삭제"
				id="view_delete_btn">
		</c:if>
		<input type="button" onclick="location.href='list.jsp';" value="목록"
			id="view_content_btn">
		<c:if
			test="${(!empty member_info) and ((member_info.member_idx eq BoardNoticeVO.member_idx) or (member_info.grade eq 2))}">
			<input type="button"
				onclick="location.href='edit.jsp?no=${BoardNoticeVO.board_idx}'"
				value="글 수정" id="view_update_btn">
		</c:if>
	</div>
	
	<footer>
		<jsp:include page="../main/footer.jsp" />
	</footer>

</body>
</html>
