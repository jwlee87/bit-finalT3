//$(function() {
//	$('[data-toggle="tooltip"]').tooltip(); 
//})
	
   	var editor = ace.edit("editor");
	editor.setTheme("ace/theme/monokai");
	editor.setShowPrintMargin(false);
	editor.session.setMode("ace/mode/java");
	editor.$blockScrolling = Infinity;
	editor.setValue("import java.*;\n\nclass Main {\n\n    public static void main(String[] args) {\n        // Your code goes here\n   }\n}\n");
	editor.clearSelection();

    var webSocket = new WebSocket('ws://192.168.0.48:9100/bit-finalT3/websocket/echo.do');
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
    	if(event.data.indexOf("class") == -1){
    		$("#result").val(event.data)
    	} else {
	    	editor.setValue(event.data)
    	}
    	
    }

    function onOpen(event) {

    }

    function onError(event) {
      alert(event.data)
    }
	
    $("#editor").keyup(function(e){
    	webSocket.send(editor.getValue())
    })

    $("#compile").click(function(){
		$.ajax({
    		url : "codeCompile.do",
    		data : {"code": editor.getValue()
    					},
    		type : "POST",
    		dataType : "JSON",
    		async: false
    		})
    	.done(function(result){
			if(result == "") {
				alert("컴파일 오류입니다.")
				return false;
			}
    		$("#result").val(result)
    		webSocket.send(result)
		})
		
    })