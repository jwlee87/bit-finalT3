/**
 * 
 */

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
		data : {email : $("input[name=email]").val()},
		dataType : "json"
	}).done(function (result){
		if(result.emailChk) {
			$("#emailResult").css("color", "red").html("사용 불가능한 이메일 입니다.");
			$("#btn").css("background", "tomato").attr("disabled", true); 
		} else {
			$("#emailResult").css("color", "green").html("사용가능한 이메일 입니다.");
			$("#btn").css("background", "#93E1D8").attr("disabled", false);
		}			
	})
});

$("#nickName").on("keyup", function () {
	$.ajax({
		url : "/bit-finalT3/user/nickNameCheck.do",
		type : "POST",
		data : {nickName : $("input[name=nickName]").val()},
		dataType : "json"
	}).done(function(result){
		if(result.nickNameChk) {
			$("#nickNameResult").css("color", "red").html("사용 불가능한 별명입니다.");
			$("#nickName").attr("id", "reNickName");
			$("#btn").css("background", "tomato");
			/* 
			 if(document.joinForm.submit()) {
				console.log("오냐오냐");
				return false;
			}  */
		} else {
			$("#nickNameResult").css("color", "green").html("사용가능한 별명입니다.");
			$("#reNickName").attr("id", "nickName");
			$("#btn").css("background", "#93E1D8");
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
	
	
	 
$("#btn").on("click", function () {
	
	var jf = document.joinForm;
	
	if(jf.email.value == "") {
		alert("메일을 입력하세요");
		jf.email.focus();
		return false;
	}

	if($("#reNickName").val() != null) {
		alert("사용 불가능한 별명입니다.");
		jf.nickName.focus();
		return false;
	}

	if(jf.nickName.value == "") {
		alert("별명을 입력하세요");
		jf.nickName.focus();
		return false;
	}
	
//	if(jf.password.value == "") {
//		alert("비밀번호를 입력하세요");
//		jf.password.focus();
//		return false;
//	}
	
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

	$.ajax({
		url : "/bit-finalT3/user/join.do",
		type : "POST",
		data : user,
		dataType : "json"
	})
	.done(function (result) {
		console.log(result)
		alert(result);
		location.href="confForm.do";
	})
	.fail(function (jqXHR, textStatus, errorThrown) {
		alert("에러 발생 \n" + textStatus + " : " + errorThrown);
	})
	
	
});