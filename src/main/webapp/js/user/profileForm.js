/**
 * 
 */


	

// button ripple effect from @ShawnSauce 's pen http://codepen.io/ShawnSauce/full/huLEH




	
	
	
	
$(function(){
	$("#userPsw").on("keyup", function(){
		var psw = $("#userPsw").val()
		if(psw.length <= 4) {
			$("#userPsw").html('<erroru> 비밀번호를 4자이상 입력하세요 <i> <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"> <path d="M0 0h24v24h-24z" fill="none" /> <path d="M1 21h22l-11-19-11 19zm12-3h-2v-2h2v2zm0-4h-2v-4h2v4z" /> </svg></i> </erroru>');
//			$("#btn").attr("disabled", true); 
		} else {
//			$("#password").css("box-shadow", "0px 0px 4px 2px #4A90BE");
//			$("#btn").attr("disabled", false);
		}
	})
		
	
	
	
	$("#submitBtn").click(function(){
		var nickName = $("#userNickName").val();
		var psw = $("#userPsw").val();
		var userNo = $("#userNo").val();
		
		console.log("별명 : " + nickName);
		console.log("암호 : " + psw);
		console.log("유저번호 : " + userNo);
		$.ajax({
			url : "/bit-finalT3/user/updateUser.do",
			type : "POST",
			dataType : "json",
			data :{userNo : userNo,
				   userNickName : nickName,
				   userPsw : psw} 
			}).done(function(result) {
				alert("ㅇㅇㅇ");
				
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
});

var username = $('#username'), 
    password = $('#password'), 
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

