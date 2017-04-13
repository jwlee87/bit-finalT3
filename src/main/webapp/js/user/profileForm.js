/**
 * 
 */


	

// button ripple effect from @ShawnSauce 's pen http://codepen.io/ShawnSauce/full/huLEH

$(document).ready(function() {
	
//	$("#userPsw").on("keyup", function(){
//		var psw = $("#userPsw").val();
//		if(psw.length <= 4) {
//			$("#submitBtn").attr("disable", true);
//		} else {
//			pdiv.removeAttr('errr');
//		}
//			$("#userPsw").html('<erroru> 비밀번호를 4자이상 입력하세요 <i> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"> <path d="M0 0h24v24h-24z" fill="none" /> <path d="M1 21h22l-11-19-11 19zm12-3h-2v-2h2v2zm0-4h-2v-4h2v4z" /> </svg></i> </erroru>');
//			$("#btn").attr("disabled", true); 
//		} else {
//			$("#password").css("box-shadow", "0px 0px 4px 2px #4A90BE");
//			$("#btn").attr("disabled", false);
//		}

	$("#submitBtn").click(function(){
		
		var nickName = $("#userNickName").val();
		var psw = $("#userPsw").val();
		var userNo = $("#userNo").val();
		
		console.log("별명 : " + nickName);
		console.log("암호 : " + psw);
		console.log("유저번호 : " + userNo);
		
		var uf  = document.updateForm;
		
		if(nickName == "") {
			swal("별명을 입력하세요");
			uf.userNickName.focus();
			return false;
		}
			
			
		if($("#reNickName").val() != null) {
			swal("사용 불가능한 별명입니다.");
			nickName.focus();
			return false;
		}
		
		if(psw == "") {
			swal("비밀번호를 입력하세요");
			psw.focus();
			return false;
		}
		
		if(psw.length <= 4) {
			swal("비밀번호를 5자리 이상 입력하세요");
			psw.focus();
			return false;
		}
		
		
		
		$.ajax({
			url : "/bit-finalT3/user/updateUser.do",
			type : "POST",
			dataType : "json",
			data :{userNo : userNo,
				   userNickName : nickName,
				   userPsw : psw} 
			}).done(function(result) {
				swal("수정되었습니다", "", "success");
				
			})
		
		
	})


	
	
  
	
  var animationLibrary = 'animate';
  
  $.easing.easeOutQuart = function (x, t, b, c, d) {
    return -c * ((t=t/d-1)*t*t*t - 1) + b;
  };
  $('[ripple]:not([disabled],.disabled)')
  .on('mousedown', function( e ){
    
    var button = $(this);
    var touch = $('<touch><touch/>');
    var size = button.outerWidth() * 1.8;
    var complete = false;
    
    $(document)
    .on('mouseup',function(){
      var a = {
        'opacity': '0'
      };
      if( complete === true ){
        size = size * 1.33;
        $.extend(a, {
          'height': size + 'px',
          'width': size + 'px',
          'margin-top': -(size)/2 + 'px',
          'margin-left': -(size)/2 + 'px'
        });
      }
        
      touch
      [animationLibrary](a, {
        duration: 500,
        complete: function(){touch.remove();},
        easing: 'swing'
      });
    });
    
    touch
    .addClass( 'touch' )
    .css({
      'position': 'absolute',
      'top': e.pageY-button.offset().top + 'px',
      'left': e.pageX-button.offset().left + 'px',
      'width': '0',
      'height': '0'
    });
    
    /* IE8 will not appendChild */
    button.get(0).appendChild(touch.get(0));
    
    touch
    [animationLibrary]({
      'height': size + 'px',
      'width': size + 'px',
      'margin-top': -(size)/2 + 'px',
      'margin-left': -(size)/2 + 'px'
    }, {
      queue: false,
      duration: 500,
      'easing': 'easeOutQuart',
      'complete': function(){
        complete = true
      }
    });
  });

var username = $('#userEmail'), 
    password = $('#userPsw'), 
    erroru = $('erroru'), 
    errorp = $('errorp'), 
    submit = $('#submit'),
    udiv = $('#u'),
    pdiv = $('#p');

username.blur(function() {
  if (username.val() == '') {
    udiv.attr('errr','');
  } else {
    udiv.removeAttr('errr');
  }
});

password.blur(function() {
if(password.val() == '') {
    pdiv.attr('errr','');
  } else {
    pdiv.removeAttr('errr');
  }
});



submit.on('click', function(event) {
  event.preventDefault();
  if (username.val() == '') {
    udiv.attr('errr','');
  } else {
    udiv.removeAttr('errr');
  } 
  if(password.val() == '') {
    pdiv.attr('errr','');
  } else {
    pdiv.removeAttr('errr');
  }
});


$("#userNickName").on("keyup", function(){
	var nickName = $("#userNickName").val();
	$.ajax({
		url : "/bit-finalT3/user/nickNameCheck.do",
		type : "POST",
		data : {nickName : $("input[name=userNickName]").val()},
		dataType : "json"
	}).done(function(result){
		if(result.nickNameChk) {
			if(nickName =="") {
				 udiv.attr('errr','');
					$("#userNickName").attr("id", "reNickName");
//					$("#btn").css("background", "tomato");
					/* 
					 if(document.joinForm.submit()) {
						console.log("오냐오냐");
						return false;
					}  */
					$("#submitBtn").attr("disabled", true); 
			}
//			$("#nickNameResult").css("color", "red").html("사용 불가능한 별명입니다.");
			 udiv.attr('errr','');
			$("#userNickName").attr("id", "reNickName");
//			$("#btn").css("background", "tomato");
			/* 
			 if(document.joinForm.submit()) {
				console.log("오냐오냐");
				return false;
			}  */
			$("#submitBtn").attr("disabled", true); 
			
		} else {
//			$("#nickNameResult").css("color", "green").html("사용가능한 별명입니다.");
			 udiv.removeAttr('errr');
//			$("#nickName").css("box-shadow", "0px 0px 4px 2px #4A90BE");
			$("#reNickName").attr("id", "userNickName");
//			$("#btn").css("background", "#4A90BE");
			$("#submitBtn").attr("disabled", false);
		}
	})
});




$("#userPsw").on("keyup", function(){
	var psw = $("#userPsw").val();
	if(psw.length <= 4) {
		 pdiv.attr('errr','');
//		alert(psw);
//		$("#userPsw").css("box-shadow", "0px 0px 4px 2px red");
		$("#submitBtn").attr("disabled", true); 
	} else {
		   pdiv.removeAttr('errr');
//		$("#userPsw").css("box-shadow", "0px 0px 4px 2px #4A90BE");
		$("#submitBtn").attr("disabled", false);
	}
})

$("#characterImgPopup").colorbox({iframe:true, width:"1300px", height:"725px"});

})