<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<jsp:include  page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false"></jsp:include>
<script src="https://cdn.webrtc-experiment.com:443/rmc3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/editor/socket.io.js"></script>
<title>코일리 - 화상채팅</title>
<style>
	video{
		width:40%;
		border-radius: 15px;
	}
</style>
</head>
<body>


<input id="txt-roomId" placeholder="Unique Room Id">
<button id="btn-open-or-join-room">
Open Or Join Room
</button>

<hr>

<script>
	var connection = new RTCMultiConnection();
	
// 	connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
	connection.socketURL = 'http://localhost:9090/';

	connection.session = {
		audio: true,
		video: true
	}
	
	connection.sdpConstraints.mandatory= {
		OfferToReceiveAudio:true,
		OfferToReceiveVideo:true
	}
	
	
	var roomId = $("#txt-roomId").val(connection.token());
	
	
	$("#btn-open-or-join-room").click(function () {
		this.disabled = true;
		connection.openOrJoin(roomId.val() || 'predefined-roomid');
		
	})
	
	
</script>
</body>
</html>