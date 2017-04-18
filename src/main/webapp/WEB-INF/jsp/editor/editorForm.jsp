<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	@import url(http://fonts.googleapis.com/css?family=Lato:100,300,400);
	*,*:before,*:after{
	  box-sizing:border-box;
	  margin:0;padding:0;
	}
	
	label, a { font:300 1em/1.5em 'Lato', sans-serif; color:rgba(53, 137, 174, 1);}
	fieldset {
	  background:#f1f1f1;
	  border:1px solid #ddd;
	  border-radius:3px;  
	  padding:1.5em 1.5em 2em;
	  margin-bottom:-3px;
	  a {float:right; display:block; text-decoration:none; margin-left:-100%;}
	  img { width:100px; float:left;}
	  label{ float:right; display:inline-block; margin-left:-100%; margin-top:1.5em;} 
	  label         { margin-right:170px; }
	  label + label { margin-right:0px; }
	  select { display:block; width:150px; }
	}
	.wrapper {
	  position:relative;
	  height:1400px;
	  //background:#f1f1f1; 
	}
	
	#ace-editorid { 
	  font-size:.9em;
	  font-family: "Courier New", Courier, "Lucida Sans Typewriter", "Lucida Typewriter", monospace;
	  position: absolute;
	  top:0; right:0; bottom:0; left:0;
	  border:1px solid #ddd;
	  border-radius:3px;
	
	  //background:#f1f1f1; // #f1f1f1; 
	}
</style>
<script src="${pageContext.request.contextPath}/js/comm/ace.js"></script>
<script>
$(function () {
	//cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/ace.js
	var theme='ace/theme/tomorrow';
	var mode='ace/mode/scss';
	var editor= ace.edit('ace-editorid');
	    editor.setTheme(theme);
	    editor.getSession().setMode(mode);
	    // editor.renderer.setShowGutter(false); 
	
	$('#ace-mode').on('change',function(){
	  editor.getSession().setMode('ace/mode/' +$(this).val().toLowerCase());
	});
	$('#ace-theme').on('change',function(){
	  editor.setTheme('ace/theme/' +$(this).val().toLowerCase());
	});
})
</script>
</head>
<body>
	<div class="wrapper" style="width:50%;">
	  <code id="ace-editorid">
	  // ================================================
	  // SCSS @extends Across Media Queries  
	  // More info: http://codepen.io/jakob-e/pen/jKyuq  
	  // ================================================  
	  
	  // Simple media mixin - without the overthinking
	  // of breakpoint libraries - sorry guys ;)
	
	  
	  // Mixin to add extends to each media query   
	 
	    
	  // =============================================
	  // How to use 
	  // =============================================
	    
	  // Define breakpoints   
	  
	  </code>
	</div>
</body>
</html>