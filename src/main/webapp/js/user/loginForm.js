/**
 * 
 */

	
/* 	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		
		var cookieValue = escape(value) + ((exdays==null)?"":"; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString();
	}
	
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieDate = document.cookie;
		var start = cookieDate.indexOf(cookieName);
		var cookieValue = "";
		
		if(start != -1) {
			start += cookieName.length;
			var end = cookieDate.indexOf(';', start);
			if(end == -1) end = cookieDate.length;
			cookieValue = cookieDate.substring(start, end);
		}
		return unescape(cookieValue);
	} */
	
	
	//쿠키에서 로그인 정보 가져오기
	function getLogin() {
		var lf = document.loginForm;
		//useremail 쿠키에서 email값을 가져온다
		var userEmail = getCookie("userEmail");
		var userPsw = getCookie("userPsw");
		
		if(userEmail != "") {
			lf.userEmail.value = userEmail;
			lf.userPsw.value = userPsw;
			lf.remember_me.checked = true;
		} else {
			$("#userPsw").attr("maxlength", "17");
			
		}
		
	}
	
	
	function confirmSave(checkbox) {
		var isRemember;
		//로그인 정보를 저장 o
		
		if(checkbox.checked) {
			isRemember = confirm("이 pc에 로그인 정보를 저장 하시겠습니까? \n\nPc방 등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
			if(!isRemember)
				checkbox.checked = false;
		}
	}
	
	
	//쿠키값 가져오기
	function getCookie(key) {
		var cook = document.cookie + ";";
		var idx =  cook.indexOf(key, 0);
		var val = "";
		if(idx != -1) {
			cook = cook.substring(idx, cook.length);
			begin = cook.indexOf("=", 0) + 1;
			end = cook.indexOf(";", begin);
			val = unescape( cook.substring(begin, end) );
		}
		return val; 
	}
	
	//쿠키값 설정
	function setCookie(name, value, expiredays) {
		var today = new Date();
		today.setDate(today.getDate() + expiredays);
		document.cookie = name + "=" + escape(value)+"; path=/; expires=" + today.toGMTString() + ";";
	}
	
	

	function saveLogin(userEmail, userPsw) {
		if(userEmail != "") {
			//userEmail 쿠키에 email값을 1일간 저장
			setCookie("userEmail", userEmail, 1);
			setCookie("userPsw", userPsw, 1);
		}else {
			//userEmail 쿠키삭제
			setCookie("userEmail", userEmail, -1);
			setCookie("userPsw", userPsw, -1);
		}
	}
	
	

	$("#loginBtn").click(function(){
		var userEmail = $("#userEmail").val();
		var userPsw = $("#userPsw").val();
	 	var lf = document.loginForm;

/*	 	if(lf.remember_me.checked) saveLogin(lf.userEmail.value, lf.userPsw.value);
		else saveLogin("");*/
//		lf.action = "/bit-finalT3/user/login.do";
//		lf.submit(); 
		$.ajax({
			url : "/bit-finalT3/user/login.do",
			dataType : "json",
			type : "POST",
			data : {userEmail : $("#userEmail").val(),
					userPsw : $("#userPsw").val()}
		}).done(function(result){
			if(result.loginOk) {
//				alert("1회원번호 : " + result.userNo);
//				alert("2메일주소 : " + result.userEmail);
//				alert("3별명 : " + result.userNickName);
//				alert("4암호 : " + result.userPsw);
				
			var lf = document.loginForm;
		 			if(lf.remember_me.checked){ 
		 				saveLogin(lf.userEmail.value, result.userPsw);
//		 				save(result.normalPsw);
		 				lf.submit();	
				} else saveLogin(""); 
			 	lf.action = "/bit-finalT3/user/login.do"; 
				 
// 				setCookie(result.userEmail, result.userEmail , 1);
//				alert("쿠키 만들어짐?? : " + getCookie(userEmail.userEmail));
				self.close();
				goMain(result);
			}else {
				   swal("로그인 실패", "회원정보가 올바르지 않습니다:)", "error");
			}
		})
	})
	
//	function save(normalPsw){
//		var psw = normalPsw;
//		alert("save : " + psw);
//		
//		getLogin(psw);
//	}
	
	
	function goMain(result) {
		var no = result.userNo;
		var nickName = result.userNickName;
		var email = result.userEmail;
//		alert("유저넘버 : " + no);
//		alert("별명 : " + nickName);
//		alert("이메일주소 : " + email);
		
		opener.location.href ="/bit-finalT3/main/main.do";
		
	}
	
	
	