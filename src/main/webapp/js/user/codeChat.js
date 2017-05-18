var webSocket = new WebSocket('wss://coily.com:443/bit-finalT3/websocket/userEcho.do');	//학원

$(document).ready(function(){
		$("#sendmessage input").focus(function(){
			if($(this).val() == "내용을 입력하세요"){
				$(this).val("");
			}
		});
		$("#sendmessage input").focusout(function(){
			if($(this).val() == ""){
				$(this).val("내용을 입력하세요");
				
			}
		});
		
	});

		webSocket.onerror = function(event) {
			onError(event)
		};

		webSocket.onopen = function(event) {
			onOpen(event)
		};

		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		
		
		webSocket.onclose = function(event) {
			onClose(event);
		};
		
		

		function onClose(event) {
			onMessage(event);
		};
		
		function onMessage(event) {
			var  html = "";
			var userData = "";
			var data="";
			var sendMessage = "";
			//			var ulArr= "";
//			textarea.value += "상대 : " + event.data + "\n";
//			alert("onMessage : " + event.data);
//			userData = event.data;
				if (event.data.startsWith("codeChat:")) {
					var chatArr = event.data.split(":");
					console.log("챗챗챗챗챗챗 : " + chatArr[0])
					console.log("챗챗챗챗챗챗 : " + chatArr[1])
					var sendMsg = chatArr[1].split(","); 
					console.log("챗챗챗챗챗챗 0: " + sendMsg[0])
					console.log("챗챗챗챗챗챗 1: " + sendMsg[1])
//					sendMessage += '<div class="message">'; 
//					sendMessage += '<span style="float: left; margin-left: -35px;">' + sendMsg[0] + '</span>'; 
//					sendMessage += '<img style="width: 33px; margin-top: 17px; border-radius: 50px;" src="' + sendMsg[1] + '"/>'; 
//					sendMessage += '<div class="bubble">'; 
//					sendMessage +=sendMsg[2]; 
//					sendMessage += '<div class="corner"></div>'; 
//					sendMessage += '</div>'; 
//					sendMessage += '</div>'; 
					sendMessage += '\n'
					sendMessage += sendMsg[0] + ":" + sendMsg[1]
					sendMessage += '\n'
					
					$("#chatMsg").append(sendMessage);
					$("#chatMsg").scrollTop($('#chatMsg').prop('scrollHeight'));
				} 
			}
//		
		
		
		

		function onOpen(event) {
//			textarea.value += "연결 성공\n";
//			alert("연결성공");
			console.log("연결성공");
		}

		function onError(event) {
			alert(event.data);
		}


// $(document).ready(function(){
	
	
	
// 	$(document).ready(function(){

	function codeMsgSend() {
		
		console.log("온다온다");
		var html = "";
		$.ajax({
			url : "/bit-finalT3/user/userChat.do",
			dataType : "json",
			type : "POST",
			data : {sendMsg : $("#sendChatMsg").val()}
		}).done(function(result){
			
			console.log("메세지 내용 : " + result.sendMsg);
			console.log("유저 닉네임 : " + result.user.userNickName);
			console.log("이미지경로 : " + result.user.userImgPath);
			
//			html += '<div class="message right">';
//			html += '<span style="float: right; margin-right: -40px;">' + result.user.userNickName+ '</span>';
//			html += '<img style="width: 33px; margin-top: 17px; border-radius: 50px;" src="' + result.user.userImgPath + '"/>';
//			html += '<div class="bubble">';
			html += '\n';
			html += result.user.userNickName+":"+result.sendMsg;
			html += '\n';
// 			html += ' <div class="corner"></div>'; 
//			html += '</div>'; 
//			html += '</div>';
			
			$("#chatMsg").append(html);
			webSocket.send("codeChat:" + result.sendMsg);
			$("chatMsg").scrollTop($('#chatMsg').prop('scrollHeight'));
			$("#sendChatMsg").val("");
		})
	}

$("input[name=sendCodeMessage]").keydown(function(key){
	console.log("에헤이1 : " + $("input[name=sendCodeMessage]").val());
	if(key.keyCode == 13) {
		if ($("input[name=sendCodeMessage]").val() == "") {
			swal("메세지를 입력하세요");
			return false;
		}else {
			codeMsgSend();
			$("#chatMsg").scrollTop($('#chatMsg').prop('scrollHeight'));
			
		} 
	}
})
	

	$("#codeMsgsend").click(function(){
		
		console.log("에헤이2 : " + $("input[name=sendCodeMessage]").val());
		if ($("input[name=sendCodeMessage]").val() == "") {
			swal("메세지를 입력하세요");
			return false;
		} else {
			codeMsgSend();
			$("#chat-messages").scrollTop($('#chat-messages').prop('scrollHeight'));
		}
	})
	
// 	})	
// })
