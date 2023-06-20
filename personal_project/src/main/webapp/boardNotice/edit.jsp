<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.BoardNoticeDAO, vo.BoardNoticeVO"%>

<%
int board_idx = Integer.parseInt(request.getParameter("no"));
BoardNoticeDAO dao = new BoardNoticeDAO();
BoardNoticeVO vo = dao.selectView(board_idx);
dao.close();
pageContext.setAttribute("boardVo", vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>

<script>
	function validateForm() {
		if (frm_edit.title.value.length == 0) {
			alert("제목을 입력하세요");
			frm_edit.title.focus();
			return false;
		} else if (frm_edit.content.value.length == 0) {
			alert("내용을 입력하세요");
			frm_edit.content.focus();
			return false;
		}
	}
</script>

<link rel="stylesheet" href="../resources/css/edit_jsp.css">

<style>
#attachedFile {
	border-color: whilte;
}

#file_msg {
	font: 11px Arial, Sans-serif;
	color: gray;
	padding: 5px;
}
</style>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/board_edit_jsp.css">
</head>
<body>

	<header>
		<jsp:include page="../main/folder_header.jsp" />
	</header>

	<div id="edit_logo">글 수정</div>
	<hr>

	<form name="frm_edit" method="post" action="edit_process.jsp"
		enctype="multipart/form-data" onsubmit="return validateForm();">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="writer"
					value="${member_info.member_id}" disabled> <input
					type="hidden" name="member_id" value="${boardVo.member_id}">
					<input type="hidden" name="member_idx"
					value="${boardVo.member_idx}"> <input type="hidden"
					name="board_idx" value="${boardVo.board_idx}"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" class="editable" name="title"
					id="edit_title" value="${boardVo.title}"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3"><input type="file" id="attachedFile"
					name="attachedFile"><br> <span id="file_msg">새로운
						파일을 선택하면 이전 파일이 교체됩니다</span></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="view_content" class="editable"
						cols="30" rows="10">${boardVo.content}</textarea></td>
			</tr>
		</table>

		<div id="edit_btn">
			<input type="reset" value="초기화" id="edit_reset_btn"> <input
				type="button" value="목록" id="edit_content_btn"
				onclick="location.href='list.jsp'"> <input type="submit"
				value="작성완료" id="edit_update_btn">
		</div>

	</form>

	<footer>
		<jsp:include page="../main/footer.jsp" />
	</footer>

</body>
</html>