<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Location Details</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />

<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />

<c:if test="${registered==true}">Successfully Registered!</c:if>


<c:if test="${failed == true }">Invalid Username or Password! Login failed.</c:if>

<div class = "cover-image" >
<div class = "cover-txt" >


 <div class = "location-name">${location.locationName}</div>
<br>
<div class = "location-cover"> ${location.region }, ${location.country } </div> 

 <br>

<div class= "location-details"> AVG RATING: <fmt:formatNumber pattern="##.#"  value = "${averageRating }"/> 
 <br>
  Water Type: ${location.waterType}, Temperature Range: ${location.minTemp} - ${location.maxTemp} degrees C
 </div>
 </div>
 </div>

 

 
<div class="mapouter">
<div class="gmap_canvas">
<iframe width="800" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=${location.latitude},%20${location.longitude}&t=&z=11&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
</iframe><a href="https://embedgooglemap.net/maps/91"></a>
<br>
<style>.mapouter{position:relative;text-align:right;height:500px;width:800px;}</style>
<style>.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:800px;}</style>
</div>
</div>

<div>

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



<c:if test="${(locationComment.user.id == loggedInUser.id || loggedInUser.role == 'administrator') && empty locationComment.responses}">
	
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

<div>
<h2>Location Dive Logs</h2>

<!-- Add Log Button  -->
<c:if test="${ ! empty loggedInUser && (loggedInUser.role == 'data_writer' || loggedInUser.role == 'administrator')}">
<form action="logForm.do" method="GET">
	<input type="hidden" name="locId" value="${location.id}">
	<input class="btn btn-primary" type="submit" value="Add A New Log!"/>
</form>
</c:if>
<c:forEach items="${logs}"  var="log" >
<c:if test="${log.user.id == loggedInUser.id || loggedInUser.role == 'administrator'}">
<form id="updateLog" action="updateLogForm.do" method="GET">
	<input type="hidden" name="logId" value="${log.id}">
	<input class="btn btn-primary" type="submit" value="Update Log"/>
</form>
<form id="removeLog" action="removeLog.do" method="POST">
	<input type="hidden" name="logId" value="${log.id}">
	<input class="btn btn-primary" type="submit" value="Delete Log"/>
</form>
</c:if>
<table id = "logEntry">
<tr>
	<td>${log.site.name}</td>
	<td>Dive Type: ${log.site.diveType.name}, Minimum Cert.: ${log.site.minimumCert}</td>
	<td>${log.rating}/5</td>
</tr>
<tr>
	<td colspan="3"><a href="getLog.do?id=${log.id}">${log.title}</a></td>
</tr>
<tr>
	<td rowspan="2">${log.imageUrl}</td>
<td>${log.user.username}</td>
	<td>${log.diveDate}</td>
</tr>
<tr>
	<td colspan="2">${log.logContent}</td>
</tr>
<tr>
	 <c:forEach items= "${log.logComments }" var= "comment">
	 <td colspan="2">
	${comment.content }
	<c:if test="${comment.user.id == loggedInUser.id || loggedInUser.role == 'administrator'}">
	
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

</div>


<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>