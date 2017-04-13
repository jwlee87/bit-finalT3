<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false" ></jsp:include>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/group/groupDetail.css"/>
	<script src="${pageContext.request.contextPath}/js/group/groupDetail.js"></script>
</head>
<body>
<input type="hidden" value="${param.groupHeaderNo}" id="GroupHeaderNo" name="groupHeaderNo"/>
<div class="ly_box">

	<p id="title1" style="display: block;">스터디 그룹 정보</p>
	<br>
	<br>
	<form class="form-horizontal">
		<div class="form-group">
			<div id="nlabel" style="width:25%">그룹 이름</div>
				<div id="nContent">
				</div>
<!-- 			<input type="text" style="width:70%" id="groupname" name="groupname" /> -->
		</div>
		<div class="form-group">
			<div id="mlabel" style="width:25%" >그룹 구성원</div>
				<div class="selectize-control demo-default multi plugin-remove_button">
					<div id="mContent" class="selectize-input items not-full has-options has-items" >
					</div>
				</div>
				<!-- <div style="width:70%"  contenteditable="false" id="groupmem" name="groupmem" >
				</div> -->
		</div>
			<button type="button" id="uButton" class="btn_insert" >수정</button>
	</form>
</div>
</body>
</html>