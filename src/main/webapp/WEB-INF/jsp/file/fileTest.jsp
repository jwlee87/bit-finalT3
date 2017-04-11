<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script>
	<script>
	$(document).ready(function () {
		$("#fileAttach").click(function() {
			window.open("writeForm.do", 600, 100);
		})
	})
	</script>
</head>
	
	
<body>
	<input type="button" id="fileAttach" value="파일첨부"></input>
	<br />
	<br />
	<c:import url="fileForm.jsp"></c:import>
</body>
</html>