/**
 * 
 */

function paperAnim() {
		var paper = document.getElementById("paper-container");
		paper.className = "move-up";
	}
	function paperAnimOut() {
		var paper = document.getElementById("paper-container");
		paper.className = "move-down";
	}

	$(".mat-input").focus(function() {
		$(this).parent().addClass("is-active is-completed");
	});

	$(".mat-input").focusout(function() {
		if ($(this).val() === "")
			$(this).parent().removeClass("is-completed");
		$(this).parent().removeClass("is-active");
	})
	
	
	

	
	var temp = location.href.split("?");
	var data = temp[1].split("=");
	var userEmail = data[1];
	var clo;
	
	$("#startBtn").click(function() {
		$.ajax({
			url : "/bit-finalT3/user/conf.do",
			dataType : "json",
			data : {
				passNo : $("#passNo").val(),
				userEmail : userEmail
			},
			type : "POST"
		}).done(function(result) {
			if (result == "yes") {
//				swal("회원가입 완료!");
				swal("회원가입 완료!", "3초후 창이 닫힙니다!", "success");
				clo = setTimeout(closeWin, 1800); // 3000ms(3초)가 경과하면
//				swal("회원가입 완료!!");
//				self.close();
			}else {
				swal("인증번호가 틀렸습니다.");
			}
			
		})

	})
	
	function closeWin() {
		self.close();
	}
	