/**
 * 
 */
	var doubleSubmitFlag = false;
	function doubleSubmitCheck(){
		$(".sweet-alert .sa-input-error.show").css("opacity","0");
		if(doubleSubmitFlag){
			$(".sweet-alert .sa-input-error.show").css("opacity","0");
			swal.showInputError("메일 전송중입니다");
			return doubleSubmitFlag;
		}else{
			$(".sweet-alert .sa-input-error.show").css("opacity","0");
			doubleSubmitFlag = true;
			return false;
		}
	}
	


function goFindPassword(){
	var email = "";
	swal({
		  title: "비밀번호 찾기",
		  text: "비밀번호 찾을 이메일주소를 입력해주세요",
		  type: "input",
		  showCancelButton: true,
		  closeOnConfirm: false,
		  inputPlaceholder: "email"
		}, function (inputValue) {
			email = inputValue;
			if (inputValue === false) return false;
			if (inputValue === "") {
		    swal.showInputError("email 주소를 입력 해주세요!!");
		    return false;
		  }
			findPsw(email);
		})
}


function findPsw(email) {
	if(doubleSubmitCheck()) {
		$(".sweet-alert .sa-input-error.show").css("opacity","0");
		return;
	}
//	alert("뭐지 이게 왜 먼져떠 : " + email);
	var email = email;
	$.ajax ({
		url : "/bit-finalT3/user/findPsw.do",
		dataType : "json",
		type : "POST",
		data : {userEmail:email}
	}).done(function(result){
		if(result == "userOk") {
			swal("메일을 보냈습니다.", "email : " + email, "success");
		}else {
			swal("잘못된 이메일주소 입니다.");
		}
	})
}


