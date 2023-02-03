<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import=" java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student details</title>
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
<form action="StudentDetails.jsp" method="post">
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
			<th>Student name</th>
			<th>Gender</th>
			<th>Date of Birth</th>
			<th>Age</th>
			<th>Email id</th>
			<th>Fathers Name</th>
			<th>Mothers Name</th>
			<th>Mobile No </th>
			<th>Blood Group</th>
			<th>Aadhar No</th>
			<th>Pan No</th>
			<th>Date of joining</th>
			</tr>
			</thead>
<%
	PreparedStatement pst = con.prepareStatement("select * from studentdetails where SID=?");
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		while(rs.next()==true){
			%>
			
			<tr>
			<td><%=rs.getLong(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getInt(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td><%=rs.getString(8) %></td>
			<td><%=rs.getLong(9) %></td>
			<td><%=rs.getString(10)%></td>
			<td><%=rs.getLong(11) %></td>
			<td><%=rs.getString(12)%></td>
			<td><%=rs.getString(13) %></td>
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