<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />
<c:if test="${failed == true }"> Invalid Username! Registration failed.</c:if>


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
		
		<input type="radio" id="data_reader" name="role" value="data_reader">
		<label for="true">View and Comment</label><br>
		<input type="radio" id="data_writer" name="role" value="data_writer">
		<label for="female">Content Creator</label><br>
		
		</div>
		

		<input type="hidden" name="enabled" value="true">
		
		
		<p>
		*Required Field
		</p>

		<input class="button" type="submit" value="Register" />
	</form>

<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>