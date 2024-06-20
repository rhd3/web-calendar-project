<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*, java.time.*" %>

<%
    String studentidStr = request.getParameter("studentid");
    int studentid = Integer.parseInt(studentidStr);
    String groupid = request.getParameter("groupid");
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");

        // 삭제 쿼리 작성
        String deleteQuery = "DELETE FROM grouplist WHERE studentid = ? AND groupid = ?";
        PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery);
        deleteStmt.setInt(1, studentid);
        deleteStmt.setString(2, groupid);

        int rowsAffected = deleteStmt.executeUpdate();
        if (rowsAffected > 0) {
            // 삭제 성공 시 accountsetting.jsp로 리다이렉션
            response.sendRedirect("accountsetting.jsp");
        } else {
            // 삭제 실패 시 적절한 처리 수행
            // (예: 에러 메시지 출력 등)
        }

        deleteStmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
