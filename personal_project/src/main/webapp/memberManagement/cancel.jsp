<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int member_idx = Integer.parseInt(request.getParameter("no")); // 일련번호 받기 

%>

<script>
	let confirmAns = confirm("정말 회원을 탈퇴시키겠습니까?");

	if(confirmAns){
		location.href = "cancel_process.jsp?no=" + <%=member_idx%>;
	}else{
		history.back();
	}
</script>    