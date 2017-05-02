<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>댓글 리스트</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script>
<link href="${pageContext.request.contextPath}/css/comment/cardCommentList.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/comment/cardCommentList.js"></script>
</head>
<body>
	<figure class="cardComment"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample1.jpg" alt="profile-sample1" class="background"/>
	   <figcaption>
  		  <div class="plus">+</div>
	   </figcaption>
	</figure>

	<c:forEach var="comment" items="${selectCardCommentByNo}">
		<figure class="cardCommentList">
		 	<figcaption>
 		 
 		<div class="closee"><a href="#" onclick="javascript:commentDeletes(${card.cardCommentNo});">x</a></div>
			<div><a href="javascript:commentDetail(${card.cardCommentNo});"><c:out value="${card.cardCommentConetent}"/></a></div>
   		<div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a><a href="#"> <i class="ion-social-twitter-outline"></i></a><a href="#"> <i class="ion-social-vimeo-outline"></i></a></div>
 		
 		 	</figcaption>		
  		</figure>
	</c:forEach>

<navi:page data="${pageResult}" />

</body>
</html>