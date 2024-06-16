<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.io.*" %>

<%
   
String dbURL = "jdbc:mysql://localhost:3306/userdb?useUnicode=true&characterEncoding=UTF-8";
String dbUser = "root";
String dbPass = "1111";

 
    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // JDBC ����̹� �ε�
        Class.forName("com.mysql.cj.jdbc.Driver");
        // �����ͺ��̽� ����
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        // SQL ���� �ۼ�
        String sql = "INSERT INTO posts (writer, title, content) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, writer);
        pstmt.setString(2, title);
        pstmt.setString(3, content);

        // ���� ����
        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('�Խù��� ����Ǿ����ϴ�.'); location.href='notice_list.jsp';</script>");
        } else {
            out.println("<script>alert('�Խù� ���忡 �����߽��ϴ�.'); history.back();</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('������ �߻��߽��ϴ�.'); history.back();</script>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>