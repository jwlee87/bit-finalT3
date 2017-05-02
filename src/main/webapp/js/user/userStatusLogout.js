/**
 * 
 */
// window.onbeforeunload = function() {
// $.ajax({
// url : "/bit-finalT3/user/userStatusLogout.do"
// }).done(function(result) {
// if (result == "") {
// alert("왔따");
//
// }
// })
//
// }
window.onbeforeunload = function() {

	// 윈도우 창을 닫을 때 로그아웃 처리
	var y = event.clientY;

	if (y < 0) {
		$.ajax({
			url : "/bit-finalT3/user/userStatusLogout.do"
		}).done(function(result) {
			if (result == "") {
				alert("왔따");
			}
		})
	}
}

window.onUnload = exit();
function exit() {
	if (self.screenTop > 9000) {
		alert('닫힘');
		$.ajax({
			url : "/bit-finalT3/user/userStatusLogout.do"
		}).done(function(result) {
			if (result == "") {
				alert("왔따");
			}
		})

		// 브라우저 닫힘
	} else {
		if (document.readyState == "complete") {
//			alert('새로고침');
			// 새로고침
		} else if (document.readyState == "loading") {
//			alert('이동');
			// 다른 사이트로 이동
		} else {
//			alert("???");
		}
	}
}

//document.onkeydown = function() {
//	// 새로고침 방지 ( Ctrl+R, Ctrl+N, F5 )
//	if (event.ctrlKey == true
//			&& (event.keyCode == 78 || event.keyCode == 82
//					|| event.keyCode == 114 || event.keyCode == 110
//					|| event.keyCode == 87 || event.keyCode == 119 || event.keyCode == 115)
//			|| event.keyCode == 116) {
//		event.keyCode = 0;
//		event.cancelBubble = true;
//		event.returnValue = false;
//	}
//
//	// 창 닫기( Alt+F4 ) 방지
//	if (event.keycode == 18 && event.keyCode == 115) { // F4 눌렀을 시
//		alert("alt + f4");
//		event.keyCode = 0;
//		event.cancelBubble = true;
//		event.returnValue = false;
//		$.ajax({
//			url : "/bit-finalT3/user/userStatusLogout.do"
//		}).done(function(result) {
//			if (result == "") {
//				alert("왔따");
//			}
//		})
//		// 로그아웃 처리
//
//	}
//
//	// 윈도우 창이 닫힐 경우
//	if (event.keyCode == 505) {
//		alert(document.body.onBeforeUnload);
//	}
//}
