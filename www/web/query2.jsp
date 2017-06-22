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

                <input type="hidden" name="n_linguas" id="n_linguas">
                <div class="row" id="sumir">

                    <div class="row">
                        <div id="divLabel1" class="col-lg-offset-2 col-lg-6 col-md-6">
                            <label>Op��es de visualiza��o:</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-6 col-md-6">
                            <div class="row" id="query2input">
                                <label> 
                                    <input type="radio" name="ranking_completo" id="ranking_completo_0" value="0" checked="checked"> 
                                    Ranking Agrupado 
                                </label>
                                <label> 
                                    <input type="radio" name="ranking_completo" id="ranking_completo_1" value="1"> 
                                    Ranking Tradicional 
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div id="divLabel1" class="col-lg-offset-2 col-lg-6 col-md-6">
                            <label>Op��es de Ranking</label>
                        </div>
                    </div>
                    <div class="row" id="selectQuery2">
                        <div class="col-lg-offset-2 col-lg-7 col-md-7">
                            <div class="row">
                                <select multiple class="form-control">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    
<!--                    <div class="row">
                        <div class="col-lg-offset-4 col-lg-4">
                            <label> 
                                <input type="radio" name="linguas" id="todas_as_linguas" value="0" checked="checked"> 
                                Mostrar Ranking Completo! 
                            </label>
                        </div>
                    </div>
                        <div class="row" >
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
                                    <div class="col-lg-4"><input class="form-control" id="x" name="x" required type="text" size="2" title="Apenas n�meros por favor!" pattern="^[0-9]+$"></div>
                                    <div id="labelLang" class="col-lg-3"><label id="smallLbl">l�nguas</label></div>
                                </div>
                            </div>
                        </div>
                    </div>-->                    
                </div>
                <div id="content" class="row">

                </div>
                <div class="row centered" id="divbotao">
                    <input id="buttonQuery2" class="btn btn-primary" type="button" value="Gerar!" onclick="validar()">
                </div>

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
                            $("#x").keypress(function (e) {
                                if (e.which == 13) {
                                    validar();
                                }
                            });
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

                        // Verifica entrada
                        function isInt(value) {
                            var x;
                            if (isNaN(value)) {
                                return false;
                            }
                            x = parseFloat(value);
                            return (x | 0) === x;
                        }
                        // Linda fun��o recursiva

                        // Roda quando a pessoa clica em Gerar!
                        function validar() {
                            if (document.getElementById('apenas_x_linguas').checked) {
                                if (isInt($("#x").val()))
                                    $("#n_linguas").val($("#x").val());
                                else {
                                    alert("Insira uma entrada v�lida!");
                                    return;
                                }
                            } else if (document.getElementById('todas_as_linguas').checked) {
                                $("#n_linguas").val('1');
                            } else {
                                return;
                            }

                            if (document.getElementById('ranking_completo_1').checked)
                            {
                                paginacao_completa($("#n_linguas").val(), 20);
                            } else if (document.getElementById('ranking_completo_0').checked)
                            {
                                paginacao_agrupada($("#n_linguas").val(), 10);
                            } else {
                                return;
                            }

                            $("#sumir").hide();
                            $("#divbotao").html('<i class="fa fa-spinner fa-spin" style="font-size:24px"></i>Carregando informa��es! ');


                        }

                        function paginacao_completa(value, limite) {
                            function addConteudo(pagina) {
                                document.getElementById('content-geral').innerHTML = '<i class="fa fa-spinner fa-spin" style="font-size:24px"></i>Carregando informa��es! '; // Carregando...
                                $.get("/Ranking?criar=0&completa=1&n_lang=" + value + "&limit=" + limite + "&offset=" + ((pagina - 1) * limite), function (array_de_atores) {
                                    $('#content-geral').html("");
                                    $.each(array_de_atores, function (index, ator) {
                                        document.getElementById('content-geral').innerHTML += (index + 1) + limite * (-1 + pagina) + ". " + ator.ActorName + " - (" + ator.n_lang + " idiomas) <br />";
                                    });
                                });
                            }
                            $('#content').html("<div id='content-geral'></div> <div id='pag-geral'></div> ");
                            $.get("/Ranking?criar=0&completa=1&n_lang=" + value, function (quantidade_de_atores_no_total) {
                                $("#divbotao").html(' <input class="btn btn-primary" type="button" value="Novo Ranking!" onclick="window.location = window.location.pathname;">');
                                $('#pag-geral').pagination({
                                    items: quantidade_de_atores_no_total,
                                    itemsOnPage: limite,
                                    hrefTextPrefix: "#pag",
                                    onInit: function () {
                                        $('#content-geral').css("min-height", "10em");
                                        $('#content-geral').css("font-size", "1em");
                                    },
                                    onPageClick: function (pageNumber) {
                                        addConteudo(pageNumber);
                                    }

                                });
                                addConteudo(1); // Init
                            });
                        }

                        function paginacao_agrupada(n_linguas, limite) {
                            /*Declara��o de fun��es usadas*/
                            function carregar(n_lang, limit) { // da init nas paginas dos rankinhos
                                if (n_lang > 0 && document.getElementById('pag-' + n_lang)) {
                                    addConteudo(n_lang, 1);
                                    carregar(n_lang - 1, limit);

                                } else if (n_lang > 0) {
                                    carregar(n_lang - 1, limit);
                                }
                            }

                            function addConteudo(n_lang, pagina) {
                                document.getElementById('content-' + n_lang).innerHTML = '<i class="fa fa-spinner fa-spin" style="font-size:24px"></i>Carregando informa��es! '; // Carregando...
                                $.get("/Ranking?criar=0&completa=0&n_lang=" + n_lang + "&limit=" + limite + "&offset=" + ((pagina - 1) * limite), function (array_de_atores) {
                                    document.getElementById('content-' + n_lang).innerHTML = "";
                                    $.each(array_de_atores, function (index, ator) {
                                        document.getElementById('content-' + n_lang).innerHTML += (index + 1) + limite * (pagina - 1) + ". " + ator.ActorName + "<br />";
                                    });
                                });
                            }
                            // Itens por p�gina:
                            $.ajax({
                                type: "GET",
                                url: "Ranking?criar=1&n_lang=" + n_linguas + "&completa=0",
                                dataType: "json",
                                timeout: 5000,
                                error: function () {
                                    alert("Tempo esgotado!");
                                },
                                success: function (data) {
                                    $("#divbotao").html(' <input class="btn btn-primary" type="button" value="Novo Ranking!" onclick="window.location = window.location.pathname;">');

                                    $.each(data, function (index, value) {
                                        //Criando os bot�es de colapso:
                                        $('#content').append("  <div class='row'><button class='btn btn-default' data-toggle='collapse' data-target='#collapso-" + value + "'> Mostrar Ranking " + value + " </button> <div class='collapse' id='collapso-" + value + "'> <div  id='content-" + value + "'> Carregando... </div><div id='pag-" + value + "'> </div></div> </div>");
                                        $.get("/Ranking?criar=0&completa=0&n_lang=" + value, function (quantidade_de_atores_na_pagina) {
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
                                                        addConteudo(value, pageNumber);
                                                    }
                                                });
                                            }
                                        });
                                    });
                                    // init vem aqui //

                                    carregar(32, limite);
                                }
                            });
                        }
        </script>
    </body>
</html>
