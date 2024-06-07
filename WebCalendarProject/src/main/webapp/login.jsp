<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학사일정</title>
<link href="./resources/images/title-logo.png" rel="shortcut icon" type="image/x-icon">

<link rel="stylesheet" href="loginstyle.css" type="text/css" />
</head>
<body>

</body>
	<div class="container">	
		<h1>로그인</h1>

		<form action="loginProcess.jsp" method="post">
			<p><input name="userId" type="text" placeholder="아이디"></p>
			<p><input name="userPw" type="password" placeholder="비밀번호"></p>
			<div>
				<p><button type ="submit" class="btn">로그인</button></p>
				<p><button type="button" class="btn" onclick="location.href='join.jsp'">회원가입</button></p>
				
			</div>
			
		</form>
	</div>
</html>