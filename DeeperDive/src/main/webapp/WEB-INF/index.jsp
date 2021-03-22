<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deeper Dive</title>
</head>
<body>

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

<h1>Dive Deeper with Deeper Dive!</h1>



${TEST }

<c:if test="${empty loggedInUser }">
<form action="login.do" method="get">
	<input class="button" type="submit" value="Login" />
</form>
</c:if>


<br>
<div>

<form action="topFiveLocations.do" method="get">
	<input class="button" type="submit" value="Top 5 Locations" />
</form>
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



<div style="width:700px;height:200px;border:1px solid #000;">

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

</body>
</html>