$(function(){
	var editor = ace.edit("editor");
	editor.setTheme("ace/theme/monokai");
	editor.setShowPrintMargin(false);
	editor.session.setMode("ace/mode/java");
	editor.setValue("import java.io.*;\n\nclass Main {\n\n    public static void main(String[] args) {\n        // Your code goes here\n   }\n}\n");
	editor.clearSelection();


	$(document).ready(function() {
	    $('[data-toggle="tooltip"]').tooltip(); 
	});


	function compile(quizNo) {
		$.ajax({
		url : "quizSolve.do",
		data : {"quizNo": quizNo,
				"code": editor.getValue()
					},
		type : "POST",
		dataType : "JSON"
		})
		.done(function(result){
//			alert(result)
			if(result == "s"){
				alert("정답입니다.")
				opener.comment(result, quizNo)
				self.close();
			} else if(result == "e"){
				alert("오답입니다.")
				opener.comment(result, quizNo)
			} else {
				alert("컴파일 오류입니다.")
			}
		})
	}
})

	
	
