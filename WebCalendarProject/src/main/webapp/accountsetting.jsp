<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        /* 헤더 스타일 */
        header {
            background-color: #304C79;
            color: #fff;
            padding: 20px;
        }
        header h1 {
            margin: 0;
        }
        header nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }
        header nav ul li {
            margin-right: 20px;
        }
        header nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        /* 메인 콘텐츠 스타일 */
        main {
            padding: 20px;
        }
        section {
            margin-bottom: 40px;
        }
        section h2 {
            margin-top: 0;
        }
        form label {
            display: block;
            margin-bottom: 5px;
        }
        form input {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }
        form button {
            background-color: #304C79;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        ul li {
            margin-bottom: 20px;
        }

        /* 푸터 스타일 */
        footer {
            background-color: #304C79;
            color: #fff;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

    <header style="margin-top: 20px;">
        <h1>마이페이지</h1>
    </header>

    <main>
        <section>
            <h2>개인 정보</h2>
            <form action="updateProfile.jsp" method="post">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="${user.name}" required>
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" value="${user.email}" required>
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit">저장</button>
            </form>
        </section>

        <section>
            <h2>주문 내역</h2>
            <table>
                <thead>
                    <tr>
                        <th>주문 번호</th>
                        <th>주문 날짜</th>
                        <th>총 금액</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.totalAmount}</td>
                            <td>${order.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>

        <section>
            <h2>작성한 리뷰</h2>
            <ul>
                <c:forEach var="review" items="${reviewList}">
                    <li>
                        <h3>${review.product.name}</h3>
                        <p>${review.content}</p>
                        <p>평점: ${review.rating}</p>
                        <p>작성 날짜: ${review.createdAt}</p>
                    </li>
                </c:forEach>
            </ul>
        </section>
    </main>

    <footer>
        <p>&copy; 2023 마이페이지. All rights reserved.</p>
    </footer>
</body>
</html>
