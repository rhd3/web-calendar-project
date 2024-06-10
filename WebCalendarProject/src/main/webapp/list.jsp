<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <script>
        function openListPopup() {
            var popup = window.open("", "listPopup", "width=600,height=400,scrollbars=yes");
            popup.document.write(`
                <head>
                    <title>To do list</title>
                </head>
                <body>
                    <div id="inlist-content" class="list"></div>
                </body>
            `);
            popup.document.close();

            var xhr = new XMLHttpRequest();
            xhr.open('GET', '<%= request.getContextPath() %>/inlist.jsp', true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var inlistContent = popup.document.getElementById('inlist-content');
                    inlistContent.innerHTML = xhr.responseText;
                } else if (xhr.readyState == 4) {
                    var inlistContent = popup.document.getElementById('inlist-content');
                    inlistContent.innerHTML = 'Failed to load content.';
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>
   <button onclick="openListPopup()" style="position: absolute; top: 45px; left: 420px;">To do list</button>
	
</body>
</html>
