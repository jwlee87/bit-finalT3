$(function(){
	$("textarea").css("display", "none")
	$("[name=updateCon]").css("display", "none")
	$("[name=cancel]").css("display", "none")
	
	$(document).on("click", ".accordion-titulo", function(e){
		
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
	
	//스크롤 이벤트 시작
	var lastScrollTop = 0;
	$("body").scroll(function(){	
		//top값
		console.log("position : " + $("div#whatis").position().top * -1)
		console.log("offset : " + $("div#whatis").offset().top * -1)
	var currentScrollTop = $(window).scrollTop();
		
		
		if(($("#whatis").position().top * -1 - 438) % 740 == 0) {
//			if(false) {
			var lastQuizNo = $("input:last").val()
			$.ajax({
			url : "scrollDown.do",
			data : {"quizNo": lastQuizNo,
						},
			type : "POST",
			dataType : "JSON"
			})
			.done(function(result){
				var html = "";
				for(var i = 0; i < result.length; i++){
					var list = result[i];
					html += '<div id="' + list.quizNo + '"class="accordion-container">';
					html += '	<input type="hidden" id="quizNo" value=' + list.quizNo + '>';
					html += '	<a href="#" onclick="javascript:selectComment(' + list.quizNo + ');" class="accordion-titulo">'+ list.quizTitle + '<span class="toggle-icon"></span></a>';					
					html +=	'		<div class="accordion-content">';	
					html += '			<textarea name="updateText' + list.quizNo + '" row="10" cols="100"></textarea>';			
					html += '			<div class="up" name="text' + list.quizNo + '">';
					if(list.quizWriteType == "u") {
						html += list.quizContent;
					} else {
						html += '<p>' + list.quizContent + '</p>';
					}
					html += '			</div>';
					html += '			<br>';
					html += '			<div class="row">'; 
					html += '			<div class="col-md-9"></div>'; 
					html += '				<div class="col-md-3">'; 
					html += '					<a href="javascript:" name="answer" onclick="answer(' + list.quizNo +')" class="btn btn-success">문제풀기</a>'; 
					html += '					<a href="javascript:" name="update" onclick="update(' + list.quizNo +')" class="btn btn-primary">수정</a>'; 
					html += '					<a href="javascript:" name="deleteQuiz" onclick="deleteQuiz(' + list.quizNo +')" class="btn btn-danger">삭제</a>'; 
					html += '					<a href="javascript:" id="updateCon" name="updateCon" onclick="updateCon(' + list.quizNo  +', \'list.quizWriteType\')" class="btn btn-success">확인</a>'; 
					html += '					<button type="button" id="cancel" name="cancel" class="btn btn-danger">취소</button>'; 
					html += '				</div>'; 
					html += '			</div>'; 
					html += '			<br>'; 
					html += '			<hr>'; 
					html += '			<div id="commentList'+ list.quizNo + '">'; 
					html += '			</div>'; 
					html += '		</div>'; 
					html += '</div>'; 
				}
				if(result.length == 0) {
//					alert("마지막 데이터 입니다.")
				}
				$("#container-main").append(html)
				
				//중복되는거....
				$("textarea").css("display", "none")
				$("[name=updateCon]").css("display", "none")
				$("[name=cancel]").css("display", "none")

			})
			var position = $(".accordion-container:first").offset();
//			$('html, body').stop().animate({scrollTop : position.top}, 600, easeEffect);
		}
	//스크롤 내릴 경우
	if(currentScrollTop - lastScrollTop > 0) {
		console.log("window Top : " + $(window).scrollTop())
		console.log("docu height : " + $(document).height())
		console.log("window height : " + $(window).height())
		if($(window).scrollTop()+1 >= ($(document).height() - $(window).height())) {
			var lastQuizNo = $("input:last").val()
			$.ajax({
			url : "scrollDown.do",
			data : {"quizNo": lastQuizNo,
						},
			type : "POST",
			dataType : "JSON"
			})
			.done(function(result){
				var html = "";
				for(var i = 0; i < result.length; i++){
					var list = result[i];
					html += '<div id="' + list.quizNo + '"class="accordion-container">';
					html += '	<input type="hidden" id="quizNo" value=' + list.quizNo + '>';
					html += '	<a href="#" onclick="javascript:selectComment(' + list.quizNo + ');" class="accordion-titulo">'+ list.quizTitle + '<span class="toggle-icon"></span></a>';					
					html +=	'		<div class="accordion-content">';	
					html += '			<textarea name="updateText' + list.quizNo + '" row="10" cols="100"></textarea>';			
					html += '			<div class="up" name="text' + list.quizNo + '">';
					if(list.quizWriteType == "u") {
						html += list.quizContent;
					} else {
						html += '<p>' + list.quizContent + '</p>';
					}
					html += '			</div>';
					html += '			<br>';
					html += '			<div class="row">'; 
					html += '			<div class="col-md-9"></div>'; 
					html += '				<div class="col-md-3">'; 
					html += '					<a href="javascript:" name="answer" onclick="answer(' + list.quizNo +')" class="btn btn-success">문제풀기</a>'; 
					html += '					<a href="javascript:" name="update" onclick="update(' + list.quizNo +')" class="btn btn-primary">수정</a>'; 
					html += '					<a href="javascript:" name="deleteQuiz" onclick="deleteQuiz(' + list.quizNo +')" class="btn btn-danger">삭제</a>'; 
					html += '					<a href="javascript:" id="updateCon" name="updateCon" onclick="updateCon(' + list.quizNo  +', \'list.quizWriteType\')" class="btn btn-success">확인</a>'; 
					html += '					<button type="button" id="cancel" name="cancel" class="btn btn-danger">취소</button>'; 
					html += '				</div>'; 
					html += '			</div>'; 
					html += '			<br>'; 
					html += '			<hr>'; 
					html += '			<div id="commentList'+ list.quizNo + '">'; 
					html += '			</div>'; 
					html += '		</div>'; 
					html += '</div>'; 
				}
				if(result.length == 0) {
					alert("마지막 데이터 입니다.")
				}
				$("#container-main").append(html)
				
				//중복되는거....
				$("textarea").css("display", "none")
				$("[name=updateCon]").css("display", "none")
				$("[name=cancel]").css("display", "none")

			})
			var position = $(".accordion-container:first").offset();
//			$('html, body').stop().animate({scrollTop : position.top}, 600, easeEffect);
		}
		console.log("last : " + lastScrollTop)
		console.log("current : " + lastScrollTop)
		lastScrollTop = currentScrollTop;
	  }
	})
	
	
	
	
	
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
	