<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*, java.util.*, java.time.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession userSession = request.getSession();
    int studentid = -1;
    if (userSession.getAttribute("studentid") != null) {
        studentid = (int)userSession.getAttribute("studentid");
    }
%>


<%!
    private String[] getuser(int studentid) {
        String[] userinfo = new String[3];

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");

            String sql = "select userid, username, usertel from infouser where studentid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, studentid);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                userinfo[0] = rs.getString("userid");
                userinfo[1] = rs.getString("username");
                userinfo[2] = rs.getString("usertel");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return userinfo;
    }

    private List<String> getGroupIdsByStudentId(int studentid) {
        List<String> groupIds = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");

            String sql = "SELECT DISTINCT groupid " +
                         "FROM grouplist " +
                         "WHERE studentid = ? AND authority = 1";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, studentid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String groupId = rs.getString("groupid");
                groupIds.add(groupId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return groupIds;
    }

    private List<String> getGroupIds(int studentid) {
        List<String> allgroupIds = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");

            String sql = "SELECT DISTINCT groupid FROM grouplist WHERE groupid NOT IN (SELECT DISTINCT groupid FROM grouplist WHERE studentid = ? and authority = 1); ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, studentid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String allgroupId = rs.getString("groupid");
                allgroupIds.add(allgroupId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return allgroupIds;
    }

    private List<String> getmyGroupIds(int studentid) {
        List<String> mygroupIds = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");

            String sql = "SELECT DISTINCT groupid " +
                         "FROM grouplist " +
                         "WHERE studentid = ? AND not authority = 1 ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, studentid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String mygroupId = rs.getString("groupid");
                mygroupIds.add(mygroupId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return mygroupIds;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        header {
            background-color: #304C79;
            color: #fff;
            padding: 20px;
        }
        header h1 {
            margin: 0;
        }
        .main-content {
            padding: 30px;
        }
        .profile-image {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 30px;
        }
        .user-info-table {
            width: 100%;
            max-width: 600px;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .user-info-table th,
        .user-info-table td {
            padding: 10px;
            border: 1px solid #ccc;
            width: 15%;
        }
        .user-info-table th {
            background-color: #f2f2f2;
            text-align: left;
            width: 30%"
        }
        .box {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            width: 43%;
            height: 30vh;
            border: 1px solid #ccc;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
    </style>
    <script>
        function addGroup() {
            const groupid = document.getElementById("groupDropdown").value;
            const studentid = <%= studentid %>;

            if (groupid) {
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "addGroup.jsp", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        location.reload();
                    }
                };
                xhr.send("studentid=" + studentid + "&groupid=" + groupid);
            }
        }

        function deleteGroup(groupid) {
            const studentid = <%= studentid %>;

            if (groupid) {
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "deleteGroup.jsp", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        location.reload();
                    }
                };
                xhr.send("studentid=" + studentid + "&groupid=" + groupid);
            }
        }
    </script>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="main-content">
    <header>
        <h1>마이페이지</h1>
    </header>

    <%
        String[] userinfo = getuser(studentid);
        String userid = userinfo[0];
        String username = userinfo[1];
        String usertel = userinfo[2];
    %>

    <div class="d-flex justify-content-center">
        <img src="<c:url value="/resource/images/img_no_profile_woman.png"/>" alt="profile image" class="profile-image">
        <table class="user-info-table">
            <tr>
                <th>ID</th>
                <td><%= userid %></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><%= username %></td>
            </tr>
            <tr>
                <th>연락처</th>
                <td><%= usertel %></td>
            </tr>
            <tr>
                <th>학번</th>
                <td><%= studentid %></td>
            </tr>
            <tr>
                <th>관리 그룹</th>
                <td>
                    <%
                        List<String> groupIds = getGroupIdsByStudentId(studentid);
                        for (String groupId : groupIds) {
                    %>
                    <div>
                        <%= groupId %> <button class="btn btn-danger btn-sm" onclick="deleteGroup('<%= groupId %>')">X</button>
                    </div>
                    <% } %>
                </td>
            </tr>
            <tr>
                <th>소속 그룹</th>
                <td>
                    <%
                        List<String> mygroupIds = getmyGroupIds(studentid);
                        for (String mygroupId : mygroupIds) {
                    %>
                    <div>
                        <%= mygroupId %> <button class="btn btn-danger btn-sm" onclick="deleteGroup('<%= mygroupId %>')">X</button>
                    </div>
                    <% } %>
                </td>
            </tr>
        </table>
    </div>
</div>

<div class="box">
    <select id="groupDropdown" class="form-control">
        <option value="">그룹 선택</option>
        <% 
            List<String> allgroupIds = getGroupIds(studentid);
            for (String allgroupId : allgroupIds) { 
        %>
        <option value="<%= allgroupId %>"><%= allgroupId %></option>
        <% } %>
    </select>
    <button class="btn btn-primary mt-2" onclick="addGroup()">추가</button>

    <div class="d-flex justify-content-center mt-3">
        <p>동아리 개설 및 삭제는 관리자에게 연락 바랍니다.</p>
    </div>
</div>

<footer class="fixed-bottom">
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
