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
<meta name="author" content="sharebootstrap.com" />
<meta name="description" content="free bootstrap template by sharebootstrap.com">
<!-- Google fonts -->
<link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700i,800i,900i&display=swap" rel="stylesheet">
<!-- Icons -->
<link rel="stylesheet" href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome-font-awesome.min.css">
<link rel="stylesheet" href="../css/main.css">
<title>About</title>
<!-- Theme style -->
<link rel="stylesheet" href="css/app.css">
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />

<body class="boxed">
    <div class="wrapper">
        <!-- Breadcrumb image -->

           <div class="space-3 bg-image bg-success blend" data-image-src="../images/bwAbout.jpg">
             Photo by <a href="https://stocksnap.io/author/51851">Adam Sherez</a> from <a href="https://stocksnap.io">StockSnap</a>
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h2 class="headline text-white -h3">The Perfect Design Framework <br>for Startup Businesses</h2>
                        <p class="tagline text-white">Good design is good business, try our demo today!</p>
                        <div class="actions"> <a class="btn btn-cta btn-primary mr-3" href="#" data-toggle="modal" data-target="#signup-modal">Start Free Trial</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end: Breadcrumb image -->
        <section id="page-section">
            <div class="space-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 pr-md-5 ml-sm-0 mb-sm-5">
                            <p class="mb-0 small text-uppercase text-muted">About</p>
                            <h3 class="">Expert Designers and Developers trained in the creative and digital industry who offer a bespoke, professional and trustworthy service.</h3>
                            <p class="lead">With over a decade of experience,we are energetic, fresh and vibrant team of eight offering creative talent, industry knowledge and extremely high standards. All of our team members have degrees in both Graphic Design and Web Design.</p>
                            <div class="my-4"> <a href="#" class="">
                                    See 100+ block sections
                                </a> </div>
                        </div>
                        <div class="col-md-7">
                            <div class="row no-gutters">
                                <div class="col-md-6">
                                    <div class="hover-item bg-warning"> <img src="assets/images/4-1200x1200.jpg" alt="Team Image">
                                        <div>
                                            <h5 class="text-white m-0">Gavin T. Feildang</h5>
                                            <h6 class="text-white">CTO Founder</h6>
                                            <ul class="list-inline">
                                                <li class="list-inline-item"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus text-white"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- end of team card -->
                                </div>
                                <!-- end of col -->
                                <div class="col-md-6">
                                    <div class="hover-item bg-primary"> <img src="assets/images/1-1200x1200.jpg" alt="Team Image">
                                        <div>
                                            <h5 class="text-white m-0">Gavin T. Feildang</h5>
                                            <h6 class="text-white">CTO Founder</h6>
                                            <ul class="list-inline">
                                                <li class="list-inline-item"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus text-white"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- end of team card -->
                                </div>
                                <!-- end of col -->
                                <div class="col-md-6">
                                    <div class="hover-item bg-success"> <img src="assets/images/3-1200x1200.jpg" alt="Team Image">
                                        <div>
                                            <h5 class="text-white m-0">Gavin T. Feildang</h5>
                                            <h6 class="text-white">CTO Founder</h6>
                                            <ul class="list-inline">
                                                <li class="list-inline-item"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus text-white"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- end of team card -->
                                </div>
                                <!-- end of col -->
                                <div class="col-md-6">
                                    <div class="hover-item bg-danger"> <img src="assets/images/2-1200x1200.jpg" alt="Team Image">
                                        <div>
                                            <h5 class="text-white m-0">Gavin T. Feildang</h5>
                                            <h6 class="text-white">CTO Founder</h6>
                                            <ul class="list-inline">
                                                <li class="list-inline-item"><a href="#"><i class="fa fa-twitter text-white"></i></a></li>
                                                <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus text-white"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- end of team card -->
                                </div>
                                <!-- end of col -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>


<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>
