<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="description" content="Flatfy Free Flat and Responsive HTML5 Template ">
	<meta name="author" content="">
	
	<title><decorator:title default="코일리 프로젝트" /></title>
	<page:applyDecorator name="jsHeader"> </page:applyDecorator>
	<decorator:head />
</head>

<body>
<!-- 	Preloader -->
<!-- 	<div id="preloader"> -->
<!-- 		<div id="status"></div> -->
<!-- 	</div> -->
	
	<!-- header --> 
 	<page:applyDecorator name="dHeader"> </page:applyDecorator>
	
	<!-- content -->
	
	<div id="whatis" class="content-section-a">
		<div class="container">
			<decorator:body />
		</div>
	</div>
	
	
	<script>
		
		$("#locationGroup").click(function() {
			location.href="${pageContext.request.contextPath}/group/groupList.do";
		});
		
		$(function () {
			  $('[data-toggle="?"]').tooltip()
		})
		$(function () {
			  $('[data-toggle="group"]').tooltip()
		})
		
		function goProfile(userNo){
			location.href = "${pageContext.request.contextPath}/user/profileForm.do?userNo="+userNo;
		}
		function goFavorite(userNo){
			location.href = "${pageContext.request.contextPath}/favorite/favoriteList.do?userNo="+userNo;
		}
		//Magnific-InlinePopup
		// $("#profilePopup").colorbox({iframe:true, width:"560px", height:"790px"});
		
		
		// $(function(){
			$('.open-popup-link').magnificPopup({
				  items: {
				      src: '<div class="row" style="color:#c7c7c7">'
				  		 + '<div class="col-md-3 wow fadeInDown text-center">'
				  		 + '</div>'
				  		 + '<div class="col-md-2 wow fadeInDown text-center">'
				  		 + "<img class='rotate' src='../img/icon/tweet.svg' alt='Generic placeholder image' onclick='javascript:cardLink()'>"
				  		 + '<h3>스터디게시판</h3>'
				  		 + '</div><!-- /.col-lg-4 -->'
				  		
				  		 + '<div class="col-md-2 wow fadeInDown text-center">'
				  		 + '<img  class="rotate" src="../img/icon/picture.svg" alt="Generic placeholder image" onclick="javascript:editLink()">'
				  		 + '<h3>코드편집기</h3>'
				  		 + '</div><!-- /.col-lg-4 -->'
				  		
				  		 + '<div class="col-md-2 wow fadeInDown text-center">'
				  		 + '<img id="linkQuiz"  class="rotate" src="../img/icon/retina.svg" alt="Generic placeholder image" onclick="javascript:quizLink()">'
				  		 + '<h3>퀴즈게시판</h3>'
				  		 + '</div><!-- /.col-lg-4 -->'
				  		 +'</div><!-- /.row -->'
				  		 + '<div class="col-md-3 wow fadeInDown text-center">'
				  		 + '</div>',
				      type: 'inline'
				  }
			});
			
			function cardLink() {
				location.href = "../card/list.do";
			}
			function editLink() {
				location.href = "../editor/form.do";
			}
			function quizLink() {
				location.href = "../quiz/list.do";
			}
		// });
	</script>
	
	<!-- footer -->
	<page:applyDecorator name="dFooter"> </page:applyDecorator>
</body>
</html>
