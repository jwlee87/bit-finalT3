<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<link href="${pageContext.request.contextPath}/css/quiz/writeForm.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/quiz/writeForm.js"></script>
</head>
<body>
<h1>
    drawing up of quiz<br><br>
    select method
</h1>
<div class="tabs">
  <div class="tab-2">
    <label for="tab2-1">direct write mode</label>
    <input id="tab2-1" name="tabs-two" type="radio" value="d">
    <div>
	    <input type="text" class="feedback-input" name="title1" id="title1" placeholder="title" maxlength="50"/> 
	    <textarea class="feedback-input" cols="50" rows="12" name="content" id="content" placeholder="content"></textarea>
	    <input type="text" class="feedback-input" name="answer1" id="answer1" placeholder="answer" maxlength="50"/> 
	    <button type="button" id="btn1">register</button>
    </div>
  </div>
  <div class="tab-2">
    <label for="tab2-2">url write mode</label>
    <input id="tab2-2" name="tabs-two" type="radio" value="u">
    <div>
	    <input type="radio" id="jungol" name="urlType" value="j" />
		<label for="jungol">JUNGOL</label>
		<input type="radio" id="algospot" name="urlType" value="a" />
		<label for="algospot">ALGOSPOT</label>
		<input type="radio" id="euler" name="urlType" value="e" />
		<label for="euler">Project Euler</label><br>
	    <input type="text" class="feedback-input" name="title2" id="title2" placeholder="title" lang="80" maxlength="100" />
	    <input type="text" class="feedback-input" name="url" id="url" placeholder="url" lang="80" maxlength="100" />
	    <input type="text" class="feedback-input" name="answer2" id="answer2" placeholder="answer" maxlength="50"/> 
	    <button type="button" id="btn2">register</button>
    </div>
  </div>
</div>



</body>
</html>