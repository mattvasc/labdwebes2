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
            <form>
                <div class="row centered">
                    <div class="col-lg-6">
                         <label> Ator: <input type ="text" > </label> <br />
                    </div>
                      <div class="col-lg-6">
                        <label> Gênero <select id="comboboxGenero"> 
                                <option>-- Selecione --
                                </option>
                            </select> </label> 
                    </div>

                     
                </div>
                
            </form>
	</div><!-- container -->

    
    <script>
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
<%@include file = "rodape.jsp" %>
        
  </body>
</html>
