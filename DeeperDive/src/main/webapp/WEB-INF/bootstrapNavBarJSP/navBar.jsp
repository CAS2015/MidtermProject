<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">

	<nav class="top-nav ">
		<ul class="nav-list">
			<li><a href="/" class="nav-link">Home</a></li>
			<!-- Subject to Change -- Still not decided on which other navbar links to add -->
			<!-- <li>
                    <a href="locationDetails.jsp" class="nav-link">Location</a>
                </li>
                <li>
                    <a href="logForm.jsp" class="nav-link">Create A Logs</a>
                </li> -->
			<!-- <li>
                    <a href="about.jsp" class="nav-link">About</a>
                </li>
                <li>
                    <a href="#contact" class="nav-link">Contact Us</a>
                </li> -->

		</ul>
		<c:choose>
			<c:when test="${empty loggedInUser }">
				<form action="login.do" method="POST" id="loginUserForm">
					<div class="loginUser">
						<h4>Login</h4>
					</div>

					<div class="loginFormBody">
						<b>Username:</b> <input type="text" name="username"
							required="required" /><br> <b>Password:</b> <input
							type="password" name="password" required="required" /><br>
					</div>

					<input class="button" type="submit" value="Login" />
				</form>
				<form action="register.do" method="get">
					<input class="button" type="submit" value="Sign Up" />
				</form>
			</c:when>
			<c:when test="${ ! empty loggedInUser }">Welcome ${loggedInUser.firstName}!
				<a href="profile.do" class="nav-link">Profile</a>
				<form action="logout.do">
					<input class="button" type="submit" value="Logout" />
				</form>
			</c:when>
		</c:choose>
	</nav>

</nav>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NavBar</title>
</head>
<body>



</body>
</html>