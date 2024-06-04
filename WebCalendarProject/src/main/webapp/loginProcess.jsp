<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사일정</title>
</head>
<body>
	<%
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
	
		String dbURL = "jdbc:mysql://localhost:3306/userdb?useUnicode=true&characterEncoding=UTF-8";
		String dbUser = "root";
		String dbPW = "1111";
		
		
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection(dbURL, dbUser, dbPW);
        	
        	String sql = "SELECT * FROM infouser WHERE userId = ? AND userPw = ?";
        	pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
        	pstmt.setString(2, userPw);
        	rs = pstmt.executeQuery();
        	
        	if (rs.next()) {
        		
                out.println("<script>alert('로그인 성공!!'); location.href='calendar.jsp';</script>");
        	
        	} else {
        		
                out.println("<script>alert('로그인 실패'); location.href='login.jsp';</script>");

        	}     	
        } catch(Exception e){
        	
        	e.printStackTrace();
        	
        } finally {
        	
        	if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        	if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        	if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }      
        
        }

	%>
</body>
</html>