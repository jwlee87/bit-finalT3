$(document).ready(function() {
	
	$(".ui-igtrialwatermark").remove();
	$("#attach").click(displayFile);
	$("#btn").click(writeAjax);
	
	var buttonLabel = $.ig.Upload.locale.labelUploadButton;
    if (Modernizr.input.multiple) {
        buttonLabel = "Drag and Drop으로 파일을 끌어오거나 <br> Click으로 파일을 선택해주세요.";
    }
    
    
    $("#igUpload1").igUpload({
        mode: 'multiple',
        multipleFiles: true,
        maxUploadedFiles: 10,
        maxSimultaneousFilesUploads: 2,
//        progressUrl: "https://www.igniteui.com/IGUploadStatusHandler.ashx",
        progressUrl: "/bit-finalT3/upload/save.do",
        controlId: "serverID1",
        labelUploadButton: buttonLabel,
        onError: function (e, args) {
            showAlert(args);
        }
    });
    if (Modernizr.input.multiple) {
        $(".ui-igstartupbrowsebutton").attr("style", "width: 600px; height: 100px;");
    }
	
});

window.onload = function () {
	
	$(".ui-igtrialwatermark").remove();
	$("#igUpload1_ibb_fp").attr("name", "uploadFile");
}

function showAlert(args) {
    $("#error-message").html(args.errorMessage).stop(true, true).fadeIn(500).delay(3000).fadeOut(500);
}

function writeAjax() {
	
	if($("#content").val() == "") {
		swal({
			title:"글을 입력하세요",
			type:"warning"
		})
		return false;
	}
	
	var form = $('#write').serialize();
		
	$.ajax({
		url: "write.do",
		type:"post",
		dataType:"json",
		data: form,
	}).done(sucessAjax)
	
}
//
//function uploadAjax(result){
//	
//	var form = $('#upload')[0];
//	var formData = new FormData(form);
//	
//	$.ajax({
//		url: 'bit-finalT3/upload/save.do',
//		data: formData,
//		dataType:'json',
//		type:'post',
//	}).done(sucessAjax)
//	
//}

function sucessAjax(result) {
	
	swal({
		title:"정상적으로 등록되었습니다.",
		type: "success"
	},
	function(){
		window.open('/bit-finalT3/card/list.do','_parent').parent.close();
	})
}



function displayFile () {
	
	if($("#displayFile").css("display") == "none") {
		$("#displayFile").css("display","block");
		return false;
	}
	
	if($("#displayFile").css("display") == "block")	{
		$("#displayFile").css("display", "none");
		return false;
	}
}