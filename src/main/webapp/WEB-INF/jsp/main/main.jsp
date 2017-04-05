<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:import url="../includeHeader.jsp" />
<c:import url="../includeImport.jsp" />
<body id="home">

	<c:import url="../navigator.jsp" />
	<c:import url="mainBody.jsp" />
	<c:import url="../footer.jsp" />
	
<script type="text/javascript">
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
<!-- Smoothscroll -->
</body>
</html>