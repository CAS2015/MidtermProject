<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />

<div class="errorMessage">
<c:if test="${failed == true }"> Invalid Username! Registration failed.</c:if>
</div>

<div class = "cover-image" > <div class = "cover-txt mainTitle" >Deeper Dive</div> </div>

<form class="pageContent logTable"action="register.do" method="POST" id="addUserForm">
		<div class="registerNewUser tableSectionLabel">
		Register New User
		</div>
		
		<div class="registrationFormBody createForm">
		<label>Username*:</label>
		<input type="text"  name="username" required="required"/><br> 
		<label>Password*:</label>
		<input type="password" name="password" required="required"/><br> 
		<label>First Name*:</label>
		<input type="text" name="firstName" required="required"/><br> 
		<label>Last Name*:</label>
		<input type="text" name="lastName" required="required" /><br> 
		<label>Profile Image URL:</label>
		<input type="text" name="imgUrl" /><br> 
		
		<label>User Role:</label><br>
		<input type="radio" id="data_reader" name="role" value="data_reader" checked="checked">
		<label id="registerRadioLabel" for="true">View and Comment</label><br>
		<input type="radio" id="data_writer" name="role" value="data_writer">
		<label id="registerRadioLabel" for="female">Content Creator</label><br>
		
		

		<input type="hidden" name="enabled" value="true">
		
		<br>
		<p>
		*Required Field
		</p>

		<input class="buttonAlt" type="submit" value="Register" />
		</div>
	</form>

<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>