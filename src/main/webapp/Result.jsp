<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
body{
font-size: 17px;
margin: 10px
}
input{
border-width:0 0 3px;
border-radius:6px;
}
</style>

</head>
<body>
<br>
<br>
<center>
<form action="Result.jsp" method="post">
<b>Enter Student Id: </b><input type="text" name="ida">   
<button type="submit" class="btn btn-primary mb-2">Submit</button>
</form>
</center>
<%  
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","rushi","rushi123");
int id= Integer.parseInt(request.getParameter("ida"));
if(id!=0){ %>
<br><br>
<table class="table table-hover table-sm" border="5px">
			<thead class="table-dark">
			<tr>
			<th>Student Id</th>
			<th>Semister</th>
			<th>SGPA</th>
			<th>CGPA</th>
			<th>Subjects</th>
			</tr>
			</thead>
<%
	PreparedStatement pst = con.prepareStatement("select * from RESULTS where SID=?");
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		while(rs.next()==true){
			%>
			
			<tr>
			<td><%=rs.getLong(1) %></td>
			<td><%=rs.getLong(2) %></td>
			<td><%=rs.getFloat(3) %></td>
			<td><%=rs.getFloat(4) %></td>
			<td><%=rs.getString(5) %></td>
			</tr>
			
<% 		}
	}
else{
	
}
}
	catch(Exception e){
		e.printStackTrace();
	}
	%>
	</table>
</body>
</html>