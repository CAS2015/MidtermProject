<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Profile Details</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/locationDetails.css">
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />

<div class = "cover-image" > <div class = "cover-txt mainTitle" >Deeper Dive</div> </div>


<div class = "section">

<div class="tableSectionLabel scrollBoxHeader">User Profile</div>

<table class = "user-profile">
<thead></thead>

<tr>
<td> <h4> ${loggedInUser.firstName } ${ loggedInUser.lastName}  </h4> </td>
</tr> 
<tr>

<td> Username: ${loggedInUser.username } </td>

</tr>
<c:if test="${not empty loggedInUser.role }">
<tr>
<td> 
Role: ${loggedInUser.role }
</td>
</tr>
</c:if>

<tr>
<td>
Account created at: ${loggedInUser.createDate }

 </td>
 </tr> <tr>
 <td>
 Total logs: ${logs.size() }
 
  </td>
</tr>

</table>    
     
</div>





<br>

<div  class = "section">
<div class="row">
<div class="col tableSectionLabel scrollBoxHeader">My Dive Logs</div>

<!-- Add Log Button  -->

</div>


<c:forEach items="${logs}"  var="log" >

<table class = "log-entry" onclick="window.location='getLog.do?id=${log.id}'" >
	<thead class = "tableSectionLabel">
		<tr>
			<c:choose>
				<c:when test="${log.user.id == loggedInUser.id || loggedInUser.role == 'administrator'}">	
					<th class="tableSectionLabel"> ${log.title}    </th>
					<th>
					<form class = "new-log-button" id="updateLog" action="updateLogForm.do" method="GET">
						<input type="hidden" name="logId" value="${log.id}">
						<input class="button" type="submit" value="Update Log"/>
					</form>
					</th>
					 <th>
					<form class = "new-log-button" id="removeLog" action="removeLog.do" method="POST">
						<input type="hidden" name="logId" value="${log.id}">
						<input class="button" type="submit" value="Delete Log"/>
					</form> 
					</th>
				</c:when>
				<c:otherwise>
					<th colspan="3" class="tableSectionLabel"> ${log.title} </th>
				</c:otherwise>
			</c:choose>
		</tr>
	</thead>
	
<tbody class="log-entry-body">
<tr>
	<td class="tableSiteName" > <strong> Site:</strong> ${log.site.name}</td>
</tr>
<tr class = "breakForSite">
	<td> <strong>Dive Type:</strong> ${log.site.diveType.name} </td><td> <strong>Minimum Cert.:</strong> ${log.site.minimumCert}</td>
	 <td>  <strong>Rating:</strong>   ${log.rating}/5</td> </tr>
<tr >
	<td rowspan="2"><img class="locDetailsImg" src="${log.imageUrl}"/></td>
	<td class="tableUsername">${log.user.username}</td>
	<td  class="tableDate">${log.diveDate}</td>
</tr>

<tr>
	<td colspan="2">${log.logContent}</td>
</tr>
</tbody>
</table>

	 <c:forEach items= "${log.logComments }" var= "comment">

	 <table class = "location-comment-response">
<tr>
<td colspan="2">  ${comment.content}   </td>
<td class="signature">~${comment.user.username}  (${comment.createAt.month.value}-${comment.createAt.dayOfMonth}-${comment.createAt.year}) </td>
</tr>

<tr>
<td>

<c:if test="${(comment.user.id == loggedInUser.id || loggedInUser.role == 'administrator')}">
	
	<form  action="removeLogComment.do" method="post" id="removeLocationComment">
	<input  type="hidden" id="logCommentId" name="logCommentId" value="${comment.id }" />
	
	<input class="buttonAlt" type="submit" value="Delete" />
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
	<textarea name="content" form="createLogComment${log.id }" rows="3" cols="80" placeholder="Comment"></textarea>
	<input class="buttonAlt" type="submit" value="Submit" />
</form>
</c:if>
</c:forEach>
<br>
</div>


<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>