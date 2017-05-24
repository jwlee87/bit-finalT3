/**
 * 
 */

$(document).ready(function() {

$('.tabs h3 a').on('click', function (event) {
//	event.preventDefault();
	$('.tabs h3 a').removeClass('active');
	$(this).addClass('active');

	tab_content = $(this).attr('href');
	$('div[id$="tab-content"]').removeClass('active');
	$(tab_content).addClass('active');
});




$("#email").on("keyup", function () {
	var jf = document.joinForm;
	$.ajax({
		url : "/bit-finalT3/user/emailCheck.do",
		type : "POST",
		data : {email : $("input[name=userEmail]").val()},
		dataType : "json"
	}).done(function (result){
		if(result.emailChk) {
//			$("#emailResult").css("color", "red").html("사용 불가능한 이메일 입니다.");
			$("#email").css("box-shadow", "0px 0px 4px 2px red");
			$("#email").attr("id", "reEmail");
			$("#btn").attr("disabled", true); 
		} else {
//			$("#emailResult").css("color", "green").html("사용가능한 이메일 입니다.");
			$("#email").css("box-shadow", "0px 0px 4px 2px #4A90BE");
			$("#reEmail").attr("id", "email");
			$("#btn").attr("disabled", false);
		}			
	})
});

$("#nickName").on("keyup", function () {
	$.ajax({
		url : "/bit-finalT3/user/nickNameCheck.do",
		type : "POST",
		data : {nickName : $("input[name=userNickName]").val()},
		dataType : "json"
	}).done(function(result){
		if(result.nickNameChk) {
//			$("#nickNameResult").css("color", "red").html("사용 불가능한 별명입니다.");
			$("#nickName").css("box-shadow", "0px 0px 4px 2px red");
			$("#nickName").attr("id", "reNickName");
//			$("#btn").css("background", "tomato");
			/* 
			 if(document.joinForm.submit()) {
				console.log("오냐오냐");
				return false;
			}  */
		} else {
//			$("#nickNameResult").css("color", "green").html("사용가능한 별명입니다.");
			$("#nickName").css("box-shadow", "0px 0px 4px 2px #4A90BE");
			$("#reNickName").attr("id", "nickName");
//			$("#btn").css("background", "#4A90BE");
		}
	})
});
	

/* 	$("#passwordCheck").on("keyup", function(){
		var user = $("#joinForm").serialize();
		
		$.ajax({
			url : "/test/user/pswCheck.do",
			type : "POST",
			data : user,
			dataType : "json"
		}).done(function (result){
			if(result.pswChk) {
				$("#pswCheck").css("color", "red").html("비밀번호가 일치하지 않습니다.");
				return false;
			}else {
				$("#pswCheck").css("color", "green").html("비밀번호가 일치합니다.");
				$("#btn").attr("disabled", false);
			}
		})
	}) */
	

$("#password").on("keyup", function(){
	var psw = $("#password").val()
	if(psw.length <= 4) {
		$("#password").css("box-shadow", "0px 0px 4px 2px red");
		$("#btn").attr("disabled", true); 
	} else {
		$("#password").css("box-shadow", "0px 0px 4px 2px #4A90BE");
		$("#btn").attr("disabled", false);
	}
})
	
var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
    	swal("메일 전송중 입니다.")
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}


$("#btn").on("click", function () {
	var jf = document.joinForm;
	var psw = $("#password").val();
	
//	if((jf.email.value || jf.reEmail.value) == "") {
//		swal("메일을 입력하세요", "", "warning");
//		jf.email.focus();
//		return false;
//	}
	
	if (jf.email.value == "") {
		swal("메일을 입력하세요", "", "warning");
		jf.email.focus();
		return false;
	}
	

	if($("#reNickName").val() != null) {
		swal("사용 불가능한 별명입니다", "", "warning");
		jf.reNickName.focus();
		return false;
	}
	
	if($("#reEmail").val() != null) {
		swal("사용 불가능한 이메일 입니다.", "", "warning");
		jf.reEmail.focus();
		return false;
	}
	

	if(jf.nickName.value == "") {
		swal("별명을 입력하세요", "", "warning");
		jf.nickName.focus();
		return false;
	}
	
	if(jf.password.value == "") {
		swal("비밀번호를 입력하세요", "", "warning");
		jf.password.focus();
		return false;
	}
	
	if(psw.length <= 4) {
		swal("비밀번호를 5자리 이상 입력하세요")
		$("#password").css("box-shadow", "0px 0px 4px 2px red");
		psw.focus();
		return false;
	} 
		
	if($("#btn").disable == true ) {
		swal("입력정보를 확인 해주세요", "", "warning");
		return false;
	}
	
	
	
//	if(jf.passwordCheck.value == "") {
//		alert("비밀번호를 확인해주세요");
//		jf.passwordCheck.focus();
//		return false;
//	}
//
//	if(jf.passwordCheck.value != jf.password.value) {
//		alert("비밀번호를 제대로 입력해주세요");
//		jf.passwordCheck.focus();
//		return false;
//	}

	var user = $("#joinForm").serialize();
//	 if(doubleSubmitCheck()) return;
	
	swal({
		title: "",
		text: "메일로 전송하시겠습니까?",
		showCancelButton: true,
		cancelButtonText: "취소",
		type: "info",
		confirmButtonText: "전송",
		closeOnConfirm: false,
		showLoaderOnConfirm: true
	},function () {
		$.ajax({
			url : "/bit-finalT3/user/join.do",
			type : "POST",
			data : user,
			dataType : "json"
		}).done(function(result) {
			if (result != null) {
	//			$("#btn").attr("disabled", true).text("로딩중...");
				console.log("dddd" + result);
				goConfForm(result);
			} else {
				swal("입력정보를 확인해주세요");
			}
		})
		.fail(function (jqXHR, textStatus, errorThrown) {
			swal("에러 발생 \n" + textStatus + " : " + errorThrown);
		})
	})
})	
	
	
	function goConfForm(result) {
		var userEmail = result.user.userEmail; 
		
		console.log("승인페이지" + result);
		location.href="confForm.do?userEmail=" + userEmail;
		
		
	/*		$.ajax({
				url:"/test/user/conf.do",
				type : "POST",
				data : {user:result},
				dataType:"json"
			}).done(function(result){
			
			})
			*/
			
	
	}
		
})
