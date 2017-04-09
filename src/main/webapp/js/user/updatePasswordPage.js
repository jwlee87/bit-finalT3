/**
 * 
 */

$(document).ready(function() {
    $("#body").attr("background","${pageContext.request.contextPath}/img/intro/intro5.jpg");
	
	var email = $("#userEmail").val();
//    alert(email);
    swal({
		  title: "비밀번호 변경하기",
		  text: "새로운 비밀번호를 입력 해주세요.",
		  type: "input",
		  inputType: "password",
		  showCancelButton: true,
		  closeOnConfirm: false,
		  inputPlaceholder: "Password"
		}, function (inputValue) {
			psw = inputValue;
			if (inputValue === false) return false;
			if (inputValue === "") {
		    swal.showInputError("비밀번호를 입력해주세요!!");
		    return false;
		  } 
			if (inputValue.length > 18){
			swal.showInputError("비밀번호는 5~17자  입력가능합니다");
			return false;
		  }
			if (inputValue.length < 5) {
			 swal.showInputError("비밀번호는 5~17자  입력가능합니다");
			return false;
			}
			
			updatePassword(email, psw);
		})
	
})

var clo;

function updatePassword(email, psw){
//	alert("1 : " + email);
//	alert("2 : " + psw);
	
	$.ajax({
		url : "/bit-finalT3/user/updatePassword.do",
		type : "POST",
		DateType : "json",
		data : {userEmail : email,
				userPsw : psw}		
	}).done(function(result){
		if(result == "yes")	swal("비밀번호가 변경 되었습니다.", "", "success");
		clo = setTimeout(closeWin, 1800);
	})
}

function closeWin() {
	self.close();
}

