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
<style>
.divDetail {
    padding: 13px !important;
    min-height: 170px;
    line-height: 24px;
    width: 507px;
}
</style>
</head>
<body>
	<input type="hidden" id="content" value="${detail.cardContent}" />
  	<div class="cDetail">
  		<div class="post">
		
			<div id="detailBlock">
				<div><c:out value="${detail.userNickName}"></c:out></div>	
				<input type="hidden" id="cardNo" value="${param.cardNo}" />
				<input type="hidden" id="userNo" value="${detail.userNo}"/>
				<input type="hidden" id="loginUserNo" value="${user.userNo}"/>
				
				<div id="printDetail">
					<div class="divDetail" id="divDetail"><c:out value="${detail.cardContent}"></c:out></div>
				</div>
				
				<div class="tools">
					<img src="${pageContext.request.contextPath}/img/icon/attach.png" width="19px" height="19px">
						<button type="button" id="detailNoneButton">수정</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<form id="commentWrite" action="#" method="post">
		<input type="hidden" id="cardContentNo" value="${param.cardContentNo}" />
		<input type="hidden" id="commentUserNo" value="${user.userNo}"/>
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
               
               
                <li class="post" id="commentList" style="margin-top: 80px;">
				</li>
			</ol>
		</section>
	</section>


</body>
</html>