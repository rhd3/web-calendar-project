<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

        String sql = "INSERT INTO todos (user_id, todo) VALUES (?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, todo);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("����Ǿ����ϴ�.");
        } else {
            out.println("���忡 �����߽��ϴ�.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("������ �߻��߽��ϴ�.");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
