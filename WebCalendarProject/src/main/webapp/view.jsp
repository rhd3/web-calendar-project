<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%--
    // 지정된 글 번호 얻기
    int num = Integer.parseInt(request.getParameter("num"));

    // 게시글 데이터를 담을 변수 정의
    String writer = "";
    String title = "";
    String content = "";
    String regtime = "";
    int hits = 0;
    
    // 지정된 글 번호를 가진 레코드 읽기
    Class.forName("org.mariadb.jdbc.Driver");
    try (
        Connection conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost:3307/jspdb", "root", "maria");
            Statement stmt = conn.createStatement();
            
            // 쿼리 실행
            ResultSet rs = stmt.executeQuery(
                    "select * from board where num=" + num);
            ){
        if (rs.next()) {
            
            // 글 데이터를 변수에 저장
            writer = rs.getString("writer");
            title = rs.getString("title");
            content = rs.getString("content");
            regtime = rs.getString("regtime");
            hits = rs.getInt("hits");
            
            // 글 제목과 내용이 웹 페이지에 올바르게 출력되도록
            // 공백과 줄 바꿈 처리
            
            title  = title.replace(" ", "&nbsp;");
            content  = content.replace(" ", "&nbsp;").replace("\n", "<br>");
            
            // 이 글의 조회를 1올림
            stmt.executeUpdate(
                    "update board set hits=hits+1 where num=" + num);
            
        }
    }catch(Exception e){
        e.printStackTrace();
    }
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table { width:680px; text-align:center; }
    th { width:100px; background-color:cyan; }
    td { text-align:left; border:1px solid gray; }
</style>
</head>
<body>
<%-- 오류 발생인 게 데베가 없어서 그런 듯 --%>
<%--
<table>
    <tr>
        <th>제목</th>
        <td><%=title %></td>
    </tr>
    
    <tr>
        <th>작성자</th>
        <td><%=writer %></td>
    </tr>
    
    <tr>
        <th>작성일시</th>
        <td><%=regtime %></td>
    </tr>
    
    <tr>
        <th>조회수</th>
        <td><%=hits %></td>
    </tr>
    
    <tr>
        <th>내용</th>
        <td><%=content %></td>
    </tr>
</table>
--%>

<!-- 예시 입력값으로 대체 -->
<table>
    <tr>
        <th>제목</th>
        <td>예시 제목</td>
    </tr>
    
    <tr>
        <th>작성자</th>
        <td>예시 작성자</td>
    </tr>
    
    <tr>
        <th>작성일시</th>
        <td>2024-06-16 12:00</td>
    </tr>
    
    <tr>
        <th>조회수</th>
        <td>123</td>
    </tr>
    
    <tr>
        <th>내용</th>
        <td>예시 내용입니다. 이 내용은 데이터베이스에서 가져온 내용 대신 표시되는 예시 텍스트입니다.</td>
    </tr>
</table>

<br>
<input type="button" value="목록보기" onclick="location.href='notice_list.jsp'">

</body>
</html>
