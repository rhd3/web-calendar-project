<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>joinProcess</title>

</head>
<body>
	<%
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String studentid = request.getParameter("userNum");
		String userTel = request.getParameter("userTel");
		String dbURL = "jdbc:mysql://localhost:3306/CalendarDB";
		String dbUser = "root";
		String dbPW = "1111"; //db연결을 위한 db의 url, id,pw정보

        Connection conn = null; //db 연결 객체
        PreparedStatement pstmt = null; //sql 쿼리 실행을 위한 객체?
		
        try {
        	Class.forName("com.mysql.jdbc.Driver"); // jdbc 드라이버 연결
        	conn = DriverManager.getConnection(dbURL, dbUser, dbPW); //db 연결시도
        	
        	String sql = "INSERT INTO infouser (userId, userPw, userName, studentid,userTel ) VALUES(?,?,?,?,?)";
        	//db 문법 
        	pstmt = conn.prepareStatement(sql); //쿼리 실행전 준비? 연결?
			pstmt.setString(1, userId); //? 에 해당하는 파라미터를 setString을통해 설정
        	pstmt.setString(2, userPw);
        	pstmt.setString(3, userName);
        	pstmt.setString(4, studentid);
        	pstmt.setString(5, userTel);
        	pstmt.executeUpdate(); //sql 쿼리실행
        	// sql 쿼리의 '?' 자리에 값을 대입, 쿼리를 실행하여 데이터베이스에 데이터를 삽입
            out.println("<script>alert('회원가입 성공!!'); location.href='login.jsp';</script>");
        	      	
        } catch(Exception e){
        	e.printStackTrace();
        } finally {
        	if (pstmt != null) {
        		try{
        			pstmt.close();
        		} catch (SQLException e){
        			e.printStackTrace();
        		}
        	}//예외처리 + pstmt 닫기 
        } 
	%>
</body>
</html>
