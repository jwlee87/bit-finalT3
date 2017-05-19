<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#sendmessage {
    height: 45px;
    border-top: 1px solid #e7ebee;
/*     position: absolute; */
    position: relative;
    margin-right: 32.5%;
    width: 100%;
    bottom: 0;
    right: 0px;
    background: #fff;
    padding-bottm: 50px;
    border: 1px solid #848484;
}

</style>
<meta charset="UTF-8">
<title>Insert title</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/code/codeEditor.css">
<link href="${pageContext.request.contextPath}/css/comm/navigator.css" rel="stylesheet">
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
<!-- <script src="http:////maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
<script src="https://ajaxorg.github.io/ace-builds/src-min-noconflict/ace.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.js"></script> -->
</head>
<body>
<div class="container">
  <div class="row" style="width: 960px; margin:0px auto;">
    <div class="col-md-12 col-sm-10 codeSide">
      <div class="row">
        <div class="col-md-12 col-sm-12">
        <div id="comSaveBtnDiv">
        	<span id="comSaveBtnFont">codeEditor</span>
				<img id="compile" src="${pageContext.request.contextPath}/img/editor/play1.png" onmouseover="this.src='${pageContext.request.contextPath}/img/editor/play2.png'" onmouseout="this.src='${pageContext.request.contextPath}/img/editor/play1.png'">
				<img id="save" src="${pageContext.request.contextPath}/img/editor/save1.png" onmouseover="this.src='${pageContext.request.contextPath}/img/editor/save2.png'" onmouseout="this.src='${pageContext.request.contextPath}/img/editor/save1.png'">
				
<!-- 	        <input type="button" id="compile" class="btn btn-sky text-uppercase btn-sm" value="Compile"> -->
<!-- 	        <input type="button" id="save" class="btn btn-sky text-uppercase btn-sm" value="Save"> -->
	    </div>
          <div class="compile-code"> 
	        <pre name="code" id="editor" style="border: none;"></pre>
          </div>
        </div>
      </div>
    </div>
    <!-- /.col-md-12 col-sm-12 codeSide -->
  </div>
  <!-- /.row -->
	<div class="notepad">
		<div id="consoleWindow" >
		<h1>Console</h1>
		<textarea id="result" readonly></textarea>
		</div>
	
		<div id="chatWindow" >
		<h1>Chat</h1>
<!-- 		<textarea id="chatMsg" readonly></textarea> -->
		<jsp:include page="/WEB-INF/jsp/user/codeChat.jsp" flush="false"></jsp:include>
<!-- 		<div id="sendmessage"> -->
<!--         	<input type="text" id="sendChatMsg" name="sendCodeMessage"   placeholder="내용을 입력하세요"/> -->
<!--             <button id="codeMsgsend"></button> -->
<!--         </div> -->
		</div>
	</div> 
</div>
<%-- <script src="${pageContext.request.contextPath}/js/user/codeChat.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/code/codeEditor.js"></script>
</body>
</html>