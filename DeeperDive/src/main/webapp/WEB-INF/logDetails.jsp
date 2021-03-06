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

<div class="pageContent">

<div class="logTable">


<table class="logTable logTableTop">
<tr class="tableSectionLabel">
	
	<c:choose>
		<c:when test="${log.user.id == loggedInUser.id || loggedInUser.role == 'administrator'}">
			<td >Log Details</td>
			<td >
				<form id="updateLog" action="updateLogForm.do" method="GET">
					<input type="hidden" name="logId" value="${log.id}">
					<input class="button" type="submit" value="Update Log"/>
				</form>
			</td>
			<td >
				<form id="removeLog" action="removeLog.do" method="POST">
					<input type="hidden" name="logId" value="${log.id}">
					<input class="button" type="submit" value="Delete Log"/>
				</form>
			</td>
		</c:when>
		<c:otherwise><td colspan="3">Log Details</td></c:otherwise>
	</c:choose>
</tr>
<tr>
	<td rowspan="2"><img class="logDetailsImg" src="${log.imageUrl}"/> </td>
<td class="tableUsername">${log.user.username}</td>
	<td class="tableDate">${log.diveDate}</td>
</tr>
<tr>
	<td colspan="2">${log.logContent}</td>
</tr>
</table>
<table class="logTable">
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
	 <c:forEach items= "${log.logComments }" var= "comment">
<tr>
	 <td colspan="2">
	${comment.content }

	<c:if test="${comment.user.id == loggedInUser.id || loggedInUser.role == 'administrator'}">
	
	<form action="removeLogComment.do" method="post" id="removeLogComment">
	<input  type="hidden" id="logCommentId" name="logCommentId" value="${comment.id }" />
	
	<input class="buttonAlt" type="submit" value="Delete Comment" />
</form>
	
	</c:if>
	</td>
	<td class="signature">~${comment.user.username}  (${comment.createAt.month.value}-${comment.createAt.dayOfMonth}-${comment.createAt.year}) </td>
</tr>
	</c:forEach>          
<tr>
	<td colspan="3">
		<c:if test="${ ! empty loggedInUser }">
		<div class="logCommentSection">
		<form action="submitLogComment.do" method="post" id="createLogComment${log.id }">
			<input  type="hidden" id ="userId" name="userId" value="${loggedInUser.id }" />
			<input  type="hidden" id="logId" name="logId" value="${log.id }" />
			<label class="commentLabel">Comment:</label>
			<textarea name="content" form="createLogComment${log.id }" rows="3" cols="80"></textarea>
			<input class="buttonAlt" type="submit" value="Submit" />
		</form>
		</div>
		</c:if>
		
	</td>
</tr>

</table>
</div>
</div>






<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>