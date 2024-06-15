<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
<%
    String titleInput = request.getParameter("title");
    String descriptionInput = request.getParameter("description");
    String startDateInput = request.getParameter("start-date");
    String endDateInput = request.getParameter("end-date");
    String categoryInput = request.getParameter("category");
    
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");
        Statement stmt = conn.createStatement();
        String sql = "INSERT INTO events (title, description, start_date, end_date, category) VALUES (?, ?, ?, ?, ?)";
        
        PreparedStatement preparedStmt = conn.prepareStatement(sql);
        preparedStmt.setString(1, titleInput);
        preparedStmt.setString(2, descriptionInput);
        preparedStmt.setDate(3, Date.valueOf(startDateInput));
        preparedStmt.setDate(4, Date.valueOf(endDateInput));
        preparedStmt.setString(5, categoryInput);
        preparedStmt.executeUpdate();
        response.sendRedirect("manage.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        String errorMessage = "Error inserting new event: " + e.getMessage();
        out.println("<script>alert('" + errorMessage + "');</script>");
    }
%>

</body>
</html>