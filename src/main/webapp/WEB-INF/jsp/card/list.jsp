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
<!-- <script src="../decorators/mainHeader.jsp"></script> -->
<script src="${pageContext.request.contextPath}/js/card/card.js"></script>
<link href="${pageContext.request.contextPath}/css/card/list.css" rel="stylesheet" type="text/css">
<%-- <script src="${pageContext.request.contextPath}/js/comm/jquery.colorbox.js"></script> --%>
<%-- <link href="${pageContext.request.contextPath}/css/comm/colorbox.css" rel="stylesheet"> --%>
<%-- <script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script> --%>
<script>
	
	/*팝업창 사용*/
/* 	$(".plus").click(function () {
		window.open("writeForm.do", "", "width=700px; height=800px;" )
	}) */
	$(document).ready(function(){
		$(".writeF").colorbox({iframe:true, width:"800px", height:"880px"});
		$(".detailF").colorbox({iframe:true, width:"800px", height:"880px"});
	});
	



	function goPage(pageNo) {
	location.href = "list.do?pageNo=" + pageNo;
	}

	function deletes(cardNo) {
		alert(cardNo)
		if(confirm("삭제 하시겠습니까?") == true){
			location.href = "delete.do?cardNo=" + cardNo
		}
	}	
		
	
</script>
</head>
<body>
	<figure class="cardList" id="maker"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample1.jpg" alt="profile-sample1" class="background"/>
	  <figcaption>
  	
  		
<!--   		<a class="plus" href="writeForm.do">+</a> -->
  		<a href="/bit-finalT3/card/writeForm.do" class="writeF"><div class="plus">+</div></a>
  		
	<!--   	<button type="button" id="plus"></button> -->
	<!--  	 <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> -->
	 	 
	  </figcaption>
	</figure>
<!-- 위에거를 보면서 기준으로 밑에 포이치 태그를 바꿔줘야한담 -->

<c:forEach var="card" items="${list}">
	<figure class="cardList"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample1.jpg" alt="profile-sample1" class="background"/>
 	   <figcaption>
<!--  	  <div class="closee">X</div> -->
 		  <div class="closee"><a href="#" onclick="javascript:deletes(${card.cardNo});">x</a></div>
		  
		 <a class="detailF" href="detail.do?cardNo=${card.cardNo}"><c:out value="${card.cardContent}"/></a>
   		 <%--  <a href="detail.do?cardNo=${card.cardNo}"></a> --%>
   		  <div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a><a href="#"> <i class="ion-social-twitter-outline"></i></a><a href="#"> <i class="ion-social-vimeo-outline"></i></a></div>
 	
 	
<!--  	<button type="button" id="close"> -->
<!--   <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> -->

<!-- </button> -->
 	   </figcaption>
    </figure>
</c:forEach>
   

<navi:page data="${pageResult}" />

</body>
</html>







