<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deeper Dive</title>
</head>
<body>

<c:if test="${registered==true}">Successfully Registered!</c:if>

<c:if test="${ ! empty loggedInUser }">Welcome ${loggedInUser.firstName}!
<form action="logout.do" >
	<input class="button" type="submit" value="Logout" />
</form>
</c:if>


<h1>Dive Deeper with Deeper Dive!</h1>

${TEST }

<c:if test="${empty loggedInUser }">
<form action="register.do" method="get">
	<input class="button" type="submit" value="Register" />
</form>
<form action="login.do" method="get">
	<input class="button" type="submit" value="Login" />
</form>
</c:if>

<form action="topFiveLocations.do" method="get">
	<input class="button" type="submit" value="Top 5 Locations" />
</form>

${locations }

</body>
</html>