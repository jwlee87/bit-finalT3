<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="${pageContext.request.contextPath}/js/comm/bootstrap.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/sweetalert.min.js"></script>
<!-- Custom CSS-->
<link href="${pageContext.request.contextPath}/css/user/user.css" rel="stylesheet"> 
 <!-- Owl-Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/user.css"> 
<link href="${pageContext.request.contextPath}/css/comm/general.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/custom.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/owl.carousel.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/owl.theme.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/comm/sweetalert.css" rel="stylesheet">



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body onload="getLogin()">
	<div class="form-wrap">
		<div class="tabs">
			<h3 class="login-tab"><a class="active" href="#login-tab-content">Login</a></h3>
		</div><!--.tabs-->
		<div class="tabs-content">
			<div id="login-tab-content" class="active">
				<form name="loginForm" class="login-form" action="" method="post">
					<input type="text" class="input" id="userEmail" name="userEmail" placeholder="Email">
					<input type="password" class="input" id="userPsw" name="userPsw" placeholder="psw">
					<input type="checkbox" class="checkbox" id="remember_me" name="remember_me" onclick="confirmSave(this)">
					<label for="remember_me">Remember me</label>
					<input type="button" class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" id="loginBtn" value="Login">
				</form>
				<div class="help-text">
					<p><a href="javascript:goFindPassword();">Forget your password?</a></p>
				</div><!--.help-text-->
			</div><!--.signup-tab-content-->

		</div><!--.tabs-content-->
	</div><!--.form-wrap-->
	
<script src="${pageContext.request.contextPath}/js/user/joinForm.js"></script>
<script src="${pageContext.request.contextPath}/js/user/loginForm.js"></script>

<script type="text/javascript">


/*	
//  	function setCookie(cookieName, value, exdays) {
// 		var exdate = new Date();
// 		exdate.setDate(exdate.getDate() + exdays);
		
// 		var cookieValue = escape(value) + ((exdays==null)?"":"; expires=" + exdate.toGMTString());
// 		document.cookie = cookieName + "=" + cookieValue;
// 	}

	
// 	function deleteCookie(cookieName) {
// 		var expireDate = new Date();
// 		expireDate.setDate(expireDate.getDate() - 1);
// 		document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString();
// 	}
	
// 	function getCookie(cookieName) {
// 		cookieName = cookieName + '=';
// 		var cookieDate = document.cookie;
// 		var start = cookieDate.indexOf(cookieName);
// 		var cookieValue = "";
		
// 		if(start != -1) {
// 			start += cookieName.length;
// 			var end = cookieDate.indexOf(';', start);
// 			if(end == -1) end = cookieDate.length;
// 			cookieValue = cookieDate.substring(start, end);
// 		}
// 		return unescape(cookieValue);
// 	} 
	
	
// 	//쿠키에서 로그인 정보 가져오기
// 	function getLogin() {
// 		var lf = document.loginForm;
// 		//useremail 쿠키에서 email값을 가져온다
// 		var userEmail = getCookie("userEmail");
// 		var userPsw = getCookie("userPsw");
		
// 		if(userEmail != "") {
// 			lf.userEmail.value = userEmail;
// 			lf.userPsw.value = userPsw;
// 			lf.remember_me.checked = true;
// 		}
		
// 	}
	
	
// 	function confirmSave(checkbox) {
// 		var isRemember;
// 		//로그인 정보를 저장 o
		
// 		if(checkbox.checked) {
// 			isRemember = confirm("이 pc에 로그인 정보를 저장 하시겠습니까? \n\nPc방 등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.")
// 			if(!isRemember)
// 				checkbox.checked = false;
// 		}
// 	}
	
	
// 	//쿠키값 가져오기
// 	function getCookie(key) {
// 		var cook = document.cookie + ";";
// 		var idx =  cook.indexOf(key, 0);
// 		var val = "";
// 		if(idx != -1) {
// 			cook = cook.substring(idx, cook.length);
// 			begin = cook.indexOf("=", 0) + 1;
// 			end = cook.indexOf(";", begin);
// 			val = unescape( cook.substring(begin, end) );
// 		}
// 		return val; 
// 	}
	
// 	//쿠키값 설정
// 	function setCookie(name, value, expiredays) {
// 		var today = new Date();
// 		today.setDate(today.getDate() + expiredays);
// 		document.cookie = name + "=" + escape(value)+"; path=/; expires=" + today.toGMTString() + ";";
// 	}
	
	

// 	function saveLogin(userEmail, userPsw) {
// 		if(userEmail != "") {
// 			//userEmail 쿠키에 email값을 1일간 저장
// 			setCookie("userEmail", userEmail, 1);
// 			setCookie("userPsw", userPsw, 1);
// 		}else {
// 			//userEmail 쿠키삭제
// 			setCookie("userEmail", userEmail, -1);
// 			setCookie("userPsw", userPsw, -1);
// 		}
// 	}
	
	

// 	$("#loginBtn").click(function(){
// 		alert("dddddd");
// 		var userEmail = $("#userEmail").val();
// 		var userPsw = $("#userPsw").val();
		
// 	/* 	var lf = document.loginForm;
// 		if(lf.remember_me.checked) saveLogin(lf.userEmail.value, lf.userPsw.value);
// 		else saveLogin("");
// 		lf.action = "/bit-finalT3/user/login.do";
// 		lf.submit(); */
// 		$.ajax({
// 			url : "/bit-finalT3/user/login.do",
// 			dataType : "json",
// 			type : "POST",
// 			data : {userEmail : $("#userEmail").val(),
// 					userPsw : $("#userPsw").val()}
// 		}).done(function(result){
// 			if(result.loginOk) {
// 				console.log(result.userNo);
// 				console.log(result.userEmail);
// 				console.log(result.userNickName);
				
// 		/* 		var lf = document.loginForm;
// 				if(lf.remember_me.checked){ saveLogin(lf.userEmail.value, lf.userPsw.value)
// 					lf.submit();	
// 				} else saveLogin(""); */
// 			/* 	lf.action = "/bit-finalT3/user/login.do"; */
				 
// // 				setCookie(result.userEmail, result.userEmail , 1);
// 				alert("쿠키 만들어짐?? : " + getCookie(userEmail.userEmail));
// 				self.close();
// 				goMain(result);
				
// 			}else {
// 				   swal("로그인 실패", "회원정보가 올바르지 않습니다:)", "error");
// 			}
// 		})
// 	})
	
	
// 	function goMain(result) {
// 		var no = result.userNo;
// 		var nickName = result.userNickName;
// 		var email = result.userEmail;
// 		alert("유저넘버 : " + no);
// 		alert("별명 : " + nickName);
// 		alert("이메일주소 : " + email);
		
// 		opener.location.href ="${pageContext.request.contextPath}/main/main.do";
		
// 	}
	
	
	
	
</script>



</body>
</html>