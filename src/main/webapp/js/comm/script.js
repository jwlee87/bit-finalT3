/*
Theme: Flatfy Theme
Author: Andrea Galanti
Bootstrap Version 
Build: 1.0
http://www.andreagalanti.it
*/

$(window).load(function() { 
	//Preloader 
	$('#status').delay(300).fadeOut(); 
	$('#preloader').delay(300).fadeOut('slow');
	$('body').delay(550).css({'overflow':'visible'});
})

$(document).ready(function() {
		//animated logo
		$(".navbar-brand").hover(function () {
			$(this).toggleClass("animated shake");
		});
		
		//animated scroll_arrow
		$(".img_scroll").hover(function () {
			$(this).toggleClass("animated infinite bounce");
		});
		
		//Wow Animation DISABLE FOR ANIMATION MOBILE/TABLET
		wow = new WOW(
		{
			mobile: false
		});
		wow.init();
		
		//Magnific-ImgPopup
		$('.image-link').magnificPopup({type:'image'});
		//Magnific-InlinePopup
		$('.open-popup-link').magnificPopup({
			  items: {
			      src: '<div class="row" style="color:#c7c7c7">'
			  		 + '<div class="col-md-3 wow fadeInDown text-center">'
			  		 + '</div>'
			  		 + '<div class="col-md-2 wow fadeInDown text-center">'
			  		 + '<img class="rotate" src="../img/icon/tweet.svg" alt="Generic placeholder image">'
			  		 + '<a href="#" style="color:#c7c7c7"><h3>카드게시판</h3></a>'
			  		 + '</div><!-- /.col-lg-4 -->'
			  		
			  		 + '<div class="col-md-2 wow fadeInDown text-center">'
			  		 + '<img  class="rotate" src="../img/icon/picture.svg" alt="Generic placeholder image">'
			  		 + '<a href="#" style="color:#c7c7c7"><h3>코드편집기</h3></a>'
			  		 + '</div><!-- /.col-lg-4 -->'
			  		
			  		 + '<div class="col-md-2 wow fadeInDown text-center">'
			  		 + '<img  class="rotate" src="../img/icon/retina.svg" alt="Generic placeholder image">'
			  		 + '<a href="#" style="color:#c7c7c7"><h3>퀴즈게시판</h3></a>'
			  		 + '</div><!-- /.col-lg-4 -->'
			  		 +'</div><!-- /.row -->'
			  		 + '<div class="col-md-3 wow fadeInDown text-center">'
			  		 + '</div>',
			      type: 'inline'
			  }
		});

		// OwlCarousel N1
		$("#owl-demo").owlCarousel({
			autoPlay: 3000,
			items : 3,
			itemsDesktop : [1199,3],
			itemsDesktopSmall : [979,3]
		});

		// OwlCarousel N2
		$("#owl-demo-1").owlCarousel({
			  navigation : false, // Show next and prev buttons
			  slideSpeed : 300,
			  paginationSpeed : 400,
			  singleItem:true
		});

		//SmothScroll
		$('a[href*=#]').click(function() {
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
			&& location.hostname == this.hostname) {
					var $target = $(this.hash);
					$target = $target.length && $target || $('[name=' + this.hash.slice(1) +']');
					if ($target.length) {
							var targetOffset = $target.offset().top;
							$('html,body').animate({scrollTop: targetOffset}, 600);
							return false;
					}
			}
		});
		
		//Subscribe
		new UIMorphingButton( document.querySelector( '.morph-button' ) );
		// for demo purposes only
		[].slice.call( document.querySelectorAll( 'form button' ) ).forEach( function( bttn ) { 
			bttn.addEventListener( 'click', function( ev ) { ev.preventDefault(); } );
		} );

});

