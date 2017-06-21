<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <title>Cinedata</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/font-awesome.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="assets/css/newcss.css" rel="stylesheet">
    </head>
    
    <body>
        <%@include file= "cabecalho.jsp" %>
	
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
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
