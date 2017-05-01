<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기(보관함)</title>
	<link href="${pageContext.request.contextPath}/css/favorite/favoriteList.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath}/js/favorite/favoriteList.js"></script>
<script>
	
	/* 카드 상세 팝업창 */
	$(function(){
		$(".detailF").colorbox({iframe:true, width:"800px", height:"880px"});
		
// 		$("input[type=radio]").removeAttr("checked");
	});
	
	
</script>
</head>
<body>
		<button type="button" onclick="share(${card.cardNo});" id="email" class="btn-sm mybutton_cyano">전송</button>
	<div id="cardPage">
		<c:forEach var="card" items="${list}">
		<figure class="cardList">
			<div class="custom-radio">
				<input type="radio" name="sendCard" id="radio${card.cardNo}" value="${card.cardNo}"/>
				<label for="radio${card.cardNo}"><span></span> </label>
			</div>
			<div class="like heart2" id="${card.cardNo}" onclick="clickLike(${card.cardNo});">
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







