<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Location Details</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />
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


<div style="width:700px;height:200px;border:1px solid #000;">

<h2>Location Comments</h2>
<c:if test="${ empty location.locationComments }"> <h2>There are no comments about this location yet</h2>      </c:if>
<c:if test="${not empty location.locationComments }">    

<c:forEach var="locationComment" items="${location.locationComments }">
<c:if test="${ empty locationComment.originalPost }">
<table>
<thead></thead>

<tr>
<td>Created by:  ${locationComment.user.username} at: ${locationComment.createdAt } </td>

<td>  ${locationComment.content}   </td>

</tr>
</table>
</c:if>
<c:if test="${not empty locationComment.responses }">
<c:forEach items = "${locationComment.responses }" var = "response">

<table>
<tr>
<td colspan="2">        White Space Here                           </td>

<td>Response by:  ${response.user.username}  at: ${response.createdAt } </td>

<td>  ${response.content}   </td>

</tr>
</table>
</c:forEach>
</c:if>



<c:if test="${locationComment.user.id == loggedInUser.id && empty locationComment.responses}">
	
	<form action="removeLocationComment.do" method="post" id="removeLocationComment">
	<input  type="hidden" id="locationCommentId" name="locationCommentId" value="${locationComment.id }" />
	
	<input class="button" type="submit" value="Delete Comment" />
</form>
	
	</c:if>
	
	     <c:if test="${ ! empty loggedInUser && empty locationComment.originalPost}">
<form action="LocationCommentResponse.do" method="post" id="createLocationCommentResponse${locationComment.id }">
	<input  type="hidden" id ="userId" name="userId" value="${loggedInUser.id }" />
	<input  type="hidden" id="locationId" name="locationId" value="${location.id }" />
	<input  type="hidden" id="locationId" name="responseId" value="${locationComment.id }" />
	<label>Create Response:</label>
	<textarea name="content" form="createLocationCommentResponse${locationComment.id }" rows="2" cols="60"></textarea>
	<input class="button" type="submit" value="Submit Comment" />
</form>
</c:if>
	
	
	
</c:forEach>

    </c:if>
     
     <c:if test="${ ! empty loggedInUser }">
<form action="newLocationComment.do" method="post" id="createLocationComment${location.id }">
	<input  type="hidden" id ="userId" name="userId" value="${loggedInUser.id }" />
	<input  type="hidden" id="locationId" name="locationId" value="${location.id }" />
	<label>Add New Comment:</label>
	<textarea name="content" form="createLocationComment${location.id }" rows="3" cols="80"></textarea>
	<input class="button" type="submit" value="Submit Comment" />
</form>
</c:if>
     
     
     
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<!-- Add Log Button  -->
<c:if test="${ ! empty loggedInUser }">
<form action="logForm.do" method="GET">
	<input class="btn btn-primary" type="submit" value="Add A New Log!"/>
</form>
</c:if>
<c:forEach items="${logs}"  var="log" >
<c:if test="${log.user.id == loggedInUser.id}">
<form id="updateLog" action="updateLogForm.do" method="GET">
	<input type="hidden" name="logId" value="${log.id}">
	<input class="btn btn-primary" type="submit" value="Update Log"/>
</form>
<form id="removeLog" action="removeLog.do" method="POST">
	<input type="hidden" name="logId" value="${log.id}">
	<input class="btn btn-primary" type="submit" value="Delete Log"/>
</form>
</c:if>
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
	<c:if test="${comment.user.id == loggedInUser.id }">
	
	<form action="removeLogComment.do" method="post" id="removeLogComment">
	<input  type="hidden" id="logCommentId" name="logCommentId" value="${comment.id }" />
	
	<input class="button" type="submit" value="Delete Comment" />
</form>
	
	</c:if>
	</td>
	</c:forEach>          
</tr>
	

</table>
<c:if test="${ ! empty loggedInUser }">
<form action="submitLogComment.do" method="post" id="createLogComment${log.id }">
	<input  type="hidden" id ="userId" name="userId" value="${loggedInUser.id }" />
	<input  type="hidden" id="logId" name="logId" value="${log.id }" />
	<label>Comment:</label>
	<textarea name="content" form="createLogComment${log.id }" rows="3" cols="80"></textarea>
	<input class="button" type="submit" value="Submit Comment" />
</form>
</c:if>
</c:forEach>



<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>