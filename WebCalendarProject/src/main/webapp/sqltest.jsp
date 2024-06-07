<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MySQL 연결드라이버 테스트</title>
</head>
<body>
	<h1>MySQL 연결드라이버 테스트</h1>
	<%
		String jdbcUrl = "jdbc:mysql://127.0.0.1:3306/calendar";
		String dbId = "root"; 
		String dbPwd = "1111";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
			out.println("MySQL 연결성공");
		}
		catch (Exception ex)
		{
			out.println("연결 오류입니다. 오류메시지: " + ex.getMessage());
		}
	%>
</body>
</html>