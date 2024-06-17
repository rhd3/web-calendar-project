<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession userSession = request.getSession();
    int studentid = -1;
    if (userSession.getAttribute("studentid") != null) {
        studentid = (int)userSession.getAttribute("studentid");
    }
%>

    
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

		String dbURL = "jdbc:mysql://localhost:3306/CalendarDB";
		String dbUser = "root";
		String dbPW = "1111";
		
		
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(dbURL, dbUser, dbPW);

    String sql = "SELECT studentid FROM infouser WHERE userId = ? AND userPw = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, userId);
    pstmt.setString(2, userPw);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        studentid = rs.getInt("studentid");
        session.setAttribute("studentid", studentid);
        response.sendRedirect("calendar.jsp");
    } else {
        session.setAttribute("loginError", "로그인 실패");
        response.sendRedirect("login.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}


	%>
</body>
</html>