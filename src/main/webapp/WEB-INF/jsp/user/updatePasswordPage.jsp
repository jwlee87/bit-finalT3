<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<!-- Custom CSS-->

<!-- Owl-Carousel -->
<head>
<jsp:include  page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false"></jsp:include>
<script src="${pageContext.request.contextPath}/js/user/updatePasswordPage.js"></script>
<link href="${pageContext.request.contextPath}/css/user/user.css" rel="stylesheet"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호변경하기</title>
</head>
<body id="body">
<input type="hidden" name="userEmail" id="userEmail" value="${param.userEmail}" /> 

</body>
</html>