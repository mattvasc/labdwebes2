<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="assets/ico/favicon.png">

        <title>CineData: Consulta 2</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/css/simplePagination.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="assets/css/main.css" rel="stylesheet">
        <script type="text/javascript" src="assets/js/jquery-3.2.1.min.js"></script>

        <script type="text/javascript" src="assets/js/jquery.simplePagination.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <!-- Fixed navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">SP<i class="fa fa-circle"></i>T</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">HOME</a></li>
                        <li><a href="works.jsp">WORKS</a></li>
                        <li class="active"><a href="services.jsp">Ranking</a></li>
                        <li><a href="about.jsp">ABOUT</a></li>

                        <li><a data-toggle="modal" data-target="#myModal" href="#myModal"><i class="fa fa-envelope-o"></i></a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>

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
                <div class="row centered">
                    <label> <input type="radio" name="linguas" id="todas_as_linguas" value="0" checked="checked"> Mostrar Ranking Completo! </label>
                </div>
                <div class="row centered">
                    <div class="col-lg-12">
                        <label> <input type="radio" name="linguas" id="apenas_x_linguas" value="1"> Filtrar... </label><br />
                        <div id="qtd"> <label> A partir de: <input id="x" name="x" required type="text" size="2" title="Apenas números por favor!" pattern="^[0-9]+$"> línguas </label> </div>

                    </div>
                </div>
                <div class="row centered">
                    <input type="button" value="Gerar!" onclick="validar()">
                </div>
                <div id="content">

                </div>

            </form>
        </div><!-- container -->




        <!-- FOOTER -->
        <div id="f">
            <div class="container">
                <div class="row centered">
                    <a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-dribbble"></i></a>

                </div><!-- row -->
            </div><!-- container -->
        </div><!-- Footer -->


        <!-- MODAL FOR CONTACT -->
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">contact us</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row centered">
                            <p>We are available 24/7, so don't hesitate to contact us.</p>
                            <p>
                                Somestreet Ave, 987<br/>
                                London, UK.<br/>
                                +44 8948-4343<br/>
                                hi@blacktie.co
                            </p>
                            <div id="mapwrap">
                                <iframe height="300" width="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.es/maps?t=m&amp;ie=UTF8&amp;ll=52.752693,22.791016&amp;spn=67.34552,156.972656&amp;z=2&amp;output=embed"></iframe>
                            </div>	
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Save & Go</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <script src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript">
                        $(document).ready(function () {

                            $('#qtd').hide();
                            $('input:radio[name="linguas"]').change(function () {
                                if ($(this).val() == '1') {
                                    $("#qtd").show();
                                } else {
                                    $('#qtd').hide();
                                }
                            });
                        });
                        // Roda quando a pessoa clica em Gerar!
                        function validar() {

                            if (document.getElementById('apenas_x_linguas').checked) {

                                // VALIDAR ENTRADA ::::::::::::::::::::::::::::::::::::::::::::::::::::::::

                                $("#n_linguas").val($("#x").val());
                            } else if (document.getElementById('todas_as_linguas').checked) {
                                $("#n_linguas").val('1');
                            }

                            // Chama ajax pro servelet /Ranking passando as informações criar=1, e o n_lang

                            // Itens por página:
                            var limite = 10;
                            console.log("antes do ajax");
                            $.ajax({
                                type: "GET",
                                url: "Ranking?criar=1&n_lang=" + $("#n_linguas").val(),
                                dataType: "json",
                                timeout: 5000,
                                error: function () {
                                    alert("Tempo esgotado!");
                                },
                                success: function (data) {
                                    console.log("dentro do ajax:: "+data    );

                                    $.each(data, function (index, value) {
                                        console.log("dentro do ajax: " + value);

                                        //Criando os botões de colapso:
                                        $('#content').append("  <div class='row'><button data-toggle='collapse' data-target='#collapso-" + value + "'> Mostrar Ranking " + value + " </button> <div class='collapse' id='collapso-" + value + "'> <div  id='content-" + value + "'> Carregando... </div><div id='pag-" + value + "'> </div></div> </div>");
                                        $.get("/Ranking?criar=0&n_lang=" + value, function (quantidade_de_atores_na_pagina) {
                                            $('#pag-' + value).pagination({
                                                items: quantidade_de_atores_na_pagina,
                                                itemsOnPage: limite,
                                                hrefTextPrefix: "#pag",
                                                onPageClick: function (pageNumber) {
                                                    document.getElementById('content-' + value).innerHTML = "";
                                                    $.get("/Ranking?criar=0&n_lang=" + value + "&limit=" + limite + "&offset=" + ((pageNumber - 1) * limite), function (array_de_atores) {
                                                        $.each(array_de_atores, function (index, ator) {
                                                            console.log(ator);
                                                            document.getElementById('content-' + value).innerHTML += ator.ActorName + "<br />";

                                                        });
                                                    });

                                                }
                                            }
                                            );
                                        });
                                    });
                                }
                            }
                            );
                            console.log("depois do ajax");

                        }


        </script>
    </body>
</html>
