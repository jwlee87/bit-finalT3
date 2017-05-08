<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>코일리 - 화상채팅</title>
<script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
<style>
	video {
		width:25%;
		border-radius: 15px;
		float:left;
	}
	#local-videos-container {
		position: absolute;
    	top: 154px;
    	left: 85%;
    	margin-left: -155px;
    	width: 100%;
	}
	#remote-videos-container {
		position: absolute;
    	top: 374px;
    	left: 85%;
    	margin-left: -155px;
    	width: 100%;
	}
</style>
</head>
<body>

<!-- <input id="txt-roomId" placeholder="Unique Room Id"> -->
<!-- <button id="btn-open-or-join-room"> -->
<!-- Open Or Join Room -->
<!-- </button> -->
<hr>
<div id="local-videos-container"></div>
<div id="remote-videos-container"></div>
<input type="hidden" value="${groupHeaderNo}" id="roomId" />
<script>
	var connection = new RTCMultiConnection();
	
	connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

	connection.session = {
		audio: true,
		video: true
	}
	
	connection.sdpConstraints.mandatory = {
		OfferToReceiveAudio:true,
		OfferToReceiveVideo:true
	}
	
	var localVideoContainer = $("#local-videos-container");
	var remoteVideoContainer = $("#remote-videos-container");
	
	
	connection.onstream = function(event) {
		var video = event.mediaElement;
		
		if(event.type === 'local') {
			localVideoContainer.append( video );
// 			 document.body.appendChild( event.mediaElement );
		}
		
		if(event.type === 'remote') {
			remoteVideoContainer.append( video );
// 			 document.body.appendChild( event.mediaElement );
		}
	}
	
	
// 	var roomId = $("#txt-roomId").val(connection.token());
	
	
// 	$("#btn-open-or-join-room").click(function () {
		this.disabled = true;
// 		connection.openOrJoin(roomId.val() || 'predefined-roomid');
		connection.openOrJoin($("roomId").val() || 'predefined-roomid');
		
// 	})
	
	
</script>
</body>
</html>