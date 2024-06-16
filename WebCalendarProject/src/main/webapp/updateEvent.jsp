<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*, java.time.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String startDate = request.getParameter("start_date");
    String endDate = request.getParameter("end_date");
    String category = request.getParameter("category");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");
        String sql = "UPDATE events SET title = ?, description = ?, start_date = ?, end_date = ?, category = ? WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, description);
        pstmt.setDate(3, Date.valueOf(startDate));
        pstmt.setDate(4, Date.valueOf(endDate));
        pstmt.setString(5, category);
        pstmt.setInt(6, id);
        pstmt.executeUpdate();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
