<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 작성</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>게시물 작성</h2>
        <div class="panel-body">
            <form method="post" action="writeSave.jsp">
                <div class="form-group">
                    <label>작성자</label> 
                    <input class="form-control" name="writer" value="${successUser}" readonly>
                </div>
                <div class="form-group">
                    <label>제목</label> 
                    <input class="form-control" name="title">
                </div>
                <div class="form-group">
                    <label>내용</label>
                    <textarea class="form-control" rows="3" name="content"></textarea>
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
</body>
</html>
