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
<link rel="stylesheet" href="../css/locationDetails.css">
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

<div class = "section">

<h2>Location Comments</h2>
<c:if test="${ empty location.locationComments }"> <h2>There are no comments about this location yet</h2>      </c:if>
<c:if test="${not empty location.locationComments }">    

<c:forEach var="locationComment" items="${location.locationComments }">
<c:if test="${ empty locationComment.originalPost }">
<table class = "location-comment">
<thead></thead>

<tr>
<td colspan="2">  ${locationComment.content}   </td>
<td>Created by:  ${locationComment.user.username} at: ${locationComment.createdAt } </td>


</tr>
<tr>
<td>

<c:if test="${(locationComment.user.id == loggedInUser.id || loggedInUser.role == 'administrator') && empty locationComment.responses}">
	
	<form  action="removeLocationComment.do" method="post" id="removeLocationComment">
	<input  type="hidden" id="locationCommentId" name="locationCommentId" value="${locationComment.id }" />
	
	<input class="button" type="submit" value="Delete Comment" />
</form>
	
	</c:if>

</td>

</tr>
</table>
</c:if>
<c:if test="${not empty locationComment.responses }">
<c:forEach items = "${locationComment.responses }" var = "response">

<table class = "location-comment-response">
<tr>
<td colspan="2">  ${response.content}   </td>
<td>Response by:  ${response.user.username}  at: ${response.createdAt } </td>


</tr>
<tr>
<td>

<c:if test="${(response.user.id == loggedInUser.id || loggedInUser.role == 'administrator') && empty response.responses}">
	
	<form  action="removeLocationComment.do" method="post" id="removeLocationComment">
	<input  type="hidden" id="locationCommentId" name="locationCommentId" value="${locationComment.id }" />
	
	<input class="button" type="submit" value="Delete Comment" />
</form>
	
	</c:if>

</td>

</tr>
</table>
</c:forEach>
</c:if>




	
	     <c:if test="${ ! empty loggedInUser && empty locationComment.originalPost}">
<form class = "new-loc-response" action="LocationCommentResponse.do" method="post" id="createLocationCommentResponse${locationComment.id }">
	<input  type="hidden" id ="userId" name="userId" value="${loggedInUser.id }" />
	<input  type="hidden" id="locationId" name="locationId" value="${location.id }" />
	<input  type="hidden" id="locationId" name="responseId" value="${locationComment.id }" />
	<textarea name="content" form="createLocationCommentResponse${locationComment.id }" rows="2" cols="60"></textarea>
	<input class="button response-button" type="submit" value="Submit Response" />
</form>
</c:if>
	
	
	
</c:forEach>

    </c:if>
     
     <c:if test="${ ! empty loggedInUser }">
     <br>
     <h4> Create New Comment:  </h4>
<form class = "new-loc-comment" action="newLocationComment.do" method="post" id="createLocationComment${location.id }">
	<input  type="hidden" id ="userId" name="userId" value="${loggedInUser.id }" />
	<input  type="hidden" id="locationId" name="locationId" value="${location.id }" />
	<textarea name="content" form="createLocationComment${location.id }" rows="3" cols="80"></textarea>
	<input class="button comment-button" type="submit" value="Submit" />
</form>
</c:if>
     
     
     
</div>

<br>

<div  class = "section">
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
<table class = "log-entry">
<thead>
<tr>
<th> ${log.site.name}    </th>
</tr>
<tr>
	<td colspan="3"><a href="getLog.do?id=${log.id}">${log.title}</a></td>
</tr>
<tr>

	<td rowspan="2"><img class="locDetailsImg" src="${log.imageUrl}"/></td>
</tr>
</thead>
<tr>
	<td> <strong>Dive Type:</strong> ${log.site.diveType.name} <br> <strong>Minimum Cert.:</strong> ${log.site.minimumCert}</td>
	<td>  <strong>Rating:</strong>   ${log.rating}/5</td>
<td>${log.user.username}</td>
	<td>${log.diveDate}</td>
</tr>

<tr>
	<td colspan="2">${log.logContent}</td>
</tr>
</table>

	 <c:forEach items= "${log.logComments }" var= "comment">

	 <table class = "location-comment-response">
<tr>
<td colspan="2">  ${comment.content}   </td>
<td>Comment by:  ${comment.user.username}  at: ${comment.createAt } </td>


</tr>
<tr>
<td>

<c:if test="${(comment.user.id == loggedInUser.id || loggedInUser.role == 'administrator')}">
	
	<form  action="removeLogComment.do" method="post" id="removeLocationComment">
	<input  type="hidden" id="logCommentId" name="logCommentId" value="${comment.id }" />
	
	<input class="button" type="submit" value="Delete Comment" />
</form>
	
	</c:if>

</td>

</tr>
</table>
	</c:forEach>          

	


<c:if test="${ ! empty loggedInUser }">
<form class = "new-log-comment" action="submitLogComment.do" method="post" id="createLogComment${log.id }">
	<input  type="hidden" id ="userId" name="userId" value="${loggedInUser.id }" />
	<input  type="hidden" id="logId" name="logId" value="${log.id }" />
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