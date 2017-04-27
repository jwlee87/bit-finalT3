$(function(){
	$("textarea").css("display", "none")
	$("[name=updateCon]").css("display", "none")
	$("[name=cancel]").css("display", "none")
	
	$(".accordion-titulo").click(function(e){
		
	        e.preventDefault();
	    
	        var contenido=$(this).next(".accordion-content");

	        if(contenido.css("display")=="none"){ //open		
	          contenido.slideDown(250);			
	          $(this).addClass("open");
	        }
	        else{ //close		
	          contenido.slideUp(250);
	          $(this).removeClass("open");	
	        }

	      });
	
//	$("#add").click(function(){
//		var left = (screen.width - 800) / 2
//		var top = (screen.height - 800) / 2
//		window.open("writeForm.do", "pop1", "top=" + top + ", left=" + left +", width=800, height=800");
//	})
	$("#add").colorbox({iframe:true, width:"700px", height:"800px"});
});


	
	$("#container-main").find("img").each(function(){
		var imgCh= $(this).attr("src")
		if($(this).attr("src").indexOf("http") == -1) {
			if(imgCh.indexOf("png") == -1) {
				$(this).attr("src", "http://euler.synap.co.kr" + imgCh)
			} else if(imgCh.indexOf("gif") == -1) {
				$(this).attr("src", "http://algospot.com" + imgCh)
			}
		}
	})
	
	
	function selectComment(quizNo){
		$.ajax({
			url : "quizCommentList.do",
			data : {"quizNo": quizNo},
			type : "POST",
			dataType: "JSON"
		})
		.done(function(result){
			console.dir(result)
			var html = "";
			html += '<table class="table table-hover table-bordered">';
			html += '	<colgroup>'; 
			html += '		<col width="5%">'; 
			html += '		<col width="5%">'; 
			html += '		<col width="8%">'; 
			html += '	</colgroup>'; 
			
			if(result.quizCommentList.length == 0) {
				html += '<td colspan="3">문제를 푼 사람이 없습니다.</td>';
			}
			
			
			for(var i = 0; i < result.quizCommentList.length; i++) {
				var comment = result.quizCommentList[i]
				var message;
				if(comment.quizSolveChk == "s") {
					message = "Success"
				} else {
					message = "Error"
				}
				html += '<tr>';
				html +=  '	<td>' + comment.userNickName + '</td>';
				html += '	<td>' + message + '</td>';
				html += '	<td>' + comment.quizCommentRegDate + '</td>';
				html += '</tr>';
			}
			$("#commentList" + quizNo).html(html)
		})
	}
	
	
	

	
	function update(updateNo){
		$("#" + updateNo).find(".accordion-titulo").attr("contentEditable", "true")
		$("#" + updateNo).find(".toggle-icon").attr("contentEditable", "false")
		$("#" + updateNo).find(".accordion-titulo").off("click")
		
		
		$.ajax({
			url : "updateForm.do",
			data : {"no": updateNo},
			async: false,
			type : "POST",
			dataType: "JSON"
		})
		.done(function(result){
			var content = $("#" + updateNo).find("[name=text" + updateNo + "]").html()
			
			$("#" + updateNo).find(".up").css("display", "none")
			$("#" + updateNo).find("[name=update]").css("display", "none")
			$("#" + updateNo).find("[name=deleteQuiz]").css("display", "none")
			$("#" + updateNo).find("[name=answer]").css("display", "none")
			$("#" + updateNo).find("[name=updateText" + updateNo + "]").css("display", "block").val(content);
			$("#" + updateNo).find("[name=updateCon]").css("display", "inline-block")
			$("#" + updateNo).find("[name=cancel]").css("display", "inline-block")
		})
		
		$("#" + updateNo).find("[name=cancel]").click(function(){
			location.reload();
		})
		
		
		tinymce.init({
			  selector: "[name=updateText" + updateNo + "]",
			  height: '500',
			  theme: 'modern',
			  plugins: [
			    'advlist autolink lists link image charmap print preview hr anchor pagebreak',
			    'searchreplace wordcount visualblocks visualchars code fullscreen',
			    'insertdatetime media nonbreaking save table contextmenu directionality',
			    'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
			  ],
			  toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
			  toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
			  image_advtab: true,
			  templates: [
			    { title: 'Test template 1', content: 'Test 1' },
			    { title: 'Test template 2', content: 'Test 2' }
			  ],
			  content_css: [
			    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
			    '//www.tinymce.com/css/codepen.min.css'
			  ]
			 });
		
		}
	
	
	
	function updateCon(updateNo, updateType) {
		var quizContent;
		if(updateType === 'u') {
			quizContent = $("#updateText" + updateNo + "_ifr").contents().find("[data-id=updateText" + updateNo + "]").html()
		} else {
			quizContent = $("#updateText" + updateNo + "_ifr").contents().find("[data-id=updateText" + updateNo + "]").text()
		}
		
		$.ajax({
			url : "update.do",
			data : {"quizNo": updateNo,
					"quizTitle": $("#" + updateNo).find(".accordion-titulo").text(),
					"quizContent": quizContent
					},
			async: false,
			type : "POST",
		})
		.done(function(result){
			swal("수정되었습니다.", "", "success")
			location.href = "list.do"
		})
	}
	
	
	function deleteQuiz(deleteNo) {
		$.ajax({
			url : "delete.do",
			data : {"deleteNo": deleteNo},
			type : "POST",
		})
		.done(function(result){
			swal({
				title: "삭제되었습니다.",
				type: "success"	
			},
			function(){
				location.href = "list.do"
			})
		})
	}
	
	
	function answer(quizNo) {
		var left = (screen.width - 800) / 2;
		var top = (screen.height - 600) / 2;
		window.open("quizSolveForm.do?quizNo=" + quizNo, "pop1", "top=" + top + ", left=" + left +", width=800, height=600");
	}
	
	

	function comment(result, quizNo){
		$.ajax({
			url : "quizCommentRegist.do",
			data : {"quizNo": quizNo,
					"quizSolveChk": result
						},
			type : "POST",
			dataType : "JSON"
		})
		.done(function(result){
			selectComment(quizNo);
		})
	}


	function goPage(pageNo) {
			location.href = "list.do?pageNo=" + pageNo;
		}
	