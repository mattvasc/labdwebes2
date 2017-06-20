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
