<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="wdth=device-width, initial-scale=1.0">
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
                            <h2><b>Ranking de Atores Poliglotas</b></h2>
                            <p id="queryText">Visualize o ranking de atores que participaram de mais filmes em idiomas diferentes!</p>
                        </div>
                    </div><!-- row -->
                </div><!-- container -->
            </div><!-- blue wrap -->

            <div class="container w">

                <input type="hidden" name="n_lang_min" id="n_lang_min" value="1" >
                <input type="hidden" name="n_lang_max" id="n_lang_max" value="32" >

                <div class="row" id="sumir">
                    <div class="col-lg-offset-2 col-lg-8 col-md-8">
                    
                    <div class="col-lg-offset-1 col-lg-5 col-md-5">
                        <h2>Opções de visualização:</h2>
                        <div class="row"><label> <input type="radio" name="ranking_completo" id="ranking_completo_0" value="0" checked="checked"> Ranking Agrupado </label></div>
                        <div class="row">    <label> <input type="radio" name="ranking_completo" id="ranking_completo_1" value="1"> Ranking Tradicional </label></div>

                    </div>
                    
                    <div class="col-lg-offset-1 col-lg-5 col-md-5">
                        <h2>Filtrar entrada:</h2>

                        <div class="row">
                            <label> <input  type="checkbox" name="apartir" id="apartir"> Filtrar a partir de: </label> <input id="iapartir" size="3" type="text" placeholder="1" onclick="$('#apartir').prop('checked', true);"> <label for="apartir"> idiomas.</label>
                        </div>
                        <div class="row">
                            <label> <input type="checkbox" name="ate" id="ate"> E Até: </label> <input id="iate" size="3" type="text" placeholder="32" onclick="$('#ate').prop('checked', true);"><label for="ate"> idiomas.</label>
                        </div>
                    </div>
                         
                    </div>

                    
                </div>

                <div id="myModal" class="modal">

                    <!-- Modal content -->
                    <div id="modal-content" class="modal-content">


                    </div>

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
                            modal = document.getElementById('myModal');
                            $("#l3").addClass("active");
                            $('#qtd').hide();
                            $('input:radio[name="linguas"]').change(function () {
                                if ($(this).val() == '1') {
                                    $("#qtd").show();
                                } else {
                                    $('#qtd').hide();
                                }
                            });
                            // When the user clicks anywhere outside of the modal, close it
                            window.onclick = function (event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                            $(document).keyup(function (e) {
                                if (e.keyCode === 27)
                                    modal.style.display = "none";

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
                        // Linda função recursiva

                        // Roda quando a pessoa clica em Gerar!
                        function validar() {
                            var number1 = (isInt($('#iapartir').val())) ? $('#iapartir').val() : false;
                            var number2 = (isInt($('#iate').val())) ? $('#iate').val() : false;


                            if ($('#apartir').is(":checked")) {
                                if (number1 && number1 >= 1 && number1 <= 32) {
                                    $("#n_lang_min").val(number1);
                                } else {
                                    alert("Entrada Inválida no campo A partir!");
                                    return;
                                }

                            } else {
                                $("#n_lang_min").val(1);

                            }

                            if ($('#ate').is(":checked")) {

                                if (number2 && $('#apartir').is(":checked") && parseInt(number1) > parseInt(number2)) {
                                    alert("A partir maior do que até!");
                                    return;
                                } else if (number2 && number2 >= 1 && number2 <= 32) {
                                    $("#n_lang_max").val(number2);
                                } else {
                                    alert("Entrada inválida no campo Até!");
                                    return;
                                }

                            } else {
                                $("#n_lang_max").val(32);

                            }


                            if (document.getElementById('ranking_completo_1').checked) {
                                paginacao_completa($("#n_lang_min").val(), $("#n_lang_max").val(), 25);
                            } else if (document.getElementById('ranking_completo_0').checked)
                            {
                                paginacao_agrupada($("#n_lang_min").val(), $("#n_lang_max").val(), 10);
                            } else {
                                return;
                            }
                            $("#sumir").hide();
                            $("#divbotao").html('<i class="fa fa-spinner fa-spin" style="font-size:24px; color:#3498db; margin-right: 5px"></i><p style="color: black">Carregando informações!</p>');
                        }

                        function paginacao_completa(min, max, limite) {
                            // Funcao que carrega paginas:
                            function addConteudo(pagina) {
                                document.getElementById('content-geral').innerHTML = '<i class="fa fa-spinner fa-spin" style="font-size:24px"></i>Carregando informações! '; // Carregando...
                                $url = "/Ranking?opcao=pagina&completa=1&n_lang_min=" + min + "&n_lang_max=" + max + "&limit=" + limite + "&offset=" + ((pagina - 1) * limite);
                                console.log($url);
                                $.get($url, function (array_de_atores) {
                                    $('#content-geral').html("");
                                    $.each(array_de_atores, function (index, ator) {
                                        document.getElementById('content-geral').innerHTML += "<tag style='cursor: pointer;' onclick='mostrar_modal(" + ator.ActorId + ", \"" + ator.ActorName + "\")'>" + ((index + 1) + limite * (-1 + pagina)) + ". " + ator.ActorName + " - (" + ator.n_lang + " idiomas)</tag> <br />";
                                    });
                                });
                            }
                            // Criando a div de paginacao
                            $('#content').html("<div id='content-geral'></div> <div id='pag-geral'></div> ");
                            //Calculando o número total de atores e criando a paginacao:
                            $url = "/Ranking?opcao=qtd&completa=1&n_lang_min=" + min + "&n_lang_max=" + max;
                            $.get($url, function (quantidade_de_atores_no_total) {
                                $("#divbotao").html(' <input class="btn btn-primary" type="button" value="Novo Ranking!" onclick="window.location = window.location.pathname;">');
                                $('#pag-geral').pagination({
                                    items: quantidade_de_atores_no_total,
                                    itemsOnPage: limite,
                                    hrefTextPrefix: "#pag",
                                    onInit: function () {
                                        $('#content-geral').css("min-height", "10em");
                                        $('#content-geral').css("font-size", "1em");
                                        addConteudo(1); // Init, carrega pagina 1
                                    },
                                    onPageClick: function (pageNumber) {
                                        addConteudo(pageNumber);
                                    }
                                });
                            });
                        }
                        function mostrar_modal(act_id, act_name) {
                            $.get('https://api.themoviedb.org/3/search/person?api_key=088e7711438e5b1544142df8f44709de&query=' + encodeURI(act_name), function (json) {
                                modal.style.display = "block";
                                $stringona = "<div class='col-md-3 col-lg-3'><img alt='" + act_name + "' src='";
                                if (json.results[0] && json.results[0].profile_path) { // Se o personagem tem imagem:
                                    $stringona = $stringona + "https://image.tmdb.org/t/p/w92/" + json.results[0].profile_path;
                                } else {
                                    $stringona = $stringona + "/assets/img/notfound.jpg";
                                }
                                $stringona = $stringona + "'></img> </div>" + "<div class='col-lg-offset-1 col-md-7 col-lg-7'> <div class='row'><h1>" + act_name 
                                        + ":</h1></div><div class='row'> <h3> Trabalhou em:</h3> </div> <div id='movies_feitos'>  <i class='fa fa-spinner fa-spin' style='font-size:24px'></i>Carregando informações! </div> </div>";
                                $('#modal-content').html($stringona);
                                $url = '/Ranking?opcao=top10&act_id=' + act_id;
                                $.get($url, function (movies) {
                                    $("#movies_feitos").html("<ul>")
                                    $.each(movies, function (index, movie) {
                                        $("#movies_feitos").append("<li>" + movie.title + "</li>");
                                    });
                                    $("#movies_feitos").append("</ul>")

                                });
                            });
                        }

                        function paginacao_agrupada(min, max, limite) {
                            /*Declaração de funções usadas*/
                            function carregar(n_lang, limit) { // da init nas paginas dos rankinhos
                                if (n_lang > 0 && document.getElementById('pag-' + n_lang)) {
                                    addConteudo(n_lang, 1);
                                    carregar(n_lang - 1, limit);
                                } else if (n_lang > 0) {
                                    carregar(n_lang - 1, limit);
                                }
                            }

                            function addConteudo(n_lang, pagina) {
                                document.getElementById('content-' + n_lang).innerHTML = '<i class="fa fa-spinner fa-spin" style="font-size:24px"></i>Carregando informações! '; // Carregando...
                                $url = "/Ranking?opcao=pagina&completa=0&n_lang=" + n_lang + "&limit=" + limite + "&offset=" + ((pagina - 1) * limite);
                                $.get($url, function (array_de_atores) {
                                    document.getElementById('content-' + n_lang).innerHTML = "";
                                    $.each(array_de_atores, function (index, ator) {
                                        document.getElementById('content-' + n_lang).innerHTML += " <tag style='cursor: pointer;' onclick='mostrar_modal(" + ator.ActorId + ", \"" + ator.ActorName + "\")'>" + ((index + 1) + limite * (pagina - 1)) + ". " + ator.ActorName + "</tag><br />";
                                    });
                                });
                            }
                            // Buscando quais sao as divs que vao ter:
                            $url = "/Ranking?opcao=quaispaginas&n_lang_min=" + min + "&n_lang_max=" + max;
                            $.ajax({
                                type: "GET",
                                url: $url,
                                dataType: "json",
                                timeout: 5000,
                                error: function () {
                                    alert("Tempo esgotado!");
                                },
                                success: function (data) {
                                    $("#divbotao").html(' <input class="btn btn-primary" type="button" value="Novo Ranking!" onclick="window.location = window.location.pathname;">');
                                    $.each(data, function (index, value) {
                                        //Criando os botões de colapso:
                                        $('#content').append("  <div class='row'><button data-toggle='collapse' data-target='#collapso-" + value + "'> Mostrar Ranking " + value + " </button> <div class='collapse' id='collapso-" + value + "'> <div  id='content-" + value + "'> Carregando... </div><div id='pag-" + value + "'> </div></div> </div>");
                                        $.get("/Ranking?opcao=qtd&completa=0&n_lang=" + value, function (quantidade_de_atores_na_pagina) {
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
