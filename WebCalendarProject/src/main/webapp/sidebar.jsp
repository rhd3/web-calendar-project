<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.time.*" %>
<!DOCTYPE html>

<%
    HttpSession userSession = request.getSession();
    int studentid = -1;
    if (userSession.getAttribute("studentid") != null) {
        studentid = (int) userSession.getAttribute("studentid");
    }
%>

<%!
    private List<String> getGroupIdsByStudentId(int studentid) {
        List<String> groupIds = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");

            String sql = "SELECT DISTINCT groupid " +
                    "FROM grouplist " +
                    "WHERE studentid = ? AND authority = 1 AND NOT groupid = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, studentid);
            pstmt.setInt(2, studentid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String groupId = rs.getString("groupid");
                groupIds.add(groupId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return groupIds;
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <script src="./resource/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="./resource/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./resource/css/font-awesome.min.css"/>

    <title>학사 일정</title>

    <style>
        .custom-link {
            color: white;
            font-weight: bold;
            margin-right: 10px;
        }

        /* 추가적인 스타일링 */
        .navbar-nav .nav-link {
            color: white;
        }

        /* 사이드바 스타일 */
        .sidebar {
            position: fixed;
            top: 0;
            bottom: 0;
            left: -280px; /* 초기에는 왼쪽에 숨김 */
            width: 280px;
            background-color: #304C79;
            transition: left 0.3s ease;
            z-index: 1030; /* Bootstrap Navbar보다 앞에 위치 */
        }

        .sidebar.show {
            left: 0; /* 사이드바가 열릴 때 왼쪽으로 이동 */
        }

        .sidebar .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            color: white;
            font-size: 24px;
            cursor: pointer;
        }

        .content {
            margin-left: 280px; /* 사이드바 열릴 때 content 영역을 오른쪽으로 이동 */
            transition: margin-left 0.3s ease;
        }

        .content.sidebar-open {
            margin-left: 0;
        }

        .navbar-toggler {
            border-color: white;
        }

    </style>

</head>

<body>

<nav class="navbar navbar-expand-lg" data-bs-theme="dark" style="background-color: #304C79;">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="./resource/images/title-logo.svg" alt="Bootstrap" width="30" height="24">
            <span style="color: white;">학사일정</span> <!-- 글자 색을 검정색으로 변경 -->
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link custom-link" aria-current="page" href='calendar.jsp'>캘린더</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        교내 홈페이지
                    </a>
                    <ul class="dropdown-menu" data-bs-theme="light">
                        <li><a class="dropdown-item" href="https://www.cju.ac.kr/">청주대학교</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="https://portal.cju.ac.kr/">포털시스템</a></li>
                        <li><a class="dropdown-item" href="https://hive.cju.ac.kr/">에델바이스</a></li>
                        <li><a class="dropdown-item"
                               href="https://www.cju.ac.kr/www/selectTnRstrntMenuListU.do?key=5117">학식 메뉴</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true">--</a>
                </li>
            </ul>
            <button type="button" class="btn btn-primary" onclick="location.href='ran.jsp'">메뉴추천</button>
            <a class="nav-link custom-link" aria-current="page" href='manage.jsp'>일정 등록</a>
            <button type="button" class="btn btn-warning" onclick="location.href='login.jsp'">로그아웃</button>

        </div>
        <button class="navbar-toggler ms-auto d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBackdrop" aria-controls="offcanvasWithBackdrop">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasWithBackdrop" aria-labelledby="offcanvasWithBackdropLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasWithBackdropLabel">Sidebar</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="home.jsp">
                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                    Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="dashboard.jsp">
                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="orders.jsp">
                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"/></svg>
                    Orders
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="products.jsp">
                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                    Products
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customers.jsp">
                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                    Customers
                </a>
            </li>
        </ul>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        const sidebarToggle = document.querySelector('[data-bs-target="#offcanvasWithBackdrop"]');
        const offcanvas = new bootstrap.Offcanvas(sidebarToggle);
        const closeButtons = document.querySelectorAll('.btn-close');

        closeButtons.forEach(btn => {
            btn.addEventListener('click', () => {
                offcanvas.hide();
            });
        });

        document.addEventListener('click', (e) => {
            const target = e.target;
            const isToggleButton = target.closest('[data-bs-target="#offcanvasWithBackdrop"]');

            if (!isToggleButton && !offcanvas._backdrop.classList.contains('show')) {
                offcanvas.hide();
            }
        });
    });
</script>

</body>
</html>
