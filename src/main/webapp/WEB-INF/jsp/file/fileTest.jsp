<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/file/fileTest.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/jquery.form.min.js"></script>
<style>
	/*
		Styles for HTML5 File Drag & Drop demonstration
		Featured on SitePoint.com
		Developed by Craig Buckler (@craigbuckler) of OptimalWorks.net
	*/
	body
	{
		font-family: "Segoe UI", Tahoma, Helvetica, freesans, sans-serif;
		font-size: 90%;
		margin: 10px;
		color: #333;
		background-color: #fff;
	}
	
	h1, h2
	{
		font-size: 1.5em;
		font-weight: normal;
	}
	
	h2
	{
		font-size: 1.3em;
	}
	
	legend
	{
		font-weight: bold;
		color: #333;
	}
	
	#filedrag
	{
		display: none;
		font-weight: bold;
		text-align: center;
		padding: 1em 0;
		margin: 1em 0;
		color: #555;
		border: 2px dashed #555;
		border-radius: 7px;
		cursor: default;
	}
	
	#filedrag.hover
	{
		color: #f00;
		border-color: #f00;
		border-style: solid;
		box-shadow: inset 0 3px 4px #888;
	}
	
	img
	{
		max-width: 100%;
	}
	
	pre
	{
		width: 95%;
		height: 8em;
		font-family: monospace;
		font-size: 0.9em;
		padding: 1px 2px;
		margin: 0 0 1em auto;
		border: 1px inset #666;
		background-color: #eee;
		overflow: auto;
	}
	
	#messages
	{
		padding: 0 10px;
		margin: 1em 0;
		border: 1px solid #999;
	}
	
	#progress p
	{
		display: block;
		width: 240px;
		padding: 2px 5px;
		margin: 2px 0;
		border: 1px inset #446;
		border-radius: 5px;
		background: #eee url("progress.png") 100% 0 repeat-y;
	}
	
	#progress p.success
	{
		background: #0c0 none 0 0 no-repeat;
	}
	
	#progress p.failed
	{
		background: #c00 none 0 0 no-repeat;
	}
</style>
</head>
<body>
<form id="upload" name="upload" enctype="multipart/form-data">

	<fieldset>
		<legend>HTML File Upload</legend>
		<input type="hidden" id="MAX_FILE_SIZE" value="300000" />
		<div>
			<label for="fileselect">Files to upload:</label>
			<input type="file" id="fileselect" name="fileselect" multiple />
			<div id="filedrag">or drop files here</div>
		</div>
	</fieldset>
	
</form>

<div id="submitbutton">
	<button type="button" id="btnUpload">Upload Files</button>
</div>
<div id="messages">
</div>

</body>
</html>