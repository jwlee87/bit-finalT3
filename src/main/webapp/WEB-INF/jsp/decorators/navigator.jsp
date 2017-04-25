<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
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
			
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main/reLoadMain.do">Coily</a>
			
			
			
			<c:if test="${not empty groupInfo}">
				<span class="qs" data-toggle="?" data-placement="bottom" title=' "${groupInfo.groupHeaderName}" 에서 오늘 하루도 열공하세요 :-)'>?</span>
			</c:if>
		</div>
		
		<div class="collapse navbar-collapse navbar-right navbar-ex1-collapse">
		
			<ul class="nav navbar-nav">
			
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						<c:out value="${user.userNickName}"></c:out>님<span class="caret"></span>
					</a>

					<ul class="dropdown-menu" role="menu" style="top: 35px;border: 1px solid #e5e5e5;background-color:white;color:#34495e;font-size:12px !important;text-align: left !important;">
						<li><a href="javascript:goProfile(${user.userNo});">프로필</a></li>
						<li class="divider"></li>
						<li><a href="javascript:goFavorite(${user.userNo});">보관함</a></li>
						<li class="divider"></li>
			        	<li><a href="javascript:goLogout(${user.userNo});">로그아웃</a></li>
					</ul>
					
				</li>
				<li class="menuItem">
					<a class="open-popup-link">
						<img src="${pageContext.request.contextPath}/img/menu.png" />
					</a>
				</li>
			</ul>
		</div>

	</div>
</div>

<script>

$(function () {
	  $('[data-toggle="?"]').tooltip()
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
		location.href = "../editor/form.do";
	}
	function quizLink() {
		location.href = "../quiz/list.do";
	}
// });
</script>


