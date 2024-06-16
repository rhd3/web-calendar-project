<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>공지사항</title>
    <style>
        table { width:680px; text-align:center; margin: 0 auto; }
        th { background-color: cyan; }
        .num { width: 80px; }
        .title { width: 230px; }
        .writer { width: 100px; }
        .regtime { width: 180px; }
        a:link { text-decoration: none; color: blue; }
        a:visited { text-decoration: none; color: gray; }
        a:hover { text-decoration: none; color: red; }
        .button-container { margin-top: 20px; text-align: right; }
        .button-container button { padding: 10px 20px; font-size: 16px; cursor: pointer; margin-left: 10px; }
    </style>
</head>
<body>
    <table>
        <tr>
            <th class="num">번호</th>
            <th class="title">제목</th>
            <th class="writer">작성자</th>
            <th class="regtime">작성일</th>
            <th class="content">내용</th>
            <th>조회수</th>
        </tr>
        <%--
        데베 예시?
        <tr>
        	<% // 게시글 리스트 읽어오기
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/userdb?useUnicode=true&characterEncoding=UTF-8", "root", "1111");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from board order by num desc");
            ) {
                // 게시글 레코드가 남아있는 동안 반복하여 화면에 출력
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("num") %></td>
            <td style="text-align:left;">
                <a href="list.jsp?num=<%= rs.getInt("num") %>"><%= rs.getString("title") %></a>
            </td>
            <td><%= rs.getString("writer") %></td>
            <td><%= rs.getString("regtime") %></td>
            <td><%= rs.getString("content") %></td>
            <td><%= rs.getInt("hits") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        --%>
        <!-- 게시글 리스트 예시 -->
        <tr>
            <td>1</td>
            <td style="text-align:left;"><a href="view.jsp?num=1">Sample Title</a></td>
            <td>Writer</td>
            <td>2024-06-16</td>
            <td>Sample content...</td>
            <td>10</td>
        </tr>
        <!-- 반복할 게시글은 여기 추가 -->
    </table>
    <div class="button-container">
        <button onclick="location.href='${contextPath}/notice_list.jsp'">목록</button>
        <button onclick="location.href='${contextPath}/innotice.jsp'">글 쓰기</button>
    </div>
</body>
</html>
