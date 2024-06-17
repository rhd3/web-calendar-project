<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%

    int num = Integer.parseInt(request.getParameter("num"));

    // 게시글 데이터를 담을 변수 정의
    String writer = "";
    String title = "";
    String content = "";
    String regtime = "";

    
    // 지정된 글 번호를 가진 레코드 읽기
    Class.forName("com.mysql.cj.jdbc.Driver");
    try (
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendardb", "root", "1111");
            Statement stmt = conn.createStatement();
            
            // 쿼리 실행
            ResultSet rs = stmt.executeQuery(
                    "select * from notice where num=" + num);
            ){
        if (rs.next()) {
            
            // 글 데이터를 변수에 저장
            writer = rs.getString("writer");
            title = rs.getString("title");
            content = rs.getString("content");
            regtime = rs.getString("regtime");
            
            // 글 제목과 내용이 웹 페이지에 올바르게 출력되도록
            // 공백과 줄 바꿈 처리
            
            title  = title.replace(" ", "&nbsp;");
            content  = content.replace(" ", "&nbsp;").replace("\n", "<br>");
            
            // 이 글의 조회를 1올림
            stmt.executeUpdate(
                    "update board set hits=hits+1 where num=" + num);
            
        }
    }catch(Exception e){
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 80%;
            max-width: 800px;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #0056b3;
        }
        table {
            width: 100%;
            text-align: center;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 15px;
            border: 1px solid #dddddd;
        }
        th {
            background-color: #0056b3;
            color: white;
            white-space: nowrap; /* Prevent line breaks */
        }
        td {
            text-align: left;
            color: #333333;
        }
        td.content {
            white-space: normal; /* Allow line breaks for content */
        }
        .button-container {
            text-align: right;
            margin-top: 20px;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4px;
        }
        .button-container button:hover {
            background-color: #003f7f;
        }
    </style>

</head>
<body>

<table>
    <tr>
        <th>제목</th>
        <td><%=title %></td>
    </tr>
    
    <tr>
        <th>작성자</th>
        <td><%=writer %></td>
    </tr>
    
    <tr>
        <th>작성일시</th>
        <td><%=regtime %></td>
    </tr>
    
    
    <tr>
        <th>내용</th>
        <td><%=content %></td>
    </tr>
</table>

<!-- 예시 입력값으로 대체 -->
   <table>
            <tr>
                <th>제목</th>
                <td>예시 제목</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>예시 작성자</td>
            </tr>
            <tr>
                <th>작성일시</th>
                <td>2024-06-16 12:00</td>
            </tr>
            <tr>
                <th>조회수</th>
                <td>123</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>예시 내용입니다. 이 내용은 데이터베이스에서 가져온 내용 대신 표시되는 예시 텍스트입니다.
                024학년 여름방학 토익 기숙캠프 수강생 모집

*대학혁신지원사업 예산 지원*

  

◆ 프로그램

개요: 3주간 기숙캠프 형식으로 진행하는 토익 몰입교육으로 주중 학교에서 진행하는 수업과 자율학습에 참여해야 하고 기숙사 생활을 해야 함(주말 동안은 귀가할 수 있음)

신청자격: 청주대학교 재학생이면서 단기간 집중 학습을 통해 실력과 공부 습관을 기르고 싶은 학생이면 누구나 가능

기 간: 2024.07.08.(월)∼07.26.(금) 3주

학습시간: 하루 8교시 수업 및 2시간 자율학습, 월∼금 3주(15일)

*금요일 자율학습은 선택사항임

모집인원: 110명

선발방법: 선착순(신청 기간 내 생활관비 완납 필요)
dd
 

◆ 비용 및 특전

수강료: 무료

식 비: 무료

생활관비: 200,000원 (참여율 90% 이상인 경우 전액 환불)

교재: 지정교재 본인 구매(분반테스트 후 공지)

비교과 마일리지: 수료자 800점 부여(수료기준: 참여율 90% 이상)

 

◆ 신청 기간 및 방법

12. 신청 기간: 2024.06.03.(월)∼19(수)

13. 신청 방법: 에델바이스에서 해당 프로그램(2024 여름방학 토익기숙캠프) 선택

14. 생활관비 납부: 신한은행 100-020-966898 (예금주: 청주대학교)

※ 생활관비 납부 시에만 신청접수가 완료된 것으로 간주함. 생활관비 납부는 반드시 본인 명의로 할 것(다른 사람 이름으로 납부하여 받는 불이익에 대한 책임은 본인에게 있음)

 

◆ 기타사항

기숙캠프 참가자는 반드시 생활관에서 취침하는 것을 원칙으로 합니다.(주중 외박불가)

기숙사입실: 2024.7.8.(월) 09:30∼11:30 국제학사

분반테스트: 2024.06.25.(화) 14:00 (장소 별도 공지)

문의처: 교양대학(새천년종합정보관 309호, 229-8781, 8782)</td>
            </tr>
        </table>

        <div class="button-container">
            <button onclick="window.history.back()">목록으로</button>
        </div>
    </div>
</body>
</html>
