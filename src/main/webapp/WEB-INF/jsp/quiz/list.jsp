<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<link href="${pageContext.request.contextPath}/css/quiz/list.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script>
</head>
<body>
	
	<div id="container-main">
	
	<div class="accordion-container" id="add">
  		<div class="accordion-titulo">
  			<div class="plus">+</div>
  		</div>
  	</div>
  	<c:forEach var="list" items="${qList}">
	<div class="accordion-container">
		<a href="#" class="accordion-titulo"><c:out value="${list.quizTitle}"/><span class="toggle-icon"></span></a>
		<div class="accordion-content">
		<c:choose>
			<c:when test="${list.quizWriteType eq 'u'}">
				${list.quizContent}
			</c:when>
			<c:otherwise>
				<p><c:out value="${list.quizContent}"/></p>
			</c:otherwise>
		</c:choose>	
		</div>
	</div>
	</c:forEach>
	
	<navi:page data="${pageResult}" />
	
	</div>

<script>
$(function(){
	$(".accordion-titulo").click(function(e){
	           
	        e.preventDefault();
	    
	        var contenido=$(this).next(".accordion-content");

	        if(contenido.css("display")=="none"){ //open		
	          contenido.slideDown(250);			
	          $(this).addClass("open");
	        }
	        else{ //close		
	          contenido.slideUp(250);
	          $(this).removeClass("open");	
	        }

	      });
	});
	
	
	$("#add").click(function(){
		console.log(screen.width)
		console.log(screen.height)
		var left = (screen.width - 800) / 2;
		var top = (screen.height - 600) / 2;
		window.open("${pageContext.request.contextPath}/quiz/writeForm.do", "pop1", "top=" + top + ", left=" + left +", width=800, height=600");
	})
	
	function goPage(pageNo) {
			location.href = "list.do?pageNo=" + pageNo;
		}
	
</script>
</body>
</html>