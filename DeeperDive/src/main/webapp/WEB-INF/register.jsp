<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>

<c:if test="${failed == true }">Invalid Username! Registration Failed.</c:if>


<form action="register.do" method="POST" id="addUserForm">
		<div class="registerNewUser">
		<h4>Register New User</h4>
		</div>
		
		<div class="registrationFormBody">
		<b>Username*:</b>
		<input type="text"  name="username" required="required"/><br> 
		<b>Password*:</b>
		<input type="password" name="password" required="required"/><br> 
		<b>First Name*:</b>
		<input type="text" name="firstName" required="required"/><br> 
		<b>Last Name*:</b>
		<input type="text" name="lastName" required="required" /><br> 
		<b>Profile Image URL:</b>
		<input type="text" name="imgUrl" /><br> 
		
		</div>
		
		<input type="hidden" name="enabled" value="true">
		<input type="hidden" name="role" value="user">
		
		<p>
		*Required Field
		</p>

		<input class="button" type="submit" value="Register" />
	</form>



</body>
</html>