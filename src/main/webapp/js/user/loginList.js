/**
 * 
 */
var interval;
$(document).ready(function() {

	interval = setInterval(userList, 10000);
})


function userList() {
		$.ajax({
			url : "/bit-finalT3/user/loginList.do",
			dataType : "json",
			type : "POST"
		}).done(function(result) {
			console.log(result);
			makeUserList(result);
		
})
	}

function makeUserList(result) {
	var html = "";
	for (var i = 0; i < result.length; i++) {
		var userList = result[i];
		html += '<h1>' + userList.userNickName + '(' + userList.userEmail
				+ ')</h1> '
	}
	$("#loginList").html(html);

}
