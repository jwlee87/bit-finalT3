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
	<c:import url="/WEB-INF/jsp/main/mainHeader.jsp" />
	<decorator:head />
</head>

<body>
	<!-- header --> 
 	<c:import url="/WEB-INF/jsp/decorators/navigator.jsp" />  
	
	<!-- content -->
	<div id="container">
		<decorator:body />
	</div>
	
	<!-- footer -->
	<c:import url="/WEB-INF/jsp/decorators/footer.jsp" />
</body>
</html>
