/**
 * 
 */




//
//var userImgPath = "";
//var userEmail = "";

//var webSocket = new WebSocket('ws://14.32.66.123:9120/bit-finalT3/websocket/userEcho.do');	//학원
var webSocket = new WebSocket('wss://coily.com:443/bit-finalT3/websocket/userEcho.do');	//학원
//var webSocket = new WebSocket('ws://192.168.0.16:9100/bit-finalT3/websocket/userEcho.do');	//학원
//var webSocket = new WebSocket('ws://localhost:9100/bit-finalT3/websocket/userEcho.do');	//학원

//var webSocket = new WebSocket('ws://14.138.118.25:9120/bit-finalT3/websocket/userEcho.do');	//고시원

$(document).ready(function(){
	
	  var preloadbg = document.createElement("img");
	  preloadbg.src = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/timeline1.png";
	  
		$("#searchfield").focus(function(){
			if($(this).val() == "Search contacts..."){
				$(this).val("");
			}
		});
		$("#searchfield").focusout(function(){
			if($(this).val() == ""){
				$(this).val("Search contacts...");
				
			}
		});
		
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
		
		
		$(".chats").click(function(){
			console.log("냠냠");
			$("#fList").fadeOut();
			$("#chat").fadeIn();
		})
		
		$(".friends").click(function() {
			$("#chat").fadeOut();
			$("#fList").fadeIn();
		})
			
		
		$(".friend").each(function(){		
			$(this).click(function(){
				var childOffset = $(this).offset();
				var parentOffset = $(this).parent().parent().offset();
				var childTop = childOffset.top - parentOffset.top;
				var clone = $(this).find('img').eq(0).clone();
				var top = childTop+12+"px";
				
				$(clone).css({'top': top}).addClass("floatingImg").appendTo("#chatbox");									
				
				setTimeout(function(){$("#profile p").addClass("animate");$("#profile").addClass("animate");}, 100);
				setTimeout(function(){
					$("#chat-messages").addClass("animate");
					$('.cx, .cy').addClass('s1');
					setTimeout(function(){$('.cx, .cy').addClass('s2');}, 100);
					setTimeout(function(){$('.cx, .cy').addClass('s3');}, 200);			
				}, 150);														
				
				$('.floatingImg').animate({
					'width': "68px",
					'left':'108px',
					'top':'20px'
				}, 200);
				
				var name = $(this).find("p strong").html();
				var email = $(this).find("p span").html();														
				$("#profile p").html(name);
				$("#profile span").html(email);			
				
				$(".message").not(".right").find("img").attr("src", $(clone).attr("src"));									
				$('#friendslist').fadeOut();
				$('#chatview').fadeIn();
			
				
				$('#close').unbind("click").click(function(){				
					$("#chat-messages, #profile, #profile p").removeClass("animate");
					$('.cx, .cy').removeClass("s1 s2 s3");
					$('.floatingImg').animate({
						'width': "40px",
						'top':top,
						'left': '12px'
					}, 200, function(){$('.floatingImg').remove()});				
					
					setTimeout(function(){
						$('#chatview').fadeOut();
						$('#friendslist').fadeIn();				
					}, 50);
				});
				
			});
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
//			webSocket.send(event);
//			alert(event);
//			alert("꾸르르르륵");
			console.log("ddddd" + event);
			console.dir(event);
			console.dir(event.data);
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
			if(event.data.startsWith("ul")) {
				var ulArr = event.data.split(":");
//				alert(ulArr);
					console.log("##################### " + userData)
					console.log("!!!!!!!!!!!!!!!!!!!!!!!! : " + ulArr[0])
					console.log("@@@@@@@@@@@@@@@@@@@@@@@@ : " + ulArr[1])
					var arrUser = ulArr[1].split(";");
					
					for(var i = 0; i < arrUser.length-1; i++) {
						var arrInfo = arrUser[i].split(",");
						html += "<div id="+i+">"
						html += '<div class="friend">';
						html += "<img  src=" + arrInfo[2] +"></img>";
						html += '<p>';
						html += '<strong>'+ arrInfo[0]+'</strong><br>';
						html += "<span>" + arrInfo[1] + "</span>";
						html += '</p>';
						html += '<div class="status available"></div>';
						html += '</div>';
						html += '</div>';
						console.log("html결과값 : " + html);
					}
					$("#result").html(html);
					
				} else if (event.data.startsWith("chat")) {
					var chatArr = event.data.split(":");
					console.log("챗챗챗챗챗챗 : " + chatArr[0])
					console.log("챗챗챗챗챗챗 : " + chatArr[1])
					var sendMsg = chatArr[1].split(","); 
					console.log("챗챗챗챗챗챗 0: " + sendMsg[0])
					console.log("챗챗챗챗챗챗 1: " + sendMsg[1])
					console.log("챗챗챗챗챗챗 2: " + sendMsg[2])
					sendMessage += '<div class="message">'; 
					sendMessage += '<span style="float: left; margin-left: -35px;">' + sendMsg[0] + '</span>'; 
					sendMessage += '<img style="width: 33px; margin-top: 17px; border-radius: 50px;" src="' + sendMsg[1] + '"/>'; 
					sendMessage += '<div class="bubble">'; 
					sendMessage +=sendMsg[2]; 
					sendMessage += '<div class="corner"></div>'; 
					sendMessage += '</div>'; 
					sendMessage += '</div>'; 
					$("#chat-messages").append(sendMessage);
					$("#chat-messages").scrollTop($('#chat-messages').prop('scrollHeight'));
				} 
			}
//			for(var i = 0; i < arrUser.length; i++) {
//
//				var arrInfo = arrUser[i].split(",");
//				html += "<div id="+i+">"
//				html += '<div class="friend">'
//				html += "<img  src=" + arrInfo[2] +"></img>"
//				html += '<p>'
//				html += '<strong>'+ arrInfo[0]+'</strong>'
//				html += "<span>" + arrInfo[1] + "</span>"
//				html += '</p>'
//				html += '<div class="status available"></div>'
//				html += '</div>';
//				html += '</div>';
//				console.log("html결과값 : " + html);
//				$("#result").html(html);
//			}
//			var userEmail = data[1];
			
			
			
//			console.log("옴???? : " + event.data);
//			console.log("옴?????html : " + html);
//			
//			console.dir("이벤트 :" +  event);
//			console.log("11 : " + event);
//			console.info("22 : " + event);
//			console.dir("33 : " + event.data);
//			console.log("44 : " + event.data.length);
//			console.log("짜른거 : " + temp);
//			console.log("짜른거 [0]: " + temp[0]);
//			console.log("짜른거 [1]: " + temp[1]);
//			console.log("짜른거 [2]: " + temp[2]);
//			console.log("길이 : " + temp.length);
//			console.log("이미지경로1 : " + event);
//			console.log("이미지경로 2: " + result);
//			console.log("이미지경로 3: " + result.userImgPath);
//			console.dir("이미지경로 4: " + result);
			
//			for (var i = 0; i < arrTemp.length-1; i++) {
//				data = temp[i];
//				console.log(i+"번째 : " + data);
				
//				html += "<div id='1'>"
//				html += '<div class="friend">'
//				html += "<img  src=" + temp[2] +"></img>"
//				html += '<p>'
//				html += '<strong>'+ temp[0]+'</strong>'
//				html += "<span>" + temp[1] + "</span>"
//				html += '</p>'
//				html += '<div class="status available"></div>'
//				html += '</div>';
//				html += '</div>';
////				console.log("결과값 : " + data);
//				console.log("html결과값 : " + html);
////			}
//			$("#result").html(html);
//			$("#result").html(html);
//			makeUserList(data);
		
		
//		function makeUserList(data) {
////			alert(data);
//			console.log("makeUserList : " + data);
//			var html = "";
//			$.ajax({
//				url : "/bit-finalT3/user/userList.do",
//				data : {userEmail : data},
//				dataType : "json",
//				type : "post"
//			}).done(function(result){
//				console.log("왔따 : " + result.user.userNickName);
//				console.log("왔따 : " + result.user.userEmail);
//				console.log("왔따 : " + result.user.userImgPath);
//				
//				var userEmail = result.user.userNickName;
//				var userNickName = result.user.userNickName;
//				var userImgPath = result.user.userImgPath;
//				
//				html += "<div id="+userNickName+">"
//				html += '<div class="friend">'
//				html += "<img src="+ userImgPath +"></img>"
//				html += '<p>'
//				html += '<strong>'+ userNickName +'</strong><br>'
//				html += "<span>" + userEmail + "</span>"
//				html += '</p>'
//				html += '<div class="status available"></div>'
//				html += '</div>';
//				html += '</div>';
//			})
//			$("#result").html(html);
//		}
		
		
		

		function onOpen(event) {
//			textarea.value += "연결 성공\n";
//			alert("연결성공");
			console.log("연결성공");
		}

		function onError(event) {
			alert(event.data);
		}

$(document).ready(function(){
	$.ajax({
		url : "/bit-finalT3/user/userList.do",
		type : "POST",
		dataType : "json"
	}).done(function(result){
//		var nickname =+  result.user.userNickName;
//		console.log("우오오오S오오오오오");
//		console.log(result);
//		console.log(result.userNickName);
//		console.log(result.user.userNickName);
//		console.log("길이 : " + result);
		console.log("로그인직후 이미지경로: " + result.user.userImgPath);
		console.log("로그인직후 이메일 : " + result.user.userEmail);
//		userImgPath = result.user.userImgPath;
//		userEmail = result.user.userEmail;
		webSocket.send(result.user.userNickName);
//		webSocket.send(result.user.userImgPath);
//		onMessage(event, result);
//		userListImg(result);
//		onMessage(result);
//		onMessage(result.user.userImgPath);
//		for(var i = 0 ; i < result.joinList.length; i ++) {
//			webSocket.send(result.joinList[i].userNickName +  ": " + i);			
//		}
	})
})

$(document).ready(function(){

function msgSend() {
		
		console.log("온다온다");
		var html = "";
		$.ajax({
			url : "/bit-finalT3/user/userChat.do",
			dataType : "json",
			type : "POST",
			data : {sendMsg : $("#sendMsg").val()}
		}).done(function(result){
			
			console.log("메세지 내용 : " + result.sendMsg);
			console.log("유저 닉네임 : " + result.user.userNickName);
			console.log("이미지경로 : " + result.user.userImgPath);
			
			html += '<div class="message right">';
			html += '<span style="float: right; margin-right: -40px;">' + result.user.userNickName+ '</span>';
			html += '<img style="width: 33px; margin-top: 17px; border-radius: 50px;" src="' + result.user.userImgPath + '"/>';
			html += '<div class="bubble">';
			html += result.sendMsg; 
			html += ' <div class="corner"></div>'; 
			html += '</div>'; 
			html += '</div>';
		
			$("#chat-messages").append(html);
			webSocket.send("chat:" + result.sendMsg);
			$("#chat-messages").scrollTop($('#chat-messages').prop('scrollHeight'));
			$("#sendMsg").val("");
		})
		
	}



$("input[name=sendMessage]").keydown(function(key){
	console.log("에헤이1 : " + $("input[name=sendMessage]").val());
	if(key.keyCode == 13) {
		if ($("input[name=sendMessage]").val() == "") {
			swal("메세지를 입력하세요");
			return false;
		}else {
			msgSend();
			$("#chat-messages").scrollTop($('#chat-messages').prop('scrollHeight'));
			
		} 
	}
})


$("#send").click(function(){
	console.log("에헤이2 : " + $("input[name=sendMessage]").val());
	if ($("input[name=sendMessage]").val() == "") {
		swal("메세지를 입력하세요");
		return false;
	} else {
		msgSend();
		$("#chat-messages").scrollTop($('#chat-messages').prop('scrollHeight'));
	}
	
})


})



		
		

//function userListImg(userInfo){
//	var userImgPath = userInfo.user.userImgPath; 
//	var userEmail = userInfo.user.userEmail;
//	console.log($("#userImgPath").val());
//	$("#userImgPath").attr("src", userImgPath);
//	$("#userEmail").html(userEmail);
//	
//}
		
