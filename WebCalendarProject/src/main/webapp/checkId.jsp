<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String userId = request.getParameter("userId");
    String dbURL = "jdbc:mysql://localhost:3306/CalendarDB?useUnicode=true&characterEncoding=UTF-8";
    String dbUser = "root";
    String dbPW = "1111";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean isDuplicate = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPW);

        String checkSql = "SELECT userId FROM infouser WHERE userId = ?";
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            isDuplicate = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    out.print(isDuplicate);
%>
