<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<script src="${pageContext.request.contextPath}/js/comm/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/jquery.magnific-popup.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Custom CSS-->

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
<title>비밀번호변경하기</title>
</head>
<body id="body">
<input type="hidden" name="userEmail" id="userEmail" value="${param.userEmail}" /> 

<script src="${pageContext.request.contextPath}/js/user/updatePasswordPage.js"></script>
</body>
</html>