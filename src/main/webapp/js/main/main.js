/**
 * 
 */
jQuery(function($) {
	$(document).ready(function() {
//		$('.navbar-default').stickUp();

	});
});

// iframe resize
function autoResize(i) {
    var iframeHeight=
    (i).contentWindow.document.body.scrollHeight;
    (i).height=iframeHeight+20;
}

new WOW().init();

//$("document").ready(function () {
//	$("img#linkQuiz").click(function() {
//			location.href = "../quiz/list.do";
//	});
//})

$("window").load(function () {
	$("document").on("click", "img#linkQuiz", function() {
		location.href = "../quiz/list.do";
	});
})