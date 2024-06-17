<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <style>
        div.notice {
        	position: relative;
            top: 35%;
            left: 25%;
            margin: 10px;
            padding: 20px;
		    background-image: linear-gradient(to top, #E7ECF2 70%,#328DDC 30%);
            width: 500px;
            height: 300px;
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
            font-size: 20px;
            background-color: #3E8DDC;
            color: #FFFFFF;
            border: none;
            cursor: pointer;
        }
        .notice button:hover {
            background-color: #3E8DDC;
        }
    </style>
</head>

<body>
    <div class="notice">
        <div class="notice-header">
            <span>공지사항</span>
            <button onclick="location.href='notice_list.jsp'">+</button>
        </div>
            <li>제목(title) 작성일(regtime)만 뜨도록. 제목 클릭시 해당 페이지(view.jsp)로 이동</li>
    </div>
</body>

</html>
