<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�л�����</title>
<link href="./resources/images/title-logo.png" rel="shortcut icon" type="image/x-icon">

<link rel="stylesheet" href="loginstyle.css" type="text/css" />
</head>
<body>

</body>
	<div class="container">	
		<h1>�α���</h1>

		<form action="loginProcess.jsp" method="post">
			<p><input name="userId" type="text" placeholder="���̵�"></p>
			<p><input name="userPw" type="password" placeholder="��й�ȣ"></p>
			<div>
				<p><button type ="submit" class="btn">�α���</button></p>
				<p><button type="button" class="btn" onclick="location.href='join.jsp'">ȸ������</button></p>
				
			</div>
			
		</form>
	</div>
</html>