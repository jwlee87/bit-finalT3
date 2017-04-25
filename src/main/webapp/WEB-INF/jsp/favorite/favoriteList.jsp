<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기(보관함)</title>
	<link href="${pageContext.request.contextPath}/css/card/list.css" rel="stylesheet" type="text/css">
<script>
	
	/* 카드 상세 팝업창 */
	$(function(){
		$(".detailF").colorbox({iframe:true, width:"800px", height:"880px"});
	});
	
</script>
</head>
<body>
	<div id="cardPage">
		<c:forEach var="card" items="${list}">
		<figure class="cardList">
			<div class="like" id="${card.cardNo}" onclick="clickLike(${card.cardNo});">
	  		</div>
	  		<div class="profile-image">
	    		<img src="${card.userImgPath}" />
	  		</div>
	  		<figcaption>
	    		<h5><c:out value="${card.userNickName}"/></h5>
	    		<h3><a class="detailF" href="../card/detail.do?cardNo=${card.cardNo}"><c:out value="${card.cardContent}"/></a></h3>
	  		</figcaption>
		</figure>
		</c:forEach>
	</div>

</body>
</html>






