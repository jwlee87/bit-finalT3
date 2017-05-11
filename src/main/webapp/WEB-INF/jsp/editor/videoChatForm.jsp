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
		width: 15%;
		border-radius: 15px;
		float:left;
	}
	#local-videos-container {
		position: absolute;
    	top: 154px;
    	left: 86%;
    	margin-left: -155px;
    	width: 100%;
	}
	#remote-videos-container1 {
		position: absolute;
    	top: 374px;
    	left: 78%;
    	width: 100%;
	}
	#remote-videos-container2 {
		position: absolute;
    	top: 594px;
    	left: 78%;
    	width: 100%;
	}
	#remote-videos-container3 {
		position: absolute;
    	top: 814px;
    	left: 78%;
    	width: 100%;
	}
	#remote-videos-container4 {
		position: absolute;
    	top: 1034px;
    	left: 78%;
    	width: 100%;
	}
	#remote-videos-container5 {
		position: absolute;
    	top: 1254px;
    	left: 78%;
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
<div id="remote-videos-container1"></div>
<div id="remote-videos-container2"></div>
<div id="remote-videos-container3"></div>
<div id="remote-videos-container4"></div>
<div id="remote-videos-container5"></div>
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
	var remoteVideoContainer1 = $("#remote-videos-container1");
	var remoteVideoContainer2 = $("#remote-videos-container2");
	var remoteVideoContainer3 = $("#remote-videos-container3");
	var remoteVideoContainer4 = $("#remote-videos-container4");
	var remoteVideoContainer5 = $("#remote-videos-container5");
	
	connection.onstream = function(event) {
		var video = event.mediaElement;
		
		if(event.type === 'local') {
			localVideoContainer.append( video );
		}
		
		if(event.type === 'remote') {
			
			if(remoteVideoContainer1.html() == "") {
				remoteVideoContainer1.append( video );
			} else {
				if(remoteVideoContainer2.html() == "" ){
					remoteVideoContainer2.append( video );
				} else {
					if(remoteVideoContainer3.html() == "" ){
						remoteVideoContainer3.append( video );
					} else { 
						if(remoteVideoContainer4.html() == "" ){
							remoteVideoContainer4.append( video );
						} else {
							if(remoteVideoContainer5.html() == "" ){
								remoteVideoContainer5.append( video );
							}
						}	
					}
					
				}
			}
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