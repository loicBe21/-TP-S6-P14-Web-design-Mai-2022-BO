<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LoicRaveloarimanana
  Date: 06/05/2023
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>IA content&mdash; all actu of intelligence artificial </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="connexion">

  <link href="https://fonts.googleapis.com/css?family=B612+Mono|Cabin:400,700&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="<c:url value="/resources/theme/fonts/icomoon/style.css" />" >

  <link rel="stylesheet" href="<c:url value="/resources/theme/css/bootstrap.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/jquery-ui.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/owl.carousel.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/owl.theme.default.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/owl.theme.default.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/jquery.fancybox.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/bootstrap-datepicker.css"/>">


  <link rel="stylesheet" href="<c:url value="/resources/theme/css/style.css"/>">



</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap">

  <div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
      <div class="site-mobile-menu-close mt-3">
        <span class="icon-close2 js-menu-toggle"></span>
      </div>
    </div>
    <div class="site-mobile-menu-body"></div>
  </div>



  <div class="header-top">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-12 col-lg-6 d-flex">


          <a href="#" class="ml-auto d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                  class="icon-menu h3"></span></a>

        </div>


      </div>
    </div>




    <div class="site-navbar py-2 js-sticky-header site-navbar-target d-none pl-0 d-lg-block" role="banner">

      <div class="container">
        <div class="d-flex align-items-center">

          <div class="mr-auto">


          </div>

        </div>
      </div>

    </div>

  </div>



  <div class="site-section bg-light">
    <div class="container">
      <div class="row">

        <div class="col-lg-12">
          <div class="section-title mb-5">
            <h2>login</h2>
          </div>
          <form method="post" action="<%=request.getContextPath()%>/login">

            <div class="row">
              <div class="col-md-6 form-group">
                <label for="fname">username</label>
                <input type="text" id="fname" class="form-control form-control-lg" name="username">
              </div>
              <div class="col-md-6 form-group">
                <label for="lname">password</label>
                <input type="password" id="lname" class="form-control form-control-lg" name="password">
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <input type="submit" value="se connecter" class="btn btn-primary py-3 px-5">
              </div>
            </div>
          </form>
        </div>

      </div>
    </div>
    <% if(request.getAttribute("error") != null ) { %>
      <div class="row">
        <div class="col-12">
          <p style="color: red"><%=request.getAttribute("error")%></p>
        </div>

      </div>
    <% } %>
    </div>
  </div>



  <div class="footer">
    <div class="container">


      <div class="row">
        <div class="col-12">
          <div class="copyright">
            <p>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>


</div>
<!-- .site-wrap -->


<!-- loader -->
<div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#ff5e15"/></svg></div>


<script src="<c:url value="/resources/theme/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/resources/theme/js/popper.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery.stellar.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.countdown.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/bootstrap-datepicker.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/resources/theme/js/aos.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery.fancybox.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.sticky.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery.mb.YTPlayer.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/main.js"/>"></script>



</body>

</html>

