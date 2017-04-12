<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath}/js/comm/bootstrap.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath}/js/comm/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/profileForm.js"></script>


<!-- Custom CSS-->
<link href="${pageContext.request.contextPath}/css/user/user.css" rel="stylesheet">
<!-- Owl-Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/user.css">
<link href="${pageContext.request.contextPath}/css/comm/general.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/custom.css"	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/owl.carousel.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/owl.theme.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/sweetalert.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/user/profileForm.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>coily-myPage</title>
</head>
<body>
	<header> One account. All of Google. </header>
	<div class="login">
		<i ripple> <svg xmlns="http://www.w3.org/2000/svg"
				viewBox="0 0 24 24"> <path fill="#C7C7C7"
				d="m12,2c-5.52,0-10,4.48-10,10s4.48,10,10,10,10-4.48,10-10-4.48-10-10-10zm1,17h-2v-2h2zm2.07-7.75-0.9,0.92c-0.411277,0.329613-0.918558,0.542566-1.20218,1.03749-0.08045,0.14038-0.189078,0.293598-0.187645,0.470854,0.02236,2.76567,0.03004-0.166108,0.07573,1.85002l-1.80787,0.04803-0.04803-1.0764c-0.02822-0.632307-0.377947-1.42259,1.17-2.83l1.24-1.26c0.37-0.36,0.59-0.86,0.59-1.41,0-1.1-0.9-2-2-2s-2,0.9-2,2h-2c0-2.21,1.79-4,4-4s4,1.79,4,4c0,0.88-0.36,1.68-0.930005,2.25z" />
			</svg>
		</i>
		<div class="photo"></div>
		<!-- <span>Sign in with your Google Account</span> -->
		<form action="" id="updateForm">
			<div id="n" class="form-group">
				<input readonly="readonly" id="userEmail" spellcheck=false class="form-control"
					name="userEmail" value="${user.userEmail}" type="text" size="18" alt="login" required="" >
				<span class="form-highlight"></span> <span class="form-bar"></span>
				<label for="userEmail" class="float-label">Email</label>
				
			</div>

			<div id="u" class="form-group">
				<input id="userNickName" spellcheck=false class="form-control"
					name="userNickName" value="${user.userNickName}" type="text" size="18" alt="login" required="">
				<span class="form-highlight"></span> <span class="form-bar"></span>
				<label for="nickName" class="float-label">nickName</label>
				<erroru> nickName is required <i> <svg
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"> <path
						d="M0 0h24v24h-24z" fill="none" /> <path
						d="M1 21h22l-11-19-11 19zm12-3h-2v-2h2v2zm0-4h-2v-4h2v4z" /> </svg>
				</i> </erroru>
			</div>

			<div id="p" class="form-group">
				<input id="userPsw" class="form-control" spellcheck=false
					name="userPsw" type="password" size="18" alt="login" required="">
				<span class="form-highlight"></span> <span class="form-bar"></span>
				<label for="userPsw" class="float-label">Password</label>
				<errorp> Password is required <i> <svg
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"> <path
						d="M0 0h24v24h-24z" fill="none" /> <path
						d="M1 21h22l-11-19-11 19zm12-3h-2v-2h2v2zm0-4h-2v-4h2v4z" /> </svg>
				</i> </errorp>
			</div>
				<input type="hidden" id="userNo" name="userNo" value="${user.userNo}" >
<%-- 				<input type="hidden" id="> --%>
			<div class="form-group">
				<button class="btn  btn-lg mybutton_cyano wow fadeIn" id="submitBtn" type="button" ripple>수정 하기</button>
			</div>
		</form>

	</div>


</body>
</html>