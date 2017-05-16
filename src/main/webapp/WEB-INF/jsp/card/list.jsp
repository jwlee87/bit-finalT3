<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 게시판</title>
<link href="${pageContext.request.contextPath}/css/card/list.css" rel="stylesheet" type="text/css">
<script>
	
	/* 카드 등록, 카드 상세 팝업창 */
	$(function(){
		
		$(".writeF").colorbox({iframe:true, width:"680px", height:"830px"});

	});
	
</script>
</head>
<body>
	<!-- 카드 등록하는 기본 카드랑 카드 리스트 페이지 전체를 하나로 감싸는 div -->
	<div id="cardPage">
		<!-- 새로운 카드 추가하는 기본 카드 -->
		<figure class="cardList" id="maker">
			<div class="profile-image" style="background-color: #fff; width: 310px;">
	     	</div>
	    	<figcaption>
	      		<h1><a href="/bit-finalT3/card/writeForm.do" class="writeF">+</a></h1>
		  	</figcaption>
		</figure>
		
		<!-- 카드 리스트 -->
		<div id="appendList"></div>
		
		</div>

<script src="${pageContext.request.contextPath}/js/card/card.js"></script>
	
</body>
</html>







