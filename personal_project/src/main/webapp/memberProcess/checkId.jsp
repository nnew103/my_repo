<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복검사</title>
	<script>
		function okId(id){
			opener.document.frm_join.confirm_id.value=id;
			self.close();
		}
	</script>
	<style>
		#container-checkId{
			width: 430px;
			height: 160px;
			position:absolute;
			left:50%;
			top:50%;
			margin-left:-180px;
			margin-top: -80px;
			text-align: center;
		}
	</style>
</head>
<body>

	<div id="container-checkId">
		<h3>아이디 중복검사</h3>
		<form action="checkId_process.jsp" name="frm_checkId" method="post">
			아이디 <input type="text" name="member_id" value="${param.member_id}">
			<input type="submit" value="중복검사"><br>
			<label>
				<c:choose>
					<c:when test="${param.result == 1}">
						<script>
							opener.document.frm_join.member_id.value="";
						</script>
						${member_id}는 이미 사용 중인 아이디입니다.
					</c:when>
					
					<c:when test="${param.result == -1}">
						<script>
							opener.document.frm_join.member_id.value="${member_id}";
						</script>
						${member_id}는 사용 가능한 아이디입니다.
						<input type="button" id="ok_btn" value="사용" onclick="okId('${member_id}')">
					</c:when>
				</c:choose>
			</label>
		</form>
	</div>
</body>
</html>