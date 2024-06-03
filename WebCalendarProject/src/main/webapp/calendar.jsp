<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/es5-shim/4.5.15/es5-shim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/es5-shim/4.5.15/es5-sham.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <title>캘린더</title>
   
</head>
<body>
	<script type="text/javascript">
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var day = today.getDate();
		<!-- document.write(year + "년 " + month + "월 " + day + "일"); -->
	</script>
	
	<style type="text/css">
	
		.date {border-collapse:separate;  border-color:black; border-style:solid; border-width:1px; text-align: center; width: 10%; min-height: 50px;}
		.line {border-collapse:collapse;  border-color:black; border-style:solid; border-width:0px; text-align: center; width: 100%; display: flex; align-items: center; justify-content: center;}
</style>
		
	
<div align-items="center" justify-content="center" style="justify-content: center;">
	<div width="70%" height="50px" style="text-align: center; color: black; background-color: #b7e4b5; display: flex; align-items: center; justify-content: center; margin-top: 50px; margin-bottom: 50px;">
		
			<button id="prev-month">이전달</button>

				<div style= "margin-left: 10%; margin-right: 10%;" ><script type="text/javascript" >
					document.write(year + "년 " + month + "월 ");
				</script></div>

			<button id="next-month">다음달</button>
	</div>
		

		<table width="70%" height="50px" padding-left=auto; padding-right=auto style="margin: 0 auto;">
		  	<thead>
			<tr>
			<th class="date" width="10%" height="50px">월</th>
			<th class="date">화</th>
			<th class="date">수</th>
			<th class="date">목</th>
			<th class="date">금</th>
			<th class="date">토</th>
			<th class="date">일</th>
		  </tr></thead>
		

			<c:forEach begin="1" end="5" step="1" var="i">
		  	<tr>
				<c:forEach begin="1" end="7" step="1" var="j">
					<td class="date">
						<div class="line"> 날짜 </div>
						<div class="line"> 일정 1 </div>
						<div class="line"> 일정 2 </div>
						<div class="line"> 일정 3 </div>
						<div class="line"> 일정 5 </div>
						<div class="line"> 일정 6 </div>
					</td>
				</c:forEach>
		  	</tr>
			</c:forEach>
		</table>
</div>

</body>
</html>
