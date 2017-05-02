<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>댓글 수정</title>
<jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/comment/commentUpdateForm.js"></script>
<link href="${pageContext.request.contextPath}/css/comment/commentUpdateForm.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container">

	<div class="content">
		<ol class="breadcrumb">
		  <li><a href="${pageContext.request.contextPath}/main/main.do">Home</a></li>
		  <li class="active">자유게시판</li>
		</ol>	
		
		<form action='update.do' method='post'>
			<input type="hidden" name="no" value="<c:out value="${commentVO.cardNo}"/>" /> 
			<table class="table table-no-border">
				<tr>
					<td class="td-txt-right td-wp10">닉네임</td>
				 	<td>
				 		<div class="form-group">
				 			<input type='text' name='writer' class="form-control input-wp5" value="<c:out value="${commentVO.userNickName}"/>" />
				 		</div>
				 	</td>
				</tr>
				<tr>
					<td class="td-txt-right td-wp10">내용</td>
				 	<td><div class="form-group">
				 		<textarea name='content' rows='5' cols='70' class="form-control"><c:out value="${commentVO.cardCommentContent}"/></textarea>
				 		</div>
				 	</td>
				</tr>
			</table>
			
			<div class="row">
			    <div class="col-md-10"></div>
			    <div class="col-md-2">
					<button class="btn btn-primary btn-lg">수정</button>
					<a href='list.do' class="btn btn-info btn-lg">목록</a>
			    </div>
			</div>
		</form>
	</div>
</div>
	
</body>
</html>