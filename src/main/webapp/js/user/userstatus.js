

function goLogout(userNo) {
//	alert("???????? : " + userNo);
	
	$.ajax({
		url : "/bit-finalT3/user/logout.do",
		type : "POST",
		dateType : "json",
		data : {userNo : userNo}
	}).done(function(result) {
		if("sessionDel") {
			location.href = "/bit-finalT3/index.html"
		}
	})
}
	


