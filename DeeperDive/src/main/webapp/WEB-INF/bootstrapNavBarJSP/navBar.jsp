<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NavBar</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/navbar.css">
</head>
<body>

	<nav class="top-nav ">
		<div class="row">
			<div class="col">
				<a href="home.do" class="nav-link">Home</a>
			</div>
			<!-- Subject to Change -- Still not decided on which other navbar links to add -->
			<!-- <li>
                    <a href="locationDetails.jsp" class="nav-link">Location</a>
                </li> -->
                <!-- <li>
                    <a href="logForm.jsp" class="nav-link">Create A Logs</a>
                </li> -->
			<div class="col">
                <a href="aboutPage.do" class="nav-link">About</a>
			</div>
			
			<div class="col">
                <a href="contactPage.do" class="nav-link">Contact Us</a>
			</div>
			<div class="col"></div>
			<div class="col-auto">
				<c:choose>
					<c:when test="${empty loggedInUser }">
					<div class="row">
						<form action="login.do" method="POST" id="loginUserForm">
						</form>
							<div class="col loginFormBody">
								Username: <input form="loginUserForm" type="text" name="username"
									required="required" />
							</div>
							<div class="col loginFormBody">		
								Password: <input
								type="password" form="loginUserForm" name="password" required="required" /><br>
							</div>
							<div class="col-auto">
							<input class="button" form="loginUserForm" type="submit" value="Login" />
						<form action="register.do" method="get">
							<input class="button" type="submit" value="Sign Up" />
						</form>
						</div>
					</div>
							
					</c:when>
					<c:when test="${ ! empty loggedInUser }">Welcome ${loggedInUser.firstName}!
						<a href="profile.do" class="nav-link">Profile</a>
						<form action="logout.do">
							<input class="button" type="submit" value="Logout" />
						</form>
					</c:when>
				</c:choose>
			</div>


		</div>
	</nav>

</body>
</html>