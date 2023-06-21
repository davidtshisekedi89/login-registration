<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css"> 
	<meta charset="ISO-8859-1">
	<title>Insert Title Here</title>
</head>
<body>
 

 <div class="container mt-5">
 
 <h1>Welcome!</h1>
 <h3>Join our growing community</h3>
 
 <h3>Register</h3>

  <form:form action="/register"  method="Post" modelAttribute="newUser">
  
    <div class="form-group">
     <form:label path="userName" >User Name:</form:label>
     <form:input path="userName" class="form-control"/>
     <form:errors path="userName" class="text-danger"/>
    </div>
    
    <div>
     <form:label path="email">Email:</form:label>
     <form:input path="email" class="form-control"/>
     <form:errors path="email" class="text-danger"/>
    </div>
    
    <div>
     <form:label path="password">Password:</form:label>
     <form:input path="password" type="password" class="form-control"/>
     <form:errors path="password" class="text-danger"/>
    </div>
    
    <div>
     <form:label path="confirm">Confirm Password:</form:label>
     <form:input path="confirm" type="password" class="form-control"/>
     <form:errors path="confirm" class="text-danger"/>
    </div>
    
    <button type="submit" class="btn btn-primary mx-auto">Submit</button>

  </form:form>

 </div>
 
 <div class="container mt-5">
 
 <form:form action="/login"  method="Post" modelAttribute="newLogin">
 
    <div>
     <form:label path="email">Email:</form:label>
     <form:input path="email" class="form-control"/>
     <form:errors path="email" class="text-danger"/>
    </div>
    
    <div>
     <form:label path="password">Password:</form:label>
     <form:input path="password" type="password" class="form-control"/>
     <form:errors path="password" class="text-danger"/>
    </div>
    
    <button type="submit" class="btn btn-primary mx-auto">Submit</button>
 
 
 </form:form>
 
 
 </div>

</body>
</html>