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
	.videos {
		width: 60%;
	}
	.divVideos {
		width: 30%;
	}
	#local-videos-container {
		position: absolute;
    	top: 154px;
    	left: 87%;
    	margin-left: -155px;
	}
	#remote-videos-container1 {
		position: absolute;
    	top: 374px;
    	left: 87%;
    	margin-left: -155px;
	}
	#remote-videos-container2 {
		position: absolute;
    	top: 594px;
    	left: 87%;
    	margin-left: -155px;
	}
	#remote-videos-container3 {
		position: absolute;
    	top: 154px;
    	left: 95%;
    	margin-left: -155px;
	}
	#remote-videos-container4 {
		position: absolute;
    	top: 374px;
    	left: 95%;
    	margin-left: -155px;
	}
	#remote-videos-container5 {
		position: absolute;
    	top: 594px;
    	left: 95%;
    	margin-left: -155px;
	}
</style>
</head>
<body>

<!-- <input id="txt-roomId" placeholder="Unique Room Id"> -->
<!-- <button id="btn-open-or-join-room"> -->
<!-- Open Or Join Room -->
<!-- </button> -->
<hr>
<div id="local-videos-container" class="videos"></div>
<div id="remote-videos-container1" class="videos"></div>
<div id="remote-videos-container2" class="videos"></div>
<div id="remote-videos-container3" class="divVideos"></div>
<div id="remote-videos-container4" class="divVideos"></div>
<div id="remote-videos-container5" class="divVideos"></div>
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
					
					localVideoContainer.removeClass("videos");
					localVideoContainer.addClass("divVideos");
					
					remoteVideoContainer1.removeClass("videos");
					remoteVideoContainer1.addClass("divVideos");
					remoteVideoContainer1.css("top","154px !important");
					
					remoteVideoContainer2.removeClass("videos");
					remoteVideoContainer2.addClass("divVideos");
					remoteVideoContainer2.css("top","306px !important");
					
					if(remoteVideoContainer3.html() == "" ){
						remoteVideoContainer3.append( video );
						remoteVideoContainer3.css("top","306px !important");
					} else { 
						if(remoteVideoContainer4.html() == "" ){
							remoteVideoContainer4.append( video );
							remoteVideoContainer4.css("top","458px !important");
						} else {
							if(remoteVideoContainer5.html() == "" ){
								remoteVideoContainer5.append( video );
								remoteVideoContainer5.css("top","458px !important");
							} else {
								
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