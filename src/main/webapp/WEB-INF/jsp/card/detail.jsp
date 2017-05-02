<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>상세 조회</title>
<jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/card/detail.js"></script>
<link href="${pageContext.request.contextPath}/css/card/detail.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/comment/commentUpdateForm.css" rel="stylesheet" type="text/css">

<title>Mockup 2</title>
    <link rel="stylesheet" type="text/css" href="/mockup-2.css" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://i.icomoon.io/public/temp/598600d210/clusterflunk-icons12/style.css">
    <link href='http://fonts.googleapis.com/css?family=Lato:400,700,900' rel='stylesheet' type='text/css'>
<!--     <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script> -->
    <script type="text/javascript" src="/mockup-2.js"></script>

</head>
<body>

	<div id="page-wrapper">
  		<ul id="messages"></ul>
  		
		<div>
			<c:out value="${detail.userNickName}"></c:out>
		</div>	
		
		<div id="detailBolck">
			${detail.cardContent}	
		</div>
	
			<input type="hidden" id="cardNo" value="${param.cardNo}" />
			<input type="hidden" id="userNo" value="${detail.userNo}"/>
			<input type="hidden" id="loginUserNo" value="${user.userNo}"/>
			
			<textarea id="detailNone" name="cardContent" required></textarea>
			
			<button id="detailNoneButton">수정</button>
	</div>
	
	<hr>
	
	<c:import url="../file/fileForm.jsp"></c:import>
	
	<form id="commentWrite" action="#" method="post">
		<input type="hidden" id="cardContentNo" value="${param.cardContentNo}" />
		<input type="hidden" id="commentUserNo" value="${user.userNo}"/>
			<br>
	</form>

		<%-- 댓글 관련 파트 시작 --%>		
		<!-- <div id="comment">
			<form id="rForm" class="form-inline"> -->
			
<!--  			    <div class="form-group"> -->
<!--  				    <input type="text" name="commentContent" id="commentContent" class="form-control input-wp1" placeholder="내용을 입력하세요"> -->
<!--  			    </div> -->
<!-- 			  	<button type="button" id="reg" class="btn btn-primary">등록</button> -->
			
		<!-- 	</form>					
		</div> -->
		<hr>
		
		<%-- 댓글 관련 파트 끝 --%>		
		
	 <section class="page">
        <div class="course-meta">
            <h1>댓글 등록</h1>
        </div>
           
        <section class="center">
        
            <ol class="posts" >
                <li class="add-post">
                    <textarea cols="100" maxlength="100" name="commentContent" id="commentContent" class="add-post-textarea" placeholder="댓글을 입력하세요"></textarea>
                <button type="button" id="reg" class="btn btn-primary">등록</button>
                </li>
                 <br><br><br><br><br><br><br><br><br>
               
               
               
               
                <li class="post" id="commentList">

                	<div class="post-content" id="postList">
                    <a class="post-author-username"
                       href="">갓일정</a>
                    <span class="post-timedelta">2초전</span>
                   
	                    <div class="post-body">댓글 답니다 ㅎㅎ</div>
	                    
	                    	<ol class="post-actions">
	                       		<li><a href="javascript:commentUpdateForm(${param.cardContentNo}, ${user.userNo})">수정</a></li>
	<!--                        		<li><a href="javascript:commentUpdateForm()">수정</a></li> -->
	                       		<li><a href="javascript:commentDelete(${param.cardContentNo}, ${user.userNo})">삭제</a></li>
	<!--                        		<li>2017-03-27-10:10</li> -->
	                       		<div class="clearfix"></div>
	                    	</ol>
	                	</div>
				</li>
			</ol>
		</section>
	</section>


</body>
</html>