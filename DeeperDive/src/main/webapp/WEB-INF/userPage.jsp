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
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />

<div class = "cover-image" > <div class = "cover-txt mainTitle" >Deeper Dive</div> </div>

<h1>Profile Details</h1>
<br>
<h4> ${loggedInUser.firstName } ${ loggedInUser.lastName}  </h4> <br>
Username: ${loggedInUser.username }
<br>
<c:if test="${not empty loggedInUser.role }">
Role: ${loggedInUser.role }
</c:if><br>
Account created at: ${loggedInUser.createDate }<br>
Total logs: ${logs.size() }

<br>

<div>
<br>
<h2>My Dive Logs</h2>
<br>
<c:forEach items="${logs}"  var="log" >
<form id="updateLog" action="updateLogForm.do" method="GET">
	<input type="hidden" name="logId" value="${log.id}">
	<input class="btn btn-primary" type="submit" value="Update Log"/>
</form>
<form id="removeLog" action="removeLog.do" method="POST">
	<input type="hidden" name="logId" value="${log.id}">
	<input class="btn btn-primary" type="submit" value="Delete Log"/>
</form>

<table>
<tr>
	<td>${log.site.name}, ${log.site.location.locationName }</td>
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
	           
</tr>
	
</table>

</c:forEach>

</div>


<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>