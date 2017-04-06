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
	
	<title><decorator:title default="JLStory" /></title>
	<decorator:head />
</head>
<body>

	<!-- header -->
	<c:import url="../navigator.jsp" />
	
	<!-- content -->
	<decorator:body></decorator:body>
	
	<!-- footer -->
	<c:import url="../footer.jsp" />

<!-- 	<script type="text/javascript">
		jQuery(function($) {
			$(document).ready(function() {
				$('.navbar-default').stickUp();
	
			});
		});
		
		// iframe resize
		function autoResize(i) {
		    var iframeHeight=
		    (i).contentWindow.document.body.scrollHeight;
		    (i).height=iframeHeight+20;
		}
		
		new WOW().init();
	</script>
 --></body>
</html>


