<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*, java.time.*" %>
<%
    String studentidStr = request.getParameter("studentid");
    int studentid = Integer.parseInt(studentidStr);
    String groupid = request.getParameter("groupid");
    int authority = 0;

    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");
        String sql = "INSERT INTO grouplist (studentid, groupid, authority) VALUES (?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, studentid);
        pstmt.setString(2, groupid);
        pstmt.setInt(3, authority);


        int rowsAffected = pstmt.executeUpdate();
    if (rowsAffected > 0) {
        // 삽입 성공 시 accountsetting.jsp로 리다이렉션
        response.sendRedirect("accountsetting.jsp");
    } else {
        // 삽입 성공 시 accountsetting.jsp로 리다이렉션 및 경고팝업창 출력
        response.sendRedirect("accountsetting.jsp?alert=추가 실패");
    }
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>