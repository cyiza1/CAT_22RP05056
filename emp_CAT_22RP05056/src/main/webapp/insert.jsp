<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <center>
    
         <form method="POST">
            <h2>Employee Management System</h2>
            
            <input type="text" name="names" placeholder="enter names "><br><br>
            <input type="text" name="position" placeholder="Position"><br><br>
            <inputtype="number" name="salary" placeholder="salary"><br><br>
            <button name="submit">Register</button>
            
        </form>
        </center>
        
        <%
        if(request.getParametr(submit) !=null) {
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        int salary = request.getParameter("salary");
        
        String url = "jdbc:mysql://localhost:3306/stock_management";
    String user = "root"; 
    String pass = "";

        Connection conn = null;
        PreparedStatement stmt = null;
       

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            conn = DriverManager.getConnection(url, user, pass);
            String sql = "INSERT INTO imp_info (name,position,salary) VALUES (?,?,?)";
            pstmt = conn.prepareStamtemt(sql);
            pstmt.setString(1,name);
            pstmt.setString(2,position);
            pstmt.setint(3,salary);
            pstmt.executeUpdate();
            out.println("<h3>recorded</h3>");
            response.sendRedirect("Display.jsp");
        }catch (Exception e) {
        	out.println("h3>Error:" +e.getMessage() + "</h3>");
        	
        } finally {
        	if (pstmt != null) try { pstmt.close();} catch (SQLException e) {}
        	if (conn != null) try { conn.close();} catch (SQLException e) {}
        	
        }
            