//$(function() {
//	$('[data-toggle="tooltip"]').tooltip(); 
//})
	
   	var editor = ace.edit("editor");
	editor.setTheme("ace/theme/eclipse");
	editor.setShowPrintMargin(false);
	editor.session.setMode("ace/mode/java");
	editor.$blockScrolling = Infinity;
	editor.setValue("import java.*;\n\nclass Main {\n\n    public static void main(String[] args) {\n        // Your code goes here\n   }\n}\n");
	editor.clearSelection();

    var webSocket = new WebSocket('wss://coily.com:443/bit-finalT3/websocket/userEcho.do');
    webSocket.onerror = function(event) {
      onError(event)
    };

    webSocket.onopen = function(event) {
      onOpen(event)
    };

    webSocket.onmessage = function(event) {
      onMessage(event)
    };

    function onMessage(event) {
    	if(event.data.startsWith("c")) {
    		var cArr = event.data.split(":")
    		$("#result").val(cArr[1])
    	} else if(event.data.startsWith("t")) {
    		var tArr = event.data.split(":")
    		$(".indent").append(tArr[1])
    	} else if(event.data.startsWith("e")){
    		var eArr = event.data.split(":")
    		editor.setValue(eArr[1])
    	} else if(event.data.startsWith("f")){
    		var ediArr = event.data.split(":")
    		editor.setValue(ediArr[4])
//    		var html="";
//    		html += '<input type="hidden" id="chNo" value="'+ ediArr[1] + '">';
//    		html += '<input type="hidden" id="oriName' + ediArr[1] +'" value="'+ ediArr[2] + '">';
//    		html += '<input type="hidden" id="sysName' + ediArr[1] +'" value="'+ ediArr[3] + '">';
//    		$("#compile").before(html);
    	}else if (event.data.startsWith("zcodeChat:")) {
			var chatArr = event.data.split(":");
			var sendMessage = "";
			console.log("챗챗챗챗챗챗 : " + chatArr[0])
			console.log("챗챗챗챗챗챗 : " + chatArr[1])
			var sendMsg = chatArr[1].split(","); 
			console.log("챗챗챗챗챗챗 0: " + sendMsg[0])
			console.log("챗챗챗챗챗챗 1: " + sendMsg[1])
//			sendMessage += '<div class="message">'; 
//			sendMessage += '<span style="float: left; margin-left: -35px;">' + sendMsg[0] + '</span>'; 
//			sendMessage += '<img style="width: 33px; margin-top: 17px; border-radius: 50px;" src="' + sendMsg[1] + '"/>'; 
//			sendMessage += '<div class="bubble">'; 
//			sendMessage +=sendMsg[2]; 
//			sendMessage += '<div class="corner"></div>'; 
//			sendMessage += '</div>'; 
//			sendMessage += '</div>'; 
			sendMessage += sendMsg[0] + " : " + sendMsg[1]
			sendMessage += '\n'
			
			$("#chatMsg").append(sendMessage);
			$("#chatMsg").scrollTop($('#chatMsg').prop('scrollHeight'));
		} 
    	
    	
    }

    function onOpen(event) {

    }

    function onError(event) {
      alert(event.data)
    }
	
    $("#editor").keyup(function(e){
    	webSocket.send("e:" + editor.getValue())
    })

    $("#compile").click(function(){
//    	alert(editor.getValue())
    	var chNo = $("#chNo:first").val()
    	var oriName = $("#oriName"+chNo).val()
    	alert(oriName)
    	$.ajax({
    		url : "codeCompile.do",
    		data : {"code": editor.getValue(),
    				"oriName" : oriName
    					},
    		type : "POST",
    		dataType : "JSON",
    		async: false
    		})
    	.done(function(result){
			if(result == "") {
				swal({
					title: "컴파일 오류입니다.",
					type: "error"	
				})
				return false;
			}
    		$("#result").val(result)
    		webSocket.send("c:" + result)
		})
    })
    
    
    $("#save").on("click", function(){
    	//chNo가 잘못된듯....
    	//무조건 first가 아니네...ㄷㄷ
    	var chNo = $("#chNo:first").val()
    	var sysName = "";
    	if($("#sysName"+chNo).val() == "null") {
    		sysName = "Main.java"
    	} else {
    		sysName = $("#sysName"+chNo).val()
    	}
    	alert(sysName)
    	$.ajax({
    		url : '/bit-finalT3/file/saveFile.do',
    		data : {"code": editor.getValue(),
    				"sysName" : sysName
    					},
    		type : "POST",
    		dataType : "JSON",
    		async: false
    		})
    	.done(function(result){
    		swal({
				title: "저장되었습니다.",
				type: "success"	
			})
		})
    })
    
    
    
    
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
			html += result.user.userNickName+" : "+result.sendMsg;
			html += '\n';
// 			html += ' <div class="corner"></div>'; 
//			html += '</div>'; 
//			html += '</div>';
			
			$("#chatMsg").append(html);
			webSocket.send("zcodeChat:" + result.sendMsg);
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
    
    
    
    
    