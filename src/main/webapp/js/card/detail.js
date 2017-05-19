window.onload = function () {
	$(".ui-igtrialwatermark").remove();
}

$(function(){
	$("#deleteButton").css("display","none");
	$("#detailNoneButton").css("display","none");
	
	/*카드 글 수정*/
	$("#divDetail").click(function () {
	
		if($("#userNo").val() != $("#loginUserNo").val()) {
			return false;
		}
		
		
		var html = '<textarea name="cardContent" id="detailNone">'+$("#content").val()+'</textarea>';
		$("#printDetail").html(html);
		
		$("#deleteButton").css("display", "block");
		$("#detailNoneButton").css("display", "block");
		$("#igUpload1_fi_main_cntnr").css("display", "block");
		$(".ui-igupload-cancel-button").css("display", "block");
		
		$("#detailNoneButton").click(function() {
		
			if($("#detailNone").val() == ""){
			 	 swal({
					title:"",
					text:"수정할 내용을 입력하세요",
					type:"warning"
				})
				return false;
				
			}
			$.ajax({
				url: "update.do",
				type:"POST",
				dataType:"json",
				data: {cardContent:$("#detailNone").val(),
					   cardNo:$("#cardNo").val(),
					   userNo:$("#userNo").val()
					   },
			}).done(function(result){
				swal({
					title:"수정 완료",
					text: "카드 내용이 수정되었습니다.",
					type: "success"
				},function(){
					window.open('/bit-finalT3/card/list.do','_parent').parent.close();
			})
		});
	})
})

	
	


/*카드 글 수정*/	

commentList();

// 댓글 등록 처리
$("#reg").click(function () {
	
	if($(".add-post-textarea").val() == ""){
	 	 swal({
			title:"",
			text:"댓글을 입력하세요",
			type:"warning"
		})
		return false;
	}
	
	$.ajax({
		url: "commentRegist.do",
		type: "POST",
		data: {
			cardNo: $('#cardNo').val(), 
			cardCommentContent: $(".add-post-textarea").val() 
		},
		dataType: "json"
	})
	.done(function (result) {
		console.dir(result)
		$("#commentContent").val("");
		
		makeCommentList(result);
	});
	
	return false ;
});




//90
$("#commentContent").keydown(function(e) {
	var len = $("#commentContent").val()
	if(len.length == 29) {
		$("#commentContent").val($("#commentContent").val() + '\n')
	}
	if(len.length == 59) {
		$("#commentContent").val($("#commentContent").val() + '\n')
	}
	if(len.length == 89) {
		$("#commentContent").val($("#commentContent").val() + '\n')
	}
});

	



function deleteFile(fileNo) {
	
	$.ajax({
		url:"deleteFile.do",
		data:{fileNo:fileNo},
		dataType:"json",
		type:"post"
	}).done(function () {
		swal({
			title: "삭제 완료",
			text: "파일 삭제가 완료되었습니다.",
			type: "success"
		},
		function(isConfirm) { 
			if(isConfirm) printFileList(); 
		});
	});
	
}

function printFileList() {
	
	$.ajax({
		url:"ajaxDetail.do",
		data:{cardNo:$("#cardNo").val()},
		dataType:"json",
		type:"post"
	}).done(function (result) {
		
		var printHtml= "";
		$("#igUpload1___fus").html("");
		
		for(var i = 0; i < result.fileList.length; i++) {
			
			var fileItem = result.fileList[i];
		
			printHtml += '<div class="ui-widget-content ui-igupload-progress-container ui-corner-all ui-helper-clearfix">		                                                                                                                                                        ';
			printHtml += '	<div class="ui-container-button-cancel-class  ui-helper-clearfix" >			                                                                                                                                                                                ';
			printHtml += '		<button id="igUpload1_'+ i +'__cbtn" title="Cancel" class="ui-button-icon-only ui-button ui-widget ui-state-default ui-corner-all ui-igbutton ui-igupload-cancel-button"                                                                        ';
			printHtml += '			role="button" aria-disabled="false" onclick="deleteFile('+fileItem.fileNo+')" >                                                                                                                                                ';
			printHtml += '			<span class="ui-button-icon-primary ui-icon ui-icon-closethick" id="igUpload1_'+ i +'__cbtn_picn"></span>                                                                                                                                   ';
			printHtml += '			<span class="ui-button-text" id="igUpload1_'+ i +'__cbtn_lbl"></span>                                                                                                                                                                       ';
			printHtml += '		</button>		                                                                                                                                                                                                                                        ';
			printHtml += '	</div>		                                                                                                                                                                                                                                                ';
			printHtml += '                                                                                                                                                                                                                                                               ';
			printHtml += '	<div class="ui-helper-clearfix">                                                                                                                                                                                                                            ';
			printHtml += '		<div class="ui-igupload-progressbar-container ui-helper-clearfix" title="'+ fileItem.fileOriName +'">				                                                                                                                                        ';
			printHtml += '			<span id="igUpload1_'+i+'__icn" class="ui-icon ui-icon-image ui-igupload-progressbar-icon ui-igupload-progressbar-icon-images"></span>				                                                                                    ';
			printHtml += '			<span class="ui-igupload-progressbar-filename" id="igUpload1_'+ i +'__pbrflnm"><a href="javascript:window.open("${pageContext.request.contextPath}/upload"'+ fileItem.filePath + '"/"'+ fileItem.fileSysName + '")">'+ fileItem.fileOriName + '</a></span>';			
			printHtml += '			<span class="ui-igupload-progressbar-filesize" id="igUpload1_'+ i +'__pbrflsz"><fmt:formatNumber value="'+ fileItem.fileSize +'" type="number"/>Byte/<fmt:formatNumber value="'+fileItem.fileSize+'" type="number"/>Byte</span>			        ';
			printHtml += '		</div>                                                                                                                                                                                                                                                  ';
			printHtml += '	                                                                                                                                                                                                                                                            ';
			printHtml += '	</div>	                                                                                                                                                                                                                                                    ';
			printHtml += '</div>                                                                                                                                                                                                                                                         ';
		
		}
		
		$("#igUpload1___fus").html(printHtml);
		
		
	})                                                                                                                                                                                                                                                                         
}                                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                               
function showAlert(args) {
    $("#error-message").html(args.errorMessage).stop(true, true).fadeIn(500).delay(3000).fadeOut(500);
}

/* 카드 삭제 */
function deletes(cardNo) {
	swal({
		title: "",
		text:"카드를 삭제하시겠습니까?",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: "#DD6B55",
		confirmButtonText: "삭제",
		cancelButtonText: "취소",
		closeOnConfirm: false
	},
	function(){
		$.ajax ({
			url: "delete.do",
			type: "POST",
			data: {
				"cardNo": cardNo
			},	
			dataType: "json"
		}).done(function(result){
			swal({
				title: "삭제 완료",
				text: "카드가 삭제되었습니다.",
				type: "success"	
			},
			function(){
				window.open('/bit-finalT3/card/list.do','_parent').parent.close();
			})			
		});
	});
};

// 댓글 목록 만드는 공통 함수
function makeCommentList(result) {

	var html = "";
	  
	for (var i = 0; i < result.length; i++) {
		
		var comment = result[i];
		
		var date = new Date(comment.cardCommentRegDate);
		var time = date.getFullYear() + "-" 
		         + (date.getMonth() + 1) + "-" 
		         + date.getDate() + " "
		         + date.getHours() + ":"
		         + date.getMinutes() + ":"
		         + date.getSeconds();
		
		// 오류 : 현재 위의 날짜를 수정하게 되면 리스트 자체가 뜨질 않는다.
		html += '<img style="width:55px; float:left; margin-right:5px; "  class="uImg" src="'+comment.userImgPath+'" />';
		html += '<div class="post-content" id="postList' + comment.cardCommentNo + '">';
		html += '<a class="post-author-username"';
		html += '   href="">' + comment.userNickName + '</a>';
		
		html += '';
		html += '    <div class="post-body"><pre>' + comment.cardCommentContent + '</pre></div>';
		html += '';
		html += '	<ol class="post-actions">';
		html += '   		<li style="margin-left:11px;"><a href="javascript:commentUpdateForm(' + comment.cardCommentNo + ', ' + comment.userNo + ')">수정</a></li>';
		html += '   		<li><a href="javascript:commentDelete(' + comment.cardCommentNo + ', ' + comment.userNo + ')">삭제</a></li>';
		html += '<span class="post-timedelta">'+comment.regDate+'</span>';
		html += '   		<div class="clearfix"></div>';
		html += '    	</ol>';
		html += '	</div>';
		html += '</li>';
		
	}
	
	$("#commentList").html(html);
}

// 댓글 목록 조회
function commentList() {
	$.ajax({
		url: "commentList.do",
		data: {cardNo: $("#cardNo").val()},
		dataType: "json"
	})
	.done(makeCommentList);
}

/*댓글 수정폼*/
function commentUpdateForm(cardCommentNo, commentUserNo) {
	if(commentUserNo != $("#loginUserNo").val()){
		swal("", "자신의 카드만 수정 가능합니다.", "info");
		return false;
	}

	$("#commentList div[id^=postList]").show();
	$("#commentList div[id^=modPost]").remove();
	
	
	var modId = $("#postList" + cardCommentNo + " > a:eq(0)").text();
	var modDate = $("#postList" + cardCommentNo + " > span:eq(0)").text();
	var modContent = $("#postList" + cardCommentNo + " > div:eq(0)").text();
	
	var html = '';
//		html += '<ol class="modPost">                                                        ';
//		html += '                                                                         ';
	html += '<div class="post-content" id="modPost' + cardCommentNo + '">                                               ';
	html += '<a class="post-author-username"                                          ';
	html += '   href="">' + modId + '</a>                                                    ';
	html += '<span class="post-timedelta">'+ modDate +'</span>                                ';
	html += '                                                                         ';
	html += '    <div class="post-body">';
	html += '		 <textarea id="updateArea' + cardCommentNo + '" name="CardCommentContent" class="add-post-textarea">'+ modContent + '</textarea>';
	html += '    </div>';                                  
	html += '	<ol class="post-actions">                                             ';
	html += '   		<li><a href="javascript:commentUpdate(' + cardCommentNo + ')">수정</a></li> ';
	html += '   		<li><a href="javascript:commentCancel(' + cardCommentNo + ')">취소</a></li> ';
//		html += '   		<li>'+time+'</li>                                     ';
	html += '   		<div class="clearfix"></div>                                  ';
	html += '    	</ol>                                                             ';
	html += '	</div>                                                                ';
	html += '</li>   ';
	$("#postList" + cardCommentNo).after(html);	
	$("#postList" + cardCommentNo).hide();
}

//새로운 댓글 수정폼
                                             


/*	html += '<tr id="modRow' + cardCommentNo + '">';
	html += '	<td>' + modId + '</td>';
	html += '	<td>';
	html += '		<div class="form-group">';
	html += '			<input type="text" name="CardCommentContent" value="' + modContent + '" class="form-control input-wp2" placeholder="내용을 입력하세요">';
	html += '		</div>';
	html += '	</td>';
	html += '	<td colspan="2">'; 
	html += '		<a href="javascript:commentUpdate(' + cardCommentNo + ');" class="btn btn-success btn-sm" role="button">수정</a>';
	html += '		<a href="javascript:commentCancel(' + cardCommentNo + ');" class="btn btn-warning btn-sm" role="button">취소</a>';
	html += '	</td>';
	html += '</tr>';
	$("#row" + cardCommentNo).after(html);	
	$("#row" + cardCommentNo).hide();
*/


/*댓글 수정 하는중*/

function commentUpdate(cardCommentNo) {
	$.ajax({
		url: "commentUpdate.do",
		type: "POST",
		data: {
			cardNo: $('#cardNo').val(), 
			CardCommentContent: $("#updateArea" + cardCommentNo).val(), 
			cardCommentNo: cardCommentNo
		},
		dataType: "json"
	})
	.done(function (result) {
		makeCommentList(result);
	});
	
}

function commentCancel(cardCommentNo) {
	$("#postList" + cardCommentNo).show();
	$("#modPost" + cardCommentNo).remove();
}



/*댓글 삭제*/	
function commentDelete(cardCommentNo, commentUserNo) {
	if(commentUserNo != $("#loginUserNo").val()){
		swal("", "자신의 댓글만 삭제 가능합니다.", "info");
		return false;
	}
	
	$.ajax({
		url: "commentDelete.do",
		data: {
			cardNo: $('#cardNo').val(), 
			cardCommentNo: cardCommentNo
		},
		dataType: "json"
	})
	.done(makeCommentList);	
}

function displayFile(index, flag) {
	
	$("#igUpload1_spbtncncl").css("display", "block");
	
	if ( flag == 0 ) {
		$("#displayFileItem"+index).css("display", "none");
	}
	
}

var files;


$("#igUpload1_spbtncncl").click(function () {
	
	var formData = new FormData();
	
	for (var i = 0; i < files.length; i++) {
		formData.append('uploadFileList', files[i]);
    }
	
	formData.append('cardNo', $("#cardNo").val());
	
	$.ajax({
		url : "/bit-finalT3/upload/saveFileList.do",
		data : formData,
		dataType : 'json',
		type : 'post'
	}).done(function(result) {
		alert("성공");
	})
	
});

//getElementById
function $id(id) {
	return document.getElementById(id);
}


// output information
function Output(msg) {
	var m = $id("igUpload1___fus");
	$("#igUpload1___fus").val(msg);
	m.innerHTML = m.innerHTML + msg;
	$("#igUpload1_spbtncncl").css("display", "block");
}


//// file drag hover
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
		ParseFile(f, i);
	}

}


