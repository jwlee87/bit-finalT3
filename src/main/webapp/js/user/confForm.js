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
//				swal("Good job!", "You clicked the button!", "success");
				console.log(swal("Good job!", "You clicked the button!", "success"));
			}else {
				swal("인증번호가 틀렸습니다.");
			}
			
		})

	})
	
	