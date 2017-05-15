<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<%-- <jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false"></jsp:include> --%>
<style>
#fileselect {
    width: 0.1px;
    height: 0.1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
}
#fileselect + label {
    max-width: 80%;
    font-size: 20px;
    font-weight: 700;
    cursor: pointer;
    overflow: hidden;
    padding: 10px 20px;
    color: #d3394c;
    display: inline;
}
#fileselect:focus + label,
#fileselect.has-focus + label,
#fileselect + label:hover {
    color: #722040;
}

#filedrag{
	position: absolute;
	display: inline-block;
	font-weight: bold;
	padding: 1em 0;
	margin: 0.4%;
	color: #555;
	border: 2px dashed #722040;
	border-radius: 7px;
	cursor: default;
	left: 2%;
	width: 20%;
}

#messages p{
	padding-left: 20px;
}


#filedrag.hover{
	color: #f00;
	border-color: #f00;
	border-style: solid;
	box-shadow: inset 0 3px 4px #888;
}

#filedrag p{
  color: #d3394c;
  opacity: 0.5;
  display: inline;
}

img{	max-width: 100%;}

pre{
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

.box{
  width: 150px;
  height: 150px;
  border: 1px solid #eee;
  float: left;
  position: relative;
  margin: 10px;
}
.box i{
  position: absolute;
  bottom: 5px;
  right: 5px;
  cursor: pointer;
  opacity: 0.5;
}
.box i:hover{
  opacity: 1;
}
#progress p{
	display: block;
	width: 240px;
	padding: 2px 5px;
	margin: 2px 0;
	border: 1px inset #446;
	border-radius: 5px;
	background: #eee url("progress.png") 100% 0 repeat-y;
}

#progress p.success{
	background: #0c0 none 0 0 no-repeat;
}

#progress p.failed{
	background: #c00 none 0 0 no-repeat;
}
#upBtn{
	border: 1px solid black;
	display: inline;
	margin-left: 40%;
	margin-top: 3%; 
}

button{
    cursor:pointer;
    border:none;
    background:none;
    outline:none;
    display:block;
}
button > *{
    padding:2px 4px;
}
.indent{
    padding:2px 20px;
    display: none;
}
button.file{
    padding:2px 24px;
}

#file-tree{
    position:absolute;
    top: 40%;
    width: 20%;
    bottom: 5.5%;
    margin: 0.4%;
   	left: 2%;
    border: 1px solid black;
    overflow: scroll;
}
*::-webkit-scrollbar {
    display: none;
}
</style>
</head>
<body>
	<form id="upload" method="POST" enctype="multipart/form-data">
		<input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="300000" />
		<div id="filedrag">
    		<input type="file" id="fileselect" name="fileselect[]" multiple="multiple" />
    		<label for="fileselect"><span>Choose a file</span></label>
	    	<p>or drop files here</p>
      		<div id ="messages">
	      	</div>
	      	<button type="button" id="upBtn">upload</button>
		</div>
	</form>
	
	<div id="file-tree">
	    <button class="dir">
	        <i class="fa fa-caret-right" aria-hidden="true"></i>
	        <i class="fa fa-folder" aria-hidden="true"></i>root folder
	    </button>
	    <div class="indent">

	    </div>
    </div>
<script>
$(function(){
	var files;
	$.ajax({
		url: '/bit-finalT3/file/mainFile.do',
		data: {"mainCode" : editor.getValue()},
		dataType:'json',
		type:'post'
	}).done(function(result) {
		var html = "";
		html += '	<button type="button" class="file" onclick="fileTree(' + result.fileNo +')">';
		html += '		<i class="fa fa-file" aria-hidden="true"></i>' + result.fileOriName;
		html += '	</button>';
		$(".indent").append(html)
		
		var htm="";
		htm += '<input type="hidden" id="oriName" value="'+ result.fileOriName + '">';
		htm += '<input type="hidden" id="sysName" value="'+ result.fileSysName + '">';
		$("#save").after(htm);
		
	})
	
	
	$('button.dir').click(function(){
        var self = $(this);
        self.toggleClass('open');
//         self.find('i.fa:first').toggleClass('fa-caret-right fa-caret-down');
        self.next().toggle(200);
    });
    
	
    $("#upBtn").on("click", function(){
//     	var form = $('#upload')[0];
		var formData = new FormData();
		
		for (var i = 0; i < files.length; i++) {
			formData.append('fileselect[]', files[i]);
        }
		
	    	$.ajax({
				url: '/bit-finalT3/file/upload.do',
				data: formData,
				dataType:'json',
				type:'post',
				processData: false,
	            contentType: false
			}).done(function(result) {
				console.dir(result)
				var html = "";
				for(var i = 0; i < result.length; i++) {
					console.log(result[i].fileOriName)
					html += '	<button type="button" class="file" onclick="fileTree(' + result[i].fileNo +')">';
					html += '		<i class="fa fa-file" aria-hidden="true"></i>' + result[i].fileOriName;
					html += '	</button>';
				}
				$(".indent").append(html)
				$("#messages").html("")
				webSocket.send("t:"+html);
			})
    })
    
	
	
    function $id(id) {
        return document.getElementById(id);
      }

      // output information
      function Output(msg) {
        var m = $id("messages");
        m.innerHTML = msg + m.innerHTML;
      }

      // file drag hover
      function FileDragHover(e) {
        e.stopPropagation();
        e.preventDefault();
        e.target.className = (e.type == "dragover" ? "hover" : "");

      }

      // file selection
      function FileSelectHandler(e) {

        // cancel event and hover styling
        FileDragHover(e);

        // fetch FileList object
        files = e.target.files || e.dataTransfer.files;
		
        // process all File objects
        for (var i = 0, f; f = files[i]; i++) {
          ParseFile(f);
        }

      }

      // output file information
      function ParseFile(file) {

        Output("<p><strong>" + file.name + "</strong>&nbsp&nbsp&nbsp size: <strong>" + file.size + "</strong> bytes</p><br>");

      }

      // initialize
      function Init() {

        var fileselect = $id("fileselect"),
          filedrag = $id("filedrag"),
          submitbutton = $id("submitbutton");

        // file select
        fileselect.addEventListener("change", FileSelectHandler, false);

        // is XHR2 available?
        var xhr = new XMLHttpRequest();
        if (xhr.upload) {

          // file drop
          filedrag.addEventListener("dragover", FileDragHover, false);
          filedrag.addEventListener("dragleave", FileDragHover, false);
          filedrag.addEventListener("drop", FileSelectHandler, false);
          filedrag.style.display = "block";

          // remove submit button
          submitbutton.style.display = "none";
        }

      }

      // call initialization file
      if (window.File && window.FileList && window.FileReader) {
        Init();
      }

      
      
});


	function fileTree(fileNo){
    	$.ajax({
			url: '/bit-finalT3/file/readFile.do',
			data: {"fileNo" : fileNo},
			dataType:'json',
			type:'post'
		}).done(function(result) {
			var arr = result.split(":")
// 			var reCode = arr[1].substr(1, arr[1].length)
// 			editor.setValue(reCode)
			editor.setValue(arr[2].trim())
			var html="";
    		html += '<input type="hidden" id="oriName" value="'+ arr[0] + '">';
    		html += '<input type="hidden" id="sysName" value="'+ arr[1] + '">';
    		$("#save").after(html);
			webSocket.send("f:" + result);
		})
	}
</script>
</body>
</html>