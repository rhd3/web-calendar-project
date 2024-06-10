<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <script>
        function openNoticePopup() {
            var popup = window.open("", "noticePopup", "width=600,height=400,scrollbars=yes");
            popup.document.write(`
                <head>
                    <title>공지사항</title>
                </head>
                <body>
                    <div id="innotice-content" class="notice"></div>
                </body>
            `);
            popup.document.close();
            
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '<%= request.getContextPath() %>/innotice.jsp', true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var innoticeContent = popup.document.getElementById('innotice-content');
                    innoticeContent.innerHTML = xhr.responseText;
                } else if (xhr.readyState == 4) {
                    var innoticeContent = popup.document.getElementById('innotice-content');
                    innoticeContent.innerHTML = 'Failed to load content.';
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>
    <button onclick="openNoticePopup()" style="position: absolute; top: 45px; left: 325px;">공지사항</button>
 
</body>
</html>
