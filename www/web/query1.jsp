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

        <title>Busca Avançada</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
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
                            <p id="queryText">Encontre seu título informando apenas o gênero e/ou 1 ator presente.</p>
                        </div>
                    </div><!-- row -->
                </div><!-- container -->
            </div><!-- blue wrap -->

            <div class="container w" id="antes">

                <div class="row centered">

                    <div class="col-lg-6" id="inputAtores">
                        <div class="row"><label for="ator-0"> Ator: <input type ="text" name="ator" id="ator-0"> </label> </div>

                    </div>
                    <div class="col-lg-6">
                        <div class="row" id="divadd"><button id="btAtores" onclick="addAtores()" type="button" style="width: 22ch">Adicionar mais Ator</button> </div>
                        <div class="row" id="divremove"><button id=" bAtores" onclick="removeAtores()" style="width: 22ch" type="button">Remover um Ator</button> </div>
                        <div class="row"><label> Gênero: <select id="comboboxGenero" name="genero"> 
                                    <option value="default">-- Selecione --
                                    </option>
                                </select> </label> </div>

                    </div>

                </div>
                <div class="row centered"><button id="btBuscar" onclick="buscar()" type="button">Buscar</button> </div>

            </div><!-- container -->  
            <div id="result" class="row">

            </div>
        </section>

        <%@include file = "rodape.jsp" %>

        <script type="text/javascript">
            $(document).ready(function () {

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
            function buscar() {

                obj = new Object();
                var stringAtores = "";
                var stringTotal = "";
                var array_atores = [];
                for (var i = 0; i <= aux; i++)
                    if ($("#ator-" + i) && $.trim($("#ator-" + i).val().length) > 1)
                        array_atores.push($.trim($("#ator-" + i).val()));
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
                var posting = $.post("/Avancada", {opcao: "lista", json : stringTotal});

                // Put the results in a div
                var limite = 15;
                
                function addConteudo(pagina) {
                    $("#content").empty();
                    for(var i = (pagina -1) * limite;i<filmes.length && i<pagina*limite;i++){
                        document.getElementById('content').innerHTML += " <tag style='cursor: pointer;' onclick='mostrar_modal(" + filmes[i].title + ", \"" + filmes[i].mvyear + "\")'>" + ((i + 1) + limite * (pagina - 1)) + ". " + filmes[i].title + "</tag><br />";

                    }
                }
                
                posting.done(function (data) {
                    $("#result").html("<div id=\"content\"> </div> <div id=\"paginacao\"></div>");
                    
                    var filmes = [];
                    $.each(data, function(index, d){
                        
                        var obj = new Object();
                        
                        obj.movieid = d.movieid;
                        obj.mvyear = d.mvyear;
                        obj.genre = d.genre.genre;
                        obj.title = d.title;
                        
                        filmes.push(obj);
                    });
                     
                    if(data.length > limite){
                        $("#paginacao").pagination({
                            items:data.length,
                            itemsOnPage:limite,
                            onInit: function(){
                                addConteudo(1);
                            },
                            onPageClick: function (pageNumber){
                                addConteudo(pageNumber);
                            }
                        });
                    }
                    else{
                        addConteudo(1);
                    }
                
                       
                });
            }
        </script>    
    </body>  
</html>
