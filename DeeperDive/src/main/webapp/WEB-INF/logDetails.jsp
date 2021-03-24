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

<h2>${log.title}</h2>
<h4>${log.site.name}</h4>
<h4>Dive Type: ${log.site.diveType.name}, Minimum Cert.: ${log.site.minimumCert}</h4>
<h4>${log.rating}/5</h4>

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
	<td rowspan="2">${log.imageUrl}</td>
<td>${log.user.username}</td>
	<td>${log.diveDate}</td>
</tr>
<tr>
	<td colspan="2">${log.logContent}</td>
</tr>
<tr>
	<td colspan="3">Attractions</td>
</tr>
<tr>
	<td colspan="3">${log.attraction }</td>
</tr>
<tr>
	<td colspan="3">Dive Times</td>
</tr>
<tr>
	<td>Entry Time: ${log.entryTime }</td>
	<td>Exit Time: ${log.endTime }</td>
	<td>Duration: ${duration } minutes</td>
</tr>
<tr>
	<td colspan="3">Dive Information</td>
</tr>
<tr>
	<td colspan="3">Visibility: ${log.visibility }</td>
</tr>
<tr>
	<td colspan="3">Maximum Depth Reached: ${log.maxDepthMeters } meters</td>
</tr>
<tr>
	<td colspan="3">Equipment</td>
</tr>
<tr>
	<td colspan="3">${log.equipment}</td>
</tr>
<tr>
	<td>Air Type: ${log.airType }</td>
	<td>Starting Cylinder Pressure: ${log.startPressureBar } bar</td>
	<td>Ending Cylinder Pressure: ${log.endPressureBar} bar</td>
</tr>
<tr>
	<td colspan="3">Comments</td>
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





<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>