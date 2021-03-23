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

<!-- Add Log Button  -->
<c:if test="${ ! empty loggedInUser }">
<form action="logForm.do" method="GET">
	<input class="btn btn-primary" type="submit" value="Add A New Log!"/>
</form>
</c:if>
<c:forEach items="${logs}"  var="log" >

<table>
<tr>
	<td>${log.site.name}</td>
	<td>Dive Type: ${log.site.diveType.name}, Minimum Cert.: ${log.site.minimumCert}</td>
	<td>${log.rating}/5</td>
</tr>
<tr>
	<td rowspan="2">${log.imageUrl}</td>
<td>${log.user.firstName} ${log.user.lastName}</td>
	<td>${log.diveDate}</td>
</tr>
<tr>
	<td colspan="2">${log.logContent}</td>
</tr>
<tr>
	 <c:forEach items= "${log.logComments }" var= "comment">
	 <td colspan="2">
	${comment.content }
	</td>
	</c:forEach>          
</tr>
	

</table>
<c:if test="${ ! empty loggedInUser }">
<form action="submitLogComment.do" method="post" id="createLogComment">
	<input  type="hidden" id ="userId" name="userId" value="${loggedInUser.id }" />
	<input  type="hidden" id="logId" name="logId" value="${log.id }" />
	<label>Comment:</label>
	<textarea name="content" form="createLogComment" rows="3" cols="80"></textarea>
	<input class="button" type="submit" value="Submit Comment" />
</form>
</c:if>
</c:forEach>




</body>
</html>