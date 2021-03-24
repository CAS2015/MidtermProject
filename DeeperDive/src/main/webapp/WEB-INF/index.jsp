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
<!-- <link rel="stylesheet" href="../css/main.css"> -->
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />
<c:if test="${registered==true}">Successfully Registered!</c:if>



<c:if test="${failed == true }">Invalid Username or Password! Login failed.</c:if>


<h1>Dive Deeper with Deeper Dive!</h1>


<br>
<div>

<form action="locationsAlphabetically.do" method="get">
	<input class="button" type="submit" value="Sort Locations Alphabetically" />
</form>
<form action="locationsByRating.do" method="get">
	<input class="button" type="submit" value="Sort Locations By Rating" />
</form>
<form action="locationsByKeyword.do" method="get">
	Enter a keyword to search:
    			<input type="text" name="keyword" size="30"/> 
    			<input type="submit" value="search by keyword"/>
</form>
</div>



<div class="listLocationsBox">

<c:if test="${ isTopFive == true}"> <h3>Top Five Locations by Rating</h3>      </c:if>
<c:if test="${ isAlphabetical == true}"> <h3>Locations Sorted Alphabetically</h3>      </c:if>
<c:if test="${ isByRating == true}"> <h3>Locations Sorted By Rating - Highest to Lowest</h3>      </c:if>

<c:if test="${ isByKeyword == true}"> 

<c:if test="${ empty locations }"> <h3>No Locations Found</h3>      </c:if>
<c:if test="${not empty locations }">   <h3>Keyword Search Results</h3>       </c:if>
     
</c:if>

<c:forEach items = "${locations }"  var= "loc" >

<ul>

<li><a href="getLocation.do?id=${loc.id}">${loc.locationName }</a></li>

</ul>

</c:forEach>


</div>

<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>