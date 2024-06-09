<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<html>
<head>
<title>공지사항</title>
</head>
<body>
	<table>
<thead>
	<tr>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일자</th>
	</tr>
</thead>

<tbody>							
<c:forEach items="" var="">							
	게시글이 반복될 부분
</c:forEach>
</tbody>
</table>

<div>
<a href="${contextPath }/board/write">
<input type="button" value="글쓰기" class="btn btn-xs pull-right"  style= "font-size: 17px; ">
</a>
</div>
</body>
</html>
