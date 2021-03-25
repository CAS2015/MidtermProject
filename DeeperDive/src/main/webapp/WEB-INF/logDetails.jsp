<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Location Details</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />

<h2></h2>
<h4></h4>
<h4></h4>
<h4></h4>

<div class = "cover-image" >
<div class = "cover-txt" >


 <div class = "location-name">${log.title}</div>
<br>
<div class = "location-cover"> ${log.site.name} </div> 

 <br>

<div class= "location-details"> 
${log.rating}/5
 <br>
 Dive Type: ${log.site.diveType.name}, Minimum Cert.: ${log.site.minimumCert}
 </div>
 </div>
 </div>


<div class="logTable">
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


<table class="logTable">
<tr>
	<td rowspan="2"><img class="logDetailsImg" src="${log.imageUrl}"/> </td>
<td class="tableUsername">${log.user.username}</td>
	<td class="tableDate">${log.diveDate}</td>
</tr>
<tr>
	<td colspan="2">${log.logContent}</td>
</tr>
<tr>
	<td class="tableSectionLabel" colspan="3">Attractions</td>
</tr>
<tr>
	<td colspan="3">${log.attraction }</td>
</tr>
<tr>
	<td class="tableSectionLabel" colspan="3">Dive Times</td>
</tr>
<tr>
	<td><b>Entry Time:</b> ${log.entryTime }</td>
	<td><b>Exit Time:</b> ${log.endTime }</td>
	<td><b>Duration: </b>${duration } minutes</td>
</tr>
<tr>
	<td class="tableSectionLabel" colspan="3">Dive Information</td>
</tr>
<tr>
	<td colspan="3">Visibility: ${log.visibility }</td>
</tr>
<tr>
	<td colspan="3">Maximum Depth Reached:</b> ${log.maxDepthMeters } meters</td>
</tr>
<tr>
	<td class="tableSectionLabel" colspan="3">Equipment</td>
</tr>
<tr>
	<td colspan="3">${log.equipment}</td>
</tr>
<tr>
	<td><b>Air Type:</b> ${log.airType }</td>
	<td><b>Start Air Pressure:</b> ${log.startPressureBar } bar</td>
	<td><b>End Air Pressure:</b> ${log.endPressureBar} bar</td>
</tr>
<tr>
	<td class="tableSectionLabel" colspan="3">Comments</td>
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
</div>


<div class="filter-section">
<c:if test="${ ! empty loggedInUser }">
<form action="submitLogComment.do" method="post" id="createLogComment${log.id }">
	<input  type="hidden" id ="userId" name="userId" value="${loggedInUser.id }" />
	<input  type="hidden" id="logId" name="logId" value="${log.id }" />
	<label class="commentLabel">Comment:</label>
	<textarea name="content" form="createLogComment${log.id }" rows="3" cols="80"></textarea>
	<input class="button" type="submit" value="Submit Comment" />
</form>
</c:if>
</div>





<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>