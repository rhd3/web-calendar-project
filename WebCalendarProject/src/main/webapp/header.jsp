<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.time.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resource/css/bootstrap.min.css"/>
<link rel="stylesheet" href="./resource/css/font-awesome.min.css"/>
<script src="./resource/js/bootstrap.bundle.min.js"></script>
<%
    HttpSession userSession = request.getSession();
    int studentid = -1;
    String userName = "Unknown";
    if (userSession.getAttribute("studentid") != null) {
        studentid = (int)userSession.getAttribute("studentid");
    }
    // Get userName from the database using studentid
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");
        String sql = "SELECT userName FROM infouser WHERE studentid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, studentid);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            userName = rs.getString("userName");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<style>
  .custom-link {
    color: white;
    font-weight: bold;
    margin-right: 10px;
  }
  .navbar-nav .nav-link {
    color: white;
  }
  main {
    height: 100vh;
    height: -webkit-fill-available;
    max-height: 100vh;
    overflow-x: auto;
    overflow-y: hidden;
    display: flex;
    justify-content: flex-end;
  }
  .nav-link:hover {
    color: white;
    border-radius: 10px;
    background-color: blue !important;
  }
  .sidebar {
    width: 280px;
    background-color: #243c62;
    color: white;
    position: fixed;
    top: 0;
    right: 0;
    height: 100%;
    padding: 15px;
    display: none;
    z-index: 1050;
    border-radius: 10px;
  }
  .sidebar h3 {
    user-select: none; /* 드래그 방지 속성 */
  }
  .sidebar.show {
    display: block;
  }
  .close-btn {
    color: white;
    font-size: 24px;
    position: absolute;
    top: 10px;
    right: 15px;
    cursor: pointer;
  }
  .calendar-container {
    border: none;
    box-shadow: none;
  }
  .btn {
    border-radius: 10px;
  }
  .sidebar-toggle-btn {
    background: transparent;
    border: none;
    color: white;
    font-size: 28px;
    cursor: pointer;
  }
  .navbar-brand img, .sidebar-toggle-btn svg {
    margin-top: -8px; /* 로고 아이콘과 사이드바 토글 아이콘을 5px 위로 올림 */
  }
  .navbar-text {
    margin-left: 10px; /* 사용자 접속중 텍스트를 왼쪽으로 이동 */
  }
  .nav-pills .nav-link {
    color: white;
  }
  .nav-pills .nav-link:hover {
    background-color: blue;
    border-radius: 10px;
  }
  .navbar-text {
    margin-left: auto;
    margin-right: 10px;
  }
  .sidebar-toggle-btn svg {
    width: 32px;
    height: 32px;
  }
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg" data-bs-theme="dark" style="background-color: #304C79;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="./resource/images/title-logo.svg" alt="Bootstrap" width="30" height="24">
      <span style="color: white;">학사일정</span>
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link custom-link" aria-current="page" href='calendar.jsp'>캘린더</a>
        </li>
        <li class="nav-item">
          <a class="nav-link custom-link" aria-current="page" href='manage.jsp'>일정 등록</a>
        </li>
        <span class="navbar-text">
          <%= userName %> 님 접속중
        </span>
      </ul>
      <button type="button" class="btn btn-warning" onclick="location.href='login.jsp'">로그아웃</button>
      <button id="sidebarToggle" type="button" class="sidebar-toggle-btn">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
        </svg>
      </button>
    </div>
  </div>
</nav>
<div class="sidebar" id="sidebar">
  <span class="close-btn" id="closeSidebar">&times;</span>
  <h3>Sidebar</h3>
  <ul class="nav nav-pills flex-column mb-auto">
    <li class="nav-item">
      <a href="notice_list.jsp" class="nav-link">공지사항</a>
    </li>
    <li>
      <a href="accountsetting.jsp" class="nav-link">마이페이지</a>
    </li>
  </ul>
  <hr>
  <div class="dropdown">
    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
      <strong>교내 홈페이지</strong>
    </a>
    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
      <li><a class="dropdown-item" href="https://www.cju.ac.kr/">청주대학교</a></li>
      <li><hr class="dropdown-divider"></li>
      <li><a class="dropdown-item" href="https://portal.cju.ac.kr/">포털시스템</a></li>
      <li><a class="dropdown-item" href="https://hive.cju.ac.kr/">에델바이스</a></li>
      <li><a class="dropdown-item" href="https://www.cju.ac.kr/www/selectTnRstrntMenuListU.do?key=5117">학식 메뉴</a></li>
    </ul>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const sidebar = document.getElementById('sidebar');
  const sidebarToggle = document.getElementById('sidebarToggle');
  const closeSidebar = document.getElementById('closeSidebar');
  
  sidebarToggle.addEventListener('click', function() {
    sidebar.classList.toggle('show');
  });

  closeSidebar.addEventListener('click', function() {
    sidebar.classList.remove('show');
  });

  const dropdownToggle = document.querySelector('[data-bs-toggle="dropdown"]');
  const dropdownMenu = document.querySelector('.dropdown-menu');

  dropdownToggle.addEventListener('click', function(e) {
    e.preventDefault();
    dropdownMenu.classList.toggle('show');
  });

  document.addEventListener('click', function(e) {
    if (!dropdownMenu.contains(e.target) && !dropdownToggle.contains(e.target)) {
      dropdownMenu.classList.remove('show');
    }
  });

  const navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(link => {
    link.addEventListener('mouseover', function(event) {
      link.classList.add('active');
    });
    link.addEventListener('mouseout', function(event) {
      link.classList.remove('active');
    });
  });

  const currentPage = document.querySelector('.nav-link[href="' + window.location.pathname.split('/').pop() + '"]');
  if (currentPage) {
    currentPage.classList.add('active');
  }
});
</script>

</body>
</html>
