/**
 * 
 */
// Create a lightbox
(function() {
  var $lightbox = $("<div class='lightbox'></div>");
  var $img = $("<img>");
  var $caption = $("<p class='caption'></p>");
  
  $(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);


  // Add image and caption to lightbox

  $lightbox
    .append($img)
    .append($caption);

  // Add lighbox to document

  $('body').append($lightbox);

  $('.lightbox-gallery img').click(function(e) {
    e.preventDefault();

    // Get image link and description
    var src = $(this).attr("src");
    var cap = $(this).attr("alt");

    // Add data to lighbox

    $img.attr('src', src);
    $caption.text(cap);

    // Show lightbox

    $lightbox.fadeIn('fast');

    $lightbox.click(function() {
      $lightbox.fadeOut('fast');
    });
  });
}());

function choiceImg(userNo, imgNo) {
//	alert("회원번호 : " + userNo);
//	alert("사진번호 : " + imgNo);
	var clo;
	$.ajax({
		url : "/bit-finalT3/user/choiceImg.do",
		type : "POST",
		dataType : "json",
		data : {userNo : userNo,
				userImgNo : imgNo}
	}).done(function(result) {
//			alert(result.userNo);
			var userNo = result.userNo;
			
			swal({
				title : "수정완료",
				text : "프로필사진이 수정되었습니다.",
				type : "success"
			}, function() {
				window.open('/bit-finalT3/user/profileForm.do?userNo='+userNo, '_parent').parent.close();
			})
			
			
//			swal("프로필사진이 수정 되었습니다.", "2초후 창이 닫힙니다!", "success");
//			clo = setTimeout(closeWin(userNo), 3900); // 3000ms(3초)가 경과하면
	})
	
}

function closeWin(userNo) {
//	top.window.close();
//	  window.open('', '_self', '');
//	  window.close();
//	  return false;
	
//	parent.window.close();
//	if (!opener.closed){
//           opener.document.location.reload();
//           window.close();
	window.open('/bit-finalT3/user/profileForm.do?userNo='+userNo, '_parent').parent.close();

	
}