<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession userSession = request.getSession();
    int studentid = -1;
    if (userSession.getAttribute("studentid") != null) {
        studentid = (int)userSession.getAttribute("studentid");
    }
%>

<%

    // 게시글 데이터를 담을 변수 정의
    String writer = "";
    String title = "";
    String content = "";
    String regtime = "";
    int num = Integer.parseInt(request.getParameter("num"));
    
    // 지정된 글 번호를 가진 레코드 읽기
    Class.forName("com.mysql.cj.jdbc.Driver");
    try (
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendardb", "root", "1111");
            Statement stmt = conn.createStatement();
            
            // 쿼리 실행
            ResultSet rs = stmt.executeQuery(
                    "select * from notice where num=" + num);
            ){
        if (rs.next()) {
            
            // 글 데이터를 변수에 저장
            writer = rs.getString("writer");
            title = rs.getString("title");
            content = rs.getString("content");
            regtime = rs.getString("regtime");
            
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
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 80%;
            max-width: 800px;
            background-color: #ffffff;
            padding: 20px;
            padding-left: 40px;  /* Add left padding */
            padding-right: 40px; /* Add right padding */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #0056b3;
        }
        table {
            width: 100%;
            text-align: center;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 15px;
            border: 1px solid #dddddd;
        }
        th {
            background-color: #0056b3;
            color: white;
            white-space: nowrap; /* Prevent line breaks */
        }
        td {
            text-align: left;
            color: #333333;
        }
        td.content {
            white-space: normal; /* Allow line breaks for content */
        }
        .button-container {
            text-align: right;
            margin-top: 20px;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4px;
        }
        .button-container button:hover {
            background-color: #003f7f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>공지사항 상세보기</h1>
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
                <th>내용</th>
                <td><%=content %></td>
            </tr>
        </table>

        <div class="button-container">
            <button onclick="window.history.back()">목록으로</button>
        </div>
    </div>
</body>
</html>
