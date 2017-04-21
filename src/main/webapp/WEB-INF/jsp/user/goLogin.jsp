<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="Flatfy Free Flat and Responsive HTML5 Template ">
    <meta name="author" content="">

    <title>Coily - Dayily Study</title>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/comm/bootstrap.min.css" rel="stylesheet">
 
    <!-- Custom Google Web Font -->
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
   
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo:400,700' rel='stylesheet' type='text/css'>
	
    <!-- Custom CSS-->
    <link href="${pageContext.request.contextPath}/css/comm/general.css" rel="stylesheet">
	
	 <!-- Owl-Carousel -->
    <link href="${pageContext.request.contextPath}/css/comm/custom.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/comm/owl.theme.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/animate.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/colorbox.css" rel="stylesheet">
	
	<!-- Magnific Popup core CSS file -->
	
	<script src="${pageContext.request.contextPath}/js/comm/modernizr-2.8.3.min.js"></script>  <!-- Modernizr /-->
	<script src="${pageContext.request.contextPath}/js/comm/jquery.colorbox.js"></script>
	<!--[if IE 9]>
		<script src="js/comm/PIE_IE9.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script src="js/comm/PIE_IE678.js"></script>
	<![endif]-->

	<!--[if lt IE 9]>
		<script src="js/comm/html5shiv.js"></script>
	<![endif]-->

</head>

<body id="home">

	<!-- Preloader -->
<!-- 	<div id="preloader"> -->
<!-- 		<div id="status"></div> -->
<!-- 	</div> -->
	
	<!-- FullScreen -->
    <div class="intro-header">
		<div class="col-xs-12 text-center abcen1">
			<h1 class="h1_home wow fadeIn" data-wow-delay="0.4s">Coily</h1>
			<h3 class="h3_home wow fadeIn" data-wow-delay="0.6s">Daily Coding Study</h3>
			<h4 class="h3_home wow fadeIn" data-wow-delay="0.6s">매일 코일리가 당신의 Coding Study를 도와드립니다 :-) </h4>
			<h4 class="h3_home wow fadeIn" data-wow-delay="0.6s">지금 바로 시작해보세요. </h4>
			<ul class="list-inline intro-social-buttons">
				<li ><a id="loginPopup" href="/bit-finalT3/user/loginForm.do" class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s"><span id="loginBtn" class="network-name">로그인</span></a></li>
				<li ><a id="joinPopup" href="/bit-finalT3/user/joinForm.do" class="btn  btn-lg mybutton_standard wow swing wow fadeIn" data-wow-delay="1.2s"><span class="network-name">회원가입</span></a></li>
			</ul>
		</div>    
        <!-- /.container -->
		<div class="col-xs-12 text-center abcen wow fadeIn">
			<div class="button_down "> 
				<a class="imgcircle wow bounceInUp" data-wow-duration="1.5s"  href="${pageContext.request.contextPath}/group/groupList.do"><img class="img_scroll" src="${pageContext.request.contextPath}/img/icon/circle.png" alt=""></a>
			</div>
		</div>
    </div>

    <!-- JavaScript -->
<script type="text/javascript">
$(document).ready(function(){
	$("#loginBtn").trigger('click');
})	
	$("#loginPopup").colorbox({iframe:true, width:"470px", height:"570px"});
	$("#joinPopup").colorbox({iframe:true, width:"470px", height:"675px"});	

</script>
<script src="${pageContext.request.contextPath}/js/comm/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/js/comm/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/owl.carousel.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/script.js"></script>
	<!-- StikyMenu -->
	<script src="${pageContext.request.contextPath}/js/comm/stickUp.min.js"></script>
	<script type="text/javascript">
	  jQuery(function($) {
		$(document).ready( function() {
// 		  $('.navbar-default').stickUp();
		  
		});
	  });
	
	</script>
	<!-- Smoothscroll -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/comm/jquery.corner.js"></script> 
	<script src="${pageContext.request.contextPath}/js/comm/wow.min.js"></script>
	<script>
	 new WOW().init();
	</script>
	<script src="${pageContext.request.contextPath}/js/comm/classie.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/uiMorphingButton_inflow.js"></script>
	<!-- Magnific Popup core JS file -->
	<script src="${pageContext.request.contextPath}/js/comm/jquery.magnific-popup.js"></script> 
</body>
</html>