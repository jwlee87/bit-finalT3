<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="description" content="Flatfy Free Flat and Responsive HTML5 Template ">
	<meta name="author" content="">
	
	<title><decorator:title default="코일리 프로젝트" /></title>
	<!-- Custom Google Web Font -->
	<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo:400,700' rel='stylesheet' type='text/css'>
	
	<!-- Bootstrap core CSS -->
	<link href="${pageContext.request.contextPath}/css/comm/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/docs.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/colorbox.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/magnific-popup.css" rel="stylesheet">
	
	<!-- JavaScript -->
	<script src="${pageContext.request.contextPath}/js/comm/jquery-1.10.2.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/jquery.colorbox.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/jquery.magnific-popup.js"></script>
	<decorator:head />
</head>


	<!-- header -->
	<c:import url="../navigator.jsp" />
	
	<!-- content -->
	<decorator:body></decorator:body>
<%-- 		<decorator:getProperty property="page.local_script"></decorator:getProperty> --%>
	
	<!-- footer -->
	<c:import url="../footer.jsp" />

</html>
