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
        String url = "jdbc:mysql://localhost:3306/emp_22rp05056";
        String user = "root"; 
        String pass = "";

        Connection conn = null;
        PreparedStatement pstmt = null;
        String id = request.getParameter("id");
        String message = "";
        if(id != null){
        	try{
        		 Class.forName("com.mysql.cj.jdbc.Driver"); 
                 conn = DriverManager.getConnection(url, user, pass);
               
                 String sql_22rp05056 = "delete * FROM emp_info where id = ? ";
                 pstmt = conn.prepareStatement(sql_22rp05056);
                 pstmt.setString(1, id);
                 int rowsAffected = pstmt.executeUpdate();
                 if (roesAffected > 0){
                	 message = "DELETED";
                	 
                 } else{
                	 message = "Employee not found";
                	
                 }
        	catch (Exception e) {
        		message = "Error :" + e.getMessage();
        	} finally {
        		try {
        		    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        		}
        	}
        	
        
        %>

</body>
</html>