<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<script src="./resource/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css"/>
<link rel="stylesheet" href="./resource/css/font-awesome.min.css"/>
<title>학사 일정</title>
</head>
<body>
<nav class="navbar navbar-expand-lg" data-bs-theme="dark" style="background-color: #304C79;">
  <div class="container-fluid">
  	<a class="navbar-brand" href="#">
      <img src="./resource/images/title-logo.svg" alt="Bootstrap" width="30" height="24">
      학사일정
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href='manage.jsp'">관리자</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">뭐쓰지</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            고민..
          </a>
          <ul class="dropdown-menu" data-bs-theme="light">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">여긴.. 학번이나 이름띄울까?없애도되고..</a>
        </li>
      </ul>
     <a>
     	<button type="button" class="btn btn-warning" onclick="location.href='login.jsp'">로그인</button>
     </a>
    </div>
  </div>
</nav>

</body>
</html>