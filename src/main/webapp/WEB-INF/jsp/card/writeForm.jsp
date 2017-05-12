<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>등록</title>
<jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/comm/jquery.form.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/card/writeForm.js"></script>
<link href="${pageContext.request.contextPath}/css/card/writeForm.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/file/fileTest.js"></script>
</head>
<body>
	<!-- 폼태그를 만들어서 카드가 들어가는 내용을 입력해준다. -->
	<div class="cDetail">
		<div class="post">
		<form id="write" action="#" method="post">
			<input type="hidden" id="userNo" name="userNo" value="${user.userNo}">
			<textarea name="cardContent" id="content" cols="80" rows="10" placeholder="내용을 작성하세요"></textarea>
				<div class="tools">
<!-- 				<ul> -->
<!-- 					<li class="icon-addPhotos"><a href="#"></a></li> -->
<!-- 				</ul> -->
				<img src="${pageContext.request.contextPath}/img/icon/attach.png" width="19px" height="19px" id="attach" title="파일 첨부">
				<div id="displayFile" style="display:none;">
					<fieldset>
						<input type="hidden" id="MAX_FILE_SIZE" value="300000" />
						<div>
							<input type="file" id="fileselect" name="fileselect" multiple style="display:none;"/>
							<div id="filedrag">
								마우스로 파일을 끌어오세요.
								<div id="messages"></div>
							</div>
						</div>
					</fieldset>
					
				</div>
				<div id="submitbutton">
            		<button type="button" id="btn">등록</button>
            	</div>
				</div>
		</form>
		</div>
	</div>
</body>
</html>