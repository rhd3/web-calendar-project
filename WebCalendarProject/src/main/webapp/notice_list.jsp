<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%!
    private static final int PAGE_SIZE = 20;

    private List<Map<String, Object>> getNoticeList(int studentid, int currentPage) {
        List<Map<String, Object>> noticeList = new ArrayList<>();
        try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendardb", "root", "1111");
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM notice WHERE category IN (SELECT groupid FROM grouplist WHERE studentid = ?) ORDER BY num DESC LIMIT ?, ?");
        ) {
            stmt.setInt(1, studentid);
            stmt.setInt(2, (currentPage - 1) * PAGE_SIZE);
            stmt.setInt(3, PAGE_SIZE);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> notice = new HashMap<>();
                notice.put("num", rs.getInt("num"));
                notice.put("title", rs.getString("title"));
                notice.put("writer", rs.getString("writer"));
                notice.put("regtime", rs.getString("regtime"));
                notice.put("category", rs.getString("category"));
                noticeList.add(notice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return noticeList;
    }

    private int getTotalCount(int studentid) {
        int totalCount = 0;
        try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendardb", "root", "1111");
            PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM notice WHERE category IN (SELECT groupid FROM grouplist WHERE studentid = ?)");
        ) {
            stmt.setInt(1, studentid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalCount;
    }

    private int getTotalPages(int totalCount) {
        return (totalCount + PAGE_SIZE - 1) / PAGE_SIZE;
    }
%>

<!DOCTYPE html>
<html>
<head>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

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

    <%
        int studentid = (Integer)session.getAttribute("studentid");
        int currentPage = 1;
        if (request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        List<Map<String, Object>> noticeList = getNoticeList(studentid, currentPage);
        for (Map<String, Object> notice : noticeList) {
    %>
    <tr>
        <td><%= notice.get("num") %></td>
        <td style="text-align:left;">
            <a href="${contextPath}/view.jsp?num=<%= notice.get("num") %>">
                <%= notice.get("title") %>
            </a>
        </td>
        <td><%= notice.get("writer") %></td>
        <td><%= notice.get("regtime") %></td>
        <td><%= notice.get("category") %></td>
    </tr>
    <% } %>
</table>

<div class="button-container" style="display: flex; justify-content: space-between;">
    <% 
        int totalCount = getTotalCount(studentid);
        int totalPages = getTotalPages(totalCount);
        for (int i = 1; i <= totalPages; i++) {
    %>
    <button onclick="location.href='${contextPath}/notice_list.jsp?currentPage=<%= i %>'">
        <%= i %>
    </button>
    <% } %>

    
    <button onclick="location.href='${contextPath}/innotice.jsp'">글 쓰기</button>

</div>

</body>
</html>
