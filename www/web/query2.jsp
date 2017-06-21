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

        <title>Ranking</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/font-awesome.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="assets/css/newcss.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="cabecalho.jsp" %>
        
        <div id="blue">
            <div class="container">
                <div class="row centered">
                    <div class="col-lg-8 col-lg-offset-2">
                        <h4><b>Ranking de Atores Poliglotas</b></h4>
                        <p>Visualize o ranking de atores que participaram de uma maior quantidade de filmes em idiomas diferentes!.</p>
                    </div>
                </div><!-- row -->
            </div><!-- container -->
        </div><!-- blue wrap -->

        <div class="container w">
            <form>
                <input type="hidden" name="n_linguas" id="n_linguas">
                <div class="row centered" id="sumir1">
                    <label> <input type="radio" name="linguas" id="todas_as_linguas" value="0" checked="checked"> Mostrar Ranking Completo! </label>
                </div>
                <div class="row centered" id="sumir2">
                    <div class="col-lg-12">
                        <label> <input type="radio" name="linguas" id="apenas_x_linguas" value="1"> Filtrar... </label><br />
                        <div id="qtd"> <label> A partir de: <input id="x" name="x" required type="text" size="2" title="Apenas números por favor!" pattern="^[0-9]+$"> línguas </label> </div>

                    </div>
                </div>
                <div class="row centered" id="divbotao">
                    <input type="button" value="Gerar!" onclick="validar()">
                </div>
                <div id="content">

                </div>
            </form>
        </div><!-- container -->

        <%@include file="rodape.jsp" %>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <link href="assets/css/simplePagination.css" rel="stylesheet">

        <script type="text/javascript" src="assets/js/jquery.simplePagination.js"></script>
    </body>
</html>
