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
<script src="${pageContext.request.contextPath}/js/quiz/quizSolveForm.js"></script>

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

</body>
</html>