<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <script>
        function openNoticePopup() {
            var popup = window.open("", "noticePopup", "width=600,height=400,scrollbars=yes");
            popup.document.write(`
                <html>
                <head>
                    <title>공지사항</title>
                    <style>
                        div.notice {
                            top: 100px;
                            left: 100px;
                            position: relative;
                            margin: 10px;
                            padding: 20px;
                            width: 500px;
                            height: 300px;
                            background-color: #3E8DDC;
                            font-size: 20px;
                            color: white;
                            border: 2px solid;
                        }
                    </style>
                </head>
                <body>
                    <div id="innotice-content"></div>
                </body>
                </html>
            `);
            popup.document.close();
            
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '<%= request.getContextPath() %>/innotice.jsp', true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var innoticeContent = popup.document.getElementById('innotice-content');
                    innoticeContent.innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>
    <button onclick="openNoticePopup()">공지사항</button>
</body>
</html>
