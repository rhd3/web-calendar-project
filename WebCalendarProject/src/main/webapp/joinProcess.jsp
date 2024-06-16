<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>joinProcess</title>

</head>
<body>
	<%
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userSnum = request.getParameter("userNum");
		String userTel = request.getParameter("userTel");
		
		String dbURL = "jdbc:mysql://localhost:3306/userdb?useUnicode=true&characterEncoding=UTF-8";
		String dbUser = "root";
		String dbPW = "1111";

        Connection conn = null;
        PreparedStatement pstmt = null;
		
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection(dbURL, dbUser, dbPW);
        	
        	String sql = "INSERT INTO infouser (userId, userPw, userName, userNum,userTel ) VALUES(?,?,?,?,?)";
        	pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
        	pstmt.setString(2, userPw);
        	pstmt.setString(3, userName);
        	pstmt.setString(4, userSnum);
        	pstmt.setString(5, userTel);
        	pstmt.executeUpdate();
        	
            out.println("<script>alert('회원가입 성공!!'); location.href='login.jsp';</script>");
        	      	
        } catch(Exception e){
        	e.printStackTrace();
        } finally {
        	if (pstmt != null) {
        		try{
        			pstmt.close();
        		} catch (SQLException e){
        			e.printStackTrace();
        		}
        	}
        } 
	%>
</body>
</html>