// output file information
function ParseFile(file, i) {

	Output(
			
			'<div class="ui-widget-content ui-igupload-progress-container ui-corner-all ui-helper-clearfix" id="displayFileItem'+i+'">		                                                                                                                                                         '
			+'	<div class="ui-container-button-cancel-class  ui-helper-clearfix" >			                                                                                                                                                                                 '
			+'		<button id="igUpload1_'+i+'__cbtn" title="Cancel" class="ui-button-icon-only ui-button ui-widget ui-state-default ui-corner-all ui-igbutton ui-igupload-cancel-button"                                                                         '
			+'			role="button" aria-disabled="false" onclick="displayFile('+i+', 0)" >                                                                                                                                                 '
			+'			<span class="ui-button-icon-primary ui-icon ui-icon-closethick" id="igUpload1_'+i+'__cbtn_picn"></span>                                                                                                                                    '
			+'			<span class="ui-button-text" id="igUpload1_'+i+'__cbtn_lbl"></span>                                                                                                                                                                        '
			+'		</button>		                                                                                                                                                                                                                                         '
			+'	</div>		                                                                                                                                                                                                                                                 '
			+'	                                                                                                                                                                                                                                                             '
			+'	<div class="ui-helper-clearfix">                                                                                                                                                                                                                             '
			+'		<div class="ui-igupload-progressbar-container ui-helper-clearfix" title="'+file.name+'">				                                                                                                                                         '
			+'			<span id="igUpload1_'+i+'__icn" class="ui-icon ui-icon-image ui-igupload-progressbar-icon ui-igupload-progressbar-icon-images"></span>				                                                                                     '
			+'			<span class="ui-igupload-progressbar-filename" id="igUpload1_'+i+'__pbrflnm">'+file.name+'</span>'			
			+'			<span class="ui-igupload-progressbar-filesize" id="igUpload1_'+i+'__pbrflsz">'+file.size+'Byte/'+file.size+'Byte</span>			         '
			+'		</div>                                                                                                                                                                                                                                                   '
			+'	                                                                                                                                                                                                                                                             '
			+'		<div id="igUpload1_0__snglpbar" class="ui-igupload-progressbar-upload ui-igupload-progressbar-upload-single ui-helper-clearfix ui-igprogressbar-horizontal ui-igprogressbar ui-widget ui-widget-content ui-corner-all">                                  '
			+'			<div id="igUpload1_0__snglpbar_progress" class="ui-igprogressbar-range ui-widget-header ui-corner-all" style="height: 100%; top: 0px; left: 0%; width: 0%; overflow: hidden;"></div>                                                                 '
			+'		</div>                                                                                                                                                                                                                                                   '
			+'	</div>	                                                                                                                                                                                                                                                     '
			+'</div>	                                                                                                                                                                                                                                                         '
			
	);

}


// initialize
function Init() {

	var fileselect = $id("uploadFile");

	// file select
	fileselect.addEventListener("change", FileSelectHandler, false);

	// is XHR2 available?
	var xhr = new XMLHttpRequest();
	if (xhr.upload) {

		// file drop
//		filedrag.addEventListener("dragover", FileDragHover, false);
//		filedrag.addEventListener("dragleave", FileDragHover, false);
//		filedrag.addEventListener("drop", FileSelectHandler, false);
//		filedrag.style.display = "block";

	}

}

// call initialization file
if (window.File && window.FileList && window.FileReader) {
	Init();
}



});
