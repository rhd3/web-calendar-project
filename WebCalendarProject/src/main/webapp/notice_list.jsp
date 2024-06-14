<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<html>
<head>
    <title>공지사항</title>
    <style>
        .center {
            text-align: center;
        }
        .button-container {
            margin-top: 20px;
            text-align: right;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <p>목록 구현.. 및 목록 버튼 생성, 글쓰기 버튼 생성(innotice.jsp), 작성자 유효성 검사, 또?</p>
    <div class="button-container">
        <button onclick="location.href='${contextPath}/notice_list.jsp'">목록</button>
        <button onclick="location.href='${contextPath}/innotice.jsp'">글 쓰기</button>
    </div>
</body>
</html>
