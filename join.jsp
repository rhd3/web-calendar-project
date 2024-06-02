<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학사일정</title>
<link rel="stylesheet" href="loginstyle.css" type="text/css" />

</head>
<body>

</body>
	<div class="container">	
		<h1>회원가입</h1>
		<form action="joinProcess.jsp" method="post">
		<p><input id="userId" name="userId" type="text" placeholder="아이디"></p>
        <p><input name="userPw" type="password" placeholder="비밀번호"></p>
        <p><input id="userName" name="userName" type="text" placeholder="이름"></p>
        <p><input id="userNum" name="userNum" type="text" placeholder="학번"></p>
        <p><input id="userTel" name="userTel" type="tel" placeholder="전화번호"></p>
		<p><button class="btn">회원가입</button></p>
			
		</form>
	</div>
</html>
