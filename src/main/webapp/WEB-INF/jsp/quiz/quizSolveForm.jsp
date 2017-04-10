<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.css">
<link href="${pageContext.request.contextPath}/css/quiz/quizSolve.css" rel="stylesheet" type="text/css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http:////maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajaxorg.github.io/ace-builds/src-min-noconflict/ace.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.js"></script>

</head>
<body>
	<!-- Editor -->
<div class="container">
  <div class="row">
    <div class="col-md-12 col-sm-12 codeSide">
      <div class="row">
        <div class="col-md-12 col-sm-12">
          <div class="compile-code">
            <!-- Editor -->
            <pre name="code" id="editor" style="border: none;"></pre>
            <a href="javascript:" name="compile" onclick="compile(${quizNo})" class="btn btn-primary">Compile</a>
<!--             <input type="button" id="compile" class="btn btn-sky text-uppercase btn-sm" value="Compile"> -->
          </div>
        </div>
      </div>
    </div>
    <!-- /.col-md-12 col-sm-12 codeSide -->
  </div>
  <!-- /.row -->
</div>
<!-- /.container -->
<script>
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
	async: false,
	type : "POST",
	dataType : "JSON"
	})
	.done(function(result){
//			alert(result)
		if(result == "s"){
			alert("정답입니다.")
		} else {
			alert("오답입니다.")
		}
		opener.comment(result, quizNo)
		self.close();
	})
}
</script>


</body>
</html>