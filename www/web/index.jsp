<%@include file= "cabecalho.jsp" %>

  <body>
	<div id="headerwrap">
		<div class="container">
			<div class="row centered">
				<div class="col-lg-8 col-lg-offset-2">
                                    <h1><b>CineData</b></h1>
				<h2>O banco de filmes BR</h2>
				</div>
			</div><!-- row -->
		</div><!-- container -->
	</div><!-- headerwrap -->


	<div class="container w">
		<div class="row centered">
			<br><br>
			<div class="col-lg-4">
				<i class="fa fa-heart"></i>
				<h4>DESIGN</h4>
				<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even believable.</p>
			</div><!-- col-lg-4 -->

			<div class="col-lg-4">
				<i class="fa fa-laptop"></i>
				<h4>BOOTSTRAP</h4>
				<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even believable.</p>
			</div><!-- col-lg-4 -->

			<div class="col-lg-4">
				<i class="fa fa-trophy"></i>
				<h4>SUPPORT</h4>
				<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even believable.</p>
			</div><!-- col-lg-4 -->
		</div><!-- row -->
		<br>
		<br>
	</div><!-- container -->


	<!-- PORTFOLIO SECTION -->
	<div id="dg">
		<div class="container">
			<div class="row centered">
				<h4>LATEST WORKS</h4>
				<br>
				<div class="col-lg-4">
					<div class="tilt">
					<a href="#"><img src="assets/img/p01.png" alt=""></a>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="tilt">
					<a href="#"><img src="assets/img/p03.png" alt=""></a>
					</div>
				</div>

				<div class="col-lg-4">
					<div class="tilt">
					<a href="#"><img src="assets/img/p02.png" alt=""></a>
					</div>
				</div>
			</div><!-- row -->
		</div><!-- container -->
	</div><!-- DG -->


	<!-- FEATURE SECTION -->
	<div class="container wb">
		<div class="row centered">
			<br><br>
			<div class="col-lg-8 col-lg-offset-2">
				<h4>WE CREATE FIRST CLASS DESIGN</h4>
				<p>By being true to the brand we represent, we elevate the audiences’ relationship to it. Like becomes love becomes a passion. Passion becomes advocacy. And we see the brand blossom from within, creating a whole story the audience embraces. That’s when the brand can truly flex its muscles.</p>
			<p><br/><br/></p>
			</div>
			<div class="col-lg-2"></div>
			<div class="col-lg-10 col-lg-offset-1">
				<img class="img-responsive" src="assets/img/munter.png" alt="">
			</div>
		</div><!-- row -->
	</div><!-- container -->

	
<%@include file = "rodape.jsp" %>
    <script>
    $(document).ready(function(){
      $("#l1").addClass("active");
      
    });   
    </script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
  </body>
</html>
