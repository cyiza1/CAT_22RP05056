<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button><a href="insert.jsp">Insert new employee</a></button><br>
<center>
<h1>Employee Details</h1>
<table border="1">
<tr>
<th>id</th>
<th>names</th>
<th>position</th>
<th>gender</th>
<th colspan"2">ACTIONS</th>
</tr>
	<%
	String url = "jdbc:mysql://localhost:3306/emp_05056";
    String user = "root"; 
    String pass = "";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            conn = DriverManager.getConnection(url, user, pass);
            stmt = conn.createStatement();
            String sql = "SELECT * FROM emp_info";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
            	int id =rs.getInt("id");
         	   String name = rs.getString("name");
         	   String position = rs.getString("position");
         	   int salary = rs.getInt("salary");
    %>
                <<tr>
<td><%= id %></td>
<td><%= name %></td>
<td><%= position %></td>
<td><%= salary %></td>
<td><a href="update.jsp?id=<%= id %>">update</a></td>
<td><a href="delete.jsp?id=<%= id %>">delete</a></td>
</tr>
  
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>