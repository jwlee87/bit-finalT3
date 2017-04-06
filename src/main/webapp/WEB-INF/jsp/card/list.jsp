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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<%-- <script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script> --%>
<link href="${pageContext.request.contextPath}/css/card/list.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/card/card.js"></script>
</head>
<body>

<figure class="cardList"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample1.jpg" alt="profile-sample1" class="background"/>
  <figcaption>
  	
  	<div class="plus">+</div>
<!--   	<button type="button" id="plus"> -->
<!--  	 <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> -->
 	 
<!--   </button> -->
 
  </figcaption>
</figure>
<!-- 위에거를 보면서 기준으로 밑에 포이치 태그를 바꿔줘야한담 -->
<c:forEach var="card" items="${list}">
<figure class="cardList"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample1.jpg" alt="profile-sample1" class="background"/>
  <figcaption>
<!--  		<div class="closee">X</div> -->
 		<div class="closee"><a href="#" onclick="javascript:deletes(${card.cardNo});">x</a></div>
			<div><a href="javascript:detail(${card.cardNo});"><c:out value="${card.cardContent}"/></a></div>
    <div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a><a href="#"> <i class="ion-social-twitter-outline"></i></a><a href="#"> <i class="ion-social-vimeo-outline"></i></a></div>
 	
 	
<!--  	<button type="button" id="close"> -->
<!--   <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> -->

<!-- </button> -->
  </figcaption>
  </figure>
</c:forEach>
   

<navi:page data="${pageResult}" />

<script>

	$(".plus").click(function () {
		window.open("writeForm.do", "", "width=700px; height=800px;" )
	})
	
	function goPage(pageNo) {
	location.href = "list.do?pageNo=" + pageNo;
	}
		function detail(cardNo){
			alert(cardNo)
		
		window.open("detail.do?cardNo=" + cardNo , "", "width=700px; height=800px;" )
	}
	
	
	function deletes(cardNo) {
		alert(cardNo)
		if(confirm("삭제 하시겠습니까?") == true){
			location.href = "delete.do?cardNo=" + cardNo
		}
	}	
		
</script>

</body>
</html>







