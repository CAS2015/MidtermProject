<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Location Details</title>
</head>
<body>

<c:if test="${registered==true}">Successfully Registered!</c:if>


<c:if test="${failed == true }">Invalid Username or Password! Login failed.</c:if>
<c:choose>
<c:when test="${empty loggedInUser }">
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
	<form action="register.do" method="get">
	<input class="button" type="submit" value="Sign Up" />
</form>
</c:when>
<c:when test="${ ! empty loggedInUser }">Welcome ${loggedInUser.firstName}!
<form action="logout.do" >
	<input class="button" type="submit" value="Logout" />
</form>
</c:when>
</c:choose>

<h2>${location.locationName } </h2>
<h3>${location.region }, ${location.country } </h3>
<h5> AVG RATING FIXME</h5>
<h5> Water Type: ${location.waterType}, Temperature Range: ${location.minTemp} - ${location.maxTemp} degrees C</h5>


</body>
</html>