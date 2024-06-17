<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, java.io.*, java.text.SimpleDateFormat, java.util.Date" %>


<%!


    //현재 시간 함수
    public static String getCurrentTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(new Date());
    }

%>



<%
 
    String writer   = request.getParameter("writer");
    String title    = request.getParameter("title");
    String content  = request.getParameter("content");
    String category = request.getParameter("category");
    String regtime  = getCurrentTime();
    
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");
        // 데이터베이스 연결
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendarDB", "root", "1111");

        // SQL 쿼리 작성
        String sql = "INSERT INTO notice (writer, title, content, category, regtime) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, writer);
        pstmt.setString(2, title);
        pstmt.setString(3, content);
        pstmt.setString(4, category);
        pstmt.setString(5, regtime);

        // 쿼리 실행
        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('게시물이 저장되었습니다.'); location.href='notice_list.jsp';</script>");
        } else {
            out.println("<script>alert('게시물 저장에 실패했습니다.'); history.back();</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류가 발생했습니다.'); history.back();</script>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
