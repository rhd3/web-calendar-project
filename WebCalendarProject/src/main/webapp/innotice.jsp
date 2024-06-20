<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
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

    private List<String> getGroupIdsByStudentId(int studentid) throws SQLException {
        List<String> groupIds = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");

            String sql = "SELECT DISTINCT groupid " +
                         "FROM grouplist " +
                         "WHERE studentid = ? AND authority = 1 AND NOT groupid = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, studentid);
            pstmt.setInt(2, studentid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String groupId = rs.getString("groupid");
                groupIds.add(groupId);
            }
        } catch (Exception e) {
            throw new SQLException("Failed to get group IDs by student ID", e);
        } 

        return groupIds;

    }

%>

<html>
<head>
    <link href="./resource/images/title-logo.png" rel="shortcut icon" type="image/x-icon">
    <meta charset="UTF-8">
    <title>게시물 작성</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>게시물 작성</h2>
        <div class="panel-body">
            <form method="post" action="writeSave.jsp" onsubmit="return validateForm()">
                <div class="form-group">
                    <label>작성자</label> 
                    <input class="form-control" name="writer">
                </div>
                <div class="form-group">
                    <label>제목</label> 
                    <input class="form-control" name="title">
                </div>
                <div class="form-group">
                    <label>내용</label>
                    <textarea class="form-control" rows="3" name="content"></textarea>
                </div>  

                <div class="form-group">
                    <label for="event-category" class="col-form-label">카테고리:</label>
                    <select class="form-control" name="category">
                        <%
                            List<String> groupIds = getGroupIdsByStudentId(studentid); 
                            for (String groupId : groupIds) {
                        %>
                        <option value="<%= groupId %>"><%= groupId %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            
                <div class="mt-4">
                    <input type="submit" class="btn btn-primary" value="글 등록하기">
                    <input type="button" class="btn btn-secondary" value="목록" onClick="location.href='notice_list.jsp'">
                </div>
            </form>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function validateForm() {
            var title = document.forms[0]["title"].value;
            var content = document.forms[0]["content"].value;
            if (title == "" || content == "") {
                alert("제목과 내용을 모두 입력하세요.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>