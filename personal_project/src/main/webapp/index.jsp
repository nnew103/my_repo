<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

<style>
* {
	margin: 0;
	padding: 0;
}

#header {
	display: flex;
	border: none;
	width: 100%;
	top: 0px;
	vertical-align: middle;
	background-color: #EFF2FB;
}

#content {
	width: 1000px;
	height: 600px;
	position: absolute;
	left: 50%;
	top: 54%;
	margin-left: -500px;
	margin-top: -300px;
	background-image: url("resources/img/main_picture.PNG");
	background-size: 1000px 600px;
	background-repeat: no-repeat;
}

footer{
		position:fixed;
		bottom: 0px;
		width: 100%;
		height: 90px;
		line-height: 30px;
	}
</style>

</head>
<body>
	<header>
		<jsp:include page="main/header.jsp" />
	</header>

	<section id="content"></section>

	<footer>
		<jsp:include page="main/footer.jsp" />
	</footer>
</body>
</html>