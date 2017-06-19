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
        <%@include file = "rodape.jsp" %>

     <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    
    <script>
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
    </script>
        
  </body>
</html>
