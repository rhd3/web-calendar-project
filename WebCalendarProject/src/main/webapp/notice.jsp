<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <script>
        function openNoticePage() {
            window.location.href = '<%= request.getContextPath() %>/notice_list.jsp';
        }
    </script>
</head>
<body>
    <button onclick="openNoticePage()" style="position: absolute; top: 45px; left: 870px;">공지사항</button>
</body>
</html>
