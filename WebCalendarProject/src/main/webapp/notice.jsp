<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <style>
        div.notice {
            top: 330px;
            left: 130px;
            position: relative;
            margin: 10px;
            padding: 20px;
            width: 500px;
            height: 300px;
            background-color: #3E8DDC;
            font-size: 20px;
            color: white;
            /*border: 2px solid;*/
        }
        .notice-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .notice button {
            padding: 5px 10px;
            font-size: 18px;
            background-color: #ffffff;
            color: #3E8DDC;
            border: none;
            cursor: pointer;
        }
        .notice button:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>

<body>
    <div class="notice">
        <div class="notice-header">
            <span>공지사항</span>
            <button onclick="location.href='notice_list.jsp'">+</button>
        </div>
        <ul>
            <li> 내용 </li>
        </ul>
    </div>
</body>

</html>
