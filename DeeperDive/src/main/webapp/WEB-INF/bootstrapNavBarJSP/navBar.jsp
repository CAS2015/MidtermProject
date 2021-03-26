<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- <link rel="stylesheet" href="../css/main.css"> -->
<!-- <link rel="stylesheet" href="../css/navbar.css"> -->
<!-- <link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/navbar-top-fixed.css" rel="stylesheet"> -->

	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Deeper Dive</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarCollapse">
	      <ul class="navbar-nav me-auto mb-2 mb-md-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="home.do">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="aboutPage.do">About</a>
	        </li>
					<li class="nav-item">
	          <a class="nav-link" href="contactPage.do">Contact</a>
	        </li>
	      </ul>
					      <%-- Sign in Register  --%>
							<div class="col"></div>
						    <div class="col-auto">
						      <c:choose>
						        <c:when test="${empty loggedInUser }">
							        <div class="row">
							          <form action="login.do" method="POST" id="loginUserForm">
							          </form>
							            <div class="col loginFormBody">
							               <input form="loginUserForm" placeholder="Username"type="text" name="username"
							                required="required" />
							            </div>
							            <div class="col loginFormBody">
							               <input type="password" form="loginUserForm" placeholder="Password" name="password" required="required" />
							            </div>
	
							            <div class="col">
							            <input class="btn btn-secondary" form="loginUserForm" type="submit" value="Login" />
													</div>
													<div class="col">
							          <form action="register.do" method="get">
							            <input class="btn btn-secondary" type="submit" value="Sign Up" />
							          </form>
							          </div>
							        </div>
						        </c:when>
						      
						        <c:when test="${ ! empty loggedInUser }">
							        <div class="row">
						            <div class="col-auto welcomeName">
								        Welcome ${loggedInUser.firstName}!
								     </div>
								     <div class="col nav-item">
						          <a href="profile.do" class="nav-link" id="profile-link">Profile</a>
						          </div>
						            <div class="col">
						          <form action="logout.do">
						            <input class="btn btn-secondary" type="submit" value="Logout" />
						          </form>
						          </div>
						          </div>
						        </c:when>
						 
						      </c:choose>

						    </div>


						  </div>

					<%-- Ends Sign in Register  --%>
	    </div>
	  </div>
	</nav>
