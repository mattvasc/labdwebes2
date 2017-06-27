<%@page import="java.util.List"%>
<%@page import="Model.Genero"%>

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
        <script src="assets/js/jquery.simplePagination.js"></script>


        <title>Busca Avançada</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/simplePagination.css" rel="stylesheet">

        <link href="assets/css/font-awesome.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="assets/css/newcss.css" rel="stylesheet">
    </head>
    <body>
        <%@include file= "cabecalho.jsp" %>

        <section> 
            <div id="blue">
                <div class="container">
                    <div class="row centered">
                        <div class="col-lg-8 col-lg-offset-2">
                            <h2><b>BUSCA AVANÇADA DE FILMES</b></h2>
                            <p id="queryText">Encontre seu título informando apenas o gênero e 1 ou mais atores presente.</p>
                        </div>
                    </div><!-- row -->
                </div><!-- container -->
            </div><!-- blue wrap -->

            <div class="container w" id="antes">
                <div class="row" id="btnGroupRow">
                    <div class="btn-group col-lg-offset-2 col-lg-8 col-md-8">
                        <div class="btn-group metade" id="divadd">
                            <button class="btn btn-primary" id="btAtores" onclick="addAtores()" type="button">Adicionar mais Ator</button> 
                        </div>
                        <div class="btn-group metade" id="divremove">
                            <button class="btn btn-primary" id=" bAtores" onclick="removeAtores()" type="button">Remover um Ator</button>
                        </div>        
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-offset-2 col-lg-8 col-md-8" id="inputAtores">
                        <div class="form-group">
                            <div class="col-lg-1 col-md-1">
                                <label for="ator-0"> Ator:</label>  
                            </div>
                            <div class="col-lg-11 col-md-11">
                                <input class="form-control" type="text" name="ator" id="ator-0"> 
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-offset-2 col-lg-8 col-md-8">
                        <div class="row"><label> Gênero: <select id="comboboxGenero" name="genero"> 
                                    <option value="default">-- Selecione --
                                    </option>
                                </select> </label> </div>

                    </div>
                </div>
                <div class="row centered"><button id="btBuscar" onclick="buscar()" type="button">Buscar</button> </div>

            </div><!-- container -->  

            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div id="modal-content" class="modal-content">


                </div>

            </div>

            <div id="result" class="row ">

            </div>
        </section>

        <%@include file = "rodape.jsp" %>

        <script type="text/javascript">
            modal = document.getElementById('myModal');

            $(document).ready(function () {
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
                $(document).keyup(function (e) {
                    if (e.keyCode === 27)
                        modal.style.display = "none";

                });
                $.ajax({

                    type: "GET", //Método
                    url: "ListaGenero", //Servlet
                    dataType: "json", //Tipo do arquivo
                    success: function (data) { //resposta setada
                        //para cada objeto do json, uma nova opcao do combobox
                        $.each(data, function (index, value) {
                            document.getElementById("comboboxGenero").innerHTML += "<option value = " + value.genre + ">" + value.genre + "</option>";
                        });
                    }
                });
                $("#l2").addClass("active");
            });
            var aux = 0;
            function addAtores() {

                if (aux < 4) {
                    var item = "<div class='row ator-" + aux + "'> <label class='ator-" + ++aux + "' for='ator-" + aux + "'> Ator: <input class='ator-" + aux + "' type='text'name='ator' id='ator-" + aux + "' > </label> </div>";
                    $("#inputAtores").append(item);
                } else
                    alert("Maximo de 5 atores");
            }

            function removeAtores() {
                (aux > 0) ? $(".ator-" + aux--).remove() : alert("Informe pelo menos um ator!");
            }


            function mostrar_modal(title, mvyear, mid) {
                var regex = /.+?(?=\()/;

                $url = 'https://api.themoviedb.org/3/search/movie?api_key=088e7711438e5b1544142df8f44709de&query=' + encodeURI($.trim(title.match(regex))) + "&year=" + mvyear.substring(0, 4);
                console.log($url);
                document.body.style.cursor = "progress";
                $.get($url, function (json) {
                   document.body.style.cursor ="default";

                    modal.style.display = "block";
                    $stringona = "<div class='col-md-3 col-lg-3'> <img alt='" + title + "' src='";
                    if (json.results[0] && json.results[0].poster_path) { // Se o personagem tem imagem:
                        $stringona = $stringona + "https://image.tmdb.org/t/p/w500/" + json.results[0].poster_path;
                    } else {
                        $stringona = $stringona + "/assets/img/not-found.png";
                    }
                    $stringona = $stringona + "'></img> </div>" + "<div class='col-lg-offset-1 col-md-8 col-lg-8'><div class='row'>  <div id='directors-div' class='col-lg-4 col-md-4'><div class='row'><h1>Diretor(s): </h1></div></div> <div class='col-lg-4 col-md-4' id='genre-div'>" +
                            " <div class='row'> <h1> Gênero(s):</h1>   </div></div> <div class=\"col-md-4 col-lg-4\" id='lang-div'> <div class='row'><h1> Idioma(s):</h1> </div></div> <div id='actors-div'> <div class='row'> <div class='offset-lg-4 offset-md-4'>   <h1>Atores:" +
                            "</h1></div></div> </div></div>";
                    $('#modal-content').html($stringona);

                    $url = '/Avancada';
                    console.log(mid);
                    $.post($url, {opcao: "busca", movieid: mid}, function (data) {
                        console.log(data);
                        var i = 0;
                        $.each(data.actors, function (index, value) {
                            
                            $('#actors-div').append("<div class='offset-md-"+(i*4)+" col-lg-4'   >"+value.ActorName+"</div>");
                            i = (++i)%3;

                        });
                        $.each(data.directors, function (index, value) {
                            $('#directors-div').append(value.director);

                        });

                        $.each(data.langs, function (index, value) {
                            $('#lang-div').append(value.lang);

                        });
                        $.each(data.generos, function (index, value) {
                            $('#genre-div').append(value.genre);

                        });



                    });
                });
            }


        function capitalize(s){
            return s.toLowerCase().replace( /\b./g, function(a){ 
                return a.toUpperCase(); 
            });
        };

            
            function buscar() {
                obj = new Object();
                var stringAtores = "";
                var stringTotal = "";
                var array_atores = [];
                for (var i = 0; i <= aux; i++)
                    if ($("#ator-" + i) && $.trim($("#ator-" + i).val().length) > 1)
                        array_atores.push($.trim(capitalize($("#ator-" + i).val())));
                     if (array_atores.length == 0) {
                        alert("Nos informe ao menos um ator!");
                        return;
                    }
                if (document.getElementById("comboboxGenero").value == "default") {
                    alert("Nos informe o gênero do filme!");
                    return;
                }

                stringTotal = '{"GENERO": "' + document.getElementById("comboboxGenero").value + '",';
                for (var i = 0; i < array_atores.length; i++) {
                    if (i + 1 === array_atores.length)
                        stringAtores += '{"NOME" : "' + array_atores[i] + '"}';
                    else
                        stringAtores += '{"NOME" : "' + array_atores[i] + '"},';
                }

                stringTotal += '"ATORES": [' + stringAtores + ']}';
                console.log(stringTotal);
                // Send the data using post
                var posting = $.post("/Avancada", {opcao: "lista", json: stringTotal});

                // Put the results in a div
                var limite = 15;



                function addConteudo(pagina) {
                    $("#content").empty();
                    for (var i = (pagina - 1) * limite; i < filmes.length && i < pagina * limite; i++) {
                        document.getElementById('content').innerHTML += " <tag style='cursor: pointer;' onclick='mostrar_modal(\" " + filmes[i].title + "\", \"" + filmes[i].mvyear + "\", " + filmes[i].movieid + ");'>" + filmes[i].title + "</tag><br />";

                    }
                }

                posting.done(function (data) {
                    $("#antes").hide();
                    $("#result").html("<div id=\"content\"> </div> <div id=\"paginacao\"></div>");

                    filmes = [];
                    $.each(data, function (index, d) {

                        var obj = new Object();

                        obj.movieid = d.movieid;
                        obj.mvyear = d.mvyear;
                        obj.title = d.title;

                        filmes.push(obj);
                    });

                    if (data.length > limite) {
                        $("#paginacao").pagination({
                            items: data.length,
                            itemsOnPage: limite,
                            onInit: function () {
                                addConteudo(1);
                            },
                            onPageClick: function (pageNumber) {
                                addConteudo(pageNumber);
                            }
                        });
                    } else {
                        addConteudo(1);
                    }


                });
            }
        </script>    
    </body>  
</html>
