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

            <div class="container w">
                <form method="POST" action="Avancada" id="formulario">

                    <div class="row centered">
                        <div class="col-lg-6" id="inputAtores">
                             <label id="ator"> Ator: <input type ="text" name="ator" id="ator1"> </label> <br />
                        </div>
                        <div class="col-lg-6">
                            <button id="btAtores" onclick="addAtores()" type="button">Add Ator</button> <br />
                        </div>
                         <div class="col-lg-6">
                            <button id=" bAtores" onclick="removeAtores()" type="button">Remove Ator</button> <br />
                        </div>
                          <div class="col-lg-6">
                            <label> Gênero <select id="comboboxGenero" name="genero"> 
                                    <option value="default">-- Selecione --
                                    </option>
                                </select> </label> 
                        </div> 
                         <div class="col-lg-6">
                            <button id="btBuscar" onclick="buscar()" type="button">Buscar</button> <br />
                        </div>
                    </div>

                </form>
            </div><!-- container -->  
        </section>

        <%@include file = "rodape.jsp" %>

        <script type="text/javascript">
            $(document).ready(function(){
                $.ajax({

                type: "GET", //Método
                url: "ListaGenero", //Servlet
                dataType: "json", //Tipo do arquivo
                success: function(data) { //resposta setada
                    //para cada objeto do json, uma nova opcao do combobox
                    $.each(data, function(index, value){
                        document.getElementById("comboboxGenero").innerHTML+= "<option value = "+value.genre+">"+value.genre+"</option>";
                    });
                }
              });
              $("#l2").addClass("active");

            });  
            
            </script>
            
            <script type="text/javascript"> 

            var aux = 1;
            
            function addAtores(){
                if(aux<5){
                aux++;
                var item = "<label id='ator'> Ator: <input type ='text'name='ator' id='ator"+aux+"' > </label> <br />";
                $("#inputAtores").append(item);}
                else 
                   alert("Maximo de 5 atores");
                
            }

            function removeAtores(){
                if(aux>1){
                    var str = "#ator"+aux+"";
                    $(str).remove();
                    aux--;}
                else 
                    alert("Digite pelo menos um ator");
            }

            function buscar(){
                obj = new Object();
                var stringAtores = "";
                var stringTotal = "";
                
                if(document.getElementById("comboboxGenero").value == "default")
                   alert("Selecione um Genero");
                else{
                    stringTotal ='{"GENERO": "'+document.getElementById("comboboxGenero").value+'",';
                    for(var i = 1;i <= aux;i++){
                        str = "#ator"+i+"";
                        var atorzin = $(str).val();
                        if(i<aux)
                         stringAtores += '{ "NOME" : "'+atorzin+'"},'; 
                        else 
                         stringAtores += '{ "NOME" : "'+atorzin+'"}';    
                    }
                    console.log(stringAtores);
                    stringTotal += '"ATORES": ['+stringAtores+']}'; 
                    
                    
                    $.ajax({
                    type: "POST",
                    url: "/Avancada",
                    data: stringTotal,
                    dataType: "json", 
                    contentType: "application/json",
                    success: function(data){
                        console.log("sucesso");
                    },
                    error: function(erro) {
                        console.log(erro); 
                    }
                 });
                } 
            }
        </script>    
    </body>  
</html>
