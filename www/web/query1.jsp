<%@page import="java.util.List"%>
<%@page import="Model.Genero"%>
<%@include file= "cabecalho.jsp" %>
	<div id="blue">
		<div class="container">
			<div class="row centered">
				<div class="col-lg-8 col-lg-offset-2">
				<h4>BUSCA AVANÇADA DE FILMES</b></h4>
				<p>Encontre seu título informando apenas o gênero e/ou 1 ator presente.</p>
				</div>
			</div><!-- row -->
		</div><!-- container -->
	</div><!-- blue wrap -->


        
	<div class="container w">
            <form method="POST" action="Avancada" id="formulario">
                <div class="row centered">
                    <div class="col-lg-6" id="inputAtores">
                         <label id="ator1"> Ator: <input type ="text" name="ator" id="ator1"> </label> <br />
                    </div>
                    <div class="col-lg-6">
                        <button id="btAtores" onclick="addAtores()" type="button">Add Ator</button> <br />
                    </div>
                     <div class="col-lg-6">
                        <button id=" bAtores" onclick="removeAtores()" type="button">Remove Ator</button> <br />
                    </div>
                      <div class="col-lg-6">
                        <label> Gênero <select id="comboboxGenero" name="genero"> 
                                <option>-- Selecione --
                                </option>
                            </select> </label> 
                    </div> 
                     <div class="col-lg-6">
                        <button id="btBuscar" onclick="buscar()" type="button">Buscar</button> <br />
                    </div>
                </div>
                
            </form>
	</div><!-- container -->
        <%@include file = "rodape.jsp" %>

     <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function(){
        $.ajax({
            type: "GET", //Method
            url: "ListaGenero", //Servlet
            dataType: "json", //Response Type
            success: function(data) { //Response data

                $.each(data, function(index, value){
                    document.getElementById("comboboxGenero").innerHTML+= "<option value = "+value.genre+">"+value.genre+"</option>";
                });
            }
          }); 

    });   
    
    var aux = 1;
    
     function addAtores(){
         aux++;
         var item = "<label id='ator"+aux+"'> Ator: <input type ='text'name='ator' id='ator"+aux+"' > </label> <br />";
          $("#inputAtores").append(item);
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
           // verificação de entrada
           $("#formulario").submit();
       }
    </script>
        
  </body>
</html>
