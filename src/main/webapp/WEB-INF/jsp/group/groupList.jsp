<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false" ></jsp:include>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/group/groupList.css"/>
	<script src="${pageContext.request.contextPath}/js/group/groupList.js"></script>
</head>
<body>
	<!-- 주사위 로딩중 -->
	<div id="preloader">
		<div id="status"></div>
	</div>
	
	<div id="container">
		<div class="sticky control maker" id="maker">
		  <div class="plus">그룹 만들기</div>
		</div>
		<c:forEach var="list" items="${list}">
			<input type="hidden" value="${list.groupHeaderNo}" id="${list.groupHeaderNo}"/>
			<div class="sticky" >
				<div class="setting">
					<img src="${pageContext.request.contextPath}/img/icon/trash.png" width="19px" height="19px" onclick="deleteGrp(${list.groupHeaderNo})" />
						<a class="iframe" href="groupDetail.do?groupHeaderNo=${list.groupHeaderNo}">
<%-- 						<a class="iframe" href="selectizeTest.do?groupHeaderNo=${list.groupHeaderNo}"> --%>
							<img src="${pageContext.request.contextPath}/img/icon/setting.png" width="19px" height="19px" />
						</a>
				</div>
				<c:out value="${list.groupHeaderName}"/>
			</div>	
		</c:forEach>
	</div>
	
</body>
</html>