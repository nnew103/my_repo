<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="javax.servlet.*, javax.servlet.http.*"%>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.ServletException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
</head>
<script>
	function validateForm() {
		if (frm_write.title.value.length == 0) {
			alert("제목을 입력하세요");
			frm_write.title.focus();
			return false;
		} else if (frm_write.content.value.length == 0) {
			alert("내용을 입력하세요");
			frm_write.content.focus();
			return false;
		}
	}
</script>

<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/board_write_jsp.css">

<body>

	<header>
		<jsp:include page="../main/folder_header.jsp" />
	</header>

	<div id="write_logo">글 작성</div>
	<hr>

	<form name="frm_write" method="post" action="write_process.jsp"
		enctype="multipart/form-data" onsubmit="return validateForm()">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="writer" value="${member_info.member_id}"
					disabled> <input type="hidden" name="member_id"
					value="${member_info.member_id}"> <input type="hidden"
					name="member_idx" value="${member_info.member_idx}"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="write_title"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="attachedFile"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="write_content" cols="30" rows="10"></textarea></td>
			</tr>
		</table>
		<div id="write_btn">
			<input type="submit" value="작성완료" id="write_update_btn"> <input
				type="reset" value="다시입력" id="write_reset_btn"> <input
				type="button" value="목록보기" id="write_content_btn"
				onclick="location.href='list.jsp'">
		</div>
	</form>

	<footer>
		<jsp:include page="../main/footer.jsp" />
	</footer>

</body>
</html>