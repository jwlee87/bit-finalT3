<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/code/codeEditor.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http:////maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajaxorg.github.io/ace-builds/src-min-noconflict/ace.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.js"></script>
</head>
<body>
<div class="container">
  <div class="row" style="width: 960px; margin:0px auto;">
    <div class="col-md-12 col-sm-10 codeSide">
      <div class="row">
        <div class="col-md-12 col-sm-12">
          <div class="compile-code"> 
	        <pre name="code" id="editor" style="border: none;"></pre>
	        <input type="button" id="compile" class="btn btn-sky text-uppercase btn-sm" value="Compile">
          </div>
        </div>
      </div>
    </div>
    <!-- /.col-md-12 col-sm-12 codeSide -->
  </div>
  <!-- /.row -->
	<div class="notepad">
		<h1>Console</h1>
		<textarea id="result" readonly></textarea>
	</div> 
</div>
<script src="${pageContext.request.contextPath}/js/code/codeEditor.js"></script>
</body>
</html>