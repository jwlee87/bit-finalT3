<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include  page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false"></jsp:include>
<!-- javaScript  -->
<script src="${pageContext.request.contextPath}/js/user/characterImg.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/general2.css">
<!-- Custom CSS-->
<link href="${pageContext.request.contextPath}/css/user/img.css" rel="stylesheet" >
<title>coily</title>
</head>
<body>
<!-- 	<div class="container"> -->
		<h2 class="text-center">coily 캐릭터</h2>
<!-- 		<div class="lightbox-gallery"> -->
		<figure onclick="choiceImg(${user.userNo}, 1)" class="snip1566">
				<div><img  src="${pageContext.request.contextPath}/img/userImg/1.PNG" ></div>
				  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>
	 	
	 	<figure onclick="choiceImg(${user.userNo}, 2)" class="snip1566">				
				<img src="${pageContext.request.contextPath}/img/userImg/2.PNG" >
				  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>
				
	 	<figure onclick="choiceImg(${user.userNo}, 3)" class="snip1566">				
				<img src="${pageContext.request.contextPath}/img/userImg/3.PNG" >
				  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>
				
	 	<figure onclick="choiceImg(${user.userNo}, 4)" class="snip1566">				
			<img  src="${pageContext.request.contextPath}/img/userImg/4.PNG" >
			  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>
				
	 	<figure onclick="choiceImg(${user.userNo}, 5)" class="snip1566">				
				<img  src="${pageContext.request.contextPath}/img/userImg/5.PNG" >
				  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>
				
	 	<figure onclick="choiceImg(${user.userNo}, 6)" class="snip1566">				
				<img  src="${pageContext.request.contextPath}/img/userImg/6.PNG" >
				  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>
				
	 	<figure onclick="choiceImg(${user.userNo}, 7)" class="snip1566">				
				<img  src="${pageContext.request.contextPath}/img/userImg/7.PNG" >
				  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>
				
	 	<figure onclick="choiceImg(${user.userNo}, 8)" class="snip1566">				
				<img  src="${pageContext.request.contextPath}/img/userImg/8.PNG" >
				  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>
				
	 	<figure onclick="choiceImg(${user.userNo}, 9)" class="snip1566">				
			<img  src="${pageContext.request.contextPath}/img/userImg/9.PNG" >
			  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>
				
	 	<figure onclick="choiceImg(${user.userNo}, 10)" class="snip1566">				
				<img  src="${pageContext.request.contextPath}/img/userImg/10.PNG" >
				  <figcaption><i class="ion-android-add" ></i></figcaption>
	 	</figure>

</body>
</html>