<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/navbar.css">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/navbar-top-fixed.css" rel="stylesheet">

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
					<form class="d-flex" action="login.do" method="POST" id="loginUserForm">
          </form>
					Username: <input form="loginUserForm" type="text" name="username"
						required="required" />
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

						<%-- OG from Bootstrap  --%>
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>

					<form class="d-flex" action="register.do" method="get">
            <input class="button" type="submit" value="Sign Up" />
          </form>
					<%-- Ends Sign in Register  --%>
	      </form>
	    </div>
	  </div>
	</nav>
