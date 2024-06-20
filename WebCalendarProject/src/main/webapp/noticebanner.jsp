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
	<link href="./resources/image/title-logo.png" rel="shortcut icon" type="image/x-icon">
    <title>공지사항</title>
   <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        table {
            width: 680px;
            text-align: center;
            margin: 0 auto;
            border-collapse: collapse;
            margin-top: 20px;
        }
      th {
            background-color: #0056b3; /* 파란색 배경 */
            color: #ffffff; /* 흰색 텍스트 */
            padding: 10px;
            white-space: nowrap; /* 줄바꿈 안되게 */
        
        }
        td {
            background-color: #ffffff; /* 흰색 배경 */
            color: #333333; /* 짙은 회색 텍스트 */
            padding: 10px;
            border-bottom: 1px solid #dddddd; /* 연한 회색 테두리 */
            vertical-align: middle; /* 세로 중앙 정렬 */
        }
        .num {
            width: 80px;
        }
        .title {
            width: 230px;
        }
        .writer {
            width: 100px;
        }
        .regtime {
            width: 180px;
        }
        .views {
            width: 80px;
        }
        a:link {
            text-decoration: none;
            color: #0056b3; /* 파란색 텍스트 */
        }
        a:visited {
            text-decoration: none;
            color: #888888; /* 회색 텍스트 */
        }
        a:hover {
            text-decoration: underline;
            color: #ff0000; /* 빨간색 텍스트 */
        }
        .button-container {
            margin-top: 20px;
            text-align: right;
            width: 680px;
            margin: 20px auto;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
            background-color: #0056b3; /* 파란색 배경 */
            color: white;
            border: none;
            border-radius: 4px;
        }
        .button-container button:hover {
            background-color: #003f7f; /* 더 진한 파란색 */
        }
    </style>

</head>
<body>
    <jsp:include page="header.jsp"/>
    <table>
        <tr>
            <th class="num">번호</th>
            <th class="title">제목</th>
            <th class="writer">작성자</th>
            <th class="regtime">작성일</th>
            <th class="category">그룹</th>
        </tr>

        <tr>
        <% // 게시글 리스트 읽어오기
        int studentid = (Integer)session.getAttribute("studentid");

        try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendardb", "root", "1111");
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM notice WHERE category IN (SELECT groupid FROM grouplist WHERE studentid = ? ) ORDER BY num DESC");
        ) {
            stmt.setInt(1, studentid);
            ResultSet rs = stmt.executeQuery();

            // 게시글 레코드가 남아있는 동안 최대 5번 반복하여 화면에 출력
            int count = 0;
            while (rs.next() && count < 5) {
                count++;
        %>

            <tr>
                <td><%= rs.getInt("num") %></td>
                <td style="text-align:left;">
                    <a href="${contextPath}/view.jsp?num=<%= rs.getInt("num") %>">
                        <%= rs.getString("title") %>
                    </a>
                </td>
                <td><%= rs.getString("writer") %></td>
                <td><%= rs.getString("regtime") %></td>
                <td><%= rs.getString("category") %></td>
        
            </tr>
            </tr>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    
      
    </table>
</body>
</html>