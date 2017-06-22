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
        
        <section id="query2Content">
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
                <form id="radioQuery2">
                    <input type="hidden" name="n_linguas" id="n_linguas">
                    <div class="row" id="sumir1">
                        <div class="col-lg-offset-4 col-lg-4">
                            <label> 
                                <input type="radio" name="linguas" id="todas_as_linguas" value="0" checked="checked"> 
                                Mostrar Ranking Completo! 
                            </label>
                        </div>
                    </div>
                    <div class="row" id="sumir2">
                        <div class="col-lg-offset-4 col-lg-2">
                            <label> 
                                <input type="radio" name="linguas" id="apenas_x_linguas" value="1">
                                Filtrar... 
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-offset-4 col-lg-4">
                            <div id="qtd"> 
                                <div id="labelFrst" class="col-lg-4"><label id="smallLbl"> A partir de: </label></div>
                                <div class="col-lg-4"><input class="form-control" id="x" name="x" required type="text" size="2" title="Apenas números por favor!" pattern="^[0-9]+$"></div>
                                <div id="labelLang" class="col-lg-3"><label id="smallLbl">línguas</label></div>
                            </div>
                        </div>
                    </div>
                    <div class="row centered" id="divbotao">
                        <input id="buttonQuery2" class="btn btn-primary" type="button" value="Gerar!" onclick="validar()">
                    </div>
                    <div id="content">

                    </div>
                </form>
            </div><!-- container -->
        </section>

        <%@include file="rodape.jsp" %>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <link href="assets/css/simplePagination.css" rel="stylesheet">
        <script type="text/javascript" src="assets/js/jquery.simplePagination.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function () {
                $("#l3").addClass("active");
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
                $("#sumir1").hide();
                $("#sumir2").hide();
                $("#divbotao").html('<i class="fa fa-spinner fa-spin" style="font-size:24px"></i>Carregando informações! ');
                // Itens por página:
                var limite = 10;
                $.ajax({
                    type: "GET",
                    url: "Ranking?criar=1&n_lang=" + $("#n_linguas").val(),
                    dataType: "json",
                    timeout: 5000,
                    error: function () {
                        alert("Tempo esgotado!");
                    },
                    success: function (data) {
                        $.each(data, function (index, value) {
                            $("#divbotao").html("");
                            //Criando os botões de colapso:
                            $('#content').append("  <div class='row'><button data-toggle='collapse' data-target='#collapso-" + value + "'> Mostrar Ranking " + value + " </button> <div class='collapse' id='collapso-" + value + "'> <div  id='content-" + value + "'> Carregando... </div><div id='pag-" + value + "'> </div></div> </div>");
                            $.get("/Ranking?criar=0&n_lang=" + value, function (quantidade_de_atores_na_pagina) {
                                if (quantidade_de_atores_na_pagina > limite) {
                                    $('#pag-' + value).pagination({
                                        items: quantidade_de_atores_na_pagina,
                                        itemsOnPage: limite,
                                        hrefTextPrefix: "#pag",
                                        onInit: function () {
                                            $('#content-' + value).css("min-height", "10em");
                                            $('#content-' + value).css("font-size", "1em");
                                        },
                                        onPageClick: function (pageNumber) {
                                            document.getElementById('content-' + value).innerHTML = '<i class="fa fa-spinner fa-spin" style="font-size:24px"></i>Carregando informações! '; // Carregando...
                                            $.get("/Ranking?criar=0&n_lang=" + value + "&limit=" + limite + "&offset=" + ((pageNumber - 1) * limite), function (array_de_atores) {
                                                document.getElementById('content-' + value).innerHTML = "";
                                                $.each(array_de_atores, function (index, ator) {
                                                    console.log(ator);
                                                    document.getElementById('content-' + value).innerHTML += (index + 1) + limite * (pageNumber - 1) + ". " + ator.ActorName + "<br />";
                                                });
                                            });
                                        }
                                    }
                                    );
                                }
                            });
                        });
                        // init vem aqui //
                        function carregar(pagina) {
                            if (pagina > 0 && document.getElementById('pag-' + pagina)) {
                                console.log(pagina);
                                document.getElementById('content-' + pagina).innerHTML = '<i class="fa fa-spinner fa-spin" style="font-size:24px"></i>Carregando informações! '; // Carregando...
                                $.get("/Ranking?criar=0&n_lang=" + pagina + "&limit=" + limite + "&offset=0", function (array_de_atores) {
                                    document.getElementById('content-' + pagina).innerHTML = "";
                                    $.each(array_de_atores, function (index, ator) {
                                        document.getElementById('content-' + pagina).innerHTML += (index + 1) + ". " + ator.ActorName + "<br />";
                                    });
                                    carregar(pagina - 1);
                                });
                            } else if (pagina > 0) {
                                carregar(pagina - 1);
                            }
                        }
                        carregar(32);
                    }
                }
                );
                console.log("depois do ajax");
            }
        </script>
    </body>
</html>
