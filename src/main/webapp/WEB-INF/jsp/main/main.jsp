<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="Flatfy Free Flat and Responsive HTML5 Template ">
    <meta name="author" content="">

    <title>Coily - Dayily Study</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/comm/bootstrap.min.css" rel="stylesheet">
 
    <!-- Custom Google Web Font -->
    <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo:400,700' rel='stylesheet' type='text/css'>
	
    <!-- Custom CSS-->
    <link href="${pageContext.request.contextPath}/css/comm/general.css" rel="stylesheet">
	
	 <!-- Owl-Carousel -->
    <link href="${pageContext.request.contextPath}/css/comm/custom.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/comm/owl.theme.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/comm/animate.css" rel="stylesheet">
	
	<!-- Magnific Popup core CSS file -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/magnific-popup.css"> 
	
	<script src="${pageContext.request.contextPath}/js/comm/modernizr-2.8.3.min.js"></script>  <!-- Modernizr /-->
	<!--[if IE 9]>
		<script src="js/comm/PIE_IE9.js"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script src="js/comm/PIE_IE678.js"></script>
	<![endif]-->

	<!--[if lt IE 9]>
		<script src="js/comm/html5shiv.js"></script>
	<![endif]-->

</head>

<body id="home">
	<!-- NavBar-->
	<nav class="navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#home">Coily</a>
			</div>
			
		

			<div class="collapse navbar-collapse navbar-right navbar-ex1-collapse">
				
				
				<ul class="nav navbar-nav">
					
				
					<li class="menuItem">
						<!-- Button trigger modal -->
						<a href="">Change View</a>
					</li>
				
					<li class="dropdown">
			        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"  aria-haspopup="true" aria-expanded="false">선민<span class="caret"></span></a>
			        	
			        		<div class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="top: 45px;width:350px;height:200px;">
			        			프로필입니다\n
			        			프로필입니다\n
			        			프로필입니다\n
			        			프로필입니다
			        			<button type="button" class="btn btn-default" onclick="javascript:alert(1)" style="margin-top: 30%;margin-left: 30px;">profile</button>
			        			<button type="button" class="btn btn-primary" onclick="javascript:alert(2)" style="margin-top: 30%;">logout</button>
			        			
			        		<!-- <ul class="dropdown-menu" role="menu" style="top: 45px;"> -->
			        			
				        		<!-- <li><a href="#">프로필</a></li>
				        		<li><a href="#">LogOut</a></li>
				        		<li><a href="#">Quiz Board</a></li>
				        		<li class="divider"></li>
				        		<li><a href="#">Separated link</a></li>
				        		<li class="divider"></li>
				        		<li><a href="#">One more separated link</a></li> -->
			        		<!-- </ul> -->
			        		</div>
			        </li>
					
					
				</ul>
			</div>
		   
		</div>
	</nav> 
	
	<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	
	<!-- What is -->
	<div id="whatis" class="content-section-b" style="border-top: 0">
		<div class="container">

			<div class="col-md-6 col-md-offset-3 text-center wrap_title">
				<h2>What is?</h2>
				<p class="lead" style="margin-top:0">A special thanks to Death.</p>
				
			</div>
			
			<div class="row">
			
				<div class="col-sm-4 wow fadeInDown text-center">
				  <img class="rotate" src="${pageContext.request.contextPath}/img/icon/tweet.svg" alt="Generic placeholder image">
				  <h3>Follow Me</h3>
				  <p class="lead">Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum. </p>

				  <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
				</div><!-- /.col-lg-4 -->
				
				<div class="col-sm-4 wow fadeInDown text-center">
				  <img  class="rotate" src="${pageContext.request.contextPath}/img/icon/picture.svg" alt="Generic placeholder image">
				   <h3>Gallery</h3>
				   <p class="lead">Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum. </p>
				   <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
				</div><!-- /.col-lg-4 -->
				
				<div class="col-sm-4 wow fadeInDown text-center">
				  <img  class="rotate" src="${pageContext.request.contextPath}/img/icon/retina.svg" alt="Generic placeholder image">
				   <h3>Retina</h3>
					<p class="lead">Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum. </p>
				  <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
				</div><!-- /.col-lg-4 -->
				
			</div><!-- /.row -->
				
			<div class="row tworow">
			
				<div class="col-sm-4  wow fadeInDown text-center">
				  <img class="rotate" src="${pageContext.request.contextPath}/img/icon/laptop.svg" alt="Generic placeholder image">
				  <h3>Responsive</h3>
				  <p class="lead">Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum. </p>
				 <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
				</div><!-- /.col-lg-4 -->
				
				<div class="col-sm-4 wow fadeInDown text-center">
				  <img  class="rotate" src="${pageContext.request.contextPath}/img/icon/map.svg" alt="Generic placeholder image">
				   <h3>Google</h3>
				   <p class="lead">Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum. </p>
				   <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
				</div><!-- /.col-lg-4 -->
				
				<div class="col-sm-4 wow fadeInDown text-center">
				  <img  class="rotate" src="${pageContext.request.contextPath}/img/icon/browser.svg" alt="Generic placeholder image">
				   <h3>Bootstrap</h3>
				 <p class="lead">Epsum factorial non deposit quid pro quo hic escorol. Olypian quarrels et gorilla congolium sic ad nauseum. </p>
				  <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
				</div><!-- /.col-lg-4 -->
				
			</div><!-- /.row -->
		</div>
	</div>
	
	<!-- Use it -->
    <div id ="useit" class="content-section-a">

        <div class="container">
			
            <div class="row">
			
				<div class="col-sm-6 pull-right wow fadeInRightBig">
                    <img class="img-responsive " src="${pageContext.request.contextPath}/img/ipad.png" alt="">
                </div>
				
                <div class="col-sm-6 wow fadeInLeftBig"  data-animation-delay="200">   
                    <h3 class="section-heading">Full Responsive</h3>
					<div class="sub-title lead3">Lorem ipsum dolor sit atmet sit dolor greand fdanrh<br> sdfs sit atmet sit dolor greand fdanrh sdfs</div>
                    <p class="lead">
						In his igitur partibus duabus nihil erat, quod Zeno commuta rest gestiret. 
						Sed virtutem ipsam inchoavit, nihil ampliusuma. Scien tiam pollicentur, 
						uam non erat mirum sapientiae lorem cupido
						patria esse cariorem. Quae qui non vident, nihilamane umquam magnum ac cognitione.
					</p>

					 <p><a class="btn btn-embossed btn-primary" href="#" role="button">View Details</a> 
					 <a class="btn btn-embossed btn-info" href="#" role="button">Visit Website</a></p>
				</div>   
            </div>
        </div>
        <!-- /.container -->
    </div>

    <div class="content-section-b"> 
		
		<div class="container">
            <div class="row">
                <div class="col-sm-6 wow fadeInLeftBig">
                     <div id="owl-demo-1" class="owl-carousel">
						<a href="${pageContext.request.contextPath}/img/iphone.png" class="image-link">
							<div class="item">
								<img  class="img-responsive img-rounded" src="${pageContext.request.contextPath}/img/iphone.png" alt="">
							</div>
						</a>
						<a href="${pageContext.request.contextPath}/img/iphone.png" class="image-link">
							<div class="item">
								<img  class="img-responsive img-rounded" src="${pageContext.request.contextPath}/img/iphone.png" alt="">
							</div>
						</a>
						<a href="${pageContext.request.contextPath}/img/iphone.png" class="image-link">
							<div class="item">
								<img  class="img-responsive img-rounded" src="${pageContext.request.contextPath}/img/iphone.png" alt="">
							</div>
						</a>
					</div>       
                </div>
				
                <div class="col-sm-6 wow fadeInRightBig"  data-animation-delay="200">   
                    <h3 class="section-heading">Drag Gallery</h3>
					<div class="sub-title lead3">Lorem ipsum dolor sit atmet sit dolor greand fdanrh<br> sdfs sit atmet sit dolor greand fdanrh sdfs</div>
                    <p class="lead">
						In his igitur partibus duabus nihil erat, quod Zeno commuta rest gestiret. 
						Sed virtutem ipsam inchoavit, nihil ampliusuma. Scien tiam pollicentur, 
						uam non erat mirum sapientiae lorem cupido
						patria esse cariorem. Quae qui non vident, nihilamane umquam magnum ac cognitione.
					</p>

					 <p><a class="btn btn-embossed btn-primary" href="#" role="button">View Details</a> 
					 <a class="btn btn-embossed btn-info" href="#" role="button">Visit Website</a></p>
				</div>  			
			</div>
        </div>
    </div>

    <div class="content-section-a">

        <div class="container">

             <div class="row">
			 
				<div class="col-sm-6 pull-right wow fadeInRightBig">
                    <img class="img-responsive " src="${pageContext.request.contextPath}/img/doge.png" alt="">
                </div>
			 
                <div class="col-sm-6 wow fadeInLeftBig"  data-animation-delay="200">   
                    <h3 class="section-heading">Font Awesome & Glyphicon</h3>
                    <p class="lead">A special thanks to Death to the Stock Photo for 
					providing the photographs that you see in this template. 
					</p>
					
					<ul class="descp lead2">
						<li><i class="glyphicon glyphicon-signal"></i> Reliable and Secure Platform</li>
						<li><i class="glyphicon glyphicon-refresh"></i> Everything is perfectly orgainized for future</li>
						<li><i class="glyphicon glyphicon-headphones"></i> Attach large file easily</li>
					</ul>
				</div>           
            </div>
        </div>

    </div>

	<!-- Screenshot -->
	<div id="screen" class="content-section-b">
        <div class="container">
          <div class="row" >
			 <div class="col-md-6 col-md-offset-3 text-center wrap_title ">
				<h2>Screen App</h2>
				<p class="lead" style="margin-top:0">A special thanks to Death.</p>
			 </div>
		  </div>
		    <div class="row wow bounceInUp" >
              <div id="owl-demo" class="owl-carousel">
				
				<a href="${pageContext.request.contextPath}/img/slide/1.png" class="image-link">
					<div class="item">
						<img  class="img-responsive img-rounded" src="${pageContext.request.contextPath}/img/slide/1.png" alt="Owl Image">
					</div>
				</a>
				
               <a href="${pageContext.request.contextPath}/img/slide/2.png" class="image-link">
					<div class="item">
						<img  class="img-responsive img-rounded" src="${pageContext.request.contextPath}/img/slide/2.png" alt="Owl Image">
					</div>
				</a>
				
				<a href="${pageContext.request.contextPath}/img/slide/3.png" class="image-link">
					<div class="item">
						<img  class="img-responsive img-rounded" src="${pageContext.request.contextPath}/img/slide/3.png" alt="Owl Image">
					</div>
				</a>
				
				<a href="${pageContext.request.contextPath}/img/slide/1.png" class="image-link">
					<div class="item">
						<img  class="img-responsive img-rounded" src="${pageContext.request.contextPath}/img/slide/1.png" alt="Owl Image">
					</div>
				</a>
				
               <a href="${pageContext.request.contextPath}/img/slide/2.png" class="image-link">
					<div class="item">
						<img  class="img-responsive img-rounded" src="${pageContext.request.contextPath}/img/slide/2.png" alt="Owl Image">
					</div>
				</a>
				
				<a href="${pageContext.request.contextPath}/img/slide/3.png" class="image-link">
					<div class="item">
						<img  class="img-responsive img-rounded" src="${pageContext.request.contextPath}/img/slide/3.png" alt="Owl Image">
					</div>
				</a>
              </div>       
          </div>
        </div>


	</div>
	
	<div  class="content-section-c ">
		<div class="container">
			<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center white">
				<h2>Get Live Updates</h2>
				<p class="lead" style="margin-top:0">A special thanks to Death.</p>
			 </div>
			<div class="col-md-6 col-md-offset-3 text-center">
				<div class="mockup-content">
						<div class="morph-button wow pulse morph-button-inflow morph-button-inflow-1">
							<button type="button "><span>Subscribe to our Newsletter</span></button>
							<div class="morph-content">
								<div>
									<div class="content-style-form content-style-form-4 ">
										<h2 class="morph-clone">Subscribe to our Newsletter</h2>
										<form>
											<p><label>Your Email Address</label><input type="text"/></p>
											<p><button>Subscribe me</button></p>
										</form>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>	
			</div>>
		</div>
	</div>	
	
	<!-- Credits -->
	<div id="credits" class="content-section-a">
		<div class="container">
			<div class="row">
			
			<div class="col-md-6 col-md-offset-3 text-center wrap_title">
				<h2>Credits</h2>
				<p class="lead" style="margin-top:0">A special thanks to Death.</p>
			 </div>
			 
				<div class="col-sm-6  block wow bounceIn">
					<div class="row">
						<div class="col-md-4 box-icon rotate"> 
							<i class="fa fa-desktop fa-4x "> </i> 
						</div>
						<div class="col-md-8 box-ct">
							<h3> Bootstrap </h3>
							<p> Lorem ipsum dolor sit ametconsectetur adipiscing elit. Suspendisse orci quam. </p>
						</div>
				  </div>
			  </div>
			  <div class="col-sm-6 block wow bounceIn">
					<div class="row">
					  <div class="col-md-4 box-icon rotate"> 
						<i class="fa fa-picture-o fa-4x "> </i> 
					  </div>
					  <div class="col-md-8 box-ct">
						<h3> Owl-Carousel </h3>
						<p> Nullam mo  arcu ac molestie scelerisqu vulputate, molestie ligula gravida, tempus ipsum.</p> 
					  </div>
					</div>
			  </div>
		  </div>
		  
		  <div class="row tworow">
				<div class="col-sm-6  block wow bounceIn">
					<div class="row">
						<div class="col-md-4 box-icon rotate"> 
							<i class="fa fa-magic fa-4x "> </i> 
						</div>
						<div class="col-md-8 box-ct">
							<h3> Codrops </h3>
							<p> Lorem ipsum dolor sit ametconsectetur adipiscing elit. Suspendisse orci quam. </p>
						</div>
				  </div>
			  </div>
			  <div class="col-sm-6 block wow bounceIn">
					<div class="row">
					  <div class="col-md-4 box-icon rotate"> 
						<i class="fa fa-heart fa-4x "> </i> 
					  </div>
					  <div class="col-md-8 box-ct">
						<h3> Lorem Ipsum</h3>
						<p> Nullam mo  arcu ac molestie scelerisqu vulputate, molestie ligula gravida, tempus ipsum.</p> 
					  </div>
					</div>
			  </div>
		  </div>
		</div>
	</div>
	
	<!-- Banner Download -->
	<div id="downloadlink" class="banner">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 text-center wrap_title">
				<h2>Download Free</h2>
				<p class="lead" style="margin-top:0">Pay with a Tweet</p>
				<p><a class="btn btn-embossed btn-primary view" role="button">Free Download</a></p> 
			 </div>
			</div>
		</div>
	</div>
	
	<!-- Contact -->
	<div id="contact" class="content-section-a">
		<div class="container">
			<div class="row">
			
			<div class="col-md-6 col-md-offset-3 text-center wrap_title">
				<h2>Contact Us</h2>
				<p class="lead" style="margin-top:0">A special thanks to Death.</p>
			</div>
			
			<form role="form" action="" method="post" >
				<div class="col-md-6">
					<div class="form-group">
						<label for="InputName">Your Name</label>
						<div class="input-group">
							<input type="text" class="form-control" name="InputName" id="InputName" placeholder="Enter Name" required>
							<span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
						</div>
					</div>
					
					<div class="form-group">
						<label for="InputEmail">Your Email</label>
						<div class="input-group">
							<input type="email" class="form-control" id="InputEmail" name="InputEmail" placeholder="Enter Email" required  >
							<span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
						</div>
					</div>
					
					<div class="form-group">
						<label for="InputMessage">Message</label>
						<div class="input-group">
							<textarea name="InputMessage" id="InputMessage" class="form-control" rows="5" required></textarea>
							<span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
						</div>
					</div>

					<input type="submit" name="submit" id="submit" value="Submit" class="btn wow tada btn-embossed btn-primary pull-right">
				</div>
			</form>
			
			<hr class="featurette-divider hidden-lg">
				<div class="col-md-5 col-md-push-1 address">
					<address>
					<h3>Office Location</h3>
					<p class="lead"><a href="https://www.google.com/maps/preview?ie=UTF-8&q=The+Pentagon&fb=1&gl=us&hq=1400+Defense+Pentagon+Washington,+DC+20301-1400&cid=12647181945379443503&ei=qmYfU4H8LoL2oATa0IHIBg&ved=0CKwBEPwSMAo&safe=on">The Pentagon<br>
					Washington, DC 20301</a><br>
					Phone: XXX-XXX-XXXX<br>
					Fax: XXX-XXX-YYYY</p>
					</address>

					<h3>Social</h3>
					<li class="social"> 
					<a href="#"><i class="fa fa-facebook-square fa-size"> </i></a>
					<a href="#"><i class="fa  fa-twitter-square fa-size"> </i> </a> 
					<a href="#"><i class="fa fa-google-plus-square fa-size"> </i></a>
					<a href="#"><i class="fa fa-flickr fa-size"> </i> </a>
					</li>
				</div>
			</div>
		</div>
	</div>
	
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h3 class="footer-title">Coily</h3>
			
			<!-- LICENSE -->
			<a rel="cc:attributionURL" href="http://www.andreagalanti.it/flatfy" property="dc:title">Coily Theme </a>
			by
		   	<a rel="dc:creator" href="http://www.andreagalanti.it" property="cc:attributionName">Andrea Galanti</a>
		   	is licensed to the public under 
		   	<BR>the <a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/it/deed.it">
		   	Creative Commons Attribution 3.0 License - NOT COMMERCIAL</a>.
         </div> <!-- /col-xs-7 -->

          <div class="col-md-5">
            <div class="footer-banner">
              <h3 class="footer-title">Coily Theme</h3>
              <ul>
                <li>a</li>
                <li>b</li>
                <li>c</li>
                <li>d</li>
                <li>e</li>
              </ul>
              Go to: <a href="http://andreagalanti.it/flatfy" target="_blank">andreagalanti.it/flatfy</a>
            </div>
          </div>
        </div>
      </div>
    </footer>

	 <!-- JavaScript -->
    <script src="${pageContext.request.contextPath}/js/comm/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/js/comm/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/owl.carousel.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/script.js"></script>
	<!-- StikyMenu -->
	<script src="${pageContext.request.contextPath}/js/comm/stickUp.min.js"></script>
	<script type="text/javascript">
	  jQuery(function($) {
		$(document).ready( function() {
		  $('.navbar-default').stickUp();
		  
		});
	  });
	
	</script>
	<!-- Smoothscroll -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/comm/jquery.corner.js"></script> 
	<script src="${pageContext.request.contextPath}/js/comm/wow.min.js"></script>
	<script>
	 new WOW().init();
	</script>
	<script src="${pageContext.request.contextPath}/js/comm/classie.js"></script>
	<script src="${pageContext.request.contextPath}/js/comm/uiMorphingButton_inflow.js"></script>
	<!-- Magnific Popup core JS file -->
	<script src="${pageContext.request.contextPath}/js/comm/jquery.magnific-popup.js"></script> 
</body>
</html>