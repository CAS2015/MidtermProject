<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>About US</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />
<link rel="stylesheet" href="../css/about.css">
</head>
<body class="blueBody">
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />

<%-- Bootstrap Template courtesy of W3schools.com https://www.w3schools.com/howto/howto_css_about_page.asp --%>
<div class="about-section">
  <br>
  <h1>About Us</h1>
  <br>
</div>
<div class="h2-subtitle">
<h2>The Deeper Dive Community</h2>
</div>

<div class="container">
<div class="row">
  <div class="col content-parag">
  <p>Although there are other diving online groups and websites that have diving as an "interest", we feel that there is
        a need for comprehensive and community-based page that integrates the complexities, peculiarities, and details that seem
        absent on the other sites.
  </p>
  <p>
        Deeper Dive motivates its registered users to feel comfortable and to post their experiences about their diving adventures
        all around the world, and our non-registered (...future) members of the community can comment on either those experiences, or simply on
        the location of the diving site. This allows for the Deeper Dive community to grow on our members collective diving
        feats and the number of locations.
  </p>
  </div>
</div>
</div>
<div class="h2-subtitle">
  <h2>The Deeper Dive Staff</h2>
</div>

<%-- Staff Descrption --%>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="../images/diver1.jpg" alt="Diver under the sea" style="width:100%">
        <p style="font-size:10px">Photo by <a href="https://unsplash.com/@olgatsai?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Olga Tsai</a> on <a href="https://unsplash.com/s/photos/divers?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></p>

      <div class="container">
        <h2>Chelsey Sessine</h2>
        <p class="title">CEO & Founder</p>
        <p>The #1 Diver and Website Content Provider</p>
        <p>divingrules@example.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>


    <div class="column">
      <div class="card">
        <img src="../images/diver2.jpg" alt="Diver under the sea" style="width:100%">
          <p style="font-size:10px">Photo by <a href="https://unsplash.com/@cristianpalmer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Cristian Palmer</a> on <a href="https://unsplash.com/s/photos/divers?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></p>
        <div class="container">
          <h2>Nick Bird</h2>
          <p class="title">CTO & CIO</p>
          <p>The Wall-Diving King and Cybersecurity Enforcer</p>
          <p>nickofthewall@example.com</p>
          <p><button class="button">Contact</button></p>
        </div>
      </div>
    </div>


      <div class="column">
        <div class="card">
          <img src="../images/diver3.jpg" alt="Diver under the sea" style="width:100%">
            <p style="font-size:10px">Photo by <a href="https://unsplash.com/@almosbech?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Almos Bechtold</a> on <a href="https://unsplash.com/s/photos/divers?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></p>
          <div class="container">
            <h2>Walter Valdez</h2>
            <p class="title">CFO & COO</p>
            <p>The Newbie Diver and Operations Implementor</p>
            <p>maybenexttimecave@example.com</p>
            <p><button class="button">Contact</button></p>
          </div>
        </div>
      </div>
<%-- End About --%>

<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>
