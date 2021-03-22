<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<c:if test="${failed == true }">Invalid Username or Password! Login failed.</c:if>


<form action="login.do" method="POST" id="loginUserForm">
		<div class="loginUser">
		<h4>Login</h4>
		</div>
		
		<div class="loginFormBody">
		<b>Username:</b>
		<input type="text"  name="username" required="required"/><br> 
		<b>Password:</b>
		<input type="password" name="password" required="required"/><br> 
		</div>

		<input class="button" type="submit" value="Login" />
	</form>



</body>
</html>