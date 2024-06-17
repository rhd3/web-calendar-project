<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, java.io.*" %>

<%
String dbURL = "jdbc:mysql://localhost:3306/userdb?useUnicode=true&characterEncoding=UTF-8";
String dbUser = "root";
String dbPass = "1111";

    String userId = request.getParameter("userId");
    String todo = request.getParameter("todo");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        String sql = "DELETE FROM todos WHERE user_id = ? AND todo = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, todo);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("삭제되었습니다.");
        } else {
            out.println("삭제에 실패했습니다.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("오류가 발생했습니다: " + e.getMessage());
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
