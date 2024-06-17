<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사일정</title>
<link rel="stylesheet" href="loginstyle.css" type="text/css" />
<link href="./resource/images/title-logo.png" rel="shortcut icon" type="image/x-icon">
<script>
    function checkPassword() {
        var pw = document.getElementById("userPw").value;
        var pwCheck = document.getElementById("userPwCheck").value;
        if(pw === pwCheck) {
            document.getElementById("passwordMatch").style.color = 'green';
            document.getElementById("passwordMatch").innerHTML = '비밀번호가 일치합니다.';
        } else {
            document.getElementById("passwordMatch").style.color = 'red';
            document.getElementById("passwordMatch").innerHTML = '비밀번호가 일치하지 않습니다.';
        }
        
        if(pw === '' || pwCheck === '') {
            document.getElementById("passwordMatch").innerHTML = '';
        }
    }

    function checkPhoneNumber(){
        var phone = document.getElementById("userTel").value;
        var regex = /^[0-9]+$/;
        if(!regex.test(phone)){
            document.getElementById("phoneHelp").style.color = 'red';
            document.getElementById("phoneHelp").innerHTML = '숫자만 입력해주세요.';
        } else {
            document.getElementById("phoneHelp").innerHTML = '';
        }
    }

    function checkId() {
        var userId = document.getElementById("userId").value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "checkId.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                if (xhr.responseText.trim() === "true") {
                    document.getElementById("idCheckResult").style.color = 'red';
                    document.getElementById("idCheckResult").innerHTML = '이미 존재하는 아이디입니다.';
                } else {
                    document.getElementById("idCheckResult").style.color = 'green';
                    document.getElementById("idCheckResult").innerHTML = '사용 가능한 아이디입니다.';
                }
            }
        };
        xhr.send("userId=" + encodeURIComponent(userId));
    }


    function validateForm() {
        var userId = document.getElementById("userId").value;
        var userPw = document.getElementById("userPw").value;
        var userPwCheck = document.getElementById("userPwCheck").value;
        var userName = document.getElementById("userName").value;
        var userNum = document.getElementById("userNum").value;
        var userTel = document.getElementById("userTel").value;

        if(userId === '' || userPw === '' || userPwCheck === '' || userName === '' || userNum === '' || userTel === ''){
            alert('모든 필드를 채워주세요.');
            return false;
        }
        return true;
    }
</script>

</head>
<body>
    <div class="container"> 
        <h1>회원가입</h1>
        <form action="joinProcess.jsp" method="post" onsubmit="return validateForm()">
        	<p>
        	    <input id="userId" name="userId" type="text" placeholder="아이디" onkeyup="checkId()" required>
        	</p>
        	<p id="idCheckResult"></p>
        	<p><input id="userPw" name="userPw" type="password" placeholder="비밀번호" onkeyup="checkPassword()" required></p>
        	<p><input id="userPwCheck" name="userPwCheck" type="password" placeholder="비밀번호 확인" onkeyup="checkPassword()" required></p>
        	<p id="passwordMatch"></p>
        	<p><input id="userName" name="userName" type="text" placeholder="이름" required></p>
        	<p><input id="userNum" name="userNum" type="text" placeholder="학번" required></p>
        	<p><input id="userTel" name="userTel" type="tel" placeholder="전화번호" onkeyup="checkPhoneNumber()" required></p>
        	<p id="phoneHelp"></p>
        	<p><button class="btn">회원가입</button></p>
        	<p><button class="btn" onclick="location.href='login.jsp'">로그인</button></p>
        	
        </form>
    </div>
</body>

</html>
