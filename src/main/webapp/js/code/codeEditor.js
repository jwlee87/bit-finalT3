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

    var webSocket = new WebSocket('wss://coily.com:443/bit-finalT3/websocket/echo.do');
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
    
    
    
    