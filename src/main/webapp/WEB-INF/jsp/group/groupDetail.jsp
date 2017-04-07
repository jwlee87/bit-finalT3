<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/comm/jquery-1.10.2.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/group/groupDetail.css"/>
</head>
<body>
<input type="hidden" value="${param.groupHeaderNo}" id="GroupHeaderNo" name="groupHeaderNo"/>
<div class="ly_box">
	<p>스터디 그룹 등록</p>
	<br>
	<br>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="groupname" class="col-sm-2 control-label" style="width:25%">그룹 이름</label>
			<div class="col-sm-10" style="width:70%">
				<input type="text" id="groupname" name="groupname" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="groupmem" class="col-sm-2 control-label" style="width:25%">그룹 구성원</label>
			<div class="col-sm-10" style="width:70%">
				<input type="text" id="groupmem" name="groupmem" class="form-control" />
			</div>
		</div>
		<button type="button" class="btn_insert">등록</button>
	</form>
</div>

<script>
	// 페이지 로드될 때 ajax 실행
	$(function(){
		
		// alert("번호 : " +  $("#GroupHeaderNo").val());
		$.ajax({
			url:"groupDetailList.do",
			type: "POST",
			data: {
				groupHeaderNo: $("#GroupHeaderNo").val()
			},
			dataType:"json"
		}).done(function (result) {
			var html = "";
			for (var i=0; i < result.userList.length; i++){
				var user = result.userList[i];
				html += user.userNickName + " ";
			}
			
			$("#groupmem").val(html);
			
			$("#groupname").val(result.name);
		});
	});
	
</script>
</body>
</html>