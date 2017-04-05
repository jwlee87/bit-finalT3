<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/comm/jquery.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/group/groupList.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/comm/jquery-1.10.2.js"></script>
	<link href="${pageContext.request.contextPath}/css/comm/bootstrap.min.css" rel="stylesheet">
 
    <!-- Custom Google Web Font -->
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo:400,700' rel='stylesheet' type='text/css'>
	
    <!-- Custom CSS-->
    <link href="${pageContext.request.contextPath}/css/comm/general.css" rel="stylesheet">
	
	 <!-- Owl-Carousel -->
    <link href="${pageContext.request.contextPath}/css/comm/custom.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/comm/owl.theme.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/animate.css" rel="stylesheet">
	
	<!-- Magnific Popup core CSS file -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/magnific-popup.css"> 
	
	<script src="${pageContext.request.contextPath}/js/comm/modernizr-2.8.3.min.js"></script>  <!-- Modernizr /-->
    <script src="${pageContext.request.contextPath}/js/comm/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/owl.carousel.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/script.js"></script>
	<!-- StikyMenu -->
	<script src="${pageContext.request.contextPath}/js/comm/stickUp.min.js"></script>
	<script type="text/javascript">
	  jQuery(function($) {
		$(document).ready( function() {
// 		  $('.navbar-default').stickUp();
		  
		});
	  });
	
	</script>
	<!-- Smoothscroll -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/comm/jquery.corner.js"></script> 
	<script src="${pageContext.request.contextPath}/js/comm/wow.min.js"></script>
	<script>
	 new WOW().init();
	</script>
	<script src="${pageContext.request.contextPath}/js/comm/classie.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/uiMorphingButton_inflow.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/jquery.magnific-popup.js"></script> 
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/group/groupList.css"/>
</head>
<body>

	<div id="container">
		<div class="sticky control maker" id="maker">
		  <div class="plus">그룹 만들기</div>
		</div>
		<c:forEach var="list" items="${list}">
			<input type="hidden" value="${list.groupHeaderNo}" id="${list.groupHeaderNo}"/>
			<div class="sticky" >
				<div class="setting">
					<img src="${pageContext.request.contextPath}/img/icon/setting.png" width="17px" height="17px" >
				</div>
				<c:out value="${list.groupHeaderName}"/>
			</div>	
		</c:forEach>
	</div>
	
</body>
<script>

$(function(){
	
	/** 등록된 그룹 클릭 시 그룹명 & 멤버 상세 조회창(수정도 가능) **/
	$(".setting").magnificPopup({
		
		
		
		type: 'ajax',
		ajax: {
			
		}

// 	      items: {
// 	          src: '<div class="ly_wrap">'
// 	               + '<div class="ly_box">'
// 	               + '<p>스터디 그룹 등록</p>'
// 	               + '<form class="form-horizontal">'
// 	               + '<div class="form-group">'
// 	               + '<label for="groupname" class="col-sm-2 control-label" style="width:25%">그룹 이름</label>'
// 	               + '<div class="col-sm-10" style="width:70%">'
// 	               + '<input type="text" id="groupname" name="groupname" class="form-control" />'
// 	               + '</div>'
// 	               + '</div>'
// 	               + '<div class="form-group">'
// 	               + '<label for="groupmem" class="col-sm-2 control-label" style="width:25%">그룹 구성원</label>'
// 	               + '<div class="col-sm-10" style="width:70%">'
// 	               + '<input type="text" id="groupmem" name="groupmem" class="form-control" />'
// 	               + '</div>'
// 	               + '</div>'
// 	               + '<button type="button" class="btn_insert">등록</button>'
// 	               + '</form>'
// 	               + '</div>'
// 	               + '</div>',
// 	          type: 'inline'
// 	      }
		
	});
})
	/** 새로운 그룹 등록 **/
	
	$("#maker").click(function () {
		
		$.ajax({
		  url: "groupHeaderWrite.do",
		  type: "POST"
	  	})
	  	.done (function(result){
	  		// alert("그룹 등록 성공1" + result);
	  		
	  		var html = '<div class="sticky" >'
	  		+ '<div class="setting">'
			+ '<img src="${pageContext.request.contextPath}/img/icon/setting.png" width="17px" height="17px" >'
			+ '</div>'
			+ result
			+ '</div>';
	  		
	  		/* var sticky = document.createElement('div');
	 	    sticky.className = 'sticky';
	 	    var stickySetting = sticky.createElement('div');
	 	    sticky.className = 'setting open-popup-link';
	 	    sticky.innerHTML = result; */
	  		
	  		
	  		$("#maker").after(html);
	  		$(".setting").magnificPopup({

	  	      items: {
	  	          src: '<div class="ly_wrap">'
	  	               + '<div class="ly_box">'
	  	               + '<p>스터디 그룹 등록</p>'
	  	               + '<form class="form-horizontal">'
	  	               + '<div class="form-group">'
	  	               + '<label for="groupname" class="col-sm-2 control-label" style="width:25%">그룹 이름</label>'
	  	               + '<div class="col-sm-10" style="width:70%">'
	  	               + '<input type="text" id="groupname" name="groupname" class="form-control" />'
	  	               + '</div>'
	  	               + '</div>'
	  	               + '<div class="form-group">'
	  	               + '<label for="groupmem" class="col-sm-2 control-label" style="width:25%">그룹 구성원</label>'
	  	               + '<div class="col-sm-10" style="width:70%">'
	  	               + '<input type="text" id="groupmem" name="groupmem" class="form-control" />'
	  	               + '</div>'
	  	               + '</div>'
	  	               + '<button type="button" class="btn_insert">등록</button>'
	  	               + '</form>'
	  	               + '</div>'
	  	               + '</div>',
	  	          type: 'inline'
	  	      }
	  		
	  	});
	 	    
	 	    
	  	});
		
	});
	

	
		var gName = $("#groupname").val();
		console.log(gName);
		
	
	
	$('.btn_insert').click(function(){
	})
</script>
</html>