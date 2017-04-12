<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<% System.out.println("123123"); %>
<!-- NavBar-->
<div class="navbar-default" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main/main.do">Coily</a>
		</div>

		<div class="collapse navbar-collapse navbar-right navbar-ex1-collapse">

			<ul class="nav navbar-nav">
				<li class="menuItem">
					<a class="open-popup-link">
						changeView
					</a>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						<c:out value="${user.userNickName}">님</c:out><span class="caret"></span>
					</a>

					<!-- <div class="dropdown-menu" role="menu" aria-labelledby="dLabel"
						style="top: 45px; width: 350px; height: 200px;">
						프로필입니다\n 프로필입니다\n 프로필입니다\n 프로필입니다
						<button type="button" class="btn btn-default"
							onclick="javascript:alert(1)"
							style="margin-top: 30%; margin-left: 30px;">profile</button>
						<button type="button" class="btn btn-primary"
							onclick="javascript:alert(2)" style="margin-top: 30%;">logout</button> -->

					<ul class="dropdown-menu" role="menu" style="top: 35px;border: 1px solid #e5e5e5;background-color:white;color:#34495e;">

							<li><a id="profilePopup" href="${pageContext.request.contextPath}/user/profileForm.do?userNo="${user.userNo}">프로필</a></li>
				        	<li><a href="javascript:goLogout(${user.userNo});">LogOut</a></li>
				        	<li><a href="${pageContext.request.contextPath}/quiz/list.do">Quiz Board</a></li>
				        	<li class="divider"></li>
				        	<li><a href="#">Separated link</a></li>
				        	<li class="divider"></li>
				        	<li><a href="#">One more separated link</a></li>
					</ul>
					
				</li>
			</ul>
		</div>

	</div>
</div>

<script>
//Magnific-InlinePopup
$("#profilePopup").colorbox({iframe:true, width:"470px", height:"570px"});


// $(function(){
	$('.open-popup-link').magnificPopup({
		  items: {
		      src: '<div class="row" style="color:#c7c7c7">'
		  		 + '<div class="col-md-3 wow fadeInDown text-center">'
		  		 + '</div>'
		  		 + '<div class="col-md-2 wow fadeInDown text-center">'
		  		 + "<img class='rotate' src='../img/icon/tweet.svg' alt='Generic placeholder image' onclick='javascript:cardLink()'>"
		  		 + '<h3>카드게시판</h3>'
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
		location.href = "../edit/list.do";
	}
	function quizLink() {
		location.href = "../quiz/list.do";
	}
// });
</script>


