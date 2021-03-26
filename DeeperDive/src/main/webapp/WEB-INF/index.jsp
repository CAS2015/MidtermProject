<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Deeper Dive</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />
 <link rel="stylesheet" href="../css/main.css"> 
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />
<c:if test="${registered==true}">Successfully Registered!</c:if>


<c:if test="${failed == true }">Invalid Username or Password! Login failed.</c:if>
<c:if test="${locked == true }">Account Disabled! Please contact us to enable.</c:if>



<div class = "cover-image" > <div class = "cover-txt mainTitle" >Deeper Dive</div> </div>

<div class= "pageContent">

<div class = "row filter-section">
<div class = "col">
<form action="locationsAlphabetically.do" method="get">
	<input class="button" type="submit" value="Sort A-Z" />
</form>
</div>
<div class = "col">
<form action="locationsByRating.do" method="get">
	<input class="button" type="submit" value="Sort By Rating" />
</form>
</div>
<div class = "col-auto">
<form action="locationsByKeyword.do" method="get">
	Keyword Search:
    			<input class="mediumInputBox" type="text" name="keyword" size="30"/> 
    			<input class="button" type="submit" value="Search"/>
</form>
</div>
</div>



<div id="listLocationBoxHeader">
<c:if test="${ isTopFive == true}"> <h3>Top Five Locations by Rating</h3>      </c:if>
<c:if test="${ isAlphabetical == true}"> <h3>Locations Sorted Alphabetically</h3>      </c:if>
<c:if test="${ isByRating == true}"> <h3>Locations Sorted By Rating - Highest to Lowest</h3>      </c:if>
</div>
<div class="listLocationsBox">
<c:if test="${ isByKeyword == true}"> 

<c:if test="${ empty locations }"> <h3>No Locations Found</h3>      </c:if>
<c:if test="${not empty locations }">   <h3>Keyword Search Results</h3>       </c:if>
     
</c:if>

<table>
	<c:forEach items = "${locations }"  var= "loc" >

		<tr>
			<td id="locationNameCol">
			<a href="getLocation.do?id=${loc.id}">${loc.locationName }</a>
			</td>
			<td rowspan="2">
			<img class="locDetailsImg" src="${loc.imgUrl}"/>
			</td>
		</tr>
		<tr>
		<td id="locationNameCol">
			${loc.description }
			</td>
		</tr>

	</c:forEach>
</table>


</div>
</div>


<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>