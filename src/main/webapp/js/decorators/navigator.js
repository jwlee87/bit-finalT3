
function goProfile(userNo){
	location.href = "${pageContext.request.contextPath}/user/profileForm.do?userNo="+userNo;
}
//Magnific-InlinePopup
// $("#profilePopup").colorbox({iframe:true, width:"560px", height:"790px"});


 $(function(){
	$('.open-popup-link').magnificPopup({
		  items: {
		      src: '<div class="row" style="color:#c7c7c7">'
		  		 + '<div class="col-md-3 wow fadeInDown text-center">'
		  		 + '</div>'
		  		 + '<div class="col-md-2 wow fadeInDown text-center">'
		  		 + "<img class='rotate' src='../img/icon/tweet.svg' alt='Generic placeholder image' onclick='javascript:cardLink()'>"
		  		 + '<h3>카드게시판</h3>'
		  		 + '</div><!-- /.col-lg-4 -->'
		  		
		  		 + '<div class="col-md-2 wow fadeInDown text-center">'
		  		 + '<img  class="rotate" src="../img/icon/picture.svg" alt="Generic placeholder image" onclick="javascript:editLink()">'
		  		 + '<h3>코드편집기</h3>'
		  		 + '</div><!-- /.col-lg-4 -->'
		  		
		  		 + '<div class="col-md-2 wow fadeInDown text-center">'
		  		 + '<img id="linkQuiz"  class="rotate" src="../img/icon/retina.svg" alt="Generic placeholder image" onclick="javascript:quizLink()">'
		  		 + '<h3>퀴즈게시판</h3>'
		  		 + '</div><!-- /.col-lg-4 -->'
		  		 +'</div><!-- /.row -->'
		  		 + '<div class="col-md-3 wow fadeInDown text-center">'
		  		 + '</div>',
		      type: 'inline'
		  }
	});
	
	function cardLink() {
		location.href = "../card/list.do";
	}
	function editLink() {
		location.href = "../editor/form.do";
	}
	function quizLink() {
		location.href = "../quiz/list.do";
	}
 });