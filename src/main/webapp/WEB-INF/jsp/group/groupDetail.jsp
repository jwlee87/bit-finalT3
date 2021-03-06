<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false" ></jsp:include>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/group/groupDetail.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/normalize.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/stylesheet.css">
	<!--[if IE 8]><script src="js/es5.js"></script><![endif]-->
	<script src="${pageContext.request.contextPath}/js/group/groupDetail.js"></script>
	<script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/selectize.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/index.js"></script>
	
	<style type="text/css">
	.selectize-control .option .title {
		display: block;
	}
	.selectize-control .option .url {
		font-size: 12px;
		display: block;
		color: #a0a0a0;
	}
	.selectize-control .item a {
		color: #006ef5;
	}
	.selectize-control .item.active a {
		color: #303030;
	}
	</style>
</head>
<body style="overflow: hidden;margin-top: 0px;margin-bottom: 0px;">
<input type="hidden" value="${param.groupHeaderNo}" id="GroupHeaderNo" name="groupHeaderNo"/>
<div class="ly_box">

	<p id="title1" style="display: block;">스터디 그룹 정보</p>
	<form class="form-horizontal" style="margin-left: 0px;margin-right: 0px;">
		<div class="form-group" style="margin-left: 0px;margin-right: 0px;">
			<div id="nlabel" style="width:25%; float: left;">그룹 이름</div>
				<div id="nContent">
				</div>
<!-- 			<input type="text" style="width:70%" id="groupname" name="groupname" /> -->
		</div>
		<div class="form-group" style="margin-left: 0px;margin-right: 0px;">
			<div id="mlabel" style="float:left;width:25%;">그룹 구성원</div>
				<div class="control-group" style="width:50%;float:left;text-align:left;">
					<input type="text" id="input-tags" class="input-tags demo-default">
				</div>
		</div>
		<div id="y" style="display: none;margin-top: 5%;">
			<button type="button" id="dButton" class="btn-update btn-sm" onclick="deleteGrp(${param.groupHeaderNo})" >삭제</button>
			<button type="button" name="uButton" class="btn-update btn-sm" >수정</button>
		</div>
		<div id="n" style="display: none;margin-top: 5%;">
			<button type="button" name="uButton" class="btn-update btn-sm" >수정</button>
		</div>
	</form>
</div>
</body>
</html>