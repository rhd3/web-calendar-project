<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.time.*" %>
<!DOCTYPE html>

<%!

int studentid = 2020011898;
 
 
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
</style>

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
      		<a class="nav-link active " aria-current="page" href='calendar.jsp'">캘린더</a>
    	</li>
        <li class="nav-item">
          <a class="nav-link" href="#">뭐쓰지</a>
        </li>


        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            숨기기
          </a>
          <ul class="dropdown-menu" data-bs-theme="light">
          
            <li><div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                  할 일 1
                </label>
              </div></li>
            <li><div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                <label class="form-check-label" for="flexCheckChecked">
                  할 일 2
                </label>
              </div></li>
            <li><div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled">
                <label class="form-check-label" for="flexCheckDisabled">
                  할 일 3
                </label>
              </div></li>
          </ul>
        </li>


        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">--</a>
        </li>
      </ul>

      <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
          옵션
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <li><a class="dropdown-item" href="#">옵션1</a></li>
          <li><a class="dropdown-item" href="#">옵션2</a></li>
        </ul>
      </div>
      <a class="nav-link custom-link" aria-current="page" href='manage.jsp'>일정 등록</a>
      <button type="button" class="btn btn-warning" onclick="location.href='login.jsp'">로그아웃</button>
    </div>
  </div>
</nav>

</body>
</html>
