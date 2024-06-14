<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <script>
        function openListPage() {
            window.location.href = '<%= request.getContextPath() %>/inlist.jsp';
        }
    </script>
</head>
<body>
   <button onclick="openListPage()" style="position: absolute; top: 45px; left: 965px;">To do list</button>
</body>
</html>
