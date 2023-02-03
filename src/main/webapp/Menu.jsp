<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  <style type="text/css">
  button{
  margin-right:150px;
  }
  </style>
  </head>
  <body background="https://www.pixelstalk.net/wp-content/uploads/2016/05/Math-Wallpaper.jpg">
  <% PrintWriter pw =response.getWriter();
  HttpSession s = request.getSession(false);
  if(s!=null){%>
   <br><br><br><br>
   <br>
   <br>
   <br>
   <br>
   <center>
   <a href="StudentDetails.jsp"><button class="btn btn-primary btn-lg"><i class="fa fa-users"></i> Student Details</button></a>
  <a href="Courses.jsp"> <button  class="btn btn-secondary btn-lg"><i class="fa fa-book" aria-hidden="true"></i>Course Details</button></a>
  <a href="Address.jsp"> <button type="button" class="btn btn-success btn-lg"><i class="fa fa-map-marker" aria-hidden="true"></i>Address Details</button></a>
   <br>
   <br>
   <br>
  <a href="Attendence.jsp"> <button type="button" class="btn btn-dark btn-lg"><i class="fa fa-calendar" aria-hidden="true"></i> Attendence Details</button></a>
  <a href="Education.jsp" ><button type="button" class="btn btn-warning btn-lg"><i class="fa fa-graduation-cap" aria-hidden="true"></i>Education Details</button></a>
   <a href="Fee.jsp"><button type="button" class="btn btn-info btn-lg"><i class="fa fa-credit-card"></i> Fee Payment Details</button></a>
   <br>
   <br>
   <br>
   <a href="Subject.jsp"><button type="button" class="btn btn-danger btn-lg"><i class="fa fa-inbox"></i>Subject Details</button></a>
   <a href="Result.jsp"> <button type="button" class="btn btn-primary btn-lg"><i class="fa fa-pencil"></i> Results</button></a>
    </center>
    <%}
  else{
	  pw.print("login first");
	  RequestDispatcher rd = request.getRequestDispatcher("Login.html");
	  rd.include(request,response);
  }
  %>
</body>
</html>