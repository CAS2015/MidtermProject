<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Contact US</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />
<link rel="stylesheet" href="../css/contact.css">
<link rel="stylesheet" href="./css/contact.css">
</head>
<body class="blueBody">
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />

<div class="contact-section">
  <br>
  <h1>Contact Us</h1>
  <br>
</div>

<div class="h2-subtitle">
<h2>How Can We Help?</h2>
</div>


<div class="h2-subtitle">
  <h5>The world of diving can sometimes be a little intimidating to start, and we would love to answer any questions</h5>
</div>



<div class="col content-parag">
  <p style="text-align:center; font-size:3rem">
                      Email us at
                      <a href="mailto:deeperdive@gmail.com" target="_top" style="font-size: 4rem">deeperdive@gmail.com</a> Any Time!
  </p>
</div>




<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>
