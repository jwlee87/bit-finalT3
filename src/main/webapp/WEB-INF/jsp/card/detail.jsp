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
<%-- <script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/card/detail.js"></script>
<link href="${pageContext.request.contextPath}/css/card/detail.css" rel="stylesheet" type="text/css">
</head>
<body>

	
	<%-- <div class="header">
		<c:import url="/WEB-INF/jsp/include/topMenu.jsp" />
	</div> --%>
	<div id="page-wrapper">
  		<ul id="messages"></ul>
  		
		<div>
			<c:out value="${detail.userNickName}"></c:out>
		</div>	
		
		<div id="detailBolck">
<%-- 			<c:out value="${detail.cardContent}"></c:out> --%>
			${detail.cardContent}	
		</div>
	
<!-- 		<div> -->
<%-- 			<c:out value="${detail.userNo}"></c:out> --%>
<!-- 		</div> -->
			<input type="hidden" id="cardNo" value="${param.cardNo}" />
			<input type="hidden" id="userNo" value="${detail.userNo}"/>
			
			<input type="hidden" id="loginUserNo" value="${user.userNo}"/>
<%-- 			<input type="hidden" id="fileNo" value="${detail.fileNo}"/> --%>
			
			<textarea id="detailNone" name="cardContent" required></textarea>
			
			<button id="detailNoneButton">수정</button>
	</div>
	
	<hr>
	<hr>
	
	<c:import url="../file/fileForm.jsp"></c:import>
	
	<form id="commentWrite" action="#" method="post">
		<input type="hidden" id="cardContentNo" value="${param.cardContentNo}" />
<%-- 		<input type="hidden" id="commentUser" value="${detail.userNo}"/> --%>
		
		<input type="hidden" id="commentUserNo" value="${user.userNo}"/>
<!-- 			<textarea id="commentNone" name="cardCommentContent" placeholder="내용을 작성하세요" required -->
<!-- 			></textarea> -->
		
<!-- 			<input type="button" id="commentNoneButton" value="댓글 등록" /> -->
<!-- 		<input type="button" id="commentDelete" value="댓글 삭제" /> -->
			
<!-- 			<textarea id="commentNone2" name="cardCommentContent2" placeholder="내용을 작성하세요" required -->
<!-- 			></textarea> -->
			<br>
	</form>
	<hr>
	<hr>
	<hr>
	<hr>
	
<%-- <div class="container">
	
	<div class="content">
		<ol class="breadcrumb">
		  <li><a href="${pageContext.request.contextPath}/card/list.do">Home</a></li>
		  <li class="active">댓글 게시판</li>
		</ol>
		<table class="table table-no-border">
		<tr>
			<td class="td-txt-right td-wp10">댓글 닉네임</td>
		 	<td><c:out value="${CommentVO.userNickName}"/></td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">댓글 제목과내용</td>
		 	<td><c:out value="${CommentVO.cardCommentContent}"/></td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">댓글 등록일</td>
		 	<td><fmt:formatDate value="${CommentVO.cardCommentRegDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
		</tr>
		<tr>
			<td class="td-txt-right td-wp10">댓글번호</td>
		 	<td><c:out value="${CommentVO.cardCommentNo}"/></td>
		</tr>

		<tr>
			<td class="td-txt-right td-wp10">댓글 회원번호</td>
		 	<td><c:out value="${CommentVO.userNo}"/></td>
		</tr>
		
		</table> --%>
		
		<%-- <div class="row">
		    <div class="col-md-9"></div>
		    <div class="col-md-3">
				<a href='updateForm.do?no=${param.no}' class="btn btn-success btn-lg">수정</a>
				<a href='delete.do?no=${param.no}' class="btn btn-danger btn-lg">삭제</a>
				<a href='list.do' class="btn btn-info btn-lg">목록</a>
		    </div>
		</div> --%>
		<hr>

		<%-- 댓글 관련 파트 시작 --%>		
		<div id="comment">
			<form id="rForm" class="form-inline">
 <%-- 			<div class="form-group">
 				    <input type="text" name="userNickName" class="form-control" value="<c:out value="${CommentVO.userNickName}" />" placeholder="닉네임을 입력하세요">
			    </div> --%>
			    
			    <div class="form-group">
				    <input type="text" name="commentContent" id="commentContent" class="form-control input-wp1" placeholder="내용을 입력하세요">
<%-- 			   		<input type="hidden" id="commentUserContent" value="${user.userNo}"/> --%>
			    </div>
			  	<button type="button" id="reg" class="btn btn-primary">등록</button>
			</form>					
		</div>
		<hr>
		
		<div id="commentList">
		
		</div>
		<%-- 댓글 관련 파트 끝 --%>		
<!-- 	</div> -->
	
	<%-- <div class="bottom">
		<c:import url="/WEB-INF/jsp/include/bottom.jsp"	/>
	</div> --%>
	

	
<!-- </div>	 -->

</body>
</html>