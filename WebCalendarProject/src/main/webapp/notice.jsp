<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
   <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: space-between;
            margin: 20px;
        }

        .notice {
            width: 30%;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .notice .notice-header {
            background-color: #328DDC;
            color: #ffffff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .notice .notice-header h2 {
            margin: 0;
            font-size: 24px;
        }

        .notice .notice-content {
            padding: 10px;
            background-color: #ffffff;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        }

        .notice .notice-content ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .notice .notice-content ul li {
            padding: 10px;
            border-bottom: 1px solid #dddddd;
            cursor: pointer;
        }

        .notice .notice-content ul li:hover {
            background-color: #f2f2f2;
        }

     

    </style>

  

</head>

<body>

    <div style="display: flex; justify-content: space-between;">
        <div class="notice">
            <div class="notice-header">
                <span>공지사항</span>
                <button onclick="location.href='notice_list.jsp'">+</button>
            </div>
                <li>제목(title) 작성일(regtime)만 뜨도록. 제목 클릭시 해당 페이지(view.jsp)로 이동</li>
        </div>

      
    </div>

</body>

</html>